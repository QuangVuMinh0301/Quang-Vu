<%-- 
    Document   : lop11
    Created on : Jun 27, 2024, 1:30:36 AM
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
     <link rel="stylesheet" href="css/coachClass.css">
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
             <<% Account acc = null;
                if(session.getAttribute("account") != null){
                    acc = (Account) session.getAttribute("account");%>
                    <div class="nav-item"> <h3>Xin Chào <span style="color: #cc0052;"><%= acc.getUsername() %></span></h3></div>
                   <%}
                %>
        </div>    
    </header>

    <div class="container">
        <h1>Miêu tả về Lớp Học Taekwondo Huấn Luyện 1-1</h1>
        <p><strong>Giới thiệu về Lớp Học Taekwondo Huấn Luyện 1-1</strong></p>
        <p>Lớp học Taekwondo huấn luyện 1-1 với huấn luyện viên là một hình thức đào tạo chuyên biệt, mang lại nhiều lợi ích vượt trội so với các lớp học nhóm thông thường. Đây là lựa chọn lý tưởng cho những ai muốn nâng cao kỹ năng võ thuật một cách nhanh chóng và hiệu quả, đồng thời nhận được sự hướng dẫn tận tình và chính xác từ các huấn luyện viên giàu kinh nghiệm.</p>

        <p><strong>Lợi Ích của Lớp Học Taekwondo Huấn Luyện 1-1</strong></p>

        <p><strong>Chương Trình Đào Tạo Cá Nhân Hóa</strong></p>
        <ul>
            <li><strong>Thiết Kế Riêng Biệt</strong>: Chương trình đào tạo được thiết kế riêng biệt, phù hợp với mục tiêu và khả năng của từng học viên. Điều này giúp học viên tiến bộ nhanh chóng và đạt được kết quả tốt nhất.</li>
            <li><strong>Tập Trung Cao Độ</strong>: Học viên nhận được sự chú ý và tập trung cao độ từ huấn luyện viên, đảm bảo rằng mỗi buổi tập đều đạt hiệu quả tối đa.</li>
        </ul>

        <p><strong>Tiến Bộ Nhanh Chóng</strong></p>
        <ul>
            <li><strong>Phản Hồi Ngay Lập Tức</strong>: Học viên nhận được phản hồi ngay lập tức từ huấn luyện viên về kỹ thuật và phong cách thi đấu, giúp họ điều chỉnh và cải thiện nhanh chóng.</li>
            <li><strong>Bài Tập Được Điều Chỉnh</strong>: Các bài tập được điều chỉnh liên tục để phù hợp với sự tiến bộ của học viên, đảm bảo rằng họ luôn được thử thách và không ngừng phát triển.</li>
        </ul>

        <p><strong>Phát Triển Kỹ Năng Chuyên Sâu</strong></p>
        <ul>
            <li><strong>Tập Trung Vào Điểm Yếu</strong>: Học viên có cơ hội làm việc trực tiếp với huấn luyện viên để khắc phục các điểm yếu và nâng cao các kỹ năng cần thiết.</li>
            <li><strong>Nâng Cao Kỹ Thuật</strong>: Các kỹ thuật cao cấp và chiến lược thi đấu được huấn luyện viên hướng dẫn chi tiết, giúp học viên trở nên xuất sắc và tự tin hơn trong các cuộc thi đấu.</li>
        </ul>

        <p><strong>Linh Hoạt Thời Gian</strong></p>
        <ul>
            <li><strong>Lịch Tập Linh Hoạt</strong>: Học viên có thể lựa chọn thời gian tập luyện phù hợp với lịch trình cá nhân, giúp họ dễ dàng duy trì việc tập luyện mà không ảnh hưởng đến công việc và cuộc sống hàng ngày.</li>
            <li><strong>Tập Trung Tối Đa</strong>: Với môi trường tập luyện riêng biệt, học viên có thể tập trung tối đa, không bị phân tâm bởi các yếu tố bên ngoài.</li>
        </ul>

        <p><strong>Phát Triển Toàn Diện</strong></p>
        <ul>
            <li><strong>Thể Chất và Tinh Thần</strong>: Ngoài việc nâng cao thể lực và kỹ năng võ thuật, học viên còn được rèn luyện tinh thần kỷ luật, kiên nhẫn và tự tin.</li>
            <li><strong>Tự Vệ Hiệu Quả</strong>: Học viên được trang bị các kỹ năng tự vệ cá nhân hiệu quả, giúp họ tự tin và an toàn hơn trong cuộc sống hàng ngày.</li>
        </ul>

        <p><strong>Kết Luận</strong></p>
        <p>Lớp học Taekwondo huấn luyện 1-1 với huấn luyện viên mang lại những lợi ích vượt trội, giúp học viên tiến bộ nhanh chóng và phát triển toàn diện. Với chương trình đào tạo cá nhân hóa, sự chú ý tận tình từ huấn luyện viên và sự linh hoạt về thời gian, đây là lựa chọn hoàn hảo cho những ai muốn nâng cao kỹ năng võ thuật một cách nhanh nhất và hiệu quả nhất. Tham gia khóa học này, học viên sẽ đạt được những thành tựu đáng kể trong bộ môn Taekwondo và trở nên tự tin, mạnh mẽ hơn trong cuộc sống.</p>
    </div>

    <form class="enrollForm" action="add" method="POST">
        <table>
            <h4>Đăng ký khoá học Lớp dạy 1-1 với HLV</h4>
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
            <input type="hidden" name="className" value="LopHLV">
        </table>
        <button type="submit" class="submitButton">Đăng Ký</button>
        <input type="hidden" name="class" value="LopHLV">
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
