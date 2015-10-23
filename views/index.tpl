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
				{{range $k,$v:=.sdata}}
				<article>
					<div class="panell">
					    <h4 class="article-title">
					    	<span class="label label-success">{{$v.day}}/{{$v.month}}</span>
					    	<a href="/detail/{{$v.id}}">{{$v.title}}</a>
					    </h4>
					    <div class="info text-muted">
					    	<span class="label-muted">Time：{{$v.hour}}:{{$v.minute}}&nbsp;&nbsp;</span>
					    	<span class="label-muted">Category：<a href="/category/{{$v.cid}}">{{$v.cname}}</a> &nbsp;&nbsp;</span>
					    	<span class="label-muted">Tag：{{$v.tags}}&nbsp;&nbsp;</span>
					    </div>
					    <div class="con text-muted hide">
					    	{{$v.info}}
					    </div>
					</div>
				</article>
				{{end}}

				{{str2html .page}}

			</div>
			<div class="col-md-2">
				{{template "rightside.html" .}}
			</div>
			<div class="col-md-2">&nbsp;</div>
		</div>
	</div>
</section>
{{template "footer.html"}}