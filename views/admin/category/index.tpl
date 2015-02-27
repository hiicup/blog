
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
          <div class="panel-body">
          <table class="table table-striped table-hover">
            <tbody>
              <tr>
                <th>编号</th>
                <th>名称</th>
                <th>文章数量</th>
                <th>描述</th>
                <th width="200">操作</th>
              </tr>

              {{range $key,$val:=.cates}}
                <tr>
                  <td>{{$val.Id}}</td>
                  <td>{{$val.Name}}</td>
                  <td>{{$key}}</td>
                  <td>{{$val.Info}}</td>
                  <td>
                    <a class="btn btn-default btn-xs" href="/admin/category/edit/{{$val.Id}}">编辑</a>
                    <a href="/admin/category/delete/{{$val.Id}}" class="btn btn-default btn-xs">删除</a>
                  </td>
                </tr>
              {{end}}
              
            </tbody>
          </table>
          </div>
        </div>

			</div>
		</div>
	</div>
</section>
{{template "footer.html"}}