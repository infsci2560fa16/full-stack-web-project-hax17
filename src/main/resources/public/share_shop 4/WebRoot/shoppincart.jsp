<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(request.getAttribute("cart_list")==null){
	response.sendRedirect("cart.QTServlet");
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
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/shoppingcart.js"></script>
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

	<form method="post" id="sub" action="xgOrder.QTServlet">
		<div class="shopping_cart">

			<table id="cartTable" style="margin:auto;">
				<thead>
					<tr>
						<th><label><input class="check-all check" type="checkbox"/>&nbsp;ALL</label></th>
						<th>Product Name</th>
						<th>Unit Price</th>
						<th>Qty</th>
						<th>Total</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
				 <c:forEach var="cart" items="${cart_list}" varStatus="status">
				 <tr>
						<td class="checkbox"><input class="check-one check" name="cart_check_value" value="${cart.id }" type="checkbox" />
						</td>
						<td class="goods"><img src="${cart.goods.images }" alt="" /><span>${cart.goods.product_Name }</span></td>
						<td class="price">${cart.goods.unit_Price }</td>
						<td class="count">
							<span class="reduce"></span>
							<input class="count-input" type="text" name="cart_num" value="${cart.QUATITY }" />
							<span class="add">+</span></td>
						<td class="subtotal"><c:out value="${cart.goods.unit_Price *cart.QUATITY }"></c:out></td>
						<td class="operation"><a href = "delCart.QTServlet?id=${cart.id }"><span class="delete">Delete</span></a>
							<input name="cart_id" value="${cart.id }" type="hidden" />
							<input name="caozuo_type" id="caozuo_type" value="" type="hidden" />
						</td>
					</tr>
		
				</c:forEach>
				
				</tbody>
				
			</table>
			

			<div class="foot" id="foot" style="margin:auto;">

				<a class="fl delete" href="javascript:void(0);" onclick="javascript:document.getElementById('caozuo_type').value='1';document.getElementById('sub').submit();">DELETE</a>
				<div class="fr closing" onclick="javascript:document.getElementById('caozuo_type').value='2';document.getElementById('sub').submit();">ORDER</div>
				<div class="fr total">TOTAL：$<span id="priceTotal">0.00</span></div>
				<div class="fr selected" id="selected">SELECTED
					<span id="selectedTotal">0</span>ITEMS
					<span class="arrow up">︽</span>
					<span class="arrow down">︾</span>
				</div>
				<div class="selected-view">
					<div id="selectedViewList" class="clearfix">
						<!--<div><img src="images/1.jpg"><span>CANCEL SELECTED</span></div>-->
					</div>
					<span class="arrow">◆<span>◆</span></span>
				</div>
			</div>
			<div class='foot' id='address' style="margin:auto;">
			<br>
			<h3>ShippingAddress</h3>
			<a href="changepwd.jsp">ManageAddress</a>
			<div>
				 <c:forEach var="add" items="${address_list}" varStatus="status">
				   <div>
					<span class="radio"><input name="address_radio" type="radio" value="${status.count }"/>
					</span>&nbsp;&nbsp;&nbsp;
					<span class="recipients">${add.recipients }</span>&nbsp;&nbsp;&nbsp;
					<span class="adddress">${add.address }</span>&nbsp;&nbsp;&nbsp;
					<span class="tel">${add.tel }</span>
				  </div>
				</c:forEach>
			</div>
		</div>
		</div>
	
	</form>
	
	<script type="text/javascript">
	    function manageAdd(){
	    	$.get("manageAdd.QTServlet",function(data){
	    	})
	    }
	</script>
	</body>
</html>