<%-- 
    Document   : lopNangCao
    Created on : Jun 27, 2024, 1:35:01 AM
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
    <link rel="stylesheet" href="css/advanceClass.css">
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
        <h1>Lớp Học Taekwondo Nâng Cao</h1>
        <p><strong>Giới thiệu về Lớp Học Taekwondo Nâng Cao</strong></p>
        <p>Lớp học Taekwondo nâng cao là nơi tập trung các võ sinh đã có nền tảng vững chắc về các kỹ thuật cơ bản của Taekwondo. Khóa học này nhằm mục đích nâng cao kỹ năng, sự linh hoạt và sức mạnh của học viên, đồng thời trang bị cho họ những kỹ năng cần thiết để thi đấu đối kháng và thi đấu quyền ở các giải đấu chuyên nghiệp.</p>

        <p><strong>Nội Dung Đào Tạo</strong></p>

        <p><strong>Kỹ Thuật Đối Kháng (Kyorugi)</strong></p>
       <div style="align-items: center; text-align: center;"><img src="img/lopnangcao.jpg" alt="" style="width: 70%;"></div> 
        <ul>
            <li><strong>Chiến Lược Thi Đấu</strong>: Học viên sẽ được học cách phân tích đối thủ, xây dựng chiến lược thi đấu hiệu quả, và thực hành các tình huống đối kháng thực tế.</li>
            <li><strong>Kỹ Năng Tấn Công và Phòng Thủ</strong>: Nâng cao kỹ thuật tấn công bằng các đòn chân, đòn tay, và kỹ thuật phòng thủ để bảo vệ bản thân trước các đòn tấn công của đối thủ.</li>
            <li><strong>Phản Xạ và Tốc Độ</strong>: Các bài tập nhằm cải thiện phản xạ và tốc độ ra đòn, giúp học viên trở nên linh hoạt và nhanh nhẹn hơn trong thi đấu.</li>
        </ul>

        <p><strong>Kỹ Thuật Thi Đấu Quyền (Poomsae)</strong></p>
        <div style="align-items: center; text-align: center;"><img src="img/lopnangcao2.jpg" alt="" style="width: 70%;"></div>
        <ul>
            <li><strong>Biểu Diễn Quyền</strong>: Học viên sẽ được hướng dẫn chi tiết về các bài quyền từ cơ bản đến nâng cao, giúp họ hiểu rõ từng động tác và ý nghĩa của mỗi bài quyền.</li>
            <li><strong>Đồng Đội và Cá Nhân</strong>: Thực hành thi đấu quyền cá nhân và đồng đội, cải thiện sự phối hợp và đồng bộ trong các bài biểu diễn.</li>
            <li><strong>Tính Nghệ Thuật và Thẩm Mỹ</strong>: Tập trung vào sự uyển chuyển, mềm mại và thẩm mỹ trong từng động tác, giúp bài quyền trở nên đẹp mắt và ấn tượng hơn.</li>
        </ul>

        <p><strong>Lợi Ích Khi Tham Gia Khóa Học</strong></p>
        <ul>
            <li><strong>Cải Thiện Sức Khỏe</strong>: Tăng cường sức khỏe toàn diện, bao gồm sức bền, sức mạnh và độ linh hoạt của cơ thể.</li>
            <li><strong>Phát Triển Tinh Thần Võ Đạo</strong>: Rèn luyện tinh thần kỷ luật, kiên nhẫn, tự tin và tôn trọng trong quá trình học tập và thi đấu.</li>
            <li><strong>Cơ Hội Thi Đấu</strong>: Học viên có cơ hội tham gia các giải đấu chuyên nghiệp, thể hiện tài năng và kỹ năng của mình trước đối thủ.</li>
        </ul>

        <p><strong>Kết Luận</strong></p>
        <p>Lớp học Taekwondo nâng cao không chỉ là nơi rèn luyện về kỹ thuật mà còn là nơi học viên phát triển toàn diện về thể chất và tinh thần. Tham gia khóa học này, học viên sẽ được trang bị đầy đủ kiến thức và kỹ năng để tự tin tham gia các giải đấu đối kháng và thi đấu quyền, đồng thời khám phá và phát huy tối đa tiềm năng của bản thân trong bộ môn Taekwondo.</p>
    </div>

    <form class="enrollForm" action="add" method="POST">
        <table>
            <h4>Đăng ký khoá học Lớp Nâng Cao</h4>
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
            <input type="hidden" name="className" value="LopNangCao">
        </table>
        <button type="submit" class="submitButton">Đăng Ký</button>
        <input type="hidden" name="class" value="LopNangCao">
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
