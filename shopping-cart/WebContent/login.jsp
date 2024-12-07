<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    :root {
        --background: #ff9900; /* Background color */
        --color: #f2f2f2; /* Text color */
        --primary-color: #146eb4; /* Accent color */
        --dark-background: #232f3e; /* Darker backgrounds */
        --black: #000000; /* Black for shadows or borders */
    }

    body {
        margin: 10;
        font-family: 'Poppins', sans-serif;
        background: var(--background);
        color: var(--color);
        letter-spacing: 1px;
        transition: background 0.3s ease;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        position: relative;
        width: 50rem;
        padding: 4rem;
    }

    .form-container {
        border: 1px solid rgba(255, 255, 255, 0.2);
        box-shadow: 0 0 36px 1px var(--black);
        border-radius: 10px;
        backdrop-filter: blur(20px);
        background: var(--dark-background);
        padding: 2rem;
        position: relative;
        z-index: 1;
    }

    .form-container h1 {
        text-align: center;
        margin-bottom: 1.5rem;
        font-size: 1.8rem;
        color: var(--color);
    }

    .form-container input, .form-container select {
        width: 100%;
        padding: 14px;
        margin: 1rem 0;
        border: none;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.1);
        color: var(--color);
        font-size: 1rem;
        outline: none;
    }

    .form-container button {
        width: 100%;
        padding: 14px;
        border: none;
        border-radius: 8px;
        background: var(--primary-color);
        color: var(--color);
        font-weight: bold;
        cursor: pointer;
        font-size: 1rem;
        transition: transform 0.2s;
    }

    .form-container button:hover {
        transform: scale(1.05);
        background: var(--black);
    }

    .register-forget {
        display: flex;
        justify-content: space-between;
        margin-top: 1.5rem;
        font-size: 0.9rem;
    }

    .register-forget a {
        color: var(--color);
        text-decoration: none;
    }

    .circle {
        position: absolute;
        background: var(--primary-color);
        border-radius: 50%;
        z-index: 0;
    }

    .circle-one {
        width: 6rem;
        height: 6rem;
        top: -3rem;
        left: -3rem;
    }

    .circle-two {
        width: 4rem;
        height: 4rem;
        bottom: -2rem;
        right: -2rem;
    }

    .illustration {
        position: absolute;
        top: -15rem;
        right: -15rem;
        width: 80%;
    }

    .theme-btn-container {
        position: fixed;
        bottom: 2rem;
        left: 2rem;
        display: flex;
        gap: 0.5rem;
    }

    .theme-btn {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        cursor: pointer;
    }
</style>

</head>
<body>
    <%@ include file="header.jsp" %>

    <% String message = request.getParameter("message"); %>

    <section class="container">
        <div class="login-container">
            <div class="circle circle-one"></div>
            <div class="form-container">
                <img src="https://raw.githubusercontent.com/hicodersofficial/glassmorphism-login-form/master/assets/illustration.png" 
                     alt="illustration" class="illustration">
                <h1>Login</h1>
                <form action="./LoginSrv" method="post">
                    <% if (message != null) { %>
                        <p class="message" style="color: red; text-align: center;"><%= message %></p>
                    <% } %>
                    <input type="email" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <select name="usertype" id="userrole" required>
                        <option value="customer" selected>Customer</option>
                        <option value="admin">Admin</option>
                    </select>
                    <button type="submit">Submit</button>
                </form>
                <div class="register-forget">
                    <a href="register.jsp">Register</a>
                    <a href="forgot-password.jsp">Forgot Password</a>
                </div>
            </div>
            <div class="circle circle-two"></div>
        </div>
        <div class="theme-btn-container"></div>
    </section>


    <script>
        const themes = [
            { background: "#1A1A2E", color: "#FFFFFF", primaryColor: "#0F3460" },
            { background: "#461220", color: "#FFFFFF", primaryColor: "#E94560" },
            { background: "#192A51", color: "#FFFFFF", primaryColor: "#967AA1" },
            { background: "#F7B267", color: "#000000", primaryColor: "#F4845F" },
            { background: "#F25F5C", color: "#000000", primaryColor: "#642B36" },
            { background: "#231F20", color: "#FFF", primaryColor: "#BB4430" }
        ];

        const setTheme = (theme) => {
            const root = document.querySelector(":root");
            root.style.setProperty("--background", theme.background);
            root.style.setProperty("--color", theme.color);
            root.style.setProperty("--primary-color", theme.primaryColor);
        };

        const displayThemeButtons = () => {
            const btnContainer = document.querySelector(".theme-btn-container");
            themes.forEach((theme) => {
                const div = document.createElement("div");
                div.className = "theme-btn";
                div.style.background = theme.background;
                btnContainer.appendChild(div);
                div.addEventListener("click", () => setTheme(theme));
            });
        };

        displayThemeButtons();
    </script>
</body>
</html>
