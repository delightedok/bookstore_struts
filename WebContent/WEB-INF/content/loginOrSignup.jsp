<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookStore</title>
<style type="text/css">
#homeHead{
	position:fixed;
	top:0px;
	left:0px;
	z-index:2;}
#homeHeadLogo{
	position:fixed;
	top:0px;
	left:10px;
	z-index:3;}
#homeBodyBackground{
	position:fixed;
	top:10%;
	left:0px;
	z-index:-1;}
#homeBodyTextBackground{
	position:absolute;
	top:15%;
	right:100px;
	z-index:0;}
.homeBodyWelcome{
	position:absolute;
	top:15%;
	right:100px;
	width:70%;
	height:550px;
	text-align:left;}
.homeBodyWelcomeText{
	position:absolute;
	top:0px;
	left:0px;
	width:60%;
	padding:20px;}
.homeBodyWelcomeText h1{
	color:"#000";
	font-size:60px;
	font-weight:900;
	font-style:oblique;}
.homeBodyWelcomeText p{
	color:"#000";
	font-size:30px;
	font-weight:bold;}
.websiteIntroduction p{
	position:absolute;
	left:0px;
	bottom:0px;
	padding:20px;
	width:60%;}
.login{
	position:absolute;
	top:0px;
	right:0px;
	width:35%;
	height:183px;
	padding:20px;}
.loginBackground{
	position:absolute;
	top:30%;
	left:50px;
	width:50%;
	height:90px;
	padding:20px;}
.loginUsername{
	position:absolute;
	top:0px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;}
.loginUsernameInput{
	position:absolute;top:7px;left:5px;
	width:90%;
	height:20px;
	border-radius:5px;}
.loginPassword{
	position:absolute;
	top:40px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;}
.loginPasswordInput{
	position:absolute;top:47px;left:5px;
	width:90%;
	height:20px;
	border-radius:5px;}
.forgotOrRemember{
	position:absolute;
	top:80px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;
	font-size:15px;
	font-weight:normal;}
.forgot{
	text-decoration:none;}
.loginSubmit{
	position:absolute;
	top:84px;
	right:4%;
	width:52px;
	height:30px;
	border-radius:5px;
	background:url("/BookStoreStruts/res/homeLoginButton.png");}
.signUp{
	position:absolute;
	top:193px;
	right:0px;
	width:35%;
	height:316px;
	padding:20px;}
.signUpBackground{
	position:absolute;
	top:20px;
	left:50px;
	width:50%;
	height:180px;
	padding-top:0px;
	padding-bottom:10px;
	padding-left:20px;
	padding-right:20px;}
.signUpBackground hr{
	position:absolute;
	top:30px;
	left:10px;
	right:10px;}
.signUpHead{
	position:absolute;
	top:10px;
	left:10px;
	width:90%;
	font-size:20px;
	font-weight:bold;}
.signUpUsername{
	position:absolute;
	top:45px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;}
.signUpUsernameInput{
	position:absolute;top:47px;left:5px;
	width:90%;
	height:20px;
	border-radius:5px;}
.signUpEmail{
	position:absolute;
	top:75px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;}
.signUpEmailInput{
	position:absolute;top:87px;left:5px;
	width:90%;
	height:20px;
	border-radius:5px;}
.signUpPassword{
	position:absolute;
	top:105px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;}
.signUpPasswordInput{
	position:absolute;top:127px;left:5px;
	width:90%;
	height:20px;
	border-radius:5px;}
.signUpSubmit{
	position:absolute;
	top:135px;
	left:0px;
	width:90%;
	height:20px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:5%;
	padding-right:5%;}
.signUpSubmitInfo{
	position:absolute;top:157px;
	right:4%;
	width:105px;
	height:33px;
	border-radius:5px;
	background:url("/BookStoreStruts/res/homeSignUpButton.png");}
</style>
</head>
<body>
<div>
	<img id="homeHead" alt="HomeHead" src="/BookStoreStruts/res/homeHead2.png" height="10%" width="100%"/>
	<img id="homeHeadLogo" alt="LOGO BookStore" src="/BookStoreStruts/res/homeHeadLogo.png" height="10%"/>
</div><br>
<div id="homeBody">
	
	<img id="homeBodyBackground" alt="HomeBodyBackground" src="/BookStoreStruts/res/homeBodyBackground.png" width="100%" height="90%"/>
	<img id="homeBodyTextBackground" alt="HomeBodyTextBackground" src="/BookStoreStruts/res/homeBodyTextBackground.png" width="70%" height="550"/>
	<div class="homeBodyWelcome">
		<div class="homeBodyWelcomeText">
			<h1>欢迎使用BookStore。</h1>
			<p>根据您的兴趣，发现广阔的知识，并将知识传播至天涯海角。</p>
		</div>
		<div class="websiteIntroduction">
			<p><a class="introductionLink" href="websiteIntroduction.html">Want to Know Our BookStore Information? Please Click.</a></p>
		</div>
		<div class="login">
			<div class="loginBackground" style="border:1px solid white;">
				<s:form action="login" name="login">
					<div class="loginUsername">
						<s:textfield type="text" name="username" placeholder="用户名" class="loginUsernameInput"/>
					</div>
					<div class="loginPassword">
						<s:textfield type="password" name="password" placeholder="密码" class="loginPasswordInput"/>
					</div>
					<div class="forgotOrRemember">
						<input type="checkbox" name="remember_me" class="remember" checked="checked"/>
						<span>记住我</span>
						<span>·</span>
						<a class="forgot" href="forgotPassword.jsp">忘记密码？</a>
						<s:submit class="loginSubmit" value=" "/>
					</div>
				</s:form>
			</div>
		</div>
		<div class="signUp">
			<div class="signUpBackground" style="border:1px solid white;">
				<div class="signUpHead">没有账号？注册</div>
				<hr>
				<s:form action="signUp" name="signUp">
					<div class="signUpUsername">
						<s:textfield type="text" name="username" placeholder="用户名" class="signUpUsernameInput"/>
					</div>
					<div class="signUpEmail">
						<s:textfield type="text" name="email" placeholder="邮箱地址" class="signUpEmailInput"/>
					</div>
					<div class="signUpPassword">
						<s:textfield type="password" name="password" placeholder="密码" class="signUpPasswordInput"/>
					</div>
					<div class="signUpSubmit">
						<s:submit class="signUpSubmitInfo" value=" "/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>
</body>
</html>