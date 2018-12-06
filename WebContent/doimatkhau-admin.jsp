<%@page import="Bean.NguoiDungBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu Admin</title>
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
        //reset form
        function resetForm() {
        document.getElementById("form").reset();
        }
        
        function checkEmpty() {
            var u = document.getElementById("matkhaucu").value;
            var u1 = document.getElementById("matkhaumoi1").value;
            var u2 = document.getElementById("matkhaumoi2").value;
            if(u==null || u=="" || u1 == null || u1=="" || u2=="" || u2==null ){
                alert("Vui lòng nhập đầy đủ các trường !");
                return false;
            }
            
            if(u1 != u2){
                alert("Xác nhận mật khẩu không khớp !");
                return false;
            }
            if(u1.length >49 || u2.length > 49){
                alert("Vui lòng nhập không nhập quá 50 ký tự mật khẩu mới!");
                return false;
            }
        }
    
        </script>
        
        <script type="text/javascript">
	var count = 3;
	var redirect = "MenuAdmin";
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
NguoiDungBean admin = (NguoiDungBean)session.getAttribute("admin");
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
								<li><a href="QuanLyCayXanh"><span class="glyphicon glyphicon-plane"></span> Quản Lý Cây Xanh</a></li>
								<li class="active"><a href="DoiMatKhauAdmin"><span class="glyphicon glyphicon-cloud"></span> Đổi mật khẩu</a></li>		
							</ul>
						</div><!-- /.navbar-collapse -->
					</nav>
				</div>
			</div>  		
		</div>
  		<div class="col-md-10 content">
  			<div class="panel panel-info">
	            <div class="panel-heading">
	                <div class="panel-title">ĐỔI MẬT KHẨU</div>
	            </div>
	             <%
if(request.getAttribute("kiemtra") != null){
	if(request.getAttribute("kiemtra").equals("-1"))	
		out.print("Sai mật khẩu cũ !");
	else if(request.getAttribute("kiemtra").equals("1")){
		out.print("Đổi mật khẩu thành công !");
		%>
		<p id="timer"><script type="text/javascript">countDown();</script></p>
		<%
		}
}
%>  
	            <div class="panel-body" >                  
	                    <form id="form" action=""  method="post" >                      
	                        <div>
	                            <label for="id_username" class="control-label col-md-3 "> Tài khoản<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" value="<%=admin.getUserName() %>" id="taikhoan" maxlength="30" name="taikhoan" readonly="readonly" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_password1" class="form-group required">
	                            <label for="id_password1" class="control-label col-md-3  requiredField">Mật khẩu cũ<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 "> 
	                                <input class="input-md textinput textInput form-control" id="matkhaucu" name="matkhaucu"  style="margin-bottom: 10px" type="password" />
	                            </div>
	                        </div>
	                        <div id="div_id_password1" class="form-group required">
	                            <label for="id_password1" class="control-label col-md-3  requiredField">Mật khẩu mới<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 "> 
	                                <input class="input-md textinput textInput form-control" id="matkhaumoi1" name="matkhaumoi1"  style="margin-bottom: 10px" type="password" />
	                            </div>
	                        </div>
	                        <div id="div_id_password2" class="form-group required">
	                             <label for="id_password2" class="control-label col-md-3  requiredField"> Xác nhận lại mật khẩu mới<span class="asteriskField">*</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="matkhaumoi2" name="matkhaumoi2"  style="margin-bottom: 10px" type="password" />
	                            </div>
	                        </div>  
	                        <div class="form-group"> 
	                            <div class="aab controls col-md-3 "></div>
	                            <div class="controls col-md-8 ">
	                                <a href="MenuAdmin" class="btn btn-info">Quay lại</a>
	                                <input type="button" onclick="resetForm()"  value="Reset" class="btn btn-primary" />
	                                <input type="submit" name="doimatkhau" onclick="return checkEmpty()"  value="Đổi mật khẩu" class="btn btn-danger"  />
	                            </div>
	                        </div>                            
	                    </form>
	            </div>
        	</div>
  		</div>
	</div>
</body>
</html>