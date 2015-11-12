<!DOCTYPE html>
<html>
<head>
{{template "head.html" .}}
<script type="text/javascript" src="/static/js/highlight.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/node_modules/highlight.js/styles/atelier-cave.light.css">

<script type="text/javascript">
	hljs.initHighlightingOnLoad();
</script>

</head>
<body>
{{template "nav.html" .}}

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">

			<ol class="breadcrumb">
			  <li><a href="/">首页</a></li>
			  <li><a href="/category/{{.data.cid}}">服务器</a></li>
			  <li class="active">详情</li>
			</ol>
			<article class="detail">
			<div class="detail-head">
				<h3>{{.data.title}}</h3>

				<div class="info">
			    	分类：<a href="/category/{{.data.cid}}">{{.data.cname}}</a> &nbsp;&nbsp;
			    	标签：{{.data.tags}}&nbsp;&nbsp;
			    	时间：{{.data.ctime}}&nbsp;&nbsp;
			    	浏览：{{.data.views}}
			    </div>
			</div>

			<div class="content" style="margin-bottom:50px;">{{str2html .data.content}}</div>
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