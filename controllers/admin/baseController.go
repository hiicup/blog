package admin

import (
	"github.com/astaxie/beego"
)

type baseController struct {
	action      string
	controller  string
	uid         int
	uname       string
	breadcrumbs map[string]string
	beego.Controller
	isPost bool
	flash  *beego.FlashData
}

func (this *baseController) Prepare() {
	this.auth()
	this._init()
}

func (this *baseController) _init() {
	this.controller, this.action = this.GetControllerAndAction()
	this.Data["action"] = this.action
	this.Data["controller"] = this.controller
	this.Data["uname"] = this.uname

	//默认面包屑
	this.breadcrumbs = make(map[string]string)
	this.breadcrumbs["/admin"] = "首页"
	this.Data["breadcrumbs"] = this.breadcrumbs

	//消息管理
	beego.ReadFromRequest(&this.Controller)

	this.flash = beego.NewFlash()

	this.isPost = this.Ctx.Input.Method() == "POST"
}

func (this *baseController) Error(msg string, url string) {
	this.flash.Error(msg)
	this.flash.Store(&this.Controller)
	this.Redirect(url, 302)
	this.StopRun()
}

func (this *baseController) Success(msg string, url string) {
	this.flash.Success(msg)
	this.flash.Store(&this.Controller)
	this.Redirect(url, 302)
	this.StopRun()
}

func (this *baseController) auth() {
	uid := this.GetSession("uid")
	if uid == nil {
		this.Redirect("/login", 302)
		this.StopRun()
	} else {
		uname := this.GetSession("uname")
		this.uname = uname.(string)
		this.uid = uid.(int)
	}
}
