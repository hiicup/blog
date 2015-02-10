package routers

import (
	"github.com/hiicup/blog.hiicup.com/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
