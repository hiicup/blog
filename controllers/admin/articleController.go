package admin

import (
	"github.com/astaxie/beego"
	"github.com/hiicup/blog/lang"
	"github.com/hiicup/blog/models"
	"html"
	"time"
)

type ArticleController struct {
	baseController
}

const (
	URL_ARTICLE_HOME   = "/admin/article"
	URL_ARTICLE_CREATE = URL_ARTICLE_HOME + "/create"
	URL_ARTICLE_EDIT   = URL_ARTICLE_HOME + "/edit"
)

func (this *ArticleController) Prepare() {
	this.baseController.Prepare()
	this.breadcrumbs["/admin/article"] = "文章管理"
	beego.EnableXSRF = false
}

func (this *ArticleController) Index() {
	beego.Trace(this.controller)

	this.breadcrumbs["nil"] = lang.LIST

	art := new(models.Article)
	data := []models.Article{}
	art.Query().OrderBy("-id").All(&data)

	this.Data["data"] = data

	this.TplNames = "admin/article/index.tpl"
}

func (this *ArticleController) Create() {
	f := beego.NewFlash()
	if this.isPost {

		art := new(models.Article)
		art.Cid, _ = this.GetInt("cid")
		art.Title = this.GetString("title")
		art.Author = this.GetString("author")
		art.Tags = this.GetString("tags")
		art.Content = html.EscapeString(this.GetString("content"))
		art.Ctime = time.Now()
		art.Info = this.GetString("info")
		art.Views, _ = this.GetInt("views")
		art.Lang = this.GetString("lang")

		rUrl := URL_ARTICLE_HOME
		if err := art.Insert(); err != nil {
			f.Error(lang.MSG_CREATE_ERROR)
			rUrl = URL_ARTICLE_CREATE
		} else {
			f.Success(lang.MSG_CREATE_SUCCESS)
		}
		f.Store(&this.Controller)
		this.Redirect(rUrl, 302)
		return

	} else {
		cate := new(models.Category)
		cates := cate.Gets()

		this.Data["cates"] = cates

	}

	this.breadcrumbs["nil"] = lang.CREATE

	this.TplNames = "admin/article/create.tpl"
}

func (this *ArticleController) Edit() {
	id, err := this.GetInt(":id")

	if err != nil {
		this.Error(lang.MSG_NOT_EXIST, URL_ARTICLE_HOME)
	}

	art := new(models.Article)
	art.Id = id
	if art.One() != nil {
		this.Error(lang.MSG_NOT_EXIST, URL_ARTICLE_HOME)
	}

	if this.isPost {

		art.Title = this.GetString("title")
		art.Author = this.GetString("author")
		art.Tags = this.GetString("tags")
		art.Content = html.EscapeString(this.GetString("content"))
		art.Info = this.GetString("info")
		art.Views, _ = this.GetInt("views")
		art.Lang = this.GetString("lang")

		if art.Update() != nil {
			this.Error(lang.MSG_EDIT_ERROR, URL_ARTICLE_HOME)
		}
		this.Success(lang.MSG_EDIT_SUCCESS, URL_ARTICLE_HOME)

	} else {
		cates := new(models.Category).Gets()
		this.Data["cates"] = cates
	}

	this.breadcrumbs["nil"] = lang.EDIT

	this.Data["data"] = art
	this.TplNames = "admin/article/edit.tpl"

}

func (this *ArticleController) Delete() {
	f := beego.NewFlash()
	id, err := this.GetInt(":id")

	if err != nil {
		f.Error(lang.MSG_NOT_EXIST)
	} else {
		art := new(models.Article)
		art.Id = id
		num, err := art.Delete()
		if err != nil || num == 0 {
			f.Error(lang.MSG_DELETE_ERROR)
		} else {
			f.Success(lang.MSG_DELETE_SUCCESS)
		}
	}

	f.Store(&this.Controller)
	this.Redirect(URL_ARTICLE_HOME, 302)

}
