<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký thành viên</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="bootstrap/css/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
        //reset form
        function resetForm() {
        document.getElementById("form").reset();
        }
        
        function checkEmpty() {
            var taikhoan = document.getElementById("taikhoan").value;
            var matkhau = document.getElementById("matkhau").value;
            var matkhau1 = document.getElementById("matkhau1").value;
            var email = document.getElementById("email").value;
            var dt = document.getElementById("dt").value;
            if(taikhoan==null || taikhoan=="" || matkhau==null || matkhau=="" || matkhau1==null || matkhau1=="" || email==null || email=="" || dt==null || dt==""){
                alert("Đăng ký thất bại! Vui lòng điền đầy đủ thông tin đăng ký !");
                return false;
            }
            
            if(matkhau != matkhau1){
                alert("Đăng ký thất bại! Vui lòng điền xác nhận mật khẩu khớp nhau !");
                return false;
            }
        }
    
        </script>
        
        <script type="text/javascript">
	var count = 3;
	var redirect = "DangNhapThanhVien";
	function countDown(){
		var timer = document.getElementById("timer");
		if(count > 0){
			count--;
			timer.innerHTML = "Đến trang đăng nhập thành viên trong "+count+" giây.";
			setTimeout("countDown()", 1000);
		}else{
			window.location.href = redirect;
		}
	}
	</script>
</head>
<body>
	<div class="container">
	<hr>
	<div style="text-align: center;">
	<h1>Đăng ký thành viên</h1>
	<%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("0"))	
		out.print("Đăng ký thất bại. Tài khoản đã tồn tại");
	else{
		out.print("Đăng ký thành công");
		%>
		<p id="timer"><script type="text/javascript">countDown();</script></p>
		<%
		}
}
%>
        <form class="form-horizontal" method="post" action="" id="form">
    <div class="form-group">
      <label class="control-label col-sm-2">Tài khoản**:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="taikhoan" name="taikhoan">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Mật khẩu**:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="matkhau" name="matkhau">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Nhập lại mật khẩu**:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="matkhau1" name="matkhau">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Họ và tên:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="hoten" name="hoten">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Ngày sinh:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control form-control-sm" value="1970-01-01" id="ngaysinh" name="ngaysinh">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">CMT:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="cmt" name="cmt">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Điện thoại**:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="dt" name="dt">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Email**:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="email" name="email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Địa chỉ:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control form-control-sm" id="diachi" name="diachi">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Giới tính:</label>
      <div class="col-sm-10">
        <select name="gioitinh" class="form-control form-control-sm">
        <option value="1">Nam</option>
        <option value="0">Nữ</option>
        </select>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-10">
      	<input class="btn btn-sm btn-primary " onclick="return checkEmpty()" type="submit" name="dangky" value="Đăng ký">
      	<input class="btn btn-sm btn-primary" onclick="resetForm()" type="button" value="Reset">
        <a href="TrangChu" class="btn btn-sm btn-primary">Hủy</a>
        
      </div>
    </div>
  </form>
  </div>
    </div><!-- /container -->
</body>
</html>