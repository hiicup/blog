package models

import (
	"time"
)

type User struct {
	Id            int
	UserName      string    `orm:size(45)`
	Password      string    `orm:size(32)`
	LastLoginTime time.Time `orm:type(datetime)`
	lastLoginIp   string
}
