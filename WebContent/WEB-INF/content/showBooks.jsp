<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Results</title>
<style type="text/css">
.searchBg{z-index:1;height:120px;position:fixed;width:100%;top:0px;}
.head{height:35px;;position:relative;width:100%;}
.subHead{height:25px;position:fixed;width:100%;z-index:2;}
.user{position:absolute;right:100px;top:5px;}
.logoImg{position:absolute;height:35px;left:50px;top:-2px;}
.headMainDivider{position:fixed;width:100%;top:35px;z-index:2;}
.main{position:relative;}
#keys{position:absolute;height:30px;width:50%;left:20%;}
#search{position:absolute;height:32px;width:100px;left:71%;}
.form{position:absolute;top:23px;width:100%;height:40px;}
.subForm{position:fixed;top:60px;width:100%;height:40px;z-index:2;}
.books{position:absolute;width:90%;left:5%;height:400px;top:70px;z-index:0;}
ul{position:absolute;width:100%;}
li{float:left;list-style:none;width:200px;height:250px;padding:10px 10px 0 0;}
.li_div{width:180px;height:230px;border:1px solid black;float:left;}
.bookImg{width:160px;display:block;margin:auto;}
.book_name{overflow:hidden;width:100%;height:20px;}
.book_info{height:45px;float:left;}
.book_price{width:140px;height:20px;}
.book_owner{width:140px;height:20px;}
.shop_cart{float:left;}
.shopCart{height:40px;width:40px;}
.foot{position:fixed;width:100%;height:46px;bottom:0px;}
.footBg{position:absolute;top:0px;width:100%;height:100%;z-index:1;}
.submit_order{position:absolute;width:100px;height:75%;top:12.5%;right:100px;border:1px solid black;z-index:2;}
#buyCounts{position:absolute;top:8px;left:5%;z-index:2;}
#buyTotals{position:absolute;top:26px;left:5%;z-index:2;}
</style>

<script type="text/javascript">
var counts=0;
var totals="0.00";
var j=0;
function clickCart(id){
	var num=id.charAt(id.length-1);
	var cart=document.getElementById(id);
	var price=document.getElementById("price"+num).innerHTML.substring(1);
	var pricea=price.split(".");
	price="";
	for(var x in pricea){
		price=price+pricea[x];
	}
	var totalsa=totals.split(".");
	totals="";
	for(var y in totalsa){
		totals=totals+totalsa[y];
	}
	if(cart.src.indexOf("/BookStoreStruts/res/shoppingCart.png")>=0){
		cart.src="/BookStoreStruts/res/shoppingCartClick.png";
	}
	counts++;
	setCookie("count",counts,5);
	var bookcount=getCookie("bookname#"+document.getElementById("name"+num).innerHTML+","+document.getElementById("owner"+num).innerHTML);
	if(bookcount==null) bookcount="1";
	else{
		var bookcounti=parseInt(bookcount);
		bookcounti++;
		bookcount=bookcounti.toString();
	}
	setCookie("bookname#"+document.getElementById("name"+num).innerHTML+","+document.getElementById("owner"+num).innerHTML,bookcount,5);
	var totalsi=parseInt(totals)+parseInt(price);
	totals=totalsi.toString();
	var totalst1=totals.substring(0,totals.length-2);
	var totalst2=totals.substring(totals.length-2,totals.length);
	totals=totalst1+"."+totalst2;
	setCookie("total",totals,5);
	document.getElementById("buyCounts").innerHTML=getCounts()
	document.getElementById("buyTotals").innerHTML=getTotals()
}
function getCounts(){
	var ccounts=getCookie("count");
	if(ccounts!=null){
		counts=parseInt(ccounts);
		return "已添加到购物车的图书数量："+ccounts;
	}
	return "已添加到购物车的图书数量：0";
}
function getTotals(){
	var ctotals=getCookie("total")
	if(ctotals!=null){
		totals=ctotals;
		return "已添加到购物车的图书总价：$"+ctotals;
	}
	return "已添加到购物车的图书总价：$0.00"
}
function getCookie(cname){
	var cookies=document.cookie.split(";");
	for(var i=0;i<cookies.length;i++){
		var cookie=cookies[i].trim();
		if(cname.indexOf("bookname")==0){
			var name=cname.substring(9);
			var temp=name.split(",");
			var t1=temp[0].split(" ");
			var t2=temp[1].split(" ");
			var value="";
			for(var x in t1){
				value=value+"#"+t1[x];
			}
			value=value+"$";
			for(var y in t2){
				value=value+"#"+t2[y];
			}
			if(cookie.indexOf("bookname#"+value)==0){
				var cvalue=cookie.substring(value.length+10,cookie.length);
				return cvalue;
			}
		}else if(cname.indexOf("count")==0){
			if(cookie.indexOf("count")==0){
				return cookie.substring(cname.length+1,cookie.length);
			}
		}else if(cname.indexOf("total")==0){
			if(cookie.indexOf("total")==0){
				return cookie.substring(cname.length+1,cookie.length);
			}
		}
	}
	return null;
}
function setCookie(cname,cvalue,exdays){
	
	if(cname.indexOf("bookname")==0){
		var name=cname.substring(9);
		var temp=name.split(",");
		var t1=temp[0].split(" ");
		var t2=temp[1].split(" ");
		var value="";
		for(var x in t1){
			value=value+"#"+t1[x];
		}
		value=value+"$";
		for(var y in t2){
			value=value+"#"+t2[y];
		}
		var d=new Date();
		d.setTime(d.getTime()+(exdays*24*60*60*1000));
		var expires="expires="+d.toGMTString();
		document.cookie="bookname#"+value+"="+cvalue+"; "+expires;
		
	}else{
		var d=new Date();
		d.setTime(d.getTime()+(exdays*24*60*60*1000));
		var expires="expires="+d.toGMTString();
		document.cookie=cname+"="+cvalue+"; "+expires;
	}
}
function deleteCookie(cname){
	var d=new Date();
	d.setTime(d.getTime()-10);
	var cookie=getCookie(cname);
	if(cookie!=null){
		document.cookie=cname+"=;expires="+d.toGMTString();
	}
}
</script>
</head>
<body>
<img alt="searchBackground" src="/BookStoreStruts/res/homeHead.png" class="searchBg"/>
<div class="head">
	<div class="subHead">
		<img class="logoImg" alt="LOGO" src="/BookStoreStruts/res/LOGOBlack.png"/>
		<div class="user">
			<%if(session.getAttribute("login")=="true"){%>
				Welcome,<a href="/BookStoreStruts/user_information">${sessionScope.username}</a>
			<%}else{%>
				<%session.setAttribute("uri", request.getRequestURI().substring(32)); %>
				<a class="loginOrSignup" href="/BookStoreStruts/loginOrSignup">LOGIN/SIGNUP</a>
			<%} %>
		</div>
	</div>
</div>
<hr class="headMainDivider">
<div class="main">
	<div class="form">
		<div class="subForm">
			<s:form action="dosearch">
				<div class="input"><s:textfield id="keys" name="keys" placeholder="Please enter your key words"></s:textfield></div>
				<div class="submit"><s:submit id="search" value="SEARCH"></s:submit></div>
			</s:form>
		</div>
	</div>
	<div class="books">
		<ul>
			<%int i=0; %>
			<s:iterator value="books" status="status">
				<li>
					<div><img class="bookImg" alt="无法显示图片" src=<s:property value="books[#status.index].path"/> /></div>
					<div class="book_name" id="name<%=i %>"><s:property value="books[#status.index].name"/></div>
					<div class="book_info">
						<div class="book_price" id="price<%=i %>"><s:property value="books[#status.index].price"/></div>
						<div class="book_owner" id="owner<%=i %>"><s:property value="books[#status.index].owner"/></div>
					</div>
					<div class="shop_cart">
						<input id="cart<%=i %>" type="image" src="/BookStoreStruts/res/shoppingCart.png" class="shopCart" onclick="clickCart('cart<%=i %>')"></input>
						<script>
						/*
							var j=0;
							var cookie=getCookie("bookname"+j);
							if(cookie.equals(document.getElementById("name"+j).innerHTML+documentgetElementById("owner"+j).innerHTML)){
								document.getElementById("cart"+j).src="/BookStoreStruts/res/shoppingCartClick.png";
							}
							j++;*/
							var cookie=getCookie("bookname"+j);
							if(cookie==document.getElementById("name"+j).innerHTML+","+document.getElementById("owner"+j).innerHTML){
								document.getElementById("cart"+j.toString()).src="/BookStoreStruts/res/shoppingCartClick.png";
							}
							j++;
						</script>
						<%i++; %>
					</div>
				</li>
			</s:iterator>
		</ul>
	</div>
</div>
<div class="foot">
	<img alt="无法显示页脚" src="/BookStoreStruts/res/homeHead.png" class="footBg">
	<div id="buyCounts"><script>document.getElementById("buyCounts").innerHTML=getCounts()</script></div>
	<div id="buyTotals"><script>document.getElementById("buyTotals").innerHTML=getTotals()</script></div>
	<s:form action="buy">
		<s:submit type="image" src="/BookStoreStruts/res/submitOrder.png" class="submit_order"></s:submit>
	</s:form>
</div>


</body>
</html>