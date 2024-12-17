<%-- 
    Document   : lopTuVe
    Created on : Jun 27, 2024, 7:23:42 AM
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
        <link rel="stylesheet" href="css/defenseClass.css">
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
            <h1>Miêu tả về Lớp Học Taekwondo Tự Vệ</h1>
            <p><strong>Giới thiệu về Lớp Học Taekwondo Tự Vệ</strong></p>
            <p>Lớp học Taekwondo tự vệ được thiết kế để trang bị cho học viên các kỹ năng cần thiết để bảo vệ bản thân trước các tình huống nguy hiểm. Đây là khóa học lý tưởng cho những ai muốn nâng cao khả năng tự vệ, tăng cường sự tự tin và an toàn trong cuộc sống hàng ngày. Khóa học không chỉ tập trung vào các kỹ thuật tự vệ mà còn rèn luyện thể lực và tinh thần, giúp học viên trở nên mạnh mẽ và kiên cường hơn.</p>

            <p><strong>Lợi Ích của Lớp Học Taekwondo Tự Vệ</strong></p>

            <p><strong>Bảo Vệ Bản Thân Trước Những Người Xấu</strong></p>
            <ul>
                <li><strong>Kỹ Năng Phản Xạ Nhanh</strong>: Học viên được huấn luyện để phản xạ nhanh chóng và hiệu quả trước các tình huống tấn công bất ngờ. Kỹ năng này giúp họ có thể tránh né hoặc phản công một cách kịp thời.</li>
                <li><strong>Kỹ Thuật Thoát Hiểm</strong>: Khóa học tập trung vào các kỹ thuật thoát hiểm khỏi những tình huống bị khống chế như bị nắm cổ tay, bị ôm từ phía sau, hoặc bị tấn công từ nhiều phía.</li>
                <li><strong>Tự Vệ Bằng Đòn Chân và Đòn Tay</strong>: Học viên được học các đòn chân và đòn tay cơ bản và nâng cao, giúp họ có thể tấn công vào những điểm yếu của kẻ tấn công và bảo vệ bản thân một cách hiệu quả.</li>
            </ul>

            <p><strong>Tăng Cường Sự Tự Tin và Tinh Thần Kiên Cường</strong></p>
            <ul>
                <li><strong>Rèn Luyện Thể Lực</strong>: Các bài tập thể lực trong khóa học giúp học viên tăng cường sức mạnh, sức bền và sự dẻo dai, từ đó nâng cao khả năng tự vệ và đối phó với các tình huống nguy hiểm.</li>
                <li><strong>Phát Triển Tinh Thần Võ Đạo</strong>: Học viên được rèn luyện tinh thần kỷ luật, kiên nhẫn và tự tin, giúp họ trở nên mạnh mẽ hơn cả về thể chất lẫn tinh thần.</li>
                <li><strong>Giảm Stress và Tăng Cường Sự Bình Tĩnh</strong>: Thông qua các bài tập và kỹ thuật hít thở, học viên học cách kiểm soát cảm xúc, giảm stress và duy trì sự bình tĩnh trong mọi tình huống.</li>
            </ul>

            <p><strong>Linh Hoạt và Hiệu Quả</strong></p>
            <ul>
                <li><strong>Lịch Tập Linh Hoạt</strong>: Học viên có thể lựa chọn thời gian tập luyện phù hợp với lịch trình cá nhân, giúp họ dễ dàng duy trì việc tập luyện mà không ảnh hưởng đến công việc và cuộc sống hàng ngày.</li>
                <li><strong>Phương Pháp Đào Tạo Hiệu Quả</strong>: Khóa học áp dụng các phương pháp đào tạo hiện đại và hiệu quả, giúp học viên nắm bắt nhanh chóng và áp dụng thành thạo các kỹ năng tự vệ.</li>
            </ul>

            <p><strong>Kết Luận</strong></p>
            <p>Lớp học Taekwondo tự vệ không chỉ giúp học viên trang bị những kỹ năng tự vệ cần thiết mà còn nâng cao thể lực và tinh thần. Tham gia khóa học này, học viên sẽ cảm thấy tự tin và an toàn hơn trong cuộc sống hàng ngày, đồng thời phát triển toàn diện cả về thể chất và tinh thần. Đây là lựa chọn hoàn hảo cho những ai muốn bảo vệ bản thân và gia đình trước những nguy cơ tiềm ẩn từ những người xấu.</p>
        </div>

        <form class="enrollForm" action="add" method="POST">
            <table>
                <h4>Đăng ký khoá học Lớp Tự Vệ</h4>
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
                <input type="hidden" name="className" value="LopTuVe">
            </table>
            <button type="submit" class="submitButton">Đăng Ký</button>
            <input type="hidden" name="class" value="LopTuVe">
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
