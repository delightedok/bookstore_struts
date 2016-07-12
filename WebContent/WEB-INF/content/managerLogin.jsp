<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Login</title>
<style type="text/css">
body{background-color:green;}
.main{position:absolute;width:100%;height:100%;top:0px;left:0px;background-image:url("/BookStoreStruts/res/ManagerLoginBackground.png");}
.login_box{width:300px;height:200px;background:white;position:absolute;left:50%;top:50%;margin-left:-150px;margin-top:-80px;}
#input_name{position:relative;top:30px;left:20px;width:250px;height:30px;border-radius:5px;}
#input_pass{position:relative;top:40px;left:20px;width:250px;height:30px;border-radius:5px;}
#input_submit{position:relative;top:50px;left:20px;width:255px;height:30px;}
#incorrect{position:relative;top:40px;left:30px;color:red;}
</style>
</head>
<body>

<div class="main">

	<div class="login_box">
		<s:form theme="simple" action="manager_login">
			<s:textfield id="input_name" name="managername" placeholder="管理员名字"></s:textfield>
			<s:password id="input_pass" name="managerpassword" placeholder="管理员密码"></s:password>
			<s:submit id="input_submit" value="登录"></s:submit>
			<%if(session.getAttribute("manager_login")=="incorrect"){ %>
				<h5 id="incorrect">您输入的管理员名字或者密码错误</h5>
			<%} %>
		</s:form>
	</div>

</div>

</body>
</html>