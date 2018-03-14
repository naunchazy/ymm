<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品列表-后台管理系统</title>
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
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">产品管理</a>
        <a><cite>商品管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">

            <div class="layui-inline">
                <input type="text" name="username" placeholder="请输入关键字" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="weadmin-block">
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="WeAdminShow('添加商品','./goods_add')"><i class="layui-icon"></i>添加</button>
        <span class="fr" style="line-height:40px">共有数据：88 条</span>
    </div>
    <table class="layui-hide" id="goodsList"></table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script type="text/html" id="operateTpl">
    <a title="编辑" onclick="WeAdminShow('编辑','./goods_edit')" href="javascript:;">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" id="cat_del" onclick="cat_del('要删除的id')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['table', 'jquery', 'admin'], function () {
        var table = layui.table,
            $ = layui.jquery,
            admin = layui.admin;

        table.render({
            elem: '#goodsList', //指定元素
            cellMinWidth: 80,
            cols: [
                [{
                    type: 'checkbox'
                }, {
                    field: 'cat_id',title:'分类编号',sort:true
                },{
                    field: 'cat_name',title:'分类名称'
                },{
                    field: 'cat_desc',title:'描述'
                },{
                    field: 'measure_unit',title:'单位'
                },{
                    field: 'operate', title: '操作', toolbar: '#operateTpl', unresize: true
                }]
            ],
            //通过URL进行数据绑定
            url:'${pageContext.request.contextPath}/product/goodslist'
        });

        /*分类-删除*/
        window.cat_del = function (id) {
            layer.confirm('确认要删除吗？', function (index) {
                //提交ajax
                $.ajax({
                    data: id,
                    dataType: "text",
                    type: "GET",
                    url: "${pageContext.request.contextPath}/product/category_del",
                    success: function (res) {
                        if (res == "true") {
                            layer.msg('已删除!', {
                                icon: 1,
                                time: 1000
                            });
                        } else {
                            layer.msg('删除失败!', {
                                icon: 2,
                                time: 1000
                            });
                        }
                    }
                });

            });
        }


    });

</script>
</body>
</html>