<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order List</title>
</head>
<body>

<h1>订单</h1>
<s:iterator value="result" status="status_order">
	<table width="670px" border="1" cellspacing="0">
		<tr>
			<td>订单号：<s:property value="result[#status_order.index].id"/></td>
			<td>下定日期：<s:property value="result[#status_order.index].create_date"/></td>
			<td>付款日期：<s:property value="result[#status_order.index].finish_date"/></td>
		</tr>
		<s:generator separator="#" val="result[#status_order.index].bookname" var="bookname"></s:generator>
		<s:generator separator="#" val="result[#status_order.index].seller" var="seller"></s:generator>
		<s:generator separator="#" val="result[#status_order.index].amount" var="amount"></s:generator>
		<s:merge var="book_list">
			<s:param value="#bookname"></s:param>
			<s:param value="#seller"></s:param>
			<s:param value="#amount"></s:param>
		</s:merge>
		<s:iterator value="#book_list" status="book_list_status">
			<s:if test="#book_list_status.index%3==0">
				<tr><td>书名：<s:property/></td>
			</s:if>
			<s:elseif test="#book_list_status.index%3==1">
				<td>卖家：<s:property/></td>
			</s:elseif>
			<s:else>
				<td>数量：<s:property/></td></tr>
			</s:else>
		</s:iterator>
	</table>
	<br>
</s:iterator>

</body>
</html>