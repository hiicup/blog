{{template "admin/common/header.html" .}}

<script type="text/javascript" src="/static/node_modules/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="/static/node_modules/marked/marked.min.js"></script>

<script type="text/javascript" src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/node_modules/highlight.js/styles/xcode.css">

<script type="text/javascript">
  $(function(){

    marked.setOptions({
      highlight: function (code) {
        return hljs.highlightAuto(code).value;
      }
    });

    var mdCon = $("#mdCon")
    var htmlCon = $("#htmlCon")

    mdCon.on('input',function(){
      var md = $(this).val();
      var html =marked(md);
      htmlCon.html(html);
      $("#html-con").val(html)
    });

    mdCon.trigger('input');

    $("textarea").on('keydown',function(e){
      if(e.keyCode == 9){
          e.preventDefault();
          var indent = '    ';
          var start = this.selectionStart;
          var end = this.selectionEnd;
          var selected = window.getSelection().toString();
          selected = indent + selected.replace(/\n/g,'\n'+indent);
          this.value = this.value.substring(0,start) + selected + this.value.substring(end);
          this.setSelectionRange(start+indent.length,start+selected.length);
      }
    })
  });
</script>

<section>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <!-- breadcrumbs begin -->
        {{template "admin/common/breadcrumbs.html" .}}
        <!-- breadcrumbs end -->

        <div class="panel panel-default">
          <div class="panel-body fb">
            <form method="post">
              <div class="form-group">
                
                <div class="row">
                  
                  <div class="col-md-6">
                    <textarea class="form-control" name="md" style="height:650px;" id="mdCon">{{.data.Md}}</textarea>
                  </div>

                  <div class="col-md-6" id="htmlCon" style="height:650px; overflow:auto">
                    {{str2html .data.Html}}
                  </div>

                  <textarea name="html" style="display:none;" id="html-con"></textarea>

                </div>

              </div>
              <div class="center">
                <button type="submit" class="btn btn-primary">立即发布</button>
              <a href="/admin/article" class="btn btn-danger btn-link">返回</a>
              </div>
            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
{{template "admin/common/footer.html" .}}