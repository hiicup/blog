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
					<div class="panel panel-default">
					  <div class="panel-body">
					    <h4><a href="/detail/{{$v.id}}">{{$v.title}}</a></h4>
					    <div class="info">
					    	分类：<a href="/category/{{$v.cid}}">{{$v.cname}}</a> &nbsp;&nbsp;
					    	标签：{{$v.tags}}&nbsp;&nbsp;
					    	时间：{{$v.ctime}}&nbsp;&nbsp;
					    </div>
					    <div class="con text-muted">
					    	{{$v.info}}
					    </div>
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