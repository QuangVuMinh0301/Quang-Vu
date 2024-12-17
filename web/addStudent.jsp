<%-- 
    Document   : addStudent
    Created on : Jul 8, 2024, 4:30:45 PM
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

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        form {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        table th {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        table th input,
        table th select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .submitButton,
        .listClassButton {
            display: inline-block;
            padding: 10px 20px;
            background-color: #d62b64;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
            cursor: pointer;
            border: none;
            font-size: 16px;
        }

        .submitButton:hover,
        .listClassButton:hover {
            background-color: #b22254;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 600px;
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
            <% Account acc = null;
            if (session.getAttribute("account") != null) {
                acc = (Account) session.getAttribute("account"); %>
                <div class="nav-item"> <h3>Xin Chào <span style="color: #cc0052;"><%= acc.getUsername() %></span></h3></div>
            <% } %>
        </div>    
    </header>
    <div class="container">
        <form action="addStudent" method="POST">
            <h4>Thêm học sinh</h4>
            <table>
                <tr>
                    <th>Họ và tên</th>
                    <th><input type="text" name="name"></th>
                </tr>
                <tr>
                    <th>Số Điện Thoại</th>
                    <th><input type="text" name="phoneNumber"></th>
                </tr>
                <tr>
                    <th>Ngày tháng năm sinh</th>
                    <th><input type="date" name="bod" style="padding-top: 10px; padding-bottom: 10px; padding-right: 120px"></th>
                </tr>
                <tr>
                    <th>Địa chỉ</th>
                    <th><input type="text" name="address"></th>
                </tr>
                <tr>
                    <th>Lớp</th>
                    <th>
                        <select name="lop" style="padding: 0px 35px; height: 25px;">
                            <option value="LopCoBan">LopCoBan</option>
                            <option value="LopNangCao">LopNangCao</option>
                            <option value="LopHLV">LopHLV</option>
                            <option value="LopNguoiLon">LopNguoiLon</option>
                            <option value="LopTuVe">LopTuVe</option>
                        </select>
                    </th>
                </tr>
            </table>
            <div class="button-container">
                <button type="submit" class="submitButton">Thêm học sinh</button>
                <a href="listClass" class="listClassButton">Danh Sách Lớp</a>
            </div>
            <h5 style="text-align: center; color: red">${sessionScope.loi}</h5>
            <% session.removeAttribute("loi"); %>
        </form>
    </div>
</body>

</html>
