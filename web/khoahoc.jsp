<%-- 
    Document   : khoahoc
    Created on : Jun 27, 2024, 1:09:21 AM
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
    <link rel="stylesheet" href="css/course.css">
</head>
<body>
    <header>
        <div class="nav">
            <div class="logo"><img src="img/icon.jpg" alt="Logo"></div>
            <div class="nav-item"><a href="home.jsp" class="active">Trang Chủ</a></div>
            <div class="nav-item"><a href="khoahoc.jsp">Khóa Học</a></div>
            <% Account displayListClass = null;
                if(session.getAttribute("account") != null){
                    displayListClass = (Account) session.getAttribute("account");%>
            <div class="nav-item"><a href="listClass">Danh Sách Lớp</a></div>
            <%}
                %>
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
    <main class="main">
        <div class="body-content"><h1>Khoá Học</h1></div>
        <div class="first3class">
            <div class="class-pics">
                <img src="img/lopcanban.jpg" alt="">
                <div class="description">Lớp dạy Taekwondo cơ bản</div>
                <div class="button-container"><button><a href="lopCoBan.jsp" style="color: white; text-decoration: none;">Đăng Ký Khóa Học</a></button></div>
            </div>
            <div class="class-pics">
                <img src="img/adultclass.jpg" alt="">
                <div class="description">Lớp dạy Taekwondo cho người lớn</div>
                <div class="button-container"><button><a href="lopNguoiLon.jsp" style="color: white; text-decoration: none;">Đăng Ký Khóa Học</a></button></div>
            </div>
            <div class="class-pics">
                <img src="img/lecture.jpg" alt="">
                <div class="description">Lớp dạy 1-1 với HLV</div>
                <div class="button-container"><button><a href="lop11.jsp" style="color: white; text-decoration: none;">Đăng Ký Khóa Học</a></button></div>
            </div>
        </div>
        <div class="remain-class">
            <div class="class-pics">
                <img src="img/nangcao.jpg" alt="">
                <div class="description">Lớp dạy nâng cao quyền, đối kháng</div>
                <div class="button-container"><button><a href="lopNangCao.jsp" style="color: white; text-decoration: none;">Đăng Ký Khóa Học</a></button></div>
            </div>
            <div class="class-pics">
                <img src="img/tuve.jpg" alt="">
                <div class="description">Lớp tập luyện Taekwondo tự vệ</div>
                <div class="button-container"><button><a href="lopTuVe.jsp" style="color: white; text-decoration: none;">Đăng Ký Khóa Học</a></button></div>
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-center">Taekwondo AllStar Center</div>
        <div class="footer-right">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3177296505073!2d105.80930281143611!3d21.019969180546436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab642a8ad0c3%3A0x64bf66f08e798c25!2zVHLGsOG7nW5nIE3huqdtIE5vbiBI4buNYSBNaQ!5e0!3m2!1svi!2s!4v1719118765443!5m2!1svi!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </footer>
    </body>
</html>
