package controllers

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/session"
	"github.com/hiicup/blog/models"
)

var gs *session.Manager

type seo struct {
	Title       string
	Keywords    string
	Description string
}

type baseController struct {
	seo
	beego.Controller
}

func init() {
	initSession()
}

func (this *baseController) Prepare() {
	this.initSeo()
	this.getCategorys()
}

func (this *baseController) initSeo() {
	this.seo.Title = beego.AppName
	this.seo.Keywords = beego.AppName
	this.seo.Description = beego.AppName
	this.Data["seo"] = &this.seo
}

func (this *baseController) getCategorys() {
	cates := new(models.Category).All()
	this.Data["cates"] = cates
}

func (this *baseController) session(args ...string) interface{} {
	sess, err := gs.SessionStart(this.Ctx.ResponseWriter, this.Ctx.Request)
	defer sess.SessionRelease(this.Ctx.ResponseWriter)
	if err != nil {
		return err
	}
	switch _len := len(args); _len {
	case 1:
		return sess.Get(args[0])
	case 2:
		return sess.Set(args[0], args[1])
	default:
		return errors.New("参数错误！")
	}
}

func (this *baseController) sessionFLush() interface{} {
	sess, err := gs.SessionStart(this.Ctx.ResponseWriter, this.Ctx.Request)
	defer sess.SessionRelease(this.Ctx.ResponseWriter)
	if err != nil {
		return err
	}
	return sess.Flush()
}
func (this *baseController) sessionDelete(key interface{}) interface{} {
	sess, err := gs.SessionStart(this.Ctx.ResponseWriter, this.Ctx.Request)
	defer sess.SessionRelease(this.Ctx.ResponseWriter)
	if err != nil {
		return err
	}
	return sess.Delete(key)
}

func initSession() {
	gs, _ = session.NewManager("file", `{"cookieName":"gosessionid", "enableSetCookie,omitempty": true, "gclifetime":3600, "maxLifetime": 3600, "secure": false, "sessionIDHashFunc": "sha1", "sessionIDHashKey": "", "cookieLifeTime": 3600, "providerConfig": ""}`)
	go gs.GC()
}
