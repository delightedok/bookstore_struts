<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Operation</title>
<style type="text/css">
body{text-align:center;}
.info_choose{position:relative;width:100%;}
.info{position:relative;width:100%;}
.info_td{border:1px solid black;}
</style>
<script type="text/javascript">
function radio_submit(){
	document.getElementById("rc").submit();
}
function edit_users(num){
	var id=document.getElementById("id"+num).innerHTML;
	var username=document.getElementById("username"+num).innerHTML;
	var email=document.getElementById("email"+num).innerHTML;
	var telephone=document.getElementById("telephone"+num).innerHTML;
	var permission=document.getElementById("permission"+num).innerHTML;
	var seller=document.getElementById("seller"+num).innerHTML;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\"><input id=\"username"+num+"\" type=\"text\" id=\"td0\" value=\""+username+"\"><input id=\"usernameh"+num+"\" type=\"hidden\" value=\""+username+"\"></td>"+
					"<td class=\"info_td\"><input id=\"email"+num+"\" type=\"text\" id=\"td1\" value=\""+email+"\" ><input id=\"emailh"+num+"\" type=\"hidden\" value=\""+email+"\"></td>"+
					"<td class=\"info_td\"><input id=\"telephone"+num+"\" type=\"text\" id=\"td2\" value=\""+telephone+"\" ><input id=\"telephoneh"+num+"\" type=\"hidden\" value=\""+telephone+"\"></td>"+
					"<td class=\"info_td\" id=\"id"+num+"\">"+id+"</td>"+
					"<td class=\"info_td\"><input id=\"permission"+num+"\" type=\"text\" id=\"td4\" value=\""+permission+"\" ><input id=\"permissionh"+num+"\" type=\"hidden\" value=\""+permission+"\"></td>"+
					"<td class=\"info_td\"><input id=\"seller"+num+"\" type=\"text\" id=\"td5\" value=\""+seller+"\" ><input id=\"sellerh"+num+"\" type=\"hidden\" value=\""+seller+"\"></td>"+
					"<td><input type=\"button\" id=\"save"+num+"\" value=\"保存\" onclick=\"save_users("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"cancel"+num+"\" value=\"取消\" onclick=\"cancel_users("+num+")\"></td>";
}
function edit_books(num){
	var name=document.getElementById("name"+num).innerHTML;
	var owner=document.getElementById("owner"+num).innerHTML;
	var author=document.getElementById("author"+num).innerHTML;
	var amount=document.getElementById("amount"+num).innerHTML;
	var price=document.getElementById("price"+num).innerHTML;
	var publisher=document.getElementById("publisher"+num).innerHTML;
	var publish_date=document.getElementById("publish_date"+num).innerHTML;
	var ISBN=document.getElementById("ISBN"+num).innerHTML;
	var description=document.getElementById("description"+num).innerHTML;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\"><input id=\"name"+num+"\" type=\"text\" id=\"td0\" value=\""+name+"\"><input id=\"nameh"+num+"\" type=\"hidden\" value=\""+name+"\"></td>"+
					"<td class=\"info_td\"><input id=\"owner"+num+"\" type=\"text\" id=\"td1\" value=\""+owner+"\" ><input id=\"ownerh"+num+"\" type=\"hidden\" value=\""+owner+"\"></td>"+
					"<td class=\"info_td\"><input id=\"author"+num+"\" type=\"text\" id=\"td2\" value=\""+author+"\" ><input id=\"authorh"+num+"\" type=\"hidden\" value=\""+author+"\"></td>"+
					"<td class=\"info_td\"><input id=\"amount"+num+"\" type=\"text\" id=\"td3\" value=\""+amount+"\" ><input id=\"amounth"+num+"\" type=\"hidden\" value=\""+amount+"\"></td>"+
					"<td class=\"info_td\"><input id=\"price"+num+"\" type=\"text\" id=\"td4\" value=\""+price+"\" ><input id=\"priceh"+num+"\" type=\"hidden\" value=\""+price+"\"></td>"+
					"<td class=\"info_td\"><input id=\"publisher"+num+"\" type=\"text\" id=\"td5\" value=\""+publisher+"\" ><input id=\"publisherh"+num+"\" type=\"hidden\" value=\""+publisher+"\"></td>"+
					"<td class=\"info_td\"><input id=\"publish_date"+num+"\" type=\"text\" id=\"td6\" value=\""+publish_date+"\" ><input id=\"publish_dateh"+num+"\" type=\"hidden\" value=\""+publish_date+"\"></td>"+
					"<td class=\"info_td\"><input id=\"ISBN"+num+"\" type=\"text\" id=\"td7\" value=\""+ISBN+"\" ><input id=\"ISBNh"+num+"\" type=\"hidden\" value=\""+ISBN+"\"></td>"+
					"<td class=\"info_td\"><input id=\"description"+num+"\" type=\"text\" id=\"td8\" value=\""+description+"\" ><input id=\"descriptionh"+num+"\" type=\"hidden\" value=\""+description+"\"></td>"+
					"<td><input type=\"button\" id=\"save"+num+"\" value=\"保存\" onclick=\"save_books("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"cancel"+num+"\" value=\"取消\" onclick=\"cancel_books("+num+")\"></td>";
}
function edit_orders(num){
	var id=document.getElementById("id"+num).innerHTML;
	var bookname=document.getElementById("bookname"+num).innerHTML;
	var seller=document.getElementById("seller"+num).innerHTML;
	var amount=document.getElementById("amount"+num).innerHTML;
	var create_date=document.getElementById("create_date"+num).innerHTML;
	var finish_date=document.getElementById("finish_date"+num).innerHTML;
	var buyer=document.getElementById("buyer"+num).innerHTML;
	var address=document.getElementById("address"+num).innerHTML;
	var telephone=document.getElementById("telephone"+num).innerHTML;
	var email=document.getElementById("email"+num).innerHTML;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\"><input id=\"bookname"+num+"\" type=\"text\" id=\"td0\" value=\""+bookname+"\"><input id=\"booknameh"+num+"\" type=\"hidden\" value=\""+bookname+"\"></td>"+
					"<td class=\"info_td\"><input id=\"seller"+num+"\" type=\"text\" id=\"td1\" value=\""+seller+"\" ><input id=\"sellerh"+num+"\" type=\"hidden\" value=\""+seller+"\"></td>"+
					"<td class=\"info_td\"><input id=\"amount"+num+"\" type=\"text\" id=\"td2\" value=\""+amount+"\" ><input id=\"amounth"+num+"\" type=\"hidden\" value=\""+amount+"\"></td>"+
					"<td class=\"info_td\" id=\"id"+num+"\">"+id+"</td>"+
					"<td class=\"info_td\"><input id=\"create_date"+num+"\" type=\"text\" id=\"td4\" value=\""+create_date+"\" ><input id=\"create_dateh"+num+"\" type=\"hidden\" value=\""+create_date+"\"></td>"+
					"<td class=\"info_td\"><input id=\"finish_date"+num+"\" type=\"text\" id=\"td5\" value=\""+finish_date+"\" ><input id=\"finish_dateh"+num+"\" type=\"hidden\" value=\""+finish_date+"\"></td>"+
					"<td class=\"info_td\"><input id=\"buyer"+num+"\" type=\"text\" id=\"td6\" value=\""+buyer+"\" ><input id=\"buyerh"+num+"\" type=\"hidden\" value=\""+buyer+"\"></td>"+
					"<td class=\"info_td\"><input id=\"address"+num+"\" type=\"text\" id=\"td7\" value=\""+address+"\" ><input id=\"addressh"+num+"\" type=\"hidden\" value=\""+address+"\"></td>"+
					"<td class=\"info_td\"><input id=\"telephone"+num+"\" type=\"text\" id=\"td8\" value=\""+telephone+"\" ><input id=\"telephoneh"+num+"\" type=\"hidden\" value=\""+telephone+"\"></td>"+
					"<td class=\"info_td\"><input id=\"email"+num+"\" type=\"text\" id=\"td9\" value=\""+email+"\" ><input id=\"emailh"+num+"\" type=\"hidden\" value=\""+email+"\"></td>"+
					"<td><input type=\"button\" id=\"save"+num+"\" value=\"保存\" onclick=\"save_orders("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"cancel"+num+"\" value=\"取消\" onclick=\"cancel_orders("+num+")\"></td>";
}
function save_users(num){
	var id=document.getElementById("id"+num).innerHTML;
	var username=document.getElementById("username"+num).value;
	var email=document.getElementById("email"+num).value;
	var telephone=document.getElementById("telephone"+num).value;
	var permission=document.getElementById("permission"+num).value;
	var seller=document.getElementById("seller"+num).value;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\" id=\"username"+num+"\">"+username+"</td>"+
					"<td class=\"info_td\" id=\"email"+num+"\">"+email+"</td>"+
					"<td class=\"info_td\" id=\"telephone"+num+"\">"+telephone+"</td>"+
					"<td class=\"info_td\" id=\"id"+num+"\">"+id+"</td>"+
					"<td class=\"info_td\" id=\"permission"+num+"\">"+permission+"</td>"+
					"<td class=\"info_td\" id=\"seller"+num+"\">"+seller+"</td>"+
					"<td><input type=\"button\" id=\"edit"+num+"\" value=\"编辑\" onclick=\"edit_users("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"delete"+num+"\" value=\"删除\" onclick=\"delete_users("+num+")\"></td>";
	//写cookie
	var d=new Date();
	d.setTime(d.getTime()+(5*24*60*60*1000));//保存5天
	var expires="expires="+d.toGMTString();
	var et=email.split(".");
	var et0=et[0].split("@");
	et[0]=et0[0]+"&"+et0[1];
	email=et[0]+"$"+et[1];
	document.cookie="save"+num+"="+username+"#"+email+"#"+telephone+"#"+id+"#"+permission+"#"+seller+"; "+expires;
}
function save_books(num){
	var name=document.getElementById("name"+num).value;
	var owner=document.getElementById("owner"+num).value;
	var author=document.getElementById("author"+num).value;
	var amount=document.getElementById("amount"+num).value;
	var price=document.getElementById("price"+num).value;
	var publisher=document.getElementById("publisher"+num).value;
	var publish_date=document.getElementById("publish_date"+num).value;
	var ISBN=document.getElementById("ISBN"+num).value;
	var description=document.getElementById("description"+num).value;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\" id=\"name"+num+"\">"+name+"</td>"+
					"<td class=\"info_td\" id=\"owner"+num+"\">"+owner+"</td>"+
					"<td class=\"info_td\" id=\"author"+num+"\">"+author+"</td>"+
					"<td class=\"info_td\" id=\"amount"+num+"\">"+amount+"</td>"+
					"<td class=\"info_td\" id=\"price"+num+"\">"+price+"</td>"+
					"<td class=\"info_td\" id=\"publisher"+num+"\">"+publisher+"</td>"+
					"<td class=\"info_td\" id=\"publish_date"+num+"\">"+publish_date+"</td>"+
					"<td class=\"info_td\" id=\"ISBN"+num+"\">"+ISBN+"</td>"+
					"<td class=\"info_td\" id=\"description"+num+"\">"+description+"</td>"+
					"<td><input type=\"button\" id=\"edit"+num+"\" value=\"编辑\" onclick=\"edit_books("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"delete"+num+"\" value=\"删除\" onclick=\"delete_books("+num+")\"></td>";
	//写cookie
	var d=new Date();
	d.setTime(d.getTime()+(5*24*60*60*1000));//保存5天
	var expires="expires="+d.toGMTString();
	document.cookie="saveb"+num+"="+name+"#"+owner+"#"+author+"#"+amount+"#"+price+"#"+publisher+"#"+publish_date+"#"+ISBN+"#"+description+"; "+expires;
}
function save_orders(num){
	var id=document.getElementById("id"+num).innerHTML;
	var bookname=document.getElementById("bookname"+num).value;
	var seller=document.getElementById("seller"+num).value;
	var amount=document.getElementById("amount"+num).value;
	var create_date=document.getElementById("create_date"+num).value;
	var finish_date=document.getElementById("finish_date"+num).value;
	var buyer=document.getElementById("buyer"+num).value;
	var address=document.getElementById("address"+num).value;
	var telephone=document.getElementById("telephone"+num).value;
	var email=document.getElementById("email"+num).value;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\" id=\"bookname"+num+"\">"+bookname+"</td>"+
					"<td class=\"info_td\" id=\"seller"+num+"\">"+seller+"</td>"+
					"<td class=\"info_td\" id=\"amount"+num+"\">"+amount+"</td>"+
					"<td class=\"info_td\" id=\"id"+num+"\">"+id+"</td>"+
					"<td class=\"info_td\" id=\"create_date"+num+"\">"+create_date+"</td>"+
					"<td class=\"info_td\" id=\"finish_date"+num+"\">"+finish_date+"</td>"+
					"<td class=\"info_td\" id=\"buyer"+num+"\">"+buyer+"</td>"+
					"<td class=\"info_td\" id=\"address"+num+"\">"+address+"</td>"+
					"<td class=\"info_td\" id=\"telephone"+num+"\">"+telephone+"</td>"+
					"<td class=\"info_td\" id=\"email"+num+"\">"+email+"</td>"+
					"<td><input type=\"button\" id=\"edit"+num+"\" value=\"编辑\" onclick=\"edit_orders("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"delete"+num+"\" value=\"删除\" onclick=\"delete_orders("+num+")\"></td>";
	//写cookie
	var d=new Date();
	d.setTime(d.getTime()+(5*24*60*60*1000));//保存5天
	var expires="expires="+d.toGMTString();
	var et=email.split(".");
	var et0=et[0].split("@");
	et[0]=et0[0]+"&"+et0[1];
	email=et[0]+"$"+et[1];
	var cdt=create_date.split(" ");
	var cdt11=cdt[1].split(":");
	cdt[1]=cdt11[0]+"#"+cdt11[1]+"#"+cdt11[2];
	create_date=cdt[0]+"$"+cdt[1];
	var fdt=finish_date.split(" ");
	var fdt11=fdt[1].split(":");
	fdt[1]=fdt11[0]+"#"+fdt11[1]+"#"+fdt11[2];
	finish_date=fdt[0]+"$"+fdt[1];
	document.cookie="saveo"+num+"="+bookname+"*"+seller+"*"+amount+"*"+id+"*"+create_date+"*"+finish_date+"*"+buyer+"*"+address+"*"+telephone+"*"+email+"; "+expires;
}
function cancel_users(num){
	var id=document.getElementById("id"+num).innerHTML;
	var username=document.getElementById("usernameh"+num).value;
	var email=document.getElementById("emailh"+num).value;
	var telephone=document.getElementById("telephoneh"+num).value;
	var permission=document.getElementById("permissionh"+num).value;
	var seller=document.getElementById("sellerh"+num).value;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\" id=\"username"+num+"\">"+username+"</td>"+
					"<td class=\"info_td\" id=\"email"+num+"\">"+email+"</td>"+
					"<td class=\"info_td\" id=\"telephone"+num+"\">"+telephone+"</td>"+
					"<td class=\"info_td\" id=\"id"+num+"\">"+id+"</td>"+
					"<td class=\"info_td\" id=\"permission"+num+"\">"+permission+"</td>"+
					"<td class=\"info_td\" id=\"seller"+num+"\">"+seller+"</td>"+
					"<td><input type=\"button\" id=\"edit"+num+"\" value=\"编辑\" onclick=\"edit_users("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"delete"+num+"\" value=\"删除\" onclick=\"delete_users("+num+")\"></td>";
}
function cancel_books(num){
	var name=document.getElementById("nameh"+num).value;
	var owner=document.getElementById("ownerh"+num).value;
	var author=document.getElementById("authorh"+num).value;
	var amount=document.getElementById("amounth"+num).value;
	var price=document.getElementById("priceh"+num).value;
	var publisher=document.getElementById("publisherh"+num).value;
	var publish_date=document.getElementById("publish_dateh"+num).value;
	var ISBN=document.getElementById("ISBNh"+num).value;
	var description=document.getElementById("descriptionh"+num).value;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\" id=\"name"+num+"\">"+name+"</td>"+
					"<td class=\"info_td\" id=\"owner"+num+"\">"+owner+"</td>"+
					"<td class=\"info_td\" id=\"author"+num+"\">"+author+"</td>"+
					"<td class=\"info_td\" id=\"amount"+num+"\">"+amount+"</td>"+
					"<td class=\"info_td\" id=\"price"+num+"\">"+price+"</td>"+
					"<td class=\"info_td\" id=\"publisher"+num+"\">"+publisher+"</td>"+
					"<td class=\"info_td\" id=\"publish_date"+num+"\">"+publish_date+"</td>"+
					"<td class=\"info_td\" id=\"ISBN"+num+"\">"+ISBN+"</td>"+
					"<td class=\"info_td\" id=\"description"+num+"\">"+description+"</td>"+
					"<td><input type=\"button\" id=\"edit"+num+"\" value=\"编辑\" onclick=\"edit_books("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"delete"+num+"\" value=\"删除\" onclick=\"delete_books("+num+")\"></td>";
}
function cancel_orders(num){
	var id=document.getElementById("id"+num).innerHTML;
	var bookname=document.getElementById("booknameh"+num).value;
	var seller=document.getElementById("sellerh"+num).value;
	var amount=document.getElementById("amounth"+num).value;
	var create_date=document.getElementById("create_dateh"+num).value;
	var finish_date=document.getElementById("finish_dateh"+num).value;
	var buyer=document.getElementById("buyerh"+num).value;
	var address=document.getElementById("addressh"+num).value;
	var telephone=document.getElementById("telephoneh"+num).value;
	var email=document.getElementById("emailh"+num).value;
	var row=document.getElementById("tr"+num);
	row.innerHTML="<td class=\"info_td\" id=\"bookname"+num+"\">"+bookname+"</td>"+
					"<td class=\"info_td\" id=\"seller"+num+"\">"+seller+"</td>"+
					"<td class=\"info_td\" id=\"amount"+num+"\">"+amount+"</td>"+
					"<td class=\"info_td\" id=\"id"+num+"\">"+id+"</td>"+
					"<td class=\"info_td\" id=\"create_date"+num+"\">"+create_date+"</td>"+
					"<td class=\"info_td\" id=\"finish_date"+num+"\">"+finish_date+"</td>"+
					"<td class=\"info_td\" id=\"buyer"+num+"\">"+buyer+"</td>"+
					"<td class=\"info_td\" id=\"address"+num+"\">"+address+"</td>"+
					"<td class=\"info_td\" id=\"telephone"+num+"\">"+telephone+"</td>"+
					"<td class=\"info_td\" id=\"email"+num+"\">"+email+"</td>"+
					"<td><input type=\"button\" id=\"edit"+num+"\" value=\"编辑\" onclick=\"edit_orders("+num+")\"></td>"+
					"<td><input type=\"button\" id=\"delete"+num+"\" value=\"删除\" onclick=\"delete_orders("+num+")\"></td>";
}
function delete_users(num){
	var id=document.getElementById("id"+num).innerHTML;
	//写cookie
	var d=new Date();
	d.setTime(d.getTime()+(5*24*60*60*1000));//保存5天
	var expires="expires="+d.toGMTString();
	document.cookie="delete"+num+"="+id+"; "+expires;
	
	var row=document.getElementById("tr"+num);
	var tb=row.parentNode;
	tb.removeChild(row);
}
function delete_books(num){
	var name=document.getElementById("name"+num).innerHTML;
	var owner=document.getElementById("owner"+num).innerHTML;
	var author=document.getElementById("author"+num).innerHTML;
	//写cookie
	var d=new Date();
	d.setTime(d.getTime()+(5*24*60*60*1000));//保存5天
	var expires="expires="+d.toGMTString();
	document.cookie="deleteb"+num+"="+name+"#"+owner+"#"+author+"; "+expires;
	
	var row=document.getElementById("tr"+num);
	var tb=row.parentNode;
	tb.removeChild(row);
}
function delete_orders(num){
	var id=document.getElementById("id"+num).innerHTML;
	//写cookie
	var d=new Date();
	d.setTime(d.getTime()+(5*24*60*60*1000));//保存5天
	var expires="expires="+d.toGMTString();
	document.cookie="deleteo"+num+"="+id+"; "+expires;
	
	var row=document.getElementById("tr"+num);
	var tb=row.parentNode;
	tb.removeChild(row);
}
</script>
</head>
<body>
<div class="info_choose">
<h1 id="body_title"></h1>
<s:form theme="simple" action="showInfo" id="rc">
	<s:radio list="#{'users':'用户信息','books':'图书信息','orders':'订单信息' }" name="choose" onclick="radio_submit()"></s:radio>
</s:form>
<hr>
</div>
<div class="info">
<s:if test='choose.indexOf("users")==0'>
	<script>document.getElementById("body_title").innerHTML="用户信息";</script>
	<div>
	<s:form theme="simple" action="doChange">
	<s:hidden name="choose"></s:hidden>
	<s:submit style="width:100px;height:30px;" value="提交"></s:submit>
	<table cellspacing=0 style="position:absolute;top:35px;left:50%;width:700px;margin-left:-350px;">
		<tr>
			<th class="info_td">姓名</th>
			<th class="info_td">邮件</th>
			<th class="info_td">手机</th>
			<th class="info_td">用户ID</th>
			<th class="info_td">权限</th>
			<th class="info_td">是否为卖家</th>
		</tr>
		<%int i=0; %>
		<s:iterator value="result" status="statusm">
			<tr id=<%="tr"+i %>>
				<td class="info_td" id=<%="username"+i %>><s:property value="result[#statusm.index].username" ></s:property></td>
				<td class="info_td" id=<%="email"+i %>><s:property value="result[#statusm.index].email" ></s:property></td>
				<td class="info_td" id=<%="telephone"+i %>><s:property value="result[#statusm.index].telephone" ></s:property></td>
				<td class="info_td" id=<%="id"+i %>><s:property value="result[#statusm.index].id"></s:property></td>
				<td class="info_td" id=<%="permission"+i %>><s:property value="result[#statusm.index].permission" ></s:property></td>
				<td class="info_td" id=<%="seller"+i %>><s:property value="result[#statusm.index].seller" ></s:property></td>
				<td><input type="button" id=<%="edit"+i %> value="编辑" onclick=<%="edit_users("+i+")" %>></td>
				<td><input type="button" id=<%="delete"+i %> value="删除" onclick=<%="delete_users("+i+")" %>></td>
			</tr>
			<%i++; %>
		</s:iterator>
	</table>
	</s:form>
	</div>
</s:if>
<s:elseif test='choose.indexOf("books")==0'>
	<script>document.getElementById("body_title").innerHTML="图书信息";</script>
	<div>
	<s:form theme="simple" action="doChange">
	<s:hidden name="choose"></s:hidden>
	<s:submit style="width:100px;height:30px;" value="提交"></s:submit>
	<table cellspacing=0 style="position:absolute;top:35px;left:50%;width:900px;margin-left:-450px;">
		<tr>
			<th class="info_td">书名</th>
			<th class="info_td">拥有者</th>
			<th class="info_td">作者</th>
			<th class="info_td">数量</th>
			<th class="info_td">价格</th>
			<th class="info_td">出版社</th>
			<th class="info_td">出版日期</th>
			<th class="info_td">ISBN</th>
			<th class="info_td">描述</th>
		</tr>
		<%int i=0; %>
		<s:iterator value="result" status="statusm">
			<tr id=<%="tr"+i %>>
				<td class="info_td" id=<%="name"+i %>><s:property value="result[#statusm.index].name" ></s:property></td>
				<td class="info_td" id=<%="owner"+i %>><s:property value="result[#statusm.index].owner" ></s:property></td>
				<td class="info_td" id=<%="author"+i %>><s:property value="result[#statusm.index].author" ></s:property></td>
				<td class="info_td" id=<%="amount"+i %>><s:property value="result[#statusm.index].amount" ></s:property></td>
				<td class="info_td" id=<%="price"+i %>><s:property value="result[#statusm.index].price" ></s:property></td>
				<td class="info_td" id=<%="publisher"+i %>><s:property value="result[#statusm.index].publisher" ></s:property></td>
				<td class="info_td" id=<%="publish_date"+i %>><s:property value="result[#statusm.index].publish_date" ></s:property></td>
				<td class="info_td" id=<%="ISBN"+i %>><s:property value="result[#statusm.index].ISBN" ></s:property></td>
				<td class="info_td" id=<%="description"+i %>><s:property value="result[#statusm.index].description" ></s:property></td>
				<td><input type="button" id=<%="edit"+i %> value="编辑" onclick=<%="edit_books("+i+")" %>></td>
				<td><input type="button" id=<%="delete"+i %> value="删除" onclick=<%="delete_books("+i+")" %>></td>
			</tr>
			<%i++; %>
		</s:iterator>
	</table>
	</s:form>
	</div>
</s:elseif>
<s:else>
	<script>document.getElementById("body_title").innerHTML="订单信息";</script>
	<div>
	<s:form theme="simple" action="doChange">
	<s:hidden name="choose"></s:hidden>
	<s:submit style="width:100px;height:30px;" value="提交"></s:submit>
	<table cellspacing=0 style="position:absolute;top:35px;left:50%;width:1000px;margin-left:-500px;">
		<tr>
			<th class="info_td">书名</th>
			<th class="info_td">卖家</th>
			<th class="info_td">数量</th>
			<th class="info_td">订单ID</th>
			<th class="info_td">生成日期</th>
			<th class="info_td">支付日期</th>
			<th class="info_td">买家</th>
			<th class="info_td">地址</th>
			<th class="info_td">手机</th>
			<th class="info_td">电子邮件</th>
		</tr>
		<%int i=0; %>
		<s:iterator value="result" status="statusm">
			<tr id=<%="tr"+i %>>
				<td class="info_td" id=<%="bookname"+i %>><s:property value="result[#statusm.index].bookname" ></s:property></td>
				<td class="info_td" id=<%="seller"+i %>><s:property value="result[#statusm.index].seller" ></s:property></td>
				<td class="info_td" id=<%="amount"+i %>><s:property value="result[#statusm.index].amount" ></s:property></td>
				<td class="info_td" id=<%="id"+i %>><s:property value="result[#statusm.index].id" ></s:property></td>
				<td class="info_td" id=<%="create_date"+i %>><s:property value="result[#statusm.index].create_date" ></s:property></td>
				<td class="info_td" id=<%="finish_date"+i %>><s:property value="result[#statusm.index].finish_date" ></s:property></td>
				<td class="info_td" id=<%="buyer"+i %>><s:property value="result[#statusm.index].buyer" ></s:property></td>
				<td class="info_td" id=<%="address"+i %>><s:property value="result[#statusm.index].address" ></s:property></td>
				<td class="info_td" id=<%="telephone"+i %>><s:property value="result[#statusm.index].telephone" ></s:property></td>
				<td class="info_td" id=<%="email"+i %>><s:property value="result[#statusm.index].email" ></s:property></td>
				<td><input type="button" id=<%="edit"+i %> value="编辑" onclick=<%="edit_orders("+i+")" %>></td>
				<td><input type="button" id=<%="delete"+i %> value="删除" onclick=<%="delete_orders("+i+")" %>></td>
			</tr>
			<%i++; %>
		</s:iterator>
	</table>
	</s:form>
	</div>
</s:else>
</div>
</body>
</html>