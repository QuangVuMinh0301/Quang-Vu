<%-- 
    Document   : priority
    Created on : Jul 4, 2024, 11:49:26 PM
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
                padding: 0;
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
                transform: scale(1.2);
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
                top: 83px;
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
                margin-left: 220px;
                padding: 20px;
                flex-grow: 1;
            }
            .content h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
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
                margin-bottom: 15px;
            }
            .content .info input[disabled] {
                background-color: #eee;
            }
            .content .info input.password {
                font-size: 16px;
                letter-spacing: 3px;
            }
            .content .info select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
                margin-bottom: 15px;
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
        <div class="sidebar">
            <a href="account.jsp">Thông tin</a>
            <a href="account">Danh Sách Tài Khoản</a>
            <a href="change">Thay đổi mật khẩu</a>
            <a href="logout.jsp">Đăng Xuất</a>
        </div>
        <%Account account = null;
            account = (Account) request.getAttribute("accountPri");
        %>
        <form action="priority" method="POST">
            <div class="content">
                <h1>Thay Đổi Quyền Hạn</h1>
                <div class="info">
                    <label for="username">Tài Khoản</label>
                    <input type="text" name="username" id="username" value="<%= account.getUsername() %>" readonly>
                </div>
                <div class="info">
                    <label for="password">Mật Khẩu</label>
                    <input type="text" id="password" name="password" value="<%= (session.getAttribute("passChange") != null) ? session.getAttribute("passChange") : account.getPassword() %>" required>
                </div>
                <div class="info">
                    <label for="priority">Quyền Hạn</label>
                    <select name="priority" id="priority">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <input type="hidden" name="id" value="<%= account.getID() %>">
                <input type="submit" value="Cập Nhật" class="styled-button">
            </div>
        </form> 
    </body>

</html>
