<!DOCTYPE html>
<html>
<head>
{{template "head.html" .}}
<script type="text/javascript" src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/node_modules/highlight.js/styles/monokai_sublime.css">

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

			<div class="comments">
				<!-- 多说最新评论 start -->
					<div class="ds-recent-comments" data-num-items="5" data-show-avatars="1" data-show-time="1" data-show-title="1" data-show-admin="1" data-excerpt-length="70"></div>
				<!-- 多说评论框 start -->
					<div class="ds-thread" data-thread-key="{{.data.Id}}" data-title="{{.data.title}}" data-url="http://hiicup.com/detail/{{.data.id}}"></div>
				<!-- 多说评论框 end -->
				<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
				<script type="text/javascript">
				var duoshuoQuery = {short_name:"hiicup"};
					(function() {
						var ds = document.createElement('script');
						ds.type = 'text/javascript';ds.async = true;
						ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
						ds.charset = 'UTF-8';
						(document.getElementsByTagName('head')[0] 
						 || document.getElementsByTagName('body')[0]).appendChild(ds);
					})();
					</script>
				<!-- 多说公共JS代码 end -->
			</div>

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