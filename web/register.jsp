<%-- 
    Document   : register
    Created on : Jul 4, 2024, 12:41:40 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #dcdcdc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .form-header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group input[type="checkbox"] {
            margin-right: 5px;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #e6005c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #cc0052;
        }
        .form-group a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="form-container">
    <div class="form-header">Register</div>
    <form action="register" method="POST">
        <div class="form-group">
            <label for="register-username">Username</label>
            <input type="text" id="register-username" name="username" required>
        </div>
        <div class="form-group">
            <label for="register-password">Password</label>
            <input type="password" id="register-password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" name="password2" required>
        </div>
        <p style="color: red">${requestScope.notMatch}</p>
        <div class="form-group">
            <input type="submit" value="Register">
        </div>
        <a href="login.jsp" style="font-size: smaller;">Already have an account? Login</a>
        <p style="color: red; text-align: center">${requestScope.dupplicate}</p>
    </form>
</div>

</body>
</html>
