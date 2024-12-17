<%-- 
    Document   : lopCoBan
    Created on : Jun 27, 2024, 1:19:19 AM
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
    <link rel="stylesheet" href="css/easyClass.css">
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
        <h1 style="text-align: center; margin-top: 50px; margin-bottom: 0px;">Lớp học Taekwondo Cơ Bản</h1>
    <main>
        <h2>Tiến trình học Taekwondo cho người mới học</h2>
        <p>Học Taekwondo có khó không? Thì câu trả lời chắc chắn là khó. Nhất là những người mới bắt đầu tập luyện. Vậy nên, trước khi bắt tay vào việc học môn võ này, mọi người cần phải dành nhiều thời gian để tìm hiểu về Taekwondo là gì? Cách thức tập luyện phù hợp với bản thân mình. Cụ thể:</p>
        <ul>
            <li>Tìm hiểu về võ Taekwondo, phong cách tập luyện để dễ dàng nắm bắt và tuân thủ một cách dễ dàng.</li> 
            <li>Cần sắp xếp thời gian để học tập và luyện tập.</li>
            <li>Tìm kiếm thêm nhiều nguồn tài liệu học võ Taekwondo online cơ bản để nắm bắt được quy trình học, kỹ thuật học.</li>
            <li>Tiến hành tập luyện theo bắt đầu từ những kỹ thuật cơ bản nhất của võ Taekwondo.</li>
            <li>Tích cực tập luyện thường xuyên để nâng cao quá trình tự học.</li>
        </ul>
        <img src="img/hoc-vo-taekwondo-coban.jpg" alt="">
        <h2>Luyện tập những động tác cơ bản của môn võ Taekwondo</h2>
        <p>Đối với những người mới tập luyện môn võ Taekwondo, hãy bắt đầu học từ những kỹ thuật cơ bản nhất của môn võ này. Bao gồm:</p>
        <h3>Đấm thẳng</h3>   
        <p>Đây là kỹ thuật cơ bản nhất của môn Taekwondo. Động tác này sẽ được thực hiện bằng cách đưa nắm đấm ngang hông, rồi đẩy nhanh, thẳng, mạnh về phía trước.</p>
        <img src="img/hoc-vo-taekwondo-coban2.jpg" alt="">
        <h3>Hình vuông thấp</h3>
        <p>Hình vuông thấp là kỹ thuật đặt nắm đấm sang vai đối diện. Đồng thời, lúc này nắm tay vuốt xuống trước khung xương chậu, dừng lại hoặc có thể đập vào chân bên cùng cánh tay chặn.</p>
        <img src="img/hoc-vo-taekwondo-coban3.jpg" alt="">
        <h3>Kỹ thuật đá trước</h3>
        <p>Đây là kỹ thuật đá cơ bản trong Taekwondo. Bạn chỉ cần giữ nguyên nắm đấm tay ngang hông rồi thực hiện cú đá phía trước, nhanh, mạnh dứt khoát về phía trước.</p>
        <img src="img/hoc-vo-taekwondo-coban4.jpg" alt="">
        <h3>Xỉa tay</h3>
        <p>Kỹ thuật này về cơ bản cũng được thực hiện như kỹ thuật đấm. Nhưng thay vì nắm bàn tay thì bạn sẽ để các ngón tay thẳng, cứng để tiến hành tạo một lực đánh nhanh, mạnh và dứt khoát để tấn công trực tiếp vào đối thủ.
            Lưu ý, với kỹ thuật xỉa tay này thì ngón tay trỏ và ngón giữa cần hơi nghiêng để tránh những chấn thương nguy hiểm khi đối kháng.</p>
        <img src="img/hoc-vo-taekwondo-coban5.jpg" alt="">    
        <h3>Xỉa tay khép</h3>
        <p>Đây được xem là kỹ thuật phản công khá tốt trong Taekwondo. Để thực hiện, mọi người để hai bàn tay sát bên người, các ngón tay duỗi thẳng. Sau đó thực hiện vung 2 tay lên phía trước nhanh, mạnh, dứt khoát để dùng lực tấn công đối thủ mạnh nhất có thể.</p>
        <img src="img/hoc-vo-taekwondo-coban6.jpg" alt="">
        <h3>Bên trong hình vuông</h3>
        <p>Đây là động tác bù trừ bên trong để giúp giữ thăng bằng cho người tập bằng cách đá sang hai bên.</p>
        <img src="img/hoc-vo-taekwondo-coban7.jpg" alt="">
        <h3>Đá bên</h3>
        <p>Đây là kỹ thuật quan trọng trong học võ Taekwondo. Để thực hiện động tác này, mọi người sẽ dùng chân sau và thực hiện cú đá về phía trước. Lưu ý, khi thực hiện kỹ thuật này cần đảm bảo đưa chân xa nhất về phía người một cách nhanh, mạnh và dứt khoát hơn.</p>
        <img src="img/hoc-vo-taekwondo-coban8.jpg" alt="">
        <h3>Đòn chặt tay trước</h3>
        <p>Đây là kỹ thuật võ Taekwondo cơ bản để hạ gục đối phương nhanh chóng. Cách thực hiện khá đơn giản, bạn chỉ cần đưa bàn tay phải ngang với tai bên phải của đối thủ, rồi thực hiện kéo bàn tay trái về phía ngang cơ thể. Thời điểm đưa bàn tay phải về phía tai phải đối thủ, hãy vẽ một đường tròn rồi tác động trực tiếp lên thái dương của đối phương nhanh chóng để hạ gục.</p>
        <img src="img/hoc-vo-taekwondo-coban9.jpg" alt="">
        <h3>Đá vòng</h3>
        <p>Đây là một kỹ thuật đặc biệt khi học Taekwondo. Cách thực hiện đơn tác này là người tập sẽ đưa chân lên cao, rồi tiến hành đá mạnh, nhanh về phía đối thủ. Còn chân kia sẽ làm trụ để tạo đà xoay cho chân bên kia đá.</p>
        <img src="img/hoc-vo-taekwondo-coban10.jpg" alt="">
    </main>

        <form class="enrollForm" action="payment" method="POST">
        <table>
            <h4>Đăng ký khoá học Lớp Cơ Bản</h4>
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
            <input type="hidden" name="className" value="LopCoBan">
        </table>
        <button type="submit" class="submitButton">Đăng Ký</button>
        <input type="hidden" name="class" value="LopCoBan">
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
