<%--
  Created by IntelliJ IDEA.
  User: SmallJIE
  Date: 2018/3/12
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
    <form class="layui-form" id="catAddForm">
        <div class="layui-form-item">
            <label for="cat_name" class="layui-form-label">
                <span class="we-red">*</span>分类名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cat_name" name="cat_name" required="" lay-verify="required"
                       autocomplete="off" placeholder="名称..." class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="cat_desc" class="layui-form-label">
                分类描述
            </label>
            <div class="layui-input-inline">
                <textarea id="cat_desc" name="cat_desc" autocomplete="off" class="layui-textarea"
                          placeholder="描述..."></textarea>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否上架</label>
            <div class="layui-input-block">
                <input type="radio" name="status" value="1" title="是">
                <input type="radio" name="status" value="2" title="否" checked>
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-filter="add" lay-submit="">
                添加
            </button>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'jquery', 'layer', 'admin'], function () {
        var form = layui.form,
            $ = layui.jquery,
            admin = layui.admin,
            layer = layui.layer;
        //开关监听
//        form.on('switch(switchTest)', function (data) {
//        //layer.msg(this.checked?"是":"否");
//            if (this.checked) {
//                $(this).val(1);
//            } else {
//                $(this).val(2);
//            }
//        layer.msg($(this).attr("value"));
//
//        });

        //监听提交
        form.on('submit(add)', function (data) {

            //提交Ajax
            $.ajax({
                data: $("#catAddForm").serialize(),
                dataType: "text",
                type: "post",
                url: "${pageContext.request.contextPath}/product/category_add",
                success: function (res) {
                    layer.alert("添加成功", {icon: 6}, function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });

                }
            });

            return false;
        });

    });
</script>
</body>

</html>