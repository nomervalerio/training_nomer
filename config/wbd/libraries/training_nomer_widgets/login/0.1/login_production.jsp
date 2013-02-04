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

<form id="loginForm" class="box login" name="login" method="POST" action="" style="width:315px;">

	<input type="hidden" name="RegisterNavpoint" value="%%registerPage%%" />
	<input type="hidden" name="registerOp" value="training_nomer_widgets.login.register" />
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
		</p>
	</fieldset>
	<footer>
		<input type="button" class="buttons" name="Registration" value="Register" id="Registration" />
		<input type="button" class="buttons" name="Submit" value="Login" id="Login" />
	</footer>
</form>

<!--END-->
</body>
</html>
