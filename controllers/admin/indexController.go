package admin

import (
	"github.com/astaxie/beego"
	"reflect"
)

type IndexController struct {
	baseController
}

func (this *IndexController) Get() {
	// flash := beego.ReadFromRequest(&this.Controller)

	beego.Trace(this.uid)
	beego.Trace(reflect.TypeOf(this.uid))

	this.TplNames = "admin/index.tpl"
}
