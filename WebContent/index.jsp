<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remittance Agent</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/loading.css">
</head>
<body>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">REMITTANCE AGENT</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<c:if test="${sessionScope.user == null }">
		        <button type="button" class="btn btn-success btn-sm navbar-btn" data-toggle="modal" data-target="#signupModal">SIGN UP</button>
		        
		        <button type="button" class="btn btn-default btn-sm navbar-btn" data-toggle="modal" data-target="#loginModal">LOG IN</button>
	      		&nbsp;&nbsp;&nbsp;
	      	</c:if>
	      	<c:if test="${sessionScope.user != null }">
	      		<li><p class="navbar-text">Signed in as <a href="#">${sessionScope.user.name}</a></p></li>
	      		<li><form action="Logout"><button type="submit" class="btn btn-danger btn-sm navbar-btn">LOG OUT</button></form></li>
	      	</c:if>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>

	<div class="container">
		<br/>
		<br/>
		<br/>
		<div class="row">
			<div class="col-md-6">
			<br/>
				<form class="form-horizontal" onsubmit="return false;">
					<h5><strong>Sender</strong></h5>
					<hr>
					<div class="well ">
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Name</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="name" placeholder="Enter Fullname" value="${user.name}" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="address" class="col-sm-3 control-label">Address</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="address" placeholder="Address" value="${user.address}" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="phone" class="col-sm-3 control-label">Phone</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="phone" placeholder="Phone" value="${user.phone}" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="bankName" class="col-sm-3 control-label">Bank Name</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="bankName" placeholder="Bank Name" value="${user.bankName}" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="bankAccount" class="col-sm-3 control-label">Bank Account</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="bankAccount" placeholder="Bank Account" value="${user.bankAccount}" required>
							</div>
						</div>
					</div>
					<h5><strong>Amount</strong></h5>
					<hr>
					<div class="well">
						<div class="form-group">
						    <label for="amount" class="col-sm-3 control-label">Amount</label>
						    <div class="col-sm-3">
						    	<select class="form-control" id="currency">
						    		<option value="USD"><small>USD</small></option>
						    		<option value="IDR"><small>IDR</small></option>	
						    	</select>
						    </div>
						    <div class="col-sm-6">
						    	<input type="text" class="form-control" id="amount" placeholder="Amount" required>
							</div>
						</div>
					</div>
					
					<h5><strong>Receiver</strong></h5>
					<hr>
					<div class="well ">
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Name</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="_name" placeholder="Enter Fullname" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="address" class="col-sm-3 control-label">Address</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="_address" placeholder="Address" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="bankName" class="col-sm-3 control-label">Bank Name</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="_bankName" placeholder="Bank Name" required>
							</div>
						</div>
						<div class="form-group">
						    <label for="bankAccount" class="col-sm-3 control-label">Bank Account</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="_bankAccount" placeholder="Bank Account" required>
							</div>
						</div>
						
					</div>
						<div class="form-group">
							<div class="col-sm-10">
								<button type="button" id="resetBtn" class="btn btn-primary pull-right" >Reset</button>
							</div>
							<div class="col-sm-2">
							<button type="submit" id="confirmBtn" class="btn btn-info pull-right">Confirm</button>
							</div>
						</div>
					<br/>
					<br/>
				</form>
				
			</div>
			<div class="col-md-4 col-md-offset-2">
				<br/>
				<br/>
				<br/>
				<br/>
				<div class="bs-docs-sidebar affix" role="complementary">
					<div class="panel panel-primary">
					  <div class="panel-heading">
					    <h3 class="panel-title">USD to IDR</h3>
					  </div>
					  <div class="panel-body" id="crcBody">
					  	<div class="molod"></div>
						  	<form class="form-horizontal" role="form">
							  <div class="form-group">
							    <label for="rate" class="col-sm-3 control-label">Rate</label>
							    <div class="col-sm-9">
							      <p class="form-control-static" id="rate"></p>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="date" class="col-sm-3 control-label">Date</label>
							    <div class="col-sm-9">
							      <p class="form-control-static" id="date"></p>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="time" class="col-sm-3 control-label">Time</label>
							    <div class="col-sm-9">
							      <p class="form-control-static" id="time"></p>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="ask" class="col-sm-3 control-label">Ask</label>
							    <div class="col-sm-9">
							      <p class="form-control-static" id="ask"></p>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="bid" class="col-sm-3 control-label">Bid</label>
							    <div class="col-sm-9">
							      <p class="form-control-static" id="bid"></p>
							    </div>
							  </div>
							</form>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${sessionScope.user == null }">
	
		<div class="modal bs-example-modal-sm fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			    <div class="modal-content">
			    <form onsubmit="return false;">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-user"></span>&nbsp;Log In</h4>
			      </div>
			      <div class="modal-body" id="loginBody">
			      	<div class="molod"></div>
			        <div class="form-group">
					    <label for="username">Username</label>
					    <input type="text" class="form-control" id="username" placeholder="Enter Username" required>
					</div>
					<div class="form-group">
						<label for="username">Password</label>
						<input type="password" class="form-control" id="password" placeholder="Password" required>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			        <button id="loginBtn" type="submit" class="btn btn-primary">Log In</button>
			      </div>
			    </form>  
			    </div>
		  </div>
		</div>
		
		<div class="modal bs-example-modal-sm fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			    <div class="modal-content">
			    <form onsubmit="return false;">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-edit"></span>&nbsp;Sign Up</h4>
			      </div>
			      <div class="modal-body" id="signupBody">
			      	<div class="molod"></div>
			        <div class="form-group">
					    <label for="username2">Username</label>
					    <input type="text" class="form-control" id="username2" placeholder="Enter Username" required>
					</div>
					<div class="form-group">
						<label for="password2">Password</label>
						<input type="password" class="form-control" id="password2" placeholder="Password" required>
					</div>
					<div class="form-group">
					    <label for="name2">Fullname</label>
					    <input type="text" class="form-control" id="name2" placeholder="Enter Fullname" required>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			        <button id="signupBtn" type="submit" class="btn btn-primary">Sign Up</button>
			      </div>
			    </form>  
			    </div>
		  </div>
		</div>
	
	</c:if>
	
	<div class="modal bs-example-modal-sm fade" id="codeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-ok"></span>&nbsp;Success</h4>
		      </div>
		      <div class="modal-body" id="codeBody">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
	  </div>
	</div>
	
	
	<div class="modal bs-example-modal-lg fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    
		    <form class="form-horizontal" onsubmit="return false;">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-file"></span>&nbsp;Confirmation</h4>
		      </div>
		      <div class="modal-body" id="confirmBody">
		      	<div class="molod"></div>
		      	<div class="row">
			      	<div class="col-md-6">
				      	Sender
				      	<hr>
			        	<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Name</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="s_name"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Address</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="s_address"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Phone</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="s_phone"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Bank Name</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="s_bankName"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Bank Account</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="s_bankAccount"></p>
						    </div>
						</div>
					</div>
					<div class="col-md-6">
						Receiver
						<hr>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Name</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="r_name"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Address</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="r_address"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Bank Name</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="r_bankName"></p>
						    </div>
						</div>
						<div class="form-group">
						    <label for="rate" class="col-sm-6 control-label">Bank Account</label>
						    <div class="col-sm-6">
						      <p class="form-control-static" id="r_bankAccount"></p>
						    </div>
					</div>
					</div>
				</div>
				<hr>
				Amount
				<hr>
				<div class="form-group">
				    <label for="rate" class="col-sm-3 control-label">Amount</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="_amount"></p>
				    </div>
				</div>
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button id="submitBtn" type="submit" class="btn btn-info">Submit</button>
		      </div>
		    </form>  
		    </div>
	  </div>
	</div>
	
	
	<script>
		$("#loginBtn").click(function(){
			var username = $("#username").val().trim();
			var password = $("#password").val();
			if(username == "" || password == "") return;
			$.ajax({
				type:"POST",
				url:"Login",
				data:{"username":username , "password":password},
				beforeSend: function(){
					$("#loginAlert").remove();
					$("#loginBody").addClass("loading");
				},
				success: function(msg){
					$("#loginBody").removeClass("loading");
					if(msg == "True"){
						$("#loginModal").modal('hide');
						location.reload();
					}
					else{
						$("#loginBody").prepend("<div id='loginAlert' class='alert alert-danger alert-dismissible' role='alert'>Invalid username or password</div>");
					}
				}
			});
		});
		
		$("#signupBtn").click(function(){
			var username = $("#username2").val().trim();
			var password = $("#password2").val();
			var name = $("#name2").val().trim();
			if(username == "" || password == "" || name == "") return;
			$.ajax({
				type:"POST",
				url:"Signup",
				data:{"username":username,"password":password,"name":name},
				beforeSend: function(){
					$("#signupAlert").remove();
					$("#signupBody").addClass("loading");
				},
				success: function(msg){
					$("#signupBody").removeClass("loading");
					if(msg == "True"){
						$.ajax({
							type:"POST",
							url:"Login",
							data:{"username":username,"password":password},
							success: function(){
								$("#signupModal").modal('hide');
								location.reload(true);
							}
						});
					}
					else {
						$("#signupBody").prepend("<div id='signupAlert' class='alert alert-danger alert-dismissible' role='alert'>Sorry,that username is already taken</div>");
					}
				},
			});
		});
		
		$('#loginModal').on('hidden.bs.modal', function(){
			$("#username").val("");
			$("#password").val("");
			$("#loginAlert").remove();
		});
		
		$('#signupModal').on('hidden.bs.modal', function(){
			$("#username2").val("");
			$("#password2").val("");
			$("#name2").val("");
			$("#signupAlert").remove();
		});
	</script>
	<script>
		$(function(){
			$.ajax({
				type:"GET",
				url:"http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.xchange where pair = 'USDIDR'&env=store://datatables.org/alltableswithkeys",
				dataType:"text",
				beforeSend: function(){
					$("#crcBody").addClass("loading");
				},
				success: function(xml){
					
					xmlDoc = $.parseXML(xml);
					$xml = $(xmlDoc);
					$rate = $xml.find("Rate");
					$date = $xml.find("Date");
					$time = $xml.find("Time");
					$ask = $xml.find("Ask");
					$bid = $xml.find("Bid");
					$rate.prepend("Rp ");
					$ask.prepend("Rp ");
					$bid.prepend("Rp ");
					
					$("#rate").append($rate.text());
					$("#date").append($date.text());
					$("#time").append($time.text());
					$("#ask").append($ask.text());
					$("#bid").append($bid.text());
					$("#crcBody").removeClass("loading");
				}
			});
		});
	</script>
	<script>
		$("#resetBtn").click(function(){
			$("#name").val("");
			$("#address").val("");
			$("#phone").val("");
			$("#bankName").val("");
			$("#bankAccount").val("");
			
			$("#amount").val("");
			
			$("#_name").val("");
			$("#_address").val("");
			$("#_bankName").val("");
			$("#_bankAccount").val("");
			
		});
		
		$("#confirmBtn").click(function(){
			if( $("#name").val() != "" && $("#address").val() != "" && $("#phone").val() != ""
			 	&& $("#bankName").val() != "" && $("#bankAccount").val() != "" && $("#amount").val() != ""
			  	&& $("#_name").val() != "" && $("#_address").val() != "" && $("#_bankName").val() != ""
			  	&& $("#_bankAccount").val() != "" ){
			  	$("#s_name").append($("#name").val());
			  	$("#s_address").append($("#address").val());
			  	$("#s_phone").append($("#phone").val());
			  	$("#s_bankName").append($("#bankName").val());
			  	$("#s_bankAccount").append($("#bankAccount").val());
			  	$("#_amount").append($("#currency").val() + " " + $("#amount").val());
			  	$("#r_name").append($("#_name").val());
			  	$("#r_address").append($("#_address").val());
			  	$("#r_bankName").append($("#_bankName").val());
			  	$("#r_bankAccount").append($("#_bankAccount").val());
				$("#confirmationModal").modal('show');
			}
		});
		
		
		$("#submitBtn").click(function(){
			var s_name = $("#name").val();
			var s_phone = $("#phone").val();
			var s_address = $("#address").val();
			var s_bankName = $("#bankName").val();
			var s_bankAccount = $("#bankAccount").val();
			var currency = $("#currency").val();
			var amount = $("#amount").val();
			var r_name = $("#_name").val();
			var r_address = $("#_address").val();
			var r_bankName = $("#_bankName").val();
			var r_bankAccount = $("#_bankAccount").val();
			
			<c:if test="${sessionScope.user == null }">
			
			$.ajax({
				type:"POST",
				url:"Submit",
				data:{"s_name":s_name,"s_phone":s_phone,"s_address":s_address,
					"s_bankName":s_bankName,"s_bankAccount":s_bankAccount,
					"currency":currency,"amount":amount,"r_name":r_name,"r_address":r_address,
					"r_bankName":r_bankName,"r_bankAccount":r_bankAccount 
				},
				beforeSend: function(){
					$("#confirmBody").addClass("loading");
				},
				success: function(msg){
					$("#confirmBody").removeClass("loading");
					if(msg != "False"){
						$("#codeBody").prepend("Your transaction code: #"+ msg);
						$("#codeModal").modal('show');
						$("#confirmationModal").modal('hide');
					}
					else{
						
					}
				}
			});
			
			</c:if>
			
			<c:if test="${sessionScope.user != null }">
			
			var username = '${user.username}';
			
			$.ajax({
				type:"POST",
				url:"Submit",
				data:{"s_name":s_name,"s_phone":s_phone,"s_address":s_address,
					"s_bankName":s_bankName,"s_bankAccount":s_bankAccount,
					"currency":currency,"amount":amount,"r_name":r_name,"r_address":r_address,
					"r_bankName":r_bankName,"r_bankAccount":r_bankAccount,"username":username 
				},
				beforeSend: function(){
					$("#confirmBody").addClass("loading");
				},
				success: function(msg){
					$("#confirmBody").removeClass("loading");
					if(msg != "False"){
						$("#codeBody").prepend("Your transaction code: #"+ msg);
						$("#codeModal").modal('show');
						$("#confirmationModal").modal('hide');
					}
					else{
						
					}
				}
			});
			
			</c:if>
		});
		
		$('#codeModal').on('hidden.bs.modal', function(){
			$("#resetBtn").click();
			location.reload(true);
		});
	</script>
	
</body>
</html>