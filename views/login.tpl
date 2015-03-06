<!DOCTYPE html>
<html>
<head>
	{{template "head.html" .}}
</head>
<body>

{{template "nav.html" .}}

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
				{{template "rightside.html" .}}
			</div>
			<div class="col-md-2">&nbsp;</div>
		</div>
	</div>
</section>
{{template "footer.html"}}