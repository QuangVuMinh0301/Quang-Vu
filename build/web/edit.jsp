<%-- 
    Document   : edit
    Created on : Jul 3, 2024, 9:25:29 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List,model.Student, model.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            .form-container {
                background-color: #dcdcdc;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                width: 300px;
                margin: 20px auto;
            }
            .form-header {
                background-color: #999999;
                color: white;
                text-align: center;
                padding: 10px 0;
                border-radius: 10px 10px 0 0;
                font-size: 24px;
                font-weight: bold;
            }
            table {
                width: 100%;
                margin-top: 10px;
                border-collapse: collapse;
            }
            td, th {
                padding: 10px;
                text-align: left;
            }
            input[type="text"], input[type="date"], select {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            input[type="date"], select {
                border: none;
            }
            .update-button {
                text-align: center;
                margin-top: 20px;
            }
            .update-button input[type="submit"] {
                background-color: #e6005c;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .update-button input[type="submit"]:hover {
                background-color: #cc0052;
            }
            footer {
                width: 100%;
                background-color: #ddd;
                padding: 0px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                text-align: center;
                height: 100px;
                margin-top: auto;
            }
            .footer-center {
                flex-grow: 1;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .footer-right {
                width: 400px;
                height: 100%;
            }
            iframe {
                border: none;
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
                display: block;
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
                if(session.getAttribute("account") != null){
                    acc = (Account) session.getAttribute("account");%>
                    <div class="nav-item"> <h3>Xin Chào <span style="color: #cc0052;"><%= acc.getUsername() %></span></h3></div>
                   <%}
                %>
                
            </div>    
        </header>

        <h1 style="text-align: center;">Cập Nhật Thông Tin Học Sinh</h1>

        <div class="form-container">
            <div class="form-header">Thông Tin Học Sinh</div>
            <form action="edit" method="POST">
                <input type="hidden" name="id" value="${student.getId()}">
                <input type="hidden" name="oldClass" value="${student.getLop()}">
                <table>
                    <tr>
                        <th>Họ và Tên</th>
                    </tr>
                    <tr>
                        <td><input type="text" name="name" value="${student.getName()}" required style="height: 25px;"></td>
                    </tr>
                    <tr>
                        <th style="padding-top: 20px;">Số Điện Thoại</th>
                    </tr>
                    <tr>
                        <td><input type="text" name="phoneNumber" value="${student.getPhoneNumber()}" required style="height: 25px;"></td>
                    </tr>
                    <tr>
                        <th style="padding-top: 20px;">Ngày sinh</th>
                    </tr>
                    <tr>
                        <td><input type="date" name="BoD" value="${student.getBod()}" style="padding: 0px 30px; height: 25px;" required></td>
                    </tr>
                    <tr>
                        <th style="padding-top: 20px;">Địa chỉ</th>
                    </tr>
                    <tr>
                        <td><input type="text" name="address" value="${student.getAddress()}" required style="height: 25px;"></td>
                    </tr>
                    <tr>
                        <th style="padding-top: 20px;">Lớp Học</th>
                    </tr>
                    <tr>
                        <td>
                            <select name="lop" style="padding: 0px 35px; height: 25px;">
                                <option value="LopCoBan" ${student.getLop() eq 'LopCoBan' ? 'selected' : ''}>LopCoBan</option>
                                <option value="LopNangCao" ${student.getLop() eq 'LopNangCao' ? 'selected' : ''}>LopNangCao</option>
                                <option value="LopHLV" ${student.getLop() eq 'LopHLV' ? 'selected' : ''}>LopHLV</option>
                                <option value="LopNguoiLon" ${student.getLop() eq 'LopNguoiLon' ? 'selected' : ''}>LopNguoiLon</option>
                                <option value="LopTuVe" ${student.getLop() eq 'LopTuVe' ? 'selected' : ''}>LopTuVe</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div class="update-button">
                    <input type="submit" value="Cập Nhật">
                </div>
                <h5 style="color: red">${requestScope.blankError}</h5>
                <h5 style="color: red">${sessionScope.nameErr}</h5>
                <h5 style="color: red">${sessionScope.phoneErr}</h5>
                <h5 style="color: red">${sessionScope.duplicateError}</h5>
                <% session.removeAttribute("blankError"); %>
                <% session.removeAttribute("nameErr"); %>
                <% session.removeAttribute("phoneErr"); %>
                <% session.removeAttribute("duplicateError"); %>
            </form>
        </div>

        <footer>
            <div class="footer-center">Taekwondo AllStar Center</div>
            <div class="footer-right">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3177296505073!2d105.80930281143611!3d21.019969180546436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab642a8ad0c3%3A0x64bf66f08e798c25!2zVHLGsOG7nW5nIE3huqdtIE5vbiBI4buNYSBNaQ!5e0!3m2!1svi!2s!4v1719118765443!5m2!1svi!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </footer>
    </body>
</html>
