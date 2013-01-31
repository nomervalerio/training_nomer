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

<form id="loginForm" method="POST" action="" style="width:200px;">
	<fieldset>
		<legend>Login Form</legend>
		<p>
			<div>
				<div class="labels">
					<label>Username</label>
            	</div>
        		<div class="inputboxes">
    				<input type="text" maxlength="20" placeholder="Input Username" autocomplete="off" data-hint="" name="username">
            	</div>
			</div>
			<div>
            	<div class="labels">
              		<label>Password</label>
            	</div>
            	<div class="inputboxes">
            		<input type="password" maxlength="8" placeholder="Input Pasword" autocomplete="off" data-hint="" name="password">
				</div>
			</div>
		</	p>
		<p>
			<div class="buttons">
				<input type="submit" id="registerbutton" value="Register" />
				<input type="submit" id="submitbutton" value="Login" />
			</div>
		</p>
	</fieldset>
</form>

<!--END-->
</body>
</html>
