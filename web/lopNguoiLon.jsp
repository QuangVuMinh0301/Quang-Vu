<%-- 
    Document   : lopNguoiLon
    Created on : Jun 27, 2024, 1:26:53 AM
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
    <link rel="stylesheet" href="css/adultClass.css">
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

    <div class="container">
        <h1>Lớp Học Taekwondo Dành cho Người Lớn</h1>
        <p><strong>Giới thiệu về Lớp Học Taekwondo Dành cho Người Lớn</strong></p>
        <p>Lớp học Taekwondo dành cho người lớn được thiết kế để phù hợp với nhu cầu và khả năng của học viên ở độ tuổi trưởng thành. Đây là khóa học lý tưởng cho những ai muốn rèn luyện sức khỏe, tăng cường sự dẻo dai, và học hỏi kỹ năng tự vệ. Khóa học không chỉ tập trung vào các kỹ thuật cơ bản mà còn mang đến những bài học về tinh thần võ đạo, giúp học viên phát triển toàn diện cả về thể chất và tinh thần.</p>

        <p><strong>Nội Dung Đào Tạo</strong></p>

        <p><strong>Kỹ Thuật Cơ Bản</strong></p>
        <div style="align-items: center; text-align: center;"><img src="img/adultTaek.jpg" alt="" style="width: 70%;"></div> 
        <ul>
            <li><strong>Đòn Chân (Chagi)</strong>: Học các loại đòn đá cơ bản như đá thẳng (Ap Chagi), đá vòng cầu (Dollyo Chagi), đá xoay (Tornado Kick) và các biến thể của đòn đá.</li>
            <li><strong>Đòn Tay (Jirugi)</strong>: Học các kỹ thuật đấm, đòn tay cắt (Knife Hand Strike), đòn chỏ (Elbow Strike) và cách phối hợp đòn tay với đòn chân.</li>
        </ul>

        <p><strong>Kỹ Thuật Tự Vệ</strong></p>
        <div style="align-items: center; text-align: center;"><img src="img/adultclass2.jpg" alt="" style="width: 40%;"></div> 
        <ul>
            <li><strong>Kỹ Năng Phản Xạ</strong>: Tập luyện các bài tập phản xạ để cải thiện khả năng phòng thủ trước các tình huống tấn công bất ngờ.</li>
            <li><strong>Kỹ Năng Thoát Hiểm</strong>: Học cách thoát khỏi các tình huống bị khống chế như bị nắm cổ tay, bị ôm từ phía sau và các kỹ thuật tự vệ khác.</li>
        </ul>

        <p><strong>Rèn Luyện Sức Khỏe và Thể Chất</strong></p>
        <ul>
            <li><strong>Bài Tập Thể Lực</strong>: Tăng cường sức bền, sức mạnh và sự dẻo dai thông qua các bài tập thể lực như chạy, nhảy dây, và các bài tập tăng cường cơ bắp.</li>
            <li><strong>Bài Tập Dưỡng Sinh</strong>: Kết hợp các bài tập dưỡng sinh để cải thiện sức khỏe tổng thể và giảm stress.</li>
        </ul>

        <p><strong>Lợi Ích Khi Tham Gia Khóa Học</strong></p>
        <ul>
            <li><strong>Cải Thiện Sức Khỏe</strong>: Tăng cường sức khỏe toàn diện, bao gồm sức bền, sức mạnh và độ linh hoạt của cơ thể.</li>
            <li><strong>Phát Triển Tinh Thần Võ Đạo</strong>: Rèn luyện tinh thần kỷ luật, kiên nhẫn, tự tin và tôn trọng trong quá trình học tập và thi đấu.</li>
            <li><strong>Kỹ Năng Tự Vệ</strong>: Trang bị các kỹ năng tự vệ cần thiết để bảo vệ bản thân trong các tình huống nguy hiểm.</li>
            <li><strong>Giảm Stress</strong>: Giúp học viên thư giãn và giảm căng thẳng sau những giờ làm việc căng thẳng thông qua các bài tập thể lực và dưỡng sinh.</li>
        </ul>

        <p><strong>Kết Luận</strong></p>
        <p>Lớp học Taekwondo dành cho người lớn không chỉ là nơi rèn luyện về kỹ thuật mà còn là nơi học viên phát triển toàn diện về thể chất và tinh thần. Tham gia khóa học này, học viên sẽ được trang bị đầy đủ kiến thức và kỹ năng để tự tin thi đấu và tự vệ, đồng thời khám phá và phát huy tối đa tiềm năng của bản thân trong bộ môn Taekwondo.</p>
    </div>

    <form class="enrollForm" action="add" method="POST">
        <table>
            <h4>Đăng ký khoá học Lớp Người Lớn</h4>
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
             <input type="hidden" name="className" value="LopNguoiLon">
        </table>
        <button type="submit" class="submitButton">Đăng Ký</button>
        <input type="hidden" name="class" value="LopNguoiLon">
        <h5 style="text-align: center; color: red">${sessionScope.err}</h5>
        <% session.removeAttribute("err"); %>
    </form>

    <footer>
        <div class="footer-center">Taekwondo AllStar Center</div>
        <div class="footer-right">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3177296505073!2d105.80930281143611!3d21.019969180546436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab642a8ad0c3%3A0x64bf66f08e798c25!2zVHLGsOG7nW5nIE3huqdtIE5vbiBI4buNYSBNaQ!5e0!3m2!1svi!2s!4v1719118765443!5m2!1svi!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </footer>
    </body>
</html>
