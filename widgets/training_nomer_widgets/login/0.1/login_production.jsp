<html>
<head>
<title></title>
</head>
<body>
<%
	WbdProductionHelper helper = null;
	JspHelper jh = null;
	String snippetVar_myProperty;
	String snippetVar_thisNavpoint;
%>
<!--START-->
<%@page import="tooltwist.wbd.WbdProductionHelper"%>
<%@page import="com.dinaa.data.XData"%>
<%--
<%@page import="tooltwist.training_nomer.productionHelpers.LoginProductionHelper"%>
--%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>

<script>
function ValidateForm(){
	var Username=document.login.username
	var Password=document.login.password
	
	if ((Username.value==null)||(Username.value=="")){
	alert("Please enter your Username and Password.")
	username.focus()
	return false
	}
	
	if ((Password.value==null)||(Password.value=="")){
	alert("Please enter your Username and Password.")
	password.focus()
	return false
	}
	
	if ((Username.value=="nomer")&&(Password.value=="nomer1")){
	window.location.href = "/ttsvr/n/ttDemo-15";
	}
	else{
	alert("Username must be 'nomer' and Password must be 'nomer1''.")
	return false
	}
}

function RedirectForm() {
	window.location.href = "/ttsvr/n/ttDemo-13";
}
</script>

<form id="loginForm" class="box login" name="login" method="POST" action="" style="width:315px;">

	<input type="hidden" name="loginOp" id="loginOp" value="training_nomer_widgets.login.login" />

	<fieldset class="boxbody">
		<p>
			<div>
				<div>
					<label>Username</label>
            	</div>
        		<div>
    				<input type="text" maxlength="20" placeholder="Input Username" autocomplete="off" data-hint="" name="username" id="userName" />
            	</div>
			</div>
			<div>
            	<div>
              		<label>Password</label>
            	</div>
            	<div>
            		<input type="password" maxlength="8" placeholder="Input Pasword" autocomplete="off" data-hint="" name="password" id="password" />
				</div>
			</div>
		</	p>
	</fieldset>
	<footer>
		<!-- <input type="Submit" class="buttons" id="registerbutton" name="Register" value="Register" onClick="return RedirectForm()" /> -->
		<input type="button" class="buttons" name="Submit" value="Login" id="Login" /> <!-- onClick="return ValidateForm()" -->
	</footer>
</form>

<!--END-->
</body>
</html>
