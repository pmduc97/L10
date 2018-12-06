<%@page import="Bean.CayXanhBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý cây xanh</title>
<link rel="stylesheet" href="css/style-index.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="js/scrip-index.js"></script>
<script type="text/javascript" src="bootstrap/css/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
</head>
<body>
<%
NguoiDungBean admin = (NguoiDungBean)session.getAttribute("admin");
ArrayList<CayXanhBean> lstCay = (ArrayList<CayXanhBean>)request.getAttribute("lstCay");
int i=1;
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
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Chào Admin: <%=admin.getHoTen() %>
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
								<li ><a href="QuanLyThanhVien"><span class="glyphicon glyphicon-dashboard"></span> Quản Lý Thành Viên</a></li>
								<li class="active"><a href="QuanLyCayXanh"><span class="glyphicon glyphicon-plane"></span> Quản Lý Cây Xanh</a></li>
								<li><a href="DoiMatKhauAdmin"><span class="glyphicon glyphicon-cloud"></span> Đổi mật khẩu</a></li>		
							</ul>
						</div><!-- /.navbar-collapse -->
					</nav>
				</div>
			</div>  		
		</div>
  		<div class="col-md-10 content">
  		<div class="row">
  		<div class="col-md-4">
  		<a href="ThemCayXanh" class="btn btn-sm btn-info">Thêm cây xanh</a>
  		</div>
  		<div class="col-md-1"></div>
  		<div class="col-md-7">
  		</div>        
  		</div>
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <div class="panel-title">DANH SÁCH CÂY XANH</div>
	            </div>  
	            <div class="panel-body" >
	            <table class="table">
	            <thead>
	            <tr>
	            <th>STT</th>
	            <th>Mã cây</th>
	            <th>Tên cây</th>
	            <th>Loại cây</th>
	            <th>Thời gian trồng</th>
	            <th>Chiều cao</th>
	            <th>Tuyến đường</th>
	            </tr>
	            </thead>
	            <tbody>
	            <%
	            for(CayXanhBean n: lstCay){
	            %>
	            <tr>
	            <td><%=i %></td>
	            <td><%=n.getMaCay() %></td>
	            <td><%=n.getTenCay() %></td>
	            <td><%=n.getMaLoai() %></td>
	            <td><%=n.getNgayTrong() %></td>
	            <td><%=n.getChieuCao() %></td>
	            <td><%=n.getTuyenDuong() %></td>
	            </tr>
	            <% i++; } %>
	            </tbody>
	            </table>
	            </div>
        	</div>
  		</div>
	</div>
</body>
</html>