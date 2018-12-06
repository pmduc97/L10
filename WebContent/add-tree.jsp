<%@page import="Bean.LoaiCayBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm cây xanh</title>
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
            var t = document.getElementById("macay").value;
            if(t==null || t==""){
                alert("Vui lòng nhập mã cây !");
                return false;
            }
            var u = document.getElementById("tencay").value;
            if(u==null || u==""){
                alert("Vui lòng nhập tên cây!");
                return false;
            }
            var u1 = document.getElementById("chieucao").value;
            if(u1==null || u1==""){
                alert("Vui lòng nhập chiều cao cây!");
                return false;
            }
            var u2 = document.getElementById("tuyenduong").value;
            if(u2==null || u2==""){
                alert("Vui lòng nhập tuyến đường!");
                return false;
            }
        }
    
        </script>
        
        <script type="text/javascript">
	var count = 3;
	var redirect = "QuanLyCayXanh";
	function countDown(){
		var timer = document.getElementById("timer");
		if(count > 0){
			count--;
			timer.innerHTML = "Trở về trang hiển thị cây xanh sau " + count + " giây";
			setTimeout("countDown()", 1000);
		}else{
			window.location.href = redirect;
		}
	}
	</script>
</head>
<body>
<%
NguoiDungBean admin = (NguoiDungBean)session.getAttribute("admin");
ArrayList<LoaiCayBean> lstLoai = (ArrayList<LoaiCayBean>)request.getAttribute("lstLoai");
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
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <div class="panel-title">Thêm cây xanh mới</div>
	            </div>  
	            <div class="panel-body" >   
	            <%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("-1"))	
		out.print("Mã cây xanh này đã tồn tại trong hệ thống!");
	else if(request.getAttribute("kiemtra").equals("1")){
		out.print("Cây xanh đã được thêm vào hệ thống");
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
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Mã cây<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control"  id="macay" maxlength="30" name="macay" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tên cây<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control"  id="tencay" maxlength="30" name="tencay" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_sex" class="form-group required">
	                            <label for="id_sex" class="control-label col-md-4  requiredField"> Loại cây<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                            <select class="input-md  textinput textInput form-control" name="loaicay" id="loaicay">
	                            <%
	                            for(LoaiCayBean l: lstLoai){
	                            %>
	                            <option value="<%=l.getMaLoai()%>"><%=l.getTenLoai()%></option>
	                            <%} %>
	                            </select>
	                            </div>
	                        </div>
	             			<div id="div_id_date" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Thời gian trồng<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" value="1970-01-01" id="thoigian" maxlength="30" name="thoigian" style="margin-bottom: 10px" type="date" />
	                            </div>
	                        </div>
	                        
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Chiều cao<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control"  id="chieucao" maxlength="30" name="chieucao" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tuyến đường<span class="asteriskField"></span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control"  id="tuyenduong" maxlength="30" name="tuyenduong" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div class="form-group"> 
	                            <div class="aab controls col-md-4 "></div>
	                            <div class="controls col-md-8 ">
	                                <a class="btn btn-primary btn btn-info" href="QuanLyCayXanh">Quay lại</a>
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