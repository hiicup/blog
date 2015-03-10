package models

import (
	"github.com/astaxie/beego/orm"
)

const PAGE_SIZE = 10

func init() {
	orm.RegisterModel(new(User), new(Category), new(Article))
}

func NewQb() (orm.QueryBuilder, error) {
	qb, err := orm.NewQueryBuilder("mysql")
	return qb, err
}

func NewOrm() orm.Ormer {
	return orm.NewOrm()
}

func NewCond() *orm.Condition {
	return orm.NewCondition()
}
