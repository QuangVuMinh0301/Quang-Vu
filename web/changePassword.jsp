<%-- 
    Document   : changePassword
    Created on : Jul 5, 2024, 12:28:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List,model.Student, model.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                background-color: #f4f4f4;
            }
            header {
                width: 100%;
                background-color: #fff;
                padding: 0px 0;
                border-bottom: 1px solid #ddd;
            }
            .nav {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 83.240px;
            }
            .logo img {
                width: 80px;
                height: auto;
                margin-right: 20px;
            }
            .nav-item {
                margin: 0 15px;
            }
            .nav-item a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
                font-size: larger;
                transition: transform 0.3s;
            }
            .nav-item a:hover {
                transform: scale(1.8);
            }
            .nav-item a.active {
                color: #d62b64;
            }

            .sidebar {
                width: 200px;
                background-color: #dcdcdc;
                padding-top: 20px;
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
            }

            .sidebar a {
                display: block;
                color: #333;
                padding: 15px;
                text-decoration: none;
                font-size: 18px;
            }

            .sidebar a:hover {
                background-color: #e6005c;
                color: white;
            }

            .content {
                margin-left: 200px;
                padding: 20px;
                flex-grow: 1;
            }

            .content h1 {
                font-size: 24px;
                color: #333;
            }

            .content .info {
                margin-top: 20px;
            }

            .content .info label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }

            .content .info input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
            }

            .content .info input[disabled] {
                background-color: #eee;
            }

            .content .info input.password {
                font-size: 16px;
                letter-spacing: 3px;
            }
            .styled-button {
                background-color: #e6005c;
                color: white;
                padding: 15px 30px;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 20px;
            }

            .styled-button:hover {
                background-color: #cc0052;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="nav">
                <div class="logo"><img src="img/icon.jpg" alt="Logo"></div>
                <div class="nav-item"><a href="home.jsp" class="active" style="color: #d62b64;">Trang Chủ</a></div>
                <div class="nav-item"><a href="khoahoc.jsp">Khóa Học</a></div>
                <div class="nav-item"><a href="listClass">Danh Sách Lớp</a></div>
                <div class="nav-item"><a href="tintuc.jsp">Tin tức</a></div>
                <div class="nav-item"><a href="account.jsp">Tài Khoản</a></div>
            </div>    
        </header>
        <%
            Account acc = null;
            if(session.getAttribute("account") != null){
                acc = (Account) session.getAttribute("account");
            
                if(acc.getPriority() == 1){
        %>
        <div class="sidebar" style="margin-top: 83px">
            <a href="account.jsp">Thông tin</a>
            <a href="account">Danh Sách Tài Khoản</a>
            <a href="change">Thay đổi mật khẩu</a>
            <a href="logout.jsp">Đăng Xuất</a>
        </div>
        <form action="change" method="POST">
            <div class="content">
                <h1>Thay Đổi Mật Khẩu</h1>
                <div class="info">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" value="<%= acc.getUsername() %>" readonly>
                </div>
                <div class="info">
                    <label for="password">Password:</label>
                    <input type="text" id="password"name="password" value="<%= (session.getAttribute("passChange") != null) ? session.getAttribute("passChange") : acc.getPassword() %>" required>
                </div>
                <input type="hidden" name="priority" value="<%= acc.getPriority() %>">
                <input type="hidden" name="id" value="<%= acc.getID() %>">
                <input type="submit" value="Thay đổi mật khẩu" class="styled-button">
            </div>
        </form> 
        <%
           }
           if(acc.getPriority() == 2){%>
        <div class="sidebar" style="margin-top: 83px">
            <a href="account.jsp">Thông tin</a>
            <a href="change">Thay đổi mật khẩu</a>
            <a href="logout.jsp">Đăng Xuất</a>
        </div>
         <form action="change" method="POST">
            <div class="content">
                <h1>Thay Đổi Mật Khẩu</h1>
                <div class="info">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" value="<%= acc.getUsername() %>" readonly>
                </div>
                <div class="info">
                    <label for="password">Password:</label>
                    <input type="text" id="password"name="password" value="<%= (session.getAttribute("passChange") != null) ? session.getAttribute("passChange") : acc.getPassword() %>" required>
                </div>
                <input type="hidden" name="priority" value="<%= acc.getPriority() %>">
                <input type="hidden" name="id" value="<%= acc.getID() %>">
                <input type="submit" value="Thay đổi mật khẩu" class="styled-button">
            </div>
        </form> 
        <%}
        }%>
    </body>
</html>
