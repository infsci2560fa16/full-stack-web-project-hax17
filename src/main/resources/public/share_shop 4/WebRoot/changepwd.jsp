<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>SHARE</title>
		<link href="css/4.css" rel="stylesheet" />
		<link href="img/t.ico" rel="shortcut icon" />
		<link href="css/5.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="js/manageAdd.js"></script>
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
			<li><a href="index.jsp"><img src="img/header.jpg" width="200" height="40" alt="" /></a></li>
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
		<!-- <div class="center"><img src="img/IMG_4048rep.jpg" alt="" /></div> -->

		<div style="width:960px;height:1px; background-color: #515151; text-align: center;margin: auto; "></div>

		<!-- 管理收货人 -->
        <form method="post" id="sub" action="manageAdd.QTServlet">
		<div class="shopping_cart">
		   <div style="text-align:center"><h3>Recipients Info</h3></div>
			<table id="AddressTable" style="margin:auto;">
				<thead>
					<tr>
						<th>name</th>
						<th>address</th>
						<th>telephone</th>
						<th>deal</th>
					</tr>
				</thead>
				
			</table>
		</div>	
	</form>
	
	 <form method="post" action="addAddress.QTServlet">
		<div>
		   <br><br><br>
		   <div style="text-align:center"><h3>Edit Recipients Info</h3></div>
			<table id="addTable" style="margin:auto;">
				<tbody>
					<tr>
						<th>name: </th>
						<th><input type="text" name="recipients" /></th>
					</tr>
					<tr>
						<th>address:</th>
						<th><input type="text" name="address" /></th>
					</tr>
					<tr>
						<th>tel:</th>
						<th><input type="text" name="tel" /></th>
					</tr>
					<input type="hidden" name="origin" value=""/>
					<tr colspan="2">
						<th></th>
						<th><input type="submit" name="submit"/></th>
					</tr>
				</tbody>
				
			</table>
		</div>	
	</form>


		<div class="loginregis">
		<form action="changepwd.QTServlet" method="post">
			<div class="login_des clearfix">
				<div class="leftArea">
					<div class="loginBox">
						<ul class="login">
							
							<li class="l_tit">New PASSWORD</li>
							<li class="mb_10"><input type="text" name="password" class="login_input"></li>
							<li class="saveid"><input type="checkbox">Save ID</li>
					    	    <li class="forget"><a href="#">Forgot ID?</a></li>
					    	    <li class="forget"><a href="#">Forgot Password?</a></li>
					    	    <li class="auto_login"><input type="submit" value="" class="login_btn"></li>
					    </ul>
					</div>
				</div>
			</div>
			</form>
		</div>
	
	</body>

</html>