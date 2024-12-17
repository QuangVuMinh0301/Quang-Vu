<%-- 
    Document   : AccountList
    Created on : Jul 4, 2024, 8:05:18 PM
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
            .content table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .content table th, .content table td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }
            .content table th {
                background-color: #f4f4f4;
                font-weight: bold;
            }
            .content table tr:hover {
                background-color: #f4f4f4;
            }
            .content table a {
                color: #e6005c;
                text-decoration: none;
                font-weight: bold;
            }
            .content table a:hover {
                text-decoration: underline;
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
                <% 
                    Account account = null;
                    if (session.getAttribute("account") != null) {
                        account = (Account) session.getAttribute("account");
                %>
                <div class="nav-item"><h3>Xin Chào <span style="color: #cc0052;"><%= account.getUsername() %></span></h3></div>
                        <% } %>
            </div>    
        </header>
        <div class="sidebar">
            <a href="account.jsp">Thông tin</a>
            <a href="account">Danh Sách Tài Khoản</a>
            <a href="change">Thay đổi mật khẩu</a>
            <a href="logout.jsp">Đăng Xuất</a>
        </div>
        <div class="content">
            <%
                List<Account> accountList = null;
                if (request.getAttribute("accountList") != null) {
                    accountList = (List<Account>) request.getAttribute("accountList");
                } 
            %>
            <h1>Danh Sách Tài Khoản</h1>
            <form action="account">
                <table>
                    <tr>
                        <th>Tên Đăng Nhập</th>
                        <th>Mật Khẩu</th>
                        <th>Quyền hạn</th>
                        <th colspan="2">Action</th>
                    </tr>
                    <%
                        if (accountList != null) {
                            for (Account c : accountList) { 
                                if (!c.getUsername().equals(account.getUsername())) {
                    %>    
                    <tr>
                        <td><%= c.getUsername() %></td>
                        <td><%= c.getPassword() %></td>
                        <td><%= c.getPriority() %></td>
                        <td><a href="priority?id=<%= c.getID() %>">Phân Quyền</a></td>
                        <td><a href="deleteAccount?id=<%= c.getID() %>">Xoá</a></td>
                    </tr>
                    <%
                                }
                            }  
                        }
                    %>
                </table>
            </form>
        </div>
    </body>

</html>
