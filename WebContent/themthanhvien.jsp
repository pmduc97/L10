<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm thành viên</title>
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
                alert("Email không được trống !");
                return false;
            }
            var u = document.getElementById("sdt").value;
            if(u==null || u==""){
                alert("Điện thoại không được trống!");
                return false;
            }
            var u1 = document.getElementById("taikhoan").value;
            if(u1==null || u1==""){
                alert("Tài khoản không được trống!");
                return false;
            }
            var u2 = document.getElementById("matkhau").value;
            if(u2==null || u2==""){
                alert("Mật khẩu không được trống!");
                return false;
            }
        }
    
        </script>
        
        <script type="text/javascript">
	var count = 1;
	var redirect = "QuanLyThanhVien";
	function countDown(){
		var timer = document.getElementById("timer");
		if(count > 0){
			count--;
			timer.innerHTML = "";
			setTimeout("countDown()", 1000);
		}else{
			window.location.href = redirect;
		}
	}
	</script>
</head>
<body>
<%
//NguoiDungBean admin = (NguoiDungBean)session.getAttribute("admin");
%>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="MenuAdmin">
				Menu Admin
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown ">
					<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Chào Admin: <%//admin.getHoTen() %>
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
								<li class=""><a href="QuanLyThanhVien"><span class="glyphicon glyphicon-dashboard"></span> Quản Lý Thành Viên</a></li>
								<li><a href="QuanLyCayXanh"><span class="glyphicon glyphicon-plane"></span> Quản Lý Cây Xanh</a></li>
								<li><a href="DoiMatKhauAdmin"><span class="glyphicon glyphicon-cloud"></span> Đổi mật khẩu</a></li>		
							</ul>
						</div><!-- /.navbar-collapse -->
					</nav>
				</div>
			</div>  		
		</div>
  		<div class="col-md-10 content">
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <div class="panel-title">Thêm thành viên mới</div>
	            </div>  
	            <div class="panel-body" >   
	            <%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("0"))	
		out.print("Thành viên này đã tồn tại trong hệ thống!");
	else if(request.getAttribute("kiemtra").equals("1")){
		out.print("Thành viên đã được thêm vào hệ thống");
		%>
		<p id="timer"><script type="text/javascript">countDown();</script></p>
		<%
		}
	else
		out.print("Có lỗi");
}
%>                  
	                    <form id="form" class="form-horizontal" action="" method="post" >                      
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tên thành viên<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control"  id="hoten" maxlength="30" name="hoten" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	             			<div id="div_id_date" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Ngày sinh<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" value="1970-01-01" id="ngaysinh" maxlength="30" name="ngaysinh" style="margin-bottom: 10px" type="date" />
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
	                                <input class="input-md textinput textInput form-control"  id="cmt" name="cmt" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_email" class="form-group required">
	                             <label for="id_email" class="control-label col-md-4  requiredField"> Email<span class="asteriskField">**</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="email"  name="email" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_address" class="form-group required">
	                             <label for="id_address" class="control-label col-md-4  requiredField"> Địa chỉ<span class="asteriskField"></span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="diachi" name="diachi" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_address" class="form-group required">
	                             <label for="id_address" class="control-label col-md-4  requiredField"> Điện thoại<span class="asteriskField">**</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="sdt"  name="sdt" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tài khoản<span class="asteriskField">**</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" id="taikhoan"  maxlength="30" name="taikhoan" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div> 
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Mật khẩu<span class="asteriskField">**</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" id="matkhau"  maxlength="30" name="matkhau" style="margin-bottom: 10px" type="password" />
	                            </div>
	                        </div>
	                        <div class="form-group"> 
	                            <div class="aab controls col-md-4 "></div>
	                            <div class="controls col-md-8 ">
	                                <a class="btn btn-primary btn btn-info" href="MenuThanhVien">Quay lại</a>
	                                <input class="btn btn-sm btn-primary" onclick="resetForm()" type="button" value="Reset">
	                                <input type="submit" onclick="return checkEmpty()" name="them" value="Thêm" class="btn btn btn-danger"  />
	                            </div>
	                        </div>                            
	                    </form>
	            </div>
        	</div>
  		</div>
	</div>
</body>
</html>