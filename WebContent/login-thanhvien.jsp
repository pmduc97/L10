<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập Thành Viên</title>
<link rel="stylesheet" href="css/style-login-admin.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="http://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="bootstrap/css/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
        //reset form
        function resetForm() {
        document.getElementById("form").reset();
        }
        
        function checkEmpty() {
            var t = document.getElementById("taikhoan").value;
            if(t==null || t==""){
                alert("Đăng nhập thất bại! Vui lòng điền đầy đủ thông tin đăng nhập !");
                return false;
            }
            var u = document.getElementById("matkhau").value;
            if(u==null || u==""){
                alert("Đăng nhập thất bại! Vui lòng điền đầy đủ thông tin đăng nhập !");
                return false;
            }
        }
    
        </script>
        
        <script type="text/javascript">
	var count = 3;
	var redirect = "ThongTinCaNhanThanhVien";
	function countDown(){
		var timer = document.getElementById("timer");
		if(count > 0){
			count--;
			timer.innerHTML = "Đến trang thành viên trong "+count+" giây.";
			setTimeout("countDown()", 1000);
		}else{
			window.location.href = redirect;
		}
	}
	</script>
</head>
<body>
	<div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card">ĐĂNG NHẬP THÀNH VIÊN</p>
            <%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("0"))	
		out.print("Đăng nhập thất bại. Tài khoản hoặc mật khẩu không chính xác");
	else{
		out.print("Đăng nhập thành công");
		%>
		<p id="timer"><script type="text/javascript">countDown();</script></p>
		<%
		}
}
%>
            <form class="form-signin" id="form" action="" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="taikhoan" class="form-control" placeholder="Tài khoản" name="taikhoan" required autofocus>
                <input type="password" id="matkhau" class="form-control" placeholder="Mật khẩu" name="matkhau" required>
                <input class="btn btn-lg btn-primary btn-block btn-signin" onclick="return checkEmpty()" type="submit" name="dangnhap" value="Đăng nhập">
                <a class="btn btn-lg btn-primary btn-block btn-signin" style="color: white;" href="TrangChu">Hủy</a>
                <button class="btn btn-lg btn-primary btn-block btn-signin"><a  style="color: white;" href="DangKyThanhVien">Đăng Ký Thành Viên</a></button>
                <input class="btn btn-lg btn-primary btn-block btn-signin" onclick="resetForm()" type="button" value="Reset">
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>