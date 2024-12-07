<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tribal Handicrafts - Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        :root {
            --background: #e0f7fa;
            --primary-color: #2b7cbb;
            --secondary-color:146eb4 ;
            --text-color: #ffffff;
            --input-background: #ffffff;
            --button-hover-color: #004d40;
        }

        body {
            background: var(--background);
            font-family: 'Arial', sans-serif;
            color: var(--secondary-color);
            margin: 0;
            padding: 0;
            transition: background 0.3s ease;
        }

        .container {
            margin-top: 50px;
        }

        .header-title {
            text-align: center;
            margin-top: 20px;
        }

        .header-title h1 {
            font-size: 3rem;
            font-weight: bold;
            color: var(--primary-color);
            text-transform: uppercase;
        }

        .header-title h2 {
            font-size: 1.5rem;
            color: var(--secondary-color);
            font-style: italic;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid #00796b;
            box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 40px;
            position: relative;
        }

        .register-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        .register-form input, .register-form textarea {
            background: var(--input-background);
            color: var(--secondary-color);
            border: 1px solid #00796b;
            padding: 14px;
            margin-bottom: 15px;
            border-radius: 5px;
            width: 100%;
        }

        .register-form input:focus, .register-form textarea:focus {
            outline: none;
            border: 1px solid var(--primary-color);
        }

        .register-form textarea {
            resize: none;
        }

        .register-form .btn {
            background-color: var(--primary-color);
            color: var(--text-color);
            font-size: 16px;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            transition: transform 0.2s, background-color 0.3s;
        }

        .register-form .btn:hover {
            transform: scale(1.05);
            background-color: var(--button-hover-color);
        }

        .register-form .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .register-form .login-link a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .register-form .login-link a:hover {
            text-decoration: underline;
        }

        .circle {
            position: absolute;
            background: var(--primary-color);
            border-radius: 50%;
            z-index: 0;
        }

        .circle-one {
            width: 8rem;
            height: 8rem;
            top: -4rem;
            left: -4rem;
        }

        .circle-two {
            width: 6rem;
            height: 6rem;
            bottom: -3rem;
            right: -3rem;
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>

    <% String message = request.getParameter("message"); %>

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 register-container">
                <div class="circle circle-one"></div>
                <h2 class="register-title">Registration Form</h2>
                <form action="./RegisterSrv" method="post" class="register-form">
                    <% if (message != null) { %>
                        <p class="text-center" style="color: yellow;"><%= message %></p>
                    <% } %>
                    
                    <div class="row">
                        <div class="col-md-11 form-group text-center">
                            <label for="first_name">Name</label>
                            <input type="text" name="username" placeholder="Enter your name" required>
                        </div>
                        <div class="col-md-11 form-group text-center">
                            <label for="email">Email</label>
                            <input type="email" name="email" placeholder="Enter your email" required>
                        </div>
                    </div>
                    
                    <div class="form-group text-center">
                        <label for="address">Address</label>
                        <textarea name="address" placeholder="Enter your address" required></textarea>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 form-group text-center">
                            <label for="mobile">Mobile</label>
                            <input type="number" name="mobile" placeholder="Enter your mobile number" required>
                        </div>
                        <div class="col-md-6 form-group text-center">
                            <label for="pincode">Pin Code</label>
                            <input type="number" name="pincode" placeholder="Enter your pin code" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 form-group text-center">
                            <label for="password">Password</label>
                            <input type="password" name="password" placeholder="Enter your password" required>
                        </div>
                        <div class="col-md-6 form-group text-center">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
                        </div>
                    </div>
                    
                    <div class="row text-center text-center">
                        <div class="col-md-6">
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn">Register</button>
                        </div>
                    </div>
                </form>
                
                <div class="login-link">
                    <p>Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
                <div class="circle circle-two"></div>
            </div>
        </div>
    </div>

</body>
</html>
