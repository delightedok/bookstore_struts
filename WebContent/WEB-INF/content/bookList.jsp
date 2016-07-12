<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book List</title>
<style type="text/css">
.book_pic{width:100px;}
.td_1{width:120px;}
.td_2{width:300px;}
.td_3{width:100px;}
.td_4{width:75px;}
.td_5{width:75px;}
</style>
</head>
<body>
<h1>您的上架图书</h1>
<a href="/BookStoreStruts/addBook">添加图书</a>
<s:iterator value="result" status="status">
	<table width="670px" border="1" cellspacing="0">
		<tr>
			<td class="td_1"><img class="book_pic" alt="无法显示图片" src=<s:property value="result[#status.index].path" /> /></td>
			<td class="td_2">
				<div><s:property value="result[#status.index].name"/></div>
				<div><s:property value="result[#status.index].author"/></div>
				<div><s:property value="result[#status.index].ISBN"/></div>
			</td>
			<td class="td_3">
				<div><s:property value="result[#status.index].publisher"/></div>
				<div><s:property value="result[#status.index].publish_date"/></div>
			</td>
			<td class="td_4"><div><s:property value="result[#status.index].amount"/></div></td>
			<td class="td_5"><div><s:property value="result[#status.index].price"/></div></td>
		</tr>
		<tr>
			<td colspan="1">描述</td>
			<td colspan="4"><div><s:property value="result[#status.index].description"/></div></td>
		</tr>
	</table>
	<br>
</s:iterator>

</body>
</html>