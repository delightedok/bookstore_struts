<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Database Manager</title>
<link rel="stylesheet" href="jquery-ui-1.11.4/jquery-ui-1.11.4/jquery-ui.css">
<script src="jquery-ui-1.11.4/jquery-ui-1.11.4/external/jquery/jquery.js"></script>
<script src="jquery-ui-1.11.4/jquery-ui-1.11.4/jquery-ui.js"></script>
<script>
$(function(){
	$( "#tabs" ).tabs();//点击按钮变换选项卡
    /*鼠标经过变换选项卡    
    $( "#tabs" ).tabs({
      event: "mouseover"
    });
    */
});
</script>
<style type="text/css">
.top{text-align:center;}
</style>
</head>
<body>
<div class="top"><h1>管理系统</h1></div>
<div id="tabs">
	<ul>
		<li><a href="#manageUsers">管理用户</a></li>
    	<li><a href="#manageBooks">管理图书信息</a></li>
    	<li><a href="#manageOrders">管理订单</a></li>
	</ul>
	<div id="manageUsers">
		hello
	</div>
	<div id="manageBooks">
    	<p>ThinkPHP 中的函数库讲解 ThinkPHP 中的有系统函数库、项目函数库和扩展函数库三种。 ThinkPHP 系统函数库 ThinkPHP 的系统函数库顾名思义这是系统的函数库，是属于ThinkPHP框架本身就自带的，此函数库是必须的。</p>
	</div>
	<div id="manageOrders">
    	<p>怎样在wordpress添加文章后，内容部分禁止自动添加p标签呢？ 如果使用the_content()本来是默认添加了p标签的，这样有点时候很烦，并不是我们想要的样式，怎样禁止wordpress自动给编辑内容添加p标签呢？有两种方法。</p>
	</div>
</div>

</body>
</html>