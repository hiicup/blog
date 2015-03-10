package main

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/hiicup/blog/models"
	_ "github.com/hiicup/blog/routers"
)

func init() {
	orm.RegisterDriver("mysql", orm.DR_MySQL)
	// 	db_host = localhost
	// db_name = blog_hiicup_com
	// db_port = 3306
	// db_user = root
	// db_pass = ""
	// db_table_prefix = ""
	db_name := beego.AppConfig.String("db_name")
	db_host := beego.AppConfig.String("db_host")
	db_port, _ := beego.AppConfig.Int64("db_port")
	db_user := beego.AppConfig.String("db_user")
	db_pass := beego.AppConfig.String("db_pass")
	db_charset := "utf8"
	//格式：mysql://host
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s",
		db_user, db_pass, db_host, db_port, db_name, db_charset)
	orm.RegisterDataBase("default", "mysql", dsn)
	// orm.RunSyncdb("default", true, true)
	orm.Debug = false

}

func main() {
	beego.Run()
}
