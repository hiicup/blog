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
					<div class="panel">
					    <h4>
					    	<span class="label label-warning">{{$v.day}}/{{$v.month}}</span>
					    	<a href="/detail/{{$v.id}}">{{$v.title}}</a>
					    </h4>
					    <div class="info text-muted">
					    	time：{{$v.hour}}:{{$v.minute}}&nbsp;&nbsp;
					    	category：<a href="/category/{{$v.cid}}">{{$v.cname}}</a> &nbsp;&nbsp;
					    	tag：{{$v.tags}}&nbsp;&nbsp;
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