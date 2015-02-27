package admin

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/validation"
	"github.com/hiicup/blog/models"
)

type CategoryController struct {
	baseController
}

func (this *CategoryController) Prepare() {
	this.baseController.Prepare()
	this.breadcrumbs["/admin/category"] = "分类管理"
	this.EnableXSRF = false
}

//新增分类
func (this *CategoryController) Create() {
	flash := beego.NewFlash()
	if this.Ctx.Input.Method() == "POST" {
		cate := new(models.Category)
		cate.Name = this.GetString("name")
		cate.Info = this.GetString("info")
		valid := validation.Validation{}
		valid.Required(cate.Name, "name")
		if valid.HasErrors() {
			flash.Error("名称不能为空！")
			flash.Store(&this.Controller)
			this.Redirect("/admin/category/create", 302)
			return
		}

		orm := orm.NewOrm()
		_, err := orm.Insert(cate)

		var url = "/admin/category"
		if err != nil {
			flash.Error("新增失败！")
			url = "/admin/category/create"
		} else {
			flash.Success("新增成功！")
		}
		flash.Store(&this.Controller)
		this.Redirect(url, 302)
	}
	this.breadcrumbs["nil"] = "添加分类"
	this.TplNames = "admin/category/create.tpl"
}

//删除
func (this *CategoryController) Delete() {
	flash := beego.NewFlash()
	id, err := this.GetInt(":id")

	if err != nil {
		flash.Error("分类不存在！")
		flash.Store(&this.Controller)
		this.Redirect("/admin/category", 302)
	}

	cate := models.Category{Id: id}
	o := orm.NewOrm()
	_, err_ := o.Delete(&cate)
	if err_ != nil {
		flash.Error("删除失败！")

	} else {
		flash.Success("删除成功！")
	}

	flash.Store(&this.Controller)
	this.Redirect("/admin/category", 302)

}

//编辑
func (this *CategoryController) Edit() {
	flash := beego.NewFlash()
	id, err := this.GetInt(":id")

	if err != nil {
		flash.Error("分类不存在！")
		flash.Store(&this.Controller)
		this.Redirect("/admin/category", 302)
	}

	cate := models.Category{Id: id}
	o := orm.NewOrm()
	err_ := o.Read(&cate)
	if err_ != nil {
		flash.Error("分类不存在！")
		flash.Store(&this.Controller)
		this.Redirect("/admin/category", 302)
	}

	if this.isPost {
		beego.Trace("di")
		cate.Name = this.GetString("name")
		cate.Info = this.GetString("info")
		if _, err := o.Update(&cate); err != nil {
			flash.Error("编辑失败！")
		} else {
			flash.Success("编辑成功！")
		}
		flash.Store(&this.Controller)
		this.Redirect("/admin/category", 302)
	}

	this.Data["cate"] = cate
	this.TplNames = "admin/category/edit.tpl"
}

//分类列表
func (this *CategoryController) Index() {

	this.breadcrumbs["nil"] = "列表"

	o := orm.NewOrm()
	var cates []models.Category
	o.QueryTable("category").All(&cates)

	this.Data["cates"] = cates

	this.TplNames = "admin/category/index.tpl"
}
