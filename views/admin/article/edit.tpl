{{template "admin/common/header.html" .}}

{{template "admin/common/ueditor.html"}}

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
              <div class="form-group">
                <label for="title">标题</label>
                <input type="text" class="form-control" id="title" name="title" maxlength="255" placeholder="标题" value="{{.data.Title}}">
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-3">
                    <label for="cid">所属分类</label>
                    <select name="cid" id="cid" class="form-control">
                      {{range $k,$v:=.cates}}
                        <option value="{{$v.Id}}" {{if eq $.data.Cid $v.Id}}selected="selected"{{end}}>{{$v.Name}}</option>
                      {{end}}
                    </select>
                  </div>
                  <div class="col-sm-2">
                    <label for="author">作者</label>
                    <input type="text" class="form-control" id="author" name="author" placeholder="作者" value="{{.data.Author}}">
                  </div>
                  <div class="col-sm-2">
                    <label for="views">浏览量</label>
                    <input type="text" class="form-control" id="views" name="views" placeholder="浏览量" value="{{.data.Views}}">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-12">
                    <label for="tags">标签 <span class="text-muted f12">空格隔开</span></label>
                    <input type="text" class="form-control" id="tags" name="tags" placeholder="标签" value="{{.data.Tags}}">
                  </div>
                  
                </div>
              </div>
              <div class="form-group">
                <label for="info">内容概要 <span class="text-muted f12">200字以内</span></label>
                <textarea class="form-control" id="info" name="info" placeholder="内容概要200字以内" style="height: 80px">{{.data.Info}}</textarea>
              </div>
              <div class="form-group">
                <label for="content">内容</label>
                <textarea class="form-control" id="myEditor" style="height:500px;" name="content" placeholder="内容">
                {{str2html .data.Content}}
                </textarea>
              </div>
              <button type="submit" class="btn btn-primary">保存</button>
              <a href="/admin/article" class="btn btn-danger btn-link">返回</a>
            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>

<script type="text/javascript">
  var um = UM.getEditor('myEditor');
</script>

{{template "admin/common/footer.html" .}}