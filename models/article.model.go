package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Article struct {
	Id      int
	Title   string    `orm:size(512)`
	Info    string    `orm:size(1024)`
	Cid     int       `orm:index`
	Content string    `orm:type(text)`
	Md      string    `orm:type(text)`
	Html    string    `orm:type(text)`
	Ctime   time.Time `orm:type(datetime)`
	Author  string
	Views   int
	Tags    string `orm:size(1000)`
	Lang    string `orm:"size(100)"`
}

func NewArticle() *Article {
	return new(Article)
}

func (this *Article) One() error {
	return orm.NewOrm().Read(this)
}

//单条记录插入
func (this *Article) Insert() error {
	if _, err := orm.NewOrm().Insert(this); err != nil {
		return err
	}
	return nil
}

func (this *Article) Update() error {
	_, err := orm.NewOrm().Update(this)
	return err
}

func (this *Article) Delete() (num int64, err error) {
	num, err = orm.NewOrm().Delete(this)
	return
}

func (this *Article) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(this)
}

func (m *Article) All() []Article {
	_data := []Article{}
	m.Query().OrderBy("id").All(&_data)
	return _data
}
