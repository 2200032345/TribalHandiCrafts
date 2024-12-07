<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Likhil.service.impl.*,com.Likhil.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #f2f2f2;">
	<!--Company Header Starting  -->
	<div class="container-fluid text-center"
		style="margin-top: 45px; background-color: #ff9900; color: #000000; padding: 5px;">
		<h2>Tribal Handicrafts</h2>
		<h6>Nothing can replace Handicrafts</h6>
		<form class="form-inline" action="index.jsp" method="get">
		</form>
		<p align="center"
			style="color: #146eb4; font-weight: bold; margin-top: 5px; margin-bottom: 5px;"
			id="message"></p>
	</div>
	<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #232f3e; color: #f2f2f2;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar" style="background-color: #ff9900;"></span> 
					<span class="icon-bar" style="background-color: #ff9900;"></span> 
					<span class="icon-bar" style="background-color: #ff9900;"></span>
				</button>
				<a class="navbar-brand" href="index.jsp" style="color: #ff9900;"><span
					class="glyphicon glyphicon-home" style="color: #ff9900;">&nbsp;</span>Let'sbuy</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp" style="color: #f2f2f2;">Login</a></li>
					<li><a href="register.jsp" style="color: #f2f2f2;">Register</a></li>
					<li><a href="index.jsp" style="color: #f2f2f2;">Products</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="color: #f2f2f2;">Category <span class="caret" style="color: #f2f2f2;"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp?type=Necklaces" style="color: #146eb4;">Necklaces</a></li>
							<li><a href="index.jsp?type=toys" style="color: #146eb4;">Toys</a></li>
							<li><a href="index.jsp?type=Wall Hangings" style="color: #146eb4;">Wall Hangings</a></li>
							<li><a href="index.jsp?type=Pots" style="color: #146eb4;">Pots</a></li>
							<li><a href="index.jsp?type=Bangles" style="color: #146eb4;">Bangles</a></li>
							<li><a href="index.jsp?type=Mats" style="color: #146eb4;">Mats</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #232f3e; color: #f2f2f2;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar" style="background-color: #ff9900;"></span> 
					<span class="icon-bar" style="background-color: #ff9900;"></span> 
					<span class="icon-bar" style="background-color: #ff9900;"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp" style="color: #ff9900;"><span
					class="glyphicon glyphicon-home" style="color: #ff9900;">&nbsp;</span>Home</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp" style="color: #f2f2f2;"><span
							class="glyphicon glyphicon-home" style="color: #f2f2f2;">Products</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="color: #f2f2f2;">Category <span class="caret" style="color: #f2f2f2;"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=Necklaces" style="color: #146eb4;">Necklaces</a></li>
							<li><a href="userHome.jsp?type=toys" style="color: #146eb4;">Toys</a></li>
							<li><a href="userHome.jsp?type=Wall Hangings" style="color: #146eb4;">Wall Hangings</a></li>
							<li><a href="userHome.jsp?type=Pots" style="color: #146eb4;">Pots</a></li>
							<li><a href="userHome.jsp?type=Bangles" style="color: #146eb4;">Bangles</a></li>
							<li><a href="userHome.jsp?type=Mats" style="color: #146eb4;">Mats</a></li>
						</ul>
					</li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp" style="color: #f2f2f2;"> <span
							class="glyphicon glyphicon-shopping-cart" style="color: #f2f2f2;"></span>Cart
					</a></li>
					<%
					} else {
					%>
					<li><a href="cartDetails.jsp" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #ff9900; color: #f2f2f2;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp" style="color: #f2f2f2;">Orders</a></li>
					<li><a href="userProfile.jsp" style="color: #f2f2f2;">Profile</a></li>
					<li><a href="./LogoutSrv" style="color: #f2f2f2;">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #232f3e; color: #f2f2f2;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar" style="background-color: #ff9900;"></span> 
					<span class="icon-bar" style="background-color: #ff9900;"></span> 
					<span class="icon-bar" style="background-color: #ff9900;"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp" style="color: #ff9900;"><span
					class="glyphicon glyphicon-home" style="color: #ff9900;">&nbsp;</span>Let'sbuy</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp" style="color: #f2f2f2;">Products</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="color: #f2f2f2;">Category <span class="caret" style="color: #f2f2f2;"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=Necklaces" style="color: #146eb4;">Necklaces</a></li>
							<li><a href="adminViewProduct.jsp?type=toys" style="color: #146eb4;">Toys</a></li>
							<li><a href="adminViewProduct.jsp?type=Wall Hangings" style="color: #146eb4;">Wall Hangings</a></li>
							<li><a href="adminViewProduct.jsp?type=Pots" style="color: #146eb4;">Pots</a></li>
							<li><a href="adminViewProduct.jsp?type=Bangles" style="color: #146eb4;">Bangles</a></li>
							<li><a href="adminViewProduct.jsp?type=Mats" style="color: #146eb4;">Mats</a></li>
						</ul>
					</li>
					<li><a href="addProduct.jsp" style="color: #f2f2f2;">Add Products</a></li>
					<li><a href="viewOrders.jsp" style="color: #f2f2f2;">View Orders</a></li>
					<li><a href="adminProfile.jsp" style="color: #f2f2f2;">Profile</a></li>
					<li><a href="./LogoutSrv" style="color: #f2f2f2;">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
</body>

</html>