<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pay</title>
</head>
<body style="text-align:center;">

付款页面

<s:form action="finish" theme="simple">
	<s:hidden name="orderId"></s:hidden>
	<s:submit value="确认支付"></s:submit>
</s:form>


</body>
</html>