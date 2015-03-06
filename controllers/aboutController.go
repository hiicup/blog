package controllers

import (
// "github.com/astaxie/beego"
)

type AboutController struct {
	baseController
}

func (this *AboutController) Get() {
	this.TplNames = "about.tpl"
}
