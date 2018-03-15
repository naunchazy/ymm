<%--
  Created by IntelliJ IDEA.
  User: SmallJIE
  Date: 2018/3/12
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
    <form class="layui-form" id="editToForm" >
        <div class="layui-form-item">
            <label for="cat_id" class="layui-form-label">
                <span class="we-red">*</span>分类编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cat_id" name="cat_id" required="" lay-verify="required"
                       autocomplete="off" value="${category.cat_id}" readonly class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="cat_name" class="layui-form-label">
                <span class="we-red">*</span>分类名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cat_name" name="cat_name" required="" lay-verify="required"
                       autocomplete="off" value="${category.cat_name}" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="cat_desc" class="layui-form-label">
                分类描述
            </label>
            <div class="layui-input-inline">
                <textarea  id="cat_desc" name="cat_desc" autocomplete="off" class="layui-textarea">${category.cat_desc}</textarea>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否上架</label>
            <div class="layui-input-block">
                <input type="radio" name="status" value="1" title="是" checked>
                <input type="radio" name="status" value="2" title="否" >
            </div>
        </div>

        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form','layer','admin'], function(){
        var form = layui.form,
            admin = layui.admin,
            layer = layui.layer;



        //监听提交
        form.on('submit(update)', function(data){
            $.ajax({
                data : $("#editToForm").serialize(),
                dataType : "text",
                type : "post",
                url : "${pageContext.request.contextPath}/product/category_editTo",
                success : function(res) {
                    if(res>0){
                        layer.alert("修改成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }else{
                        layer.alert("修改失败", {icon: 5});
                    }
                }
            });
            return false;
        });

    });
</script>
</body>

</html>