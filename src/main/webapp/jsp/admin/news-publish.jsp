<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<!--富文本编辑器wangEditor-->
<meta http-equiv="Access-Control-Allow-Origin" content="*"/>
<link href="https://cdn.staticfile.org/wangEditor/10.0.13/wangEditor.min.css" rel="stylesheet">
<link href="https://cdn.staticfile.org/wangEditor/10.0.13/fonts/w-e-icon.woff" rel="stylesheet">
<script src="https://cdn.staticfile.org/wangEditor/10.0.13/wangEditor.min.js"></script>
<section class="p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="col-lg-9 col-md-8 col-sm-12">
                    <section style="padding-top: 10px;">
                        <div class="container">
                            <div class="row">
                                <form id="newsForm">
                                    <input type="hidden" id="id" name="id" value="${news.id}">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="submit-page form-simple">
                                            <div class="frm_submit_block">
                                                <h3>发布信息</h3>
                                                <div class="form-row">
                                                    <div class="form-group col-md-12">
                                                        <label><strong>作者</strong></label>
                                                        <input type="text" name="author" class="form-control"
                                                               value="${news.author}">
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label><strong>新闻标题</strong></label>
                                                        <input type="text" name="title" class="form-control"
                                                               value="${news.title}" style="width: 1000px;">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label><strong>新闻内容</strong></label>
                                                        <%--富文本编辑器测试区域--%>
                                                        <div id="div1">
                                                            <p>${news.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12" style="display: none;">
                                                        <label><strong>新闻内容</strong></label>
                                                        <textarea class="form-control h-240" name="content" id="content"
                                                                  style="min-height: 300px;width: 1000px">${news.content}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-12 col-md-12">
                                                    <button class="btn btn-theme bg-2" type="button"
                                                            onclick="submitNews()">发布
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</section>
<%--同步修改textarea中的H5内容--%>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    var $text1 = $('#content')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())
</script>
<%@ include file="../common/footer.jsp" %>
