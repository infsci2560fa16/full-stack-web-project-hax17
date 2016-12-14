<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(request.getParameter("type")!=null&&request.getAttribute("g_list")==null){

	response.sendRedirect("goods.QTServlet?type="+request.getParameter("type"));
	return;
}
if(request.getAttribute("g_list")==null){
	response.sendRedirect("goods.QTServlet?type=1");
	return;
}
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>SHARE</title>
		<link href="css/3.css" rel="stylesheet" />
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

		<div class="center"><img src="img/IMG_4048rep.jpg" alt="" width="960" height="640" /></div>

		<div class="allitem">
			<h4 class="center">Best</h4>
		</div>

		<div class="products_list clearfix">
		
    <c:forEach var="goods" items="${g_list}" varStatus="status">
    
    
			<div class="item">
				<div class="img_item">
					<a href="goodsinfo.QTServlet?id=${goods.id}"><img src="${goods.images}" style="max-height:300px;" alt=""></a>
				</div>
				<ul>
				<li class="proname">
					<a href="goodsinfo.QTServlet?id=${goods.id}">${goods.product_Name}</a>
				</li>
				<li class="money">${goods.unit_Price}</li>
                </ul>
			</div>
	</c:forEach>
		


		</div>

	</body>

</html>