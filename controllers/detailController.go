package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/hiicup/blog/models"
	"html"
	"strings"
)

type DetailController struct {
	baseController
}

func (this *DetailController) Get() {
	id, err := this.GetInt(":id")
	if err != nil {
		this.Redirect("/", 302)
	}

	//构造sql语句
	qb, _ := models.NewQb() //query builder
	qb.Select("a.id,a.views,a.ctime,a.lang,a.title,a.content,a.html,a.cid,a.tags,a.info,c.name as cname").From("article as a").InnerJoin("category as c").On("a.cid = c.id").Where("a.id = ?")

	//原生查询
	o := models.NewOrm()
	var lists []orm.Params
	o.Raw(qb.String(), id).Values(&lists)

	article := lists[0]
	article["content"] = html.UnescapeString(article["content"].(string))

	lang := []string{}

	if article["lang"] != nil {
		lang = strings.Split(article["lang"].(string), " ")
	}

	this.seo.Title = article["title"].(string) + "-" + beego.AppName
	this.seo.Keywords = article["tags"].(string)
	this.seo.Description = article["info"].(string)

	//浏览数自增
	o.Raw("update article set views=(views+1) where id=?", id).Exec()

	this.Data["isHtml"] = "yes"
	if article["html"] == "" {
		this.Data["isHtml"] = "no"
	}

	this.Data["data"] = article
	this.Data["lang"] = lang
	this.TplNames = "detail.tpl"
}
