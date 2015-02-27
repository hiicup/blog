package controllers

import (
	"github.com/astaxie/beego"
	"github.com/hiicup/blog/models"
	"html"
)

type DetailController struct {
	beego.Controller
}

func (this *DetailController) Get() {
	id, err := this.GetInt(":id")
	if err != nil {
		this.Redirect("/", 302)
	}
	article := new(models.Article)
	article.Id = id
	article.One()

	article.Content = html.UnescapeString(article.Content)

	this.Data["data"] = article
	this.TplNames = "detail.tpl"
}
