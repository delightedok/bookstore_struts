<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Book</title>
<style type="text/css">
body{text-align:center;}
.main{position:relative;left:25%;width:50%;height:400px;}
#book_pic_bg{position:absolute;top:0px;left:233px;border:1px solid black;width:205px;height:205px;background-color:#f2efe6;}
.form_div{border:1px solid grey;width:100%;height:30px;
	border-top-width:0px;border-bottom-width:1px;
	border-right-width:0px;border-left-width:0px;}
</style>
</head>
<body>

<h1>添加图书</h1>
<div class="main">
	<div id="book_pic_bg"></div>
	<%if(session.getAttribute("hasUpload")=="true"){ %>
		<div><img style="position:relative;left:1px;top:1px;width:200px;height:200px;" src="<%=session.getAttribute("pic_uri") %>"></div>
	<%}else{ %>
		<div><div style="position:relative;left:1px;top:1px;width:200px;height:200px;"></div></div>
	<%} %>
	<br style="position:relative;">
	<div style="position:relative;width:100%;">
		<s:form action="upload" enctype="multipart/form-data" method="post">
			<s:file style="position:absolute;left:190px;top:2px;" name="upload"></s:file>
			<s:submit value="上传" style="position:absolute;left:410px;top:2px;"></s:submit>
		</s:form>
	</div>
	<br style="position:relative;">
	<br style="position:relative;">
	<div style="position:relative;width:100%;">
	<s:form theme="simple" action="add_book" style="text-align:center;position:absolute;left:25%;width:50%;">
		<div><s:textfield class="form_div" name="name" placeholder="书名"></s:textfield></div>
		<div><s:textfield class="form_div" name="author" placeholder="作者"></s:textfield></div>
		<div><s:textfield class="form_div" name="amount" placeholder="数量"></s:textfield></div>
		<div><s:textfield class="form_div" name="price" placeholder="价格"></s:textfield></div>
		<div><s:textfield class="form_div" name="publisher" placeholder="出版社"></s:textfield></div>
		<div><s:textfield class="form_div" name="publish_date" placeholder="出版日期"></s:textfield></div>
		<div><s:textfield class="form_div" name="ISBN" placeholder="ISBN"></s:textfield></div>
		<div><s:textfield class="form_div" name="description" placeholder="描述"></s:textfield></div>
		<%if(session.getAttribute("hasUpload")=="true"){ %>
			<s:hidden name="path" value="%{#session.pic_uri}"></s:hidden>
		<%} %>
		<div><s:submit value="提交"></s:submit></div>
	</s:form>
	</div>
</div>
</body>
</html>