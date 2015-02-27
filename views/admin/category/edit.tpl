{{template "admin/common/header.html" .}}

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">

				<div class="panel panel-default">
					<div class="panel-heading">
						功能导航
					</div>
					{{template "admin/common/leftMenu.html"}}
				</div>


			</div>
			<div class="col-md-8">
        
        <!-- breadcrumbs begin -->
        {{template "admin/common/breadcrumbs.html" .}}
        <!-- breadcrumbs end -->

        <div class="panel panel-default">
          <div class="panel-body fb">
            <form method="post">
              <input type="hidden" name="id" value="{{.cate.Id}}">
              <div class="form-group">
                <label for="name">分类名称</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="分类名称" value="{{.cate.Name}}">
              </div>
              <div class="form-group">
                <label for="info">分类描述</label>
                <textarea class="form-control" name="info" id="info" placeholder="分类描述">{{.cate.Info}}</textarea>
              </div>
              <button type="submit" class="btn btn-default">保存</button>
            </form>
          </div>
        </div>

			</div>
		</div>
	</div>
</section>

{{template "admin/common/footer.html" .}}