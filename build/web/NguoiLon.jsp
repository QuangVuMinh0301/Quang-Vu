<%-- 
    Document   : NguoiLon
    Created on : Jun 29, 2024, 5:34:43 PM
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
            display: flex;
            flex-direction: column;
            height: calc(100vh - 55px); /* Ensure sidebar takes full height minus header */
        }

        .sidebar a {
            display: block;
            margin: 20px 0;
            font-size: 18px;
            text-decoration: none;
            color: black;
            text-align: center;
        }

        .sidebar a[href="addStudent"] {
            display: inline-block;
            padding: 10px 20px;
            background-color: #d62b64;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .sidebar a[href="addStudent"]:hover {
            background-color: #b22254;
        }

        .main-content {
            width: calc(100% - 12% - 40px); /* Adjust width to consider sidebar and padding */
            padding: 20px;
            box-sizing: border-box;
            overflow-x: auto; /* Add horizontal scroll if needed */
            background-color: #f4f4f4; /* Ensure background color covers entire area */
        }

        h1 {
            text-align: center;
        }

        table {
            width: calc(100% - 40px); /* Adjust the width to fit within the padding of the main-content */
            border-collapse: collapse;
            margin: 20px auto; /* Adjust the margin to provide space around the table */
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

        a[href="addStudent"] {
            display: inline-block;
            padding: 10px 20px;
            margin: 20px auto;
            background-color: #d62b64;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        a[href="addStudent"]:hover {
            background-color: #b22254;
        }

        td a {
            display: inline-block;
            padding: 5px 10px;
            margin: 5px;
            background-color: #d62b64;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        td a:hover {
            background-color: #b22254;
        }

        .student-count {
            text-align: right;
            margin-right: 40px;
            font-size: 18px;
            color: #333;
            font-weight: bold;
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
            <hr>
               <%
                    Account acc = null;
                if(session.getAttribute("account") != null){
                     acc = (Account) session.getAttribute("account");
                     
            %>
                <% if (acc.getPriority() != 2) { %>
            <a href="addStudent">Add New Student</a>
            <hr>
            <% } %>
        </div>
        <div class="main-content">
            <h1>Lớp Người Lớn</h1>
             <p class="student-count">Số Lượng học sinh: ${requestScope.countNguoiLon}</p>
           
             <%       
                    if(acc.getPriority() == 1){
             List<Student> list = null;
             if (request.getAttribute("list") != null) {
                 list = (List<Student>) request.getAttribute("list");
             }
        %>
            <table>
                <tr>
                    <th>Họ và Tên</th>
                    <th>Số điện thoại</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
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
                     <td><a href="edit?id=<%= s.getClassChungID() %>">Edit</a></td>
                    <td><a href="delete?id=<%= s.getClassChungID() %>&oldClass=LopNguoiLon">Delete</a></td>
                </tr>
                <%
                        }
                    }
                   }
                %>
            </table>
            <%if(acc.getPriority() == 2){
                         List<Student> list = null;
             if (request.getAttribute("list") != null) {
                 list = (List<Student>) request.getAttribute("list");
             }
                %>
                <table>
                <tr>
                    <th>Họ và Tên</th>
                    <th>Số điện thoại</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
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
           
    </body>
</html>
