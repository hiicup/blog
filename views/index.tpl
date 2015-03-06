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
				{{range $k,$v:=.data}}
				<article>
					<div class="panel panel-default">
					  <div class="panel-body">
					    <h4><a href="/detail/{{$v.Id}}">{{$v.Title}}</a></h4>
					    <div class="info">
					    	分类：<a href="#">前端</a> &nbsp;&nbsp;
					    	标签：{{$v.Tags}}&nbsp;&nbsp;
					    	时间：{{$v.Ctime}}&nbsp;&nbsp;
					    </div>
					    <div class="con text-muted">
					    	{{$v.Info}}
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