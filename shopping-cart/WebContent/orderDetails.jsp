<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.Likhil.service.impl.*,com.Likhil.service.*,com.Likhil.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Order Details</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/changes.css">
	<style>
		/* Background Gradient */
		body {
			background: linear-gradient(to right, #CCCCFF, #E6E6FA);
			font-family: 'Arial', sans-serif;
		}
		/* Title Styling */
		.text-center {
			color: #4CAF50;
			font-size: 28px;
			font-weight: bold;
			margin-top: 20px;
		}
		/* Table Styling */
		.table {
			background-color: #fff;
			border-radius: 8px;
			box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
		}
		.table th, .table td {
			padding: 12px 15px;
			text-align: center;
		}
		.table th {
			background-color: #343a40;
			color: white;
		}
		.table td {
			background-color: #f9f9f9;
			color: #333;
			font-size: 14px;
		}
		/* Hover Effects */
		.table-hover tbody tr:hover {
			background-color: #f1f1f1;
			transform: scale(1.02);
			transition: transform 0.3s ease;
		}
		/* Status Styling */
		.text-success {
			color: #28a745 !important;
		}
		/* Image Styling */
		.table img {
			width: 50px;
			height: 50px;
			border-radius: 5px;
		}
		/* Footer */
		footer {
			background-color: #343a40;
			color: white;
			text-align: center;
			padding: 10px;
			position: fixed;
			width: 100%;
			bottom: 0;
		}
	</style>
</head>
<body>

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	OrderService dao = new OrderServiceImpl();
	List<OrderDetails> orders = dao.getAllOrderDetails(userName);
	%>

	<jsp:include page="header.jsp" />

	<!-- Order Details Section -->
	<div class="text-center">
		Order Details
	</div>

	<!-- Start of Product Items List -->
	<div class="container">
		<div class="table-responsive">
			<table class="table table-hover table-sm">
				<thead>
					<tr>
						<th>Picture</th>
						<th>Product Name</th>
						<th>Order ID</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Time</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (OrderDetails order : orders) {
					%>
					<tr>
						<td><img src="./ShowImage?pid=<%=order.getProductId()%>" class="img-fluid"></td>
						<td><%=order.getProdName()%></td>
						<td><%=order.getOrderId()%></td>
						<td><%=order.getQty()%></td>
						<td><%=order.getAmount()%></td>
						<td><%=order.getTime()%></td>
						<td class="text-success"><%=order.getShipped() == 0 ? "ORDER_PLACED" : "ORDER_SHIPPED"%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<!-- End of Product Items List -->

	<%@ include file="footer.html"%>
</body>
</html>
