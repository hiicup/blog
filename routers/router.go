package routers

import (
	"github.com/astaxie/beego"
	"github.com/hiicup/blog/controllers"
	"github.com/hiicup/blog/controllers/admin"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/index.html", &controllers.MainController{})
	beego.Router("/index.php", &controllers.MainController{})
	beego.Router("/detail/:id([0-9]+)", &controllers.DetailController{})
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/logout", &controllers.LoginController{}, "*:Logout")
	beego.Router("/about", &controllers.AboutController{})
	beego.Router("/category/:cid([0-9]+)", &controllers.CategoryController{})

	//后台
	beego.Router("/admin", &admin.IndexController{})

	//分类管理
	beego.Router("/admin/category", &admin.CategoryController{}, "*:Index")
	beego.Router("/admin/category/create", &admin.CategoryController{}, "*:Create")
	beego.Router("/admin/category/edit/:id([0-9]+)", &admin.CategoryController{}, "get,post:Edit")
	beego.Router("/admin/category/delete/:id([0-9]+)", &admin.CategoryController{}, "get:Delete")

	//文章管理
	beego.Router("/admin/article", &admin.ArticleController{}, "*:Index")
	beego.Router("/admin/article/create", &admin.ArticleController{}, "*:Create")
	beego.Router("/admin/article/edit/:id([0-9]+)", &admin.ArticleController{}, "get,post:Edit")
	beego.Router("/admin/article/md/:id([0-9]+)", &admin.ArticleController{}, "get,post:Md")
	beego.Router("/admin/article/delete/:id([0-9]+)", &admin.ArticleController{}, "get:Delete")
}
