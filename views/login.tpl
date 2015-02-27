<!DOCTYPE html>
<html>
<head>
  <title>{{.appName}}</title>
  <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="/static/bt/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/hiicup.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/static/bt/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top -navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"><img src="static/logo.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">关于</a></li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="关键字">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-4">&nbsp;</div>
					<div class="col-md-4">
					{{if .hasError}}
					<div class="alert alert-danger alert-dismissible" role="alert">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					  <strong>Error!</strong> {{.flash.error}}
					</div>
					{{end}}
<form method="post">
{{._hash_}}
  <div class="form-group">
    <label for="exampleInputEmail1">用户名</label>
    <input type="text" name="username" class="form-control" required id="username" placeholder="用户名">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">密码</label>
    <input type="password" name="password" class="form-control" required id="password" placeholder="密码">
  </div>
  <div class="checkbox">
    <label>
      <input name="remember" type="checkbox"> 记住我
    </label>
  </div>
  <button type="submit" class="btn btn-default">登录</button>
</form>
					</div>
					<div class="col-md-4">&nbsp;</div>
				</div>
			</div>
			<div class="col-md-2">

				<div class="panel panel-default">
					<div class="panel-heading">
						所有分类
					</div>
					<ul class="list-group">
					  <li class="list-group-item"><a href="#">数据库</a> <span class="badge">4</span></li>
					  <li class="list-group-item"><a href="#">前端</a> <span class="badge">42</span></li>
					  <li class="list-group-item"><a href="#">Go</a> <span class="badge">55</span></li>
					  <li class="list-group-item"><a href="#">php</a> <span class="badge">47</span></li>
					  <li class="list-group-item"><a href="#">服务器</a> <span class="badge">87</span></li>
					</ul>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						文章归档
					</div>
					<ul class="list-group">
					  <li class="list-group-item"><a href="#">数据库</a> <span class="badge">4</span></li>
					  <li class="list-group-item"><a href="#">前端</a> <span class="badge">42</span></li>
					  <li class="list-group-item"><a href="#">Go</a> <span class="badge">55</span></li>
					  <li class="list-group-item"><a href="#">php</a> <span class="badge">47</span></li>
					  <li class="list-group-item"><a href="#">服务器</a> <span class="badge">87</span></li>
					</ul>
				</div>

				<div class="panel panel-default">
					<ul class="list-group">
					  <li class="list-group-item"><a href="#" class="text-muted">登录</a></li>
					</ul>
				</div>


			</div>
			<div class="col-md-2">&nbsp;</div>
		</div>
	</div>
</section>

<footer>
	<nav class="navbar navbar-default navbar-fixed-bottom">
	  <p class="text-center" style="padding-top:10px;">
	  	Copyright &copy; 2015 <a href="#">Hiicup.COM</a> . Powered by <a href="#">Beego</a> and <a href="#">GoLang</a> . 
	  </p>
	</nav>
</footer>

</body>
</html>