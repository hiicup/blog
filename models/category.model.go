package models

import (
	"github.com/astaxie/beego/orm"
)

type Category struct {
	Id   int
	Name string `orm:size(20)`
	Info string
}

func NewCategory() *Category {
	return new(Category)
}

func (this *Category) Gets() []Category {

	o := orm.NewOrm()

	cates := []Category{}

	_, err := o.QueryTable("Category").All(&cates)

	if err != nil {

	}

	return cates

}

func (m *Category) All() []Category {
	_data := []Category{}
	orm.NewOrm().QueryTable(m).All(&_data)
	return _data
}
