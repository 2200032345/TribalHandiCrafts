<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
    import="com.Likhil.service.impl.*,com.Likhil.service.*,com.Likhil.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #CCCCFF; /* Original soft lavender background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Poppins', sans-serif;
            letter-spacing: 0.5px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            color: #0056b3;
        }

        .container {
            margin-top: 40px;
            padding: 20px;
        }

        /* Card Styles */
        .card {
            border-radius: 15px;
            border: none;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            overflow: hidden;
        }

        .card:hover {
            transform: scale(1.02);
            transition: all 0.3s ease-in-out;
        }

        .card-body {
            padding: 20px 30px;
        }

        /* Profile Picture */
        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 20px auto;
            border: 5px solid #9fa8da; /* Soft blue for the profile image border */
        }

        /* Breadcrumb */
        .breadcrumb {
            background-color: #e6e6fa; /* Light lavender */
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 14px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .breadcrumb a {
            color: #333; /* Darker text */
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        /* Contact Section */
        .contact-us {
            text-align: center;
            padding: 15px;
            background-color: #CCCCFF; /* Original background color */
            color: #4B0082; /* Indigo for text contrast */
            border-radius: 10px;
        }

        .contact-us h5 {
            font-weight: bold;
        }

        .contact-us p {
            margin: 5px 0;
            font-size: 14px;
        }

        .contact-us a {
            color: #4B0082; /* Indigo */
            text-decoration: underline;
        }

        .contact-us a:hover {
            text-decoration: none;
            color: #800080; /* Purple hover */
        }

        /* User Details */
        .detail-row {
            margin-bottom: 10px;
        }

        .detail-row p {
            font-size: 16px;
            margin: 0;
        }

        .detail-label {
            font-weight: bold;
            color: #555;
        }

        .detail-value {
            font-size: 15px;
            color: #777;
        }

        hr {
            border: 1px solid #f0f0f0;
        }

        /* Footer */
        .footer {
            text-align: center;
            background-color: #4B0082; /* Dark indigo */
            color: #fff;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 20px;
        }

        .footer a {
            color: #CCCCFF; /* Light lavender links */
        }

        .footer a:hover {
            color: #fff;
        }
    </style>
</head>
<body>

<%
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (userName == null || password == null) {
        response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    }

    UserService dao = new UserServiceImpl();
    UserBean user = dao.getUserDetails(userName, password);
    if (user == null) {
        user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, Bihar", 87659, "defaultPassword");
    }
%>

<jsp:include page="header.jsp" />

<div class="container">
    <!-- Breadcrumb -->
    <div class="row mb-4">
        <div class="col">
            <nav aria-label="breadcrumb" class="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Profile Section -->
    <div class="row">
        <!-- Profile Picture and Contact Info -->
        <div class="col-lg-4">
            <div class="card text-center">
                <div class="card-body">
                    <img src="images/profile-1.jpg" alt="User Image" class="profile-img">
                    <h4>Hello, <%= user.getName() %>!</h4>
                    <p>Welcome to your profile dashboard.</p>
                </div>
            </div>

            <div class="contact-us mt-4">
                <h5>Contact Us</h5>
                <p>Email: <a href="mailto:tribalhandicrafts@kluniversity.in">tribalhandicrafts@kluniversity.in</a></p>
                <p>Phone: <a href="tel:+918645350200">+91 86453 50200</a></p>
            </div>
        </div>

        <!-- User Details -->
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="mb-4">Profile Details</h5>

                    <div class="detail-row">
                        <p class="detail-label">Full Name:</p>
                        <p class="detail-value"><%= user.getName() %></p>
                    </div>
                    <hr>

                    <div class="detail-row">
                        <p class="detail-label">Email:</p>
                        <p class="detail-value"><%= user.getEmail() %></p>
                    </div>
                    <hr>

                    <div class="detail-row">
                        <p class="detail-label">Phone:</p>
                        <p class="detail-value"><%= user.getMobile() %></p>
                    </div>
                    <hr>

                    <div class="detail-row">
                        <p class="detail-label">Address:</p>
                        <p class="detail-value"><%= user.getAddress() %></p>
                    </div>
                    <hr>

                    <div class="detail-row">
                        <p class="detail-label">Pin Code:</p>
                        <p class="detail-value"><%= user.getPinCode() %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <p>&copy; 2024 Tribal Handicrafts. All Rights Reserved. <a href="#">Privacy Policy</a></p>
</div>

</body>
</html>
