<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Order</title>
<style type="text/css">
body{text-align:center;}
.book_div{border:1px solid #CCFAC7;width:20%;}
.part_div{border:1px solid #CDCECD;width:50%;}
.info{width:100%;position:relative}
.info_form{width:50%;text-align:center;position:absolute;left:25%;}
.info_input{border:1px solid grey;width:50%;
	border-top-width:0px;border-bottom-width:1px;
	border-right-width:0px;border-left-width:0px;}
.address_label{border-top-width:0px;border-bottom-width:0px;
	border-right-width:0px;border-left-width:0px;}
#part_div_form{border:1px solid #CDCECD;width:100%;}
.total_pay{}
</style>
</head>
<body>
<h1 style="position:relative;">您的订单</h1>
<hr>
<div style="position:relative;">
	<s:iterator value="order" status="status2">
		<div>书名：<s:property value="order[#status2.index].name"/></div>
		<div>卖家：<s:property value="order[#status2.index].owner"/></div>
		<div>数量：<s:property value="order[#status2.index].amount"/></div>
		<hr class="book_div">
	</s:iterator>
</div>
<br><hr class="part_div"><br>
<div class="info">
	<s:form class="info_form" theme="simple" action="pay">
		<div><s:textfield name="address" class="info_input" placeholder="地址"></s:textfield></div><br>
		<div><s:textfield name="telephone" class="info_input" placeholder="联系电话"></s:textfield></div><br>
		<div><s:textfield name="email" class="info_input" placeholder="邮箱-可用于发送物流信息"></s:textfield></div>
		<br><hr id="part_div_form"><br>
		<div style="font-size:24px;">
			<span>总计：<s:property value="totals"/></span>
			<span> | </span>
			<span><s:submit value="提交订单" style="width:65px;height:34px;"></s:submit></span>
		</div>
	</s:form>
</div>

</body>
</html>