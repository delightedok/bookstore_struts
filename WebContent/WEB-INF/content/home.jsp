<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Store HOME</title>

<style type="text/css">
body{background:white;}
.head{height:25px;padding-right:100px;text-align:right;}
.main{height:400px;position:relative;}
.logoImg{height:100px;position:absolute;top:130px;left:38%}
#keys{position:absolute;height:30px;width:50%;left:20%;}
#search{position:absolute;height:32px;width:100px;left:71%;}
.form{position:absolute;top:260px;width:100%;height:40px;}
#about{position:absolute;bottom:100px;left:35%;width:70px;}
#manager{position:absolute;bottom:100px;right:45%;width:70px;}
</style>

</head>
<body>
<div class="head">
	<%if(session.getAttribute("login")=="true"){%>
		Welcome,<a href="/BookStoreStruts/user_information">${sessionScope.username}</a>
	<%}else{%>
		<%session.setAttribute("uri", request.getRequestURI().substring(32)); %>
		<a class="loginOrSignup" href="/BookStoreStruts/loginOrSignup">LOGIN/SIGNUP</a>
	<%} %>
</div>
<hr>
<div class="main">
	<img class="logoImg" id="logoImg" alt="LOGO" src="/BookStoreStruts/res/LOGOBlack.png"/>
	<div class="form">
		<s:form action="dosearch">
			<div class="input"><s:textfield id="keys" name="keys" placeholder="Please enter your key words"></s:textfield></div>
			<div class="submit"><s:submit id="search" value="SEARCH"></s:submit></div>
		</s:form>
	</div>
</div>

<a href="/BookStoreStruts/contactUs" id="about">关于我们</a>
<a href="/BookStoreStruts/managerLogin" id="manager">管理员？</a>


</body>
</html>