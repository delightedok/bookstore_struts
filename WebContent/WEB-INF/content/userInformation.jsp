<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Information</title>
<style type="text/css">
.head{position:fixed;top:0px;width:100%;height:35px;background-image:url('/BookStoreStruts/res/homeHead.png');z-index:4;}
.logo{position:absolute;height:35px;left:50px;}
.logout{position:absolute;right:100px;top:5px;}
body{text-align:center;}
#main{position:absolute;width:50%;height:100%;left:25%;}
#user_info{position:absolute;top:50px;width:100%;left:0px;background-image:url(/BookStoreStruts/res/homeHead.png);}
#user_edit{position:absolute;top:50px;width:100%;left:0px;background-image:url(/BookStoreStruts/res/homeHead.png);}
.user_info_td{width:50%;}
.book_info{position:relative;width:100%;}
#user_book_divider{position:relative;width:100%;border:1px dashed #CDCECD;}
#book_order_divider{position:relative;width:100%;border:1px dashed #CDCECD;}
</style>
<script type="text/javascript">
function toEdit(){
	document.getElementById("user_info").style.zIndex=2;
	document.getElementById("user_edit").style.zIndex=3;
}
function toShow(){
	document.getElementById("user_info").style.zIndex=3;
	document.getElementById("user_edit").style.zIndex=2;
}
</script>
</head>
<body>
<div class="head">
	<img class="logo" alt="LOGO" src="/BookStoreStruts/res/LOGOBlack.png">
	<a class="logout" href="/BookStoreStruts/logout">LOGOUT</a>
	<hr style="position:absolute;top:27px;width:100%;">
</div>
<div id="main">
<div style="positioin:relative;width:100%;height:45px;">
	<img alt="headBackground" src="/BookStoreStruts/res/homeHead.png" height="45px">
</div>
<div id="user_info" style="z-index:3;">
	<table align="center" width="100%" border="1" cellspacing="0">
		<tr>
			<td colspan="2" class="user_info_td"><h1>个人信息</h1></td>
		</tr>
		<tr>
			<td class="user_info_td"><h3>用户ID</h3></td>
			<td class="user_info_td"><s:property value="user.id"/></td>
		</tr>
		<tr>
			<td class="user_info_td"><h3>姓名</h3></td>
			<td class="user_info_td"><s:property value="username"/></td>
		</tr>
		<tr>
			<td class="user_info_td"><h3>电子邮件</h3></td>
			<td class="user_info_td"><s:property value="user.email"/></td>
		</tr>
		<tr>
			<td class="user_info_td"><h3>电话</h3></td>
			<td class="user_info_td"><s:property value="user.telephone"/></td>
		</tr>
	</table>
	<input type="button" id="modify" value="修改信息" onclick="toEdit()"/>
</div>
<div id="user_edit" style="z-index:2;">
	<s:form theme="simple" action="modify">
		<table align="center" width="100%" border="1" cellspacing="0">
			<tr>
				<td colspan="2" class="user_info_td"><h1>个人信息</h1></td>
			</tr>
			<tr>
				<td class="user_info_td"><h3>用户ID</h3></td>
				<td class="user_info_td"><s:property value="user.id"/></td>
			</tr>
			<tr>
				<td class="user_info_td"><h3>姓名</h3></td>
				<td class="user_info_td"><s:textfield name="user.username" value=""></s:textfield></td>
			</tr>
			<tr>
				<td class="user_info_td"><h3>电子邮件</h3></td>
				<td class="user_info_td"><s:textfield name="user.email" value=""></s:textfield></td>
			</tr>
			<tr>
				<td class="user_info_td"><h3>电话</h3></td>
				<td class="user_info_td"><s:textfield name="user.telephone" value=""></s:textfield></td>
			</tr>
		</table>
		<s:hidden name="user.id"></s:hidden>
		<s:submit value="保存"></s:submit>
		<input type="reset" onclick="toShow()" value="取消" />
	</s:form>
</div>
<div style="position:relative;width:100%;height:380px;"></div>
<hr id="user_book_divider">
<div class="book_info">
	<s:action name="book_db" executeResult="true">
		<s:param name="syntax" value="'select name,path,author,amount,price,publisher,publish_date,ISBN,description from books where '"></s:param>
		<s:param name="param['owner']" value="user.id"></s:param>
	</s:action>
</div>
<hr id="book_order_divider">
<div class="order_info">
	<s:action name="order_db" executeResult="true">
		<s:param name="syntax" value="'select bookname,seller,amount,id,create_date,finish_date from orders where '"></s:param>
		<s:param name="param['buyerId']" value="user.id"></s:param>
	</s:action>
</div>
</div>

</body>
</html>