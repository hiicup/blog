package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/validation"
	"github.com/hiicup/blog/models"
	"github.com/hiicup/tool"
	"html/template"
	"time"
)

type LoginController struct {
	baseController
}

func (this *LoginController) Prepare() {
	this.sessionFLush()
}

func (this *LoginController) Get() {
	if this.isLogin() {
		this.Redirect("/admin", 302)
		this.StopRun()
	}
	flash := beego.ReadFromRequest(&this.Controller)
	_, hasError := flash.Data["error"]
	this.Data["hasError"] = hasError
	this.Data["_hash_"] = template.HTML(this.XsrfFormHtml())
	this.TplNames = "login.tpl"
}

func (this *LoginController) Post() {

	flash := beego.NewFlash()
	UserName := this.GetString("username")
	Password := tool.Md5(this.GetString("password"))

	valid := validation.Validation{}

	valid.Required(UserName, "username")
	valid.Required(Password, "password")

	if valid.HasErrors() {
		flash.Error("用户名或密码不能为空！")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}

	o := orm.NewOrm()

	var u models.User

	err := o.QueryTable("user").Filter("username", UserName).One(&u)

	if err == orm.ErrMultiRows {
		flash.Error("用户名或密码错误！")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}

	if err == orm.ErrNoRows {
		flash.Error("用户名或密码错误！")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}

	if u.Password != Password {
		flash.Error("用户名或密码错误！")
		flash.Store(&this.Controller)
		this.Redirect("/login", 302)
		return
	}

	this.SetSession("uid", u.Id)
	this.SetSession("uname", u.UserName)
	flash.Success("登录成功!")
	flash.Store(&this.Controller)
	this.Redirect("/admin", 302)
}

func (this *LoginController) Logout() {
	this.DestroySession()
	this.Redirect("/", 302)
}

func initAdmin() {
	orm := orm.NewOrm()
	user := new(models.User)
	user.UserName = "hiicup"
	user.Password = tool.Md5("dangpei")
	user.LastLoginTime = time.Now()
	userId, err := orm.Insert(user)
	if err != nil {
		beego.Error(err)
	}
	beego.Info(userId)
}

func (this *LoginController) isLogin() bool {
	uid := this.GetSession("uid")
	return uid != nil
}
