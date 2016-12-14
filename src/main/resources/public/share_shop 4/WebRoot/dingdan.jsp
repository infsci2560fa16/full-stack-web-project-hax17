<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(request.getAttribute("cart_list")==null){
	response.sendRedirect("order.QTServlet");
	return;
}
%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8" />
		<title>SHARE</title>
		<link href="css/5.css" rel="stylesheet" />
		<link href="img/t.ico" rel="shortcut icon" />
		<script src="js/shoppingcart.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/topshare.js"></script>
	</head>

	<body>

		<div class="top">
			<ul class="top_logo">
				<li><a href="index.jsp"><img src="img/header.jpg" alt="" height="20" /></a></li>
			</ul>


			<ul class="top_bar">
			<% if(request.getSession().getAttribute("user")==null||request.getSession().getAttribute("user")==""){
			%>
			
        		<li>
					<a href="login.jsp">LOGIN</a>
				</li>
				<li>
					<a href="#">JOIN</a>
				</li>
			<%
		}else{
			
		 %>
		
				<li>
					<a href="shoppincart.jsp">CART(${cart_num})</a>
				</li>
				<li>
					<a href="dingdan.jsp">orders</a>
				</li>
				<li>
					<a href="changepwd.jsp">MY PAGE</a>
				</li>
				<li>
					<a href="login.jsp">LoginOut</a>
				</li>
        		
		
			<%	} %>
			
				
				<li>
					<a href="#">LIVE CHAT</a>
				</li>
				<li class="forget">
					<a href="#">FORGOT ID?</a>
				</li>
			</ul>

		</div>

		<div class="header">
			<ul>
			<li class="center"><a href="index.jsp"><img src="img/header.jpg" width="200" height="40" alt="" /></a></li>
			</ul>
		</div>

		<ul class="nav">
			
			<li>
				<a href="javascript:void(0)">BEST</a>
			</li>
			<li>
				<a href="prolist.jsp">CATEGORY</a>
			</li>
			<li>
				<a href="javascript:void(0)">LIFE</a>
			</li>
			<li>
				<a href="javascript:void(0)">HELP</a>
			</li>
			<li>
				<a href="javascript:void(0)">REVIEW</a>
			</li>
			<li>
				<a href="javascript:void(0)">QUESTION</a>
			</li>
			<li style=" margin-top:20px; float:right;">

        		<form action="search.QTServlet" method="post">
					<input type="text" name="seach_value"/>
					<input type="submit" value="Search"/>
            	</form>
			</li>

		</ul>

		<div class="shopping_cart">

			<table id="cartTable" style="margin:auto;">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Unit Price</th>
						<th>Color</th>
						<th>Size</th>
						<th>Qty</th>
						<th>Date</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
				 <c:forEach var="cart" items="${cart_list}" varStatus="status">
				 <%-- <c:set var="orderId" scope="session" value="${cart.orderId }"></c:set>
				 <c:if test="${cart.orderId } != ${orderId}"> --%>
				 <tr><td>OrderNumber：<a href="javascript:void(0)" onclick="showDetail(this)">${cart.orderId } </a></td></tr>
				<%--  </c:if> --%>
				 <tr>
						<td class="goods"><img src="${cart.goods.images }" alt="" /><span>${cart.goods.product_Name }</span></td>
						<td class="price">${cart.goods.unit_Price }</td>
						<td class="count">${cart.color.color_name }</td>
						<td class="count">${cart.size.size_name }</td>
						<td class="count">${cart.QUATITY }</td>
						<td class="count">${cart.create_time }</td>
						<td class="subtotal"><c:out value="${cart.goods.unit_Price *cart.QUATITY }"></c:out></td>
					</tr>
				</c:forEach>
				
				</tbody>	
			</table>
			
</div>
	<script type="text/javascript">
	  function showDetail($this) {
	    var val = $this.text;
	    $.post("orderDetail.QTServlet","orderId="+val,function(result){
	       var message = "NAME："+result.recipients + 
	         "    SHIPPINGADDRESS："+result.address +
	         "    PHONE："+result.tel ;
            alert(message);
        });
	  }
	</script>
	
	</body>

</html>