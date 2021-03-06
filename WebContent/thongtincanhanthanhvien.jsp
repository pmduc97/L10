<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu thành viên</title>
<link rel="stylesheet" href="css/style-index.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="js/scrip-index.js"></script>
<script type="text/javascript" src="bootstrap/css/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
        //reset form
        function resetForm() {
        document.getElementById("form").reset();
        }
        
        function checkEmpty() {
            var t = document.getElementById("email").value;
            if(t==null || t==""){
                alert("Lưu thất bại, Vui lòng nhập đầy đủ thông tin cần thiết !");
                return false;
            }
            var u = document.getElementById("sdt").value;
            if(u==null || u==""){
                alert("Lưu thất bại, Vui lòng nhập đầy đủ thông tin cần thiết !");
                return false;
            }
        }
    
        </script>
        
        <script type="text/javascript">
	var count = 3;
	var redirect = "QuanLyThanhVien";
	function countDown(){
		var timer = document.getElementById("timer");
		if(count > 0){
			count--;
			timer.innerHTML = "Đến trang Admin trong "+count+" giây.";
			setTimeout("countDown()", 1000);
		}else{
			window.location.href = redirect;
		}
	}
	</script>
</head>
<body>
<%
NguoiDungBean thanhvien = (NguoiDungBean)session.getAttribute("thanhvien");
%>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="MenuThanhVien">
				Menu thành viên
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown ">
					<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Chào thành viên: <%=thanhvien.getHoTen() %>
					</a>
				</li>
				<li class="dropdown ">
					<a href="DangXuat" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Đăng xuất
					</a>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>  	
	<div class="container-fluid main-container">
  		<div class="col-md-2 sidebar">
  			<div class="row">
				<!-- uncomment code for absolute positioning tweek see top comment in css -->
				<div class="absolute-wrapper"> </div>
				<!-- Menu -->
				<div class="side-menu">
					<nav class="navbar navbar-default" role="navigation">
						<!-- Main Menu -->
						<div class="side-menu-container">
							<ul class="nav navbar-nav">
								<li class="active"><a href="ThongTinCaNhanThanhVien"><span class="glyphicon glyphicon-dashboard"></span> Thông tin cá nhân</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-plane"></span> Xem cây xanh</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-cloud"></span> Đổi mật khẩu</a></li>		
							</ul>
						</div><!-- /.navbar-collapse -->
					</nav>
				</div>
			</div>  		
		</div>
  		<div class="col-md-10 content">
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <div class="panel-title">Thông tin cá nhân</div>
	            </div>  
	            <div class="panel-body" >   
	            <%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("1"))	
		out.print("Lưu thông tin thành viên thành công !");
	else{
		out.print("Có lỗi. Vui lòng thử lại");
		%>
		<%
		}
}
%>                  
	                    <form id="form" class="form-horizontal" action="" method="post" >                      
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tên thành viên<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" value="<%=thanhvien.getHoTen() %>" id="hoten" maxlength="30" name="hoten" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	             			<div id="div_id_date" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Ngày sinh<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" value="<%=thanhvien.getNgaySinh() %>" id="ngaysinh" maxlength="30" name="ngaysinh" style="margin-bottom: 10px" type="date" />
	                            </div>
	                        </div>
	                        <div id="div_id_sex" class="form-group required">
	                            <label for="id_sex" class="control-label col-md-4  requiredField"> Giới tính<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                            <select class="input-md  textinput textInput form-control" name="gioitinh" id="gioitinh">
	                            <option value="1">Nam</option>
	                            <option value="0">Nữ</option>
	                            </select>
	                            </div>
	                        </div>
	                        <div id="div_id_cmt" class="form-group required">
	                            <label for="id_cmt" class="control-label col-md-4  requiredField">CMT<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 "> 
	                                <input class="input-md textinput textInput form-control" value="<%=thanhvien.getCMT() %>" id="cmt" name="cmt" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_email" class="form-group required">
	                             <label for="id_email" class="control-label col-md-4  requiredField"> Email<span class="asteriskField">**</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="email" value="<%=thanhvien.getEmail() %>" name="email" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_address" class="form-group required">
	                             <label for="id_address" class="control-label col-md-4  requiredField"> Địa chỉ<span class="asteriskField"></span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="diachi" value="<%=thanhvien.getDiaChi() %>" name="diachi" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_address" class="form-group required">
	                             <label for="id_address" class="control-label col-md-4  requiredField"> Điện thoại<span class="asteriskField">**</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="sdt" value="<%=thanhvien.getSDT() %>" name="sdt" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tài khoản<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" readonly="readonly" id="taikhoan" value="<%=thanhvien.getUserName() %>" maxlength="30" name="taikhoan" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div> 
	                        <div class="form-group"> 
	                            <div class="aab controls col-md-4 "></div>
	                            <div class="controls col-md-8 ">
	                                <a class="btn btn-primary btn btn-info" href="MenuThanhVien">Quay lại</a>
	                                <input type="submit" onclick="return checkEmpty()" name="luu" value="Lưu" class="btn btn btn-danger"  />
	                            </div>
	                        </div>                            
	                    </form>
	            </div>
        	</div>
  		</div>
	</div>
</body>
</html>