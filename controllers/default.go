package controllers

import (
	"github.com/astaxie/beego"
	"github.com/hiicup/blog/models"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	articles := new(models.Article).All()
	cates := new(models.Category).All()

	this.Data["cates"] = cates
	this.Data["data"] = articles
	this.TplNames = "index.tpl"
}
