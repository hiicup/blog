package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/hiicup/blog/models"
	"github.com/hiicup/tool"
	"strconv"
)

type MainController struct {
	baseController
}

func (this *MainController) Get() {
	this.seo.Title = beego.AppConfig.String("appname") + "首页"

	w := this.GetString("w", "")
	p, _ := this.GetInt("p", 1)

	o := models.NewOrm()
	var lists []orm.Params
	var countRes []orm.Params
	var r, countR orm.RawSeter
	pageSize := models.PAGE_SIZE

	//生成sql
	qb, _ := models.NewQb()      //获取数据构造器
	countQb, _ := models.NewQb() //获取总数构造器

	countQb.Select("count(*) as count")
	countQb.From("article")

	qb.Select("a.id,a.views,a.ctime,a.title,a.content,a.cid,a.tags,a.info,c.name as cname")
	qb.From("article as a")
	qb.LeftJoin("category as c")
	qb.On("a.cid = c.id")
	qb.OrderBy("a.id").Desc()
	qb.Limit(pageSize).Offset((p - 1) * pageSize)

	if w != "" {
		where := "title like %?% OR tags like %?%"
		qb.Where(where)
		countQb.Where(where)
		r = o.Raw(qb.String(), w, w)
		countR = o.Raw(countQb.String(), w, w)
	} else {
		r = o.Raw(qb.String())
		countR = o.Raw(countQb.String())
	}

	r.Values(&lists)         //获取数据
	countR.Values(&countRes) //获取总数
	//总数
	dataCount, _ := strconv.Atoi(countRes[0]["count"].(string))

	page := tool.NewPager(p, dataCount, pageSize, this.Ctx.Request.RequestURI)

	this.Data["w"] = w
	this.Data["page"] = page.String()
	this.Data["sdata"] = lists
	this.TplNames = "index.tpl"
}
