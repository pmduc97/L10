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
</head>
<body>

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
						Chào thành viên: 
					</a>
				</li>
				<li class="dropdown ">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
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
	                <form method="post" action=".">
	                    <input type='hidden' name='csrfmiddlewaretoken' value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' />                       
	                    <form  class="form-horizontal" method="post" >                      
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tên thành viên<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" id="id_username" maxlength="30" name="username" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	             			<div id="div_id_date" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Ngày sinh<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" id="id_username" maxlength="30" name="date" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_sex" class="form-group required">
	                            <label for="id_sex" class="control-label col-md-4  requiredField"> Giới tính<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" id="sex" maxlength="30" name="sex" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div>
	                        <div id="div_id_cmt" class="form-group required">
	                            <label for="id_cmt" class="control-label col-md-4  requiredField">CMT<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 "> 
	                                <input class="input-md textinput textInput form-control" id="cmt" name="cmt" style="margin-bottom: 10px" type="number" />
	                            </div>
	                        </div>
	                        <div id="div_id_email" class="form-group required">
	                             <label for="id_email" class="control-label col-md-4  requiredField"> Email<span class="asteriskField">*</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="email" name="email" style="margin-bottom: 10px" type="email" />
	                            </div>
	                        </div>
	                        <div id="div_id_address" class="form-group required">
	                             <label for="id_address" class="control-label col-md-4  requiredField"> Địa chỉ<span class="asteriskField">*</span> </label>
	                             <div class="controls col-md-8 ">
	                                <input class="input-md textinput textInput form-control" id="address" name="address" style="margin-bottom: 10px" type="address" />
	                            </div>
	                        </div>
	                        <div id="div_id_username" class="form-group required">
	                            <label for="id_username" class="control-label col-md-4  requiredField"> Tài khoản<span class="asteriskField">*</span> </label>
	                            <div class="controls col-md-8 ">
	                                <input class="input-md  textinput textInput form-control" id="id_username" maxlength="30" name="username" style="margin-bottom: 10px" type="text" />
	                            </div>
	                        </div> 
	                        <div class="form-group"> 
	                            <div class="aab controls col-md-4 "></div>
	                            <div class="controls col-md-8 ">
	                                <input type="submit" name="Signup" value="Quay lại" class="btn btn-primary btn btn-info" id="submit-id-signup" />
	                                <input type="button" name="delete" value="Xóa" class="btn btn btn-primary" id="button-id-signup" />
	                                <input type="button" name="edit" value="Sửa" class="btn btn btn-danger" id="button-id-signup" />
	                            </div>
	                        </div>                            
	                    </form>
	                </form>
	            </div>
        	</div>
  		</div>
	</div>
</body>
</html>