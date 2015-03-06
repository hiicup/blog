package models

import (
	"github.com/astaxie/beego/orm"
)

const PAGE_SIZE = 10

func init() {
	orm.RegisterModel(new(User), new(Category), new(Article))
}
