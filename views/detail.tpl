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
			  <li><a href="/category">服务器</a></li>
			  <li class="active">详情</li>
			</ol>
			<article class="detail">
			<h3>{{.data.Title}}</h3>

			<div class="info">
		    	分类：<a href="#">前端</a> &nbsp;&nbsp;
		    	标签：{{.data.Tags}}&nbsp;&nbsp;
		    	时间：{{.data.Ctime}}&nbsp;&nbsp;
		    </div>
			<div class="content">{{str2html .data.Content}}</div>
			</article>
				
			</div>
			<div class="col-md-2">
				{{template "rightside.html" .}}
			</div>
			<div class="col-md-2">&nbsp;</div>
		</div>
	</div>
</section>
{{template "footer.html"}}