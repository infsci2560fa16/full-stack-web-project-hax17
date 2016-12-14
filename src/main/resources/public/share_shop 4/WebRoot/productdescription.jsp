<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	

		<head>
			<meta charset="utf-8" />
			<title>LEATHER.PT</title>
			<link href="css/2.css" rel="stylesheet" />
			<link href="img/t.ico" rel="shortcut icon" />
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
<form action="addCart.QTServlet" id="sub" method="post">
			<div class="description_info">
				<div class="description clearfix">
					<div class="leftArea">
						<div class="description_imgs">
							<div class="big">
								<img src="${goods.images}" alt="">
							</div>
						</div>
					</div>

					<div class="rightArea">

						<div class="des_content">
							<h2 class="des_content_tit">${goods.product_Name}</h2>
							<div style="width:350px;height:1px; background-color: #515151; text-align: center;margin: auto; "></div>

							<div class="dl clearfix">
								<div class="dt">Price</div>
								<div class="dd">${goods.unit_Price}</div>
							</div>
							<div class="dl clearfix">
								<div class="dt">Reserves</div>
								<div class="dd">1.99</div>
							</div>

							<div class="des_position">
								<div class="dl clearfix">
									<div class="dt">COLOR</div>
									<div class="dd">
										<select name="color_id">
										
    <c:forEach var="colors" items="${goods.colors}" varStatus="status">
											<option value="${colors.id}">${colors.color_name}</option>
	</c:forEach>
										
										</select>
									</div>
									<div class="dt">SIZE</div>
									<div class="dd">
										<select name="size_id">
															
    <c:forEach var="sizes" items="${goods.sizes}" varStatus="status">
											<option value="${sizes.id}">${sizes.size_name}</option>
	</c:forEach>
										</select>
									</div>

								</div>

							</div>
							<div class="dl clearfix">
								<div class="shop_buy">
								<input name = "id" type="hidden" value="${goods.id}"/>
								<input name = "type_id" type="hidden" id="type_id" value=""/>
									<a href="javascript:void(0)" class="shopping_btn" onclick="javascript:document.getElementById('type_id').value='2';document.getElementById('sub').submit();"></a>
									<a href="javascript:void(0)" class="buy_btn" onclick="javascript:document.getElementById('type_id').value='1';document.getElementById('sub').submit();"></a>
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
			</form>
			<div class="center"><img src="img/product.jpg" alt=""/></div>
			<div class="center"><img src="img/model.jpg" alt=""/></div>
			

		</body>

</html>