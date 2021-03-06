<%@page import="java.util.ArrayList"%>
<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý thành viên</title>
<link rel="stylesheet" href="css/style-index.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="js/scrip-index.js"></script>
<script type="text/javascript" src="bootstrap/css/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {

    var enrollType;
  //  $("#div_id_As").hide();
    $("input[name='As']").change(function() {
        memberType = $("input[name='select']:checked").val();
        providerType = $("input[name='As']:checked").val();
		toggleIndividInfo();
    });
    
    $("input[name='select']").change(function() {
		memberType = $("input[name='select']:checked").val();
		toggleIndividInfo();
		toggleLearnerTrainer();
	});
	
	function toggleLearnerTrainer() {

	if (memberType == 'P' || enrollType=='company') {
		$("#cityField").hide();
		$("#providerType").show();
		$(".provider").show();
		$(".locationField").show();
		if(enrollType=='INSTITUTE'){
			$(".individ").hide();
		}
	
	} 
    else {
		$("#providerType").hide();
		$(".provider").hide();
		$('#name').show();
		$("#cityField").hide();
		$(".locationField").show();
		$("#instituteName").hide();
		$("#cityField").show();
		
	}
    }
    function toggleIndividInfo(){

	if(((typeof memberType!=='undefined' && memberType == 'TRAINER')||enrollType=='INSTITUTE') && providerType=='INDIVIDUAL'){
		$("#instituteName").hide();
		$(".individ").show();
		$('#name').show();
	}
    else if((typeof memberType!=='undefined' && memberType == 'TRAINER')|| enrollType=='INSTITUTE'){
		$('#name').hide();
		$("#instituteName").show();
		$(".individ").hide();
	}
    }
   
 });
</script>

<script type="text/javascript">     
        function checkEmpty() {
            var t = document.getElementById("key").value;
            if(t==null || t==""){
                alert("Bạn cần nhập thông tin cần tìm kiếm !");
                return false;
            }
        }
    
        </script>
</head>
<body>
<%
NguoiDungBean admin = (NguoiDungBean)session.getAttribute("admin");
ArrayList<NguoiDungBean> lstThanhVien = (ArrayList<NguoiDungBean>)request.getAttribute("lstTV");
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
								<li class="active"><a href="QuanLyThanhVien"><span class="glyphicon glyphicon-dashboard"></span> Quản Lý Thành Viên</a></li>
								<li><a href="QuanLyCayXanh"><span class="glyphicon glyphicon-plane"></span> Quản Lý Cây Xanh</a></li>
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
  		<a href="ThemThanhVien" class="btn btn-sm btn-info">Thêm thành viên</a>
  		</div>
  		<div class="col-md-1"></div>
  		<div class="col-md-7">
  		<form action="" class="" method="get">
  		<input type="text" id="key" name="key" class="form-control form-control-sm">
  		<input type="submit" class="btn btn-sm btn-info" onclick="return checkEmpty()" value="Tìm">
  		</form>
  		</div>
  		<%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("1") == false)	
		out.print("Không tim thấy thành viên có tài khoản: " + (String)request.getAttribute("kiemtra"));
}
%>         
<%
if(request.getAttribute("kiemtraxoa") != null){
	if(request.getAttribute("kiemtraxoa").equals("1"))	
		out.print("Đã xóa");
}
%>            
  		</div>
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <div class="panel-title">DANH SÁCH THÀNH VIÊN</div>
	            </div>  
	            <div class="panel-body" >
	            <table class="table">
	            <thead>
	            <tr>
	            <th>STT</th>
	            <th>Tài khoản</th>
	            <th>Họ tên</th>
	            <th>Ngày sinh</th>
	            <th>CMT</th>
	            <th>Điện thoại</th>
	            <th>Email</th>
	            <th>Địa chỉ</th>
	            <th>Giới tính</th>
	            </tr>
	            </thead>
	            <tbody>
	            <%
	            for(NguoiDungBean n: lstThanhVien){
	            %>
	            <tr>
	            <td><%=i %></td>
	            <td><%=n.getUserName() %></td>
	            <td><%=n.getHoTen() %></td>
	            <td><%=n.getNgaySinh() %></td>
	            <td><%=n.getCMT() %></td>
	            <td><%=n.getSDT() %></td>
	            <td><%=n.getEmail() %></td>
	            <td><%=n.getDiaChi() %></td>
	            <td><%
	            if(n.isGioiTinh())
	            	out.print("Nam");
	            else
	            	out.print("Nữ");
	            %></td>
	            <td style="width: 150px;">
	            <form action="" method="post">
	            <input type="hidden" name="taikhoan" value="<%=n.getUserName()%>">
	            <input style="float: left;" type="submit" name="xoa" class="btn btn-sm btn-info" value="Xóa" >
	            </form>
	            <a style="float: right;" class="btn btn-sm btn-info" href="ThongTinThanhVien?taikhoan=<%=n.getUserName()%>">Chi tiết</a></td>
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