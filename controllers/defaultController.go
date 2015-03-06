package controllers

import (
	"github.com/astaxie/beego"
	"github.com/hiicup/blog/models"
	"github.com/hiicup/tool"
)

type MainController struct {
	baseController
}

func (this *MainController) Get() {
	this.seo.Title = beego.AppConfig.String("appname") + "首页"

	w := this.GetString("w", "")
	p, _ := this.GetInt("p", 1)

	articles := []models.Article{}

	qsf := new(models.Article).Query().Filter("title__icontains", w)

	pageSize := models.PAGE_SIZE
	dataCount, _ := qsf.Count()
	page := tool.NewPager(p, int(dataCount), pageSize, this.Ctx.Request.RequestURI)

	qsf.OrderBy("-id").Limit(pageSize, (p-1)*pageSize).All(&articles)

	this.Data["w"] = w
	this.Data["page"] = page.String()
	this.Data["data"] = articles
	this.TplNames = "index.tpl"
}
