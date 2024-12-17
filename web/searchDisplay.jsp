<%-- 
    Document   : searchDisplay.jsp
    Created on : Jul 5, 2024, 3:22:18 PM
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
                font-family: 'Times New Roman', Times, serif;
                margin: 0;
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

            .container {
                display: flex;
                height: 100vh;
                background-color: #f4f4f4;
            }

            .sidebar {
                width: 12%;
                border-right: solid 1px #737373;
                padding: 20px;
                box-sizing: border-box;
                margin-top: 55px;
            }

            .sidebar a {
                display: block;
                margin: 20px 0;
                font-size: 18px;
                text-decoration: none;
                color: black;
                text-align: center;
            }

            .main-content {
                width: 80%;
                padding: 20px;
                box-sizing: border-box;
            }

            h1 {
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 0 auto;
                background-color: whitesmoke;
            }

            table, th, td {
                border: 1px solid black;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            .search-form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 20px;
            }

            .search-input, .search-select, .search-button {
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            .search-input {
                width: 300px;
            }

            .search-select {
                width: 200px;
            }

            .search-button {
                background-color: #d62b64;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .search-button:hover {
                background-color: #b22254;
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
                <% Account account = null;
               if(session.getAttribute("account") != null){
                   account = (Account) session.getAttribute("account");%>
                <div class="nav-item"> <h3>Xin Chào <span style="color: #cc0052;"><%= account.getUsername() %></span></h3></div>
                        <%}
                        %>
            </div>    
        </header>



        <%
                    Account acc = null;
                if(session.getAttribute("account") != null){
                     acc = (Account) session.getAttribute("account");
                    
                    if(acc.getPriority() == 1){
             List<Student> list = null;
             if (session.getAttribute("searchList") != null) {
                 list = (List<Student>) session.getAttribute("searchList");
             }
        %>
        <div class="container">
            <div class="sidebar">
                <a href="listClass">Tất Cả học sinh</a>
                <hr>
                <a href="coban">Lớp Cơ Bản</a>
                <hr>
                <a href="nangcao">Lớp Nâng Cao</a>
                <hr>
                <a href="nguoilon">Lớp Người Lớn</a>
                <hr>
                <a href="kemHLV">Lớp dạy 1-1 với HLV</a>
                <hr>
                <a href="tuve">Lớp Tự Vệ</a>
            </div>
            <div class="main-content">
                <h1>Kết quả tìm kiếm</h1>

                <form action="search" method="GET" class="search-form">
                    <input type="hidden" name="userType" value="admin">
                    <input type="text" name="keyword" placeholder="Enter student's name" class="search-input">
                    <input type="submit" value="Search" class="search-button">
                </form>

                <input type="hidden" name="id" value="${s.getId()}">
                <table border="1">
                    <tr>
                        <th>Họ và Tên</th>
                        <th>Số điện thoại</th>
                        <th>Ngày sinh</th>
                        <th>Địa chỉ</th>
                        <th>Lớp Học</th>
                        <th colspan="2">Action</th>
                    </tr>
                    <%
                        if (list != null) {
                            for(Student s : list) {
                                String bod = s.getBod() != null ? s.getBod() : "N/A";
                    %>
                    <tr>
                        <td><%= s.getName() %></td>
                        <td><%= s.getPhoneNumber() %></td>
                        <td><%= bod %></td>
                        <td><%= s.getAddress() %></td>
                        <td><%= s.getLop() %></td>
                        <td><a href="edit?id=<%= s.getId()%>">Edit</a></td>
                        <td><a href="delete?id=<%= s.getId()%>&oldClass=<%= s.getLop() %>" onclick="return confirm('Do you want to delete?');">Delete</a></td>
                    </tr>

                    <%
                            }
                        }
                    }

                    %>
                </table>
                <%if(acc.getPriority() == 2){
                         List<Student> list = null;
             if (session.getAttribute("searchList") != null) {
                 list = (List<Student>) session.getAttribute("searchList");
             }
                %>
                <div class="container">
                    <div class="sidebar">
                        <a href="listClass">Tất Cả Học Sinh</a>
                        <hr>
                        <a href="coban">Lớp Cơ Bản</a>
                        <hr>
                        <a href="nangcao">Lớp Nâng Cao</a>
                        <hr>
                        <a href="nguoilon">Lớp Người Lớn</a>
                        <hr>
                        <a href="kemHLV">Lớp dạy 1-1 với HLV</a>
                        <hr>
                        <a href="tuve">Lớp Tự Vệ</a>
                    </div>
                    <div class="main-content">
                        <h1>Kết quả tìm kiếm</h1>

                        <form action="search" method="GET" class="search-form">
                            <input type="hidden" name="userType" value="admin">
                            <input type="text" name="keyword" placeholder="Enter student's name" class="search-input">
                            <input type="submit" value="Search" class="search-button">
                        </form>
                        <input type="hidden" name="id" value="${s.getId()}">
                        <table border="1">
                            <tr>
                                <th>Họ và Tên</th>
                                <th>Số điện thoại</th>
                                <th>Ngày sinh</th>
                                <th>Địa chỉ</th>
                                <th>Lớp Học</th>

                            </tr>
                            <%
                                if (list != null) {
                                    for(Student s : list) {
                                        String bod = s.getBod() != null ? s.getBod() : "N/A";
                            %>
                            <tr>
                                <td><%= s.getName() %></td>
                                <td><%= s.getPhoneNumber() %></td>
                                <td><%= bod %></td>
                                <td><%= s.getAddress() %></td>
                                <td><%= s.getLop() %></td>

                            </tr>

                            <%
                                    }
                                }
                            }
                         }
                            %>
                        </table>

                    </div>
                </div>
                <%if(session.getAttribute("account") == null){%>
                <h2 style="text-align: center; color: #cc0052">Bạn phải đăng nhập để có thể xem nội dung này</h2>
                <h4 style="text-align: center"><a href="login.jsp" style="text-decoration: none;">Đăng Nhập ngay</a></h4>
                <%   }
                %>
                </body>
                </html>