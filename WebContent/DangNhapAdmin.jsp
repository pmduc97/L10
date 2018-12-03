<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Dang nhap admin</title>
</head>
<body>
<h2>Dang nhap admin</h2>
<form action="" method="post">
<table>
<tr>
<th>Tai khoan</th>
<td><input value="" name="taikhoan" type="text"></td>
</tr>
<tr>
<th>Mat khau</th>
<td><input value="" name="matkhau" type="text"></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="dangnhap" value="Dang nhap"></td>
</tr>
</table>
</form>
<p>
<%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("1")){
		NguoiDungBean nguoidung = (NguoiDungBean)request.getAttribute("nguoidung");
		out.print("Dang nhap thanh cong");
		out.print("Chao: " + nguoidung.getHoTen());
	}
	else{
		out.print("Dang nhap that bai");
	}
}
%>
</p>
</body>
</html>