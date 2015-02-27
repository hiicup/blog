{{template "admin/common/header.html" .}}

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">

				<div class="panel panel-default">
					<div class="panel-heading">
						功能导航
					</div>
					{{template "admin/common/leftMenu.html" .}}
				</div>

			</div>
			<div class="col-md-8">

				<div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>欢迎回来</strong> {{.flash.success}}
          </div>

			</div>
		</div>
	</div>
</section>

{{template "admin/common/footer.html"}}