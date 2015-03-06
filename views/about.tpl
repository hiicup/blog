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

			<ol class="breadcrumb">
			  <li><a href="/">首页</a></li>
			  <li class="active">关于博主</li>
			</ol>

			<blockquote class="text-muted">
				占位！(...此处省略若干个字！)
			</blockquote>

			</div>
			<div class="col-md-2">
				{{template "rightside.html" .}}
			</div>
			<div class="col-md-2">&nbsp;</div>
		</div>
	</div>
</section>

{{template "footer.html"}}