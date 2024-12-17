<%-- 
    Document   : tintuc
    Created on : Jun 27, 2024, 1:10:30 AM
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
     <link rel="stylesheet" href="css/place.css">
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
    <main>
        <div class="news-container">
            <a class="news-item" href="baibao.html">
                <img src="img/logo.jpg" alt="News Image 1">
                <div class="news-title">Taekwondo là gì?</div>
            </a>
    
            <a class="news-item" href="baibao.html">
                <img src="img/dai.jpg" alt="News Image 2">
                <div class="news-title">Hệ Thống Đai Và Kỳ Thi Lên Đai Của Taekwondo</div>
            </a>
            
            <a class="news-item" href="baibao.html">
                <img src="img/benefit.jpg" alt="News Image 3">
                <div class="news-title">Lợi ích của Taekwondo</div>
            </a>
    
            <a class="news-item" href="baibao.html">
                <img src="img/skills.jpg" alt="News Image 4">
                <div class="news-title">Các kỹ thuật cơ bản</div>
            </a>
            
            <a class="news-item" href="baibao.html">
                <img src="img/compe.png" alt="News Image 5">
                <div class="news-title">Giải đấu Taekwondo</div>
            </a>
    
            <a class="news-item" href="baibao.html">
                <img src="img/lee-dae-hoonnewsdirectory.jpg" alt="News Image 6">
                <div class="news-title">Những Võ Sĩ Nổi Bật</div>
            </a>
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
