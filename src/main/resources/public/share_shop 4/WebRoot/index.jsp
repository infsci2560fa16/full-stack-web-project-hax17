<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>SHARE</title>
		<link href="css/1.css" rel="stylesheet" />
		<link href="img/t.ico" rel="shortcut icon" />
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/topshare.js"></script>
		<script src="js/slide.js"></script>
		<script src="js/slide1.js"></script>

	</head>

	<body>
		<div class="top"><!--The top part-->
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
					<a href="changepwd.jsp">order</a>
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

		<div class="slides">
			<div class="slideInner">
				<a href="#" style="background: url(img/IMG_4048rep.jpg) no-repeat;">
					
				</a>
				<a href="#" style="background: url(img/IMG_2950.jpg) no-repeat">
			
				</a>
				<a href="#" style="background: url(img/IMG_2996.jpg) no-repeat;">
					
				</a>
				<a href="#" style="background:url(img/IMG_3006.jpg) no-repeat;">
					
				</a>

			</div>
			<div class="navi">
				<a class="prev" href="javascript:;"></a>
				<a class="next" href="javascript:;"></a>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				$(".slideInner").slide({
					slideContainer: $('.slideInner a'),
					effect: 'easeOutCirc',
					autoRunTime: 3000,
					slideSpeed: 1000,
					nav: true,
					autoRun: true,
					prevBtn: $('a.prev'),
					nextBtn: $('a.next')
				})
			})
		</script>
<style type="text/css">
<!--
#demo {
background: #FFF;
overflow:hidden;
width: 960px;
margin:auto;

}
#demo img {
border: 3px solid #F2F2F2;
}
#indemo {
float: left;
width: 800%;
}
#demo1 {
float: left;
}
#demo2 {
float: left;
}

-->
</style>
<div id="demo">
						<div id="indemo">
							<div id="demo1">
                            
								<div style="float:left; "><img src="img/IMG_4048rep.jpg" width="120" height="130"  /><img src="img/IMG_2950.jpg" width="120" height="130" /><img src="img/IMG_2996.jpg" width="120" height="130" /><img src="img/IMG_3006.jpg" width="120" height="130"  /></div>
								
								<div style="float:left; "><img src="img/IMG_4048rep.jpg" width="120" height="130"  /><img src="img/IMG_2950.jpg" width="120" height="130" /><img src="img/IMG_2996.jpg" width="120" height="130" /><img src="img/IMG_3006.jpg" width="120" height="130"  /></div>
								<div style="float:left; "><img src="img/IMG_4048rep.jpg" width="120" height="130"  /><img src="img/IMG_2950.jpg" width="120" height="130" /><img src="img/IMG_2996.jpg" width="120" height="130" /><img src="img/IMG_3006.jpg" width="120" height="130"  /></div>
							</div>
							<div id="demo2"></div>
						</div>
					</div>
<script>
<!--
var speed=10;
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
-->
</script>
	</body>

</html>