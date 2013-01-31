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
<%@page import="tooltwist.training_nomer.productionHelpers.RegistrationProductionHelper"%>
--%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>

<form id="registrationForm" action="" method="post" style="width:400px">
	<fieldset>
    	<legend>Registration Form</legend>
    	<p class="alert">Please input the details.</p>
    	<table>
    		<tr>
    			<td class="labels"><label for="username">Username : </label>
    			<td class="inputboxes"><input type="text" name="name" id="username"/>
    		</tr>
    		<tr>
    			<td class="labels"><label for="email">Email : </label>
    			<td class="inputboxes"><input type="text" name="email" id="email" />
    		</tr>
    		<tr>
    			<td class="labels"><label for="password1">Password : </label>
    			<td class="inputboxes"><input type="password" maxlength="8" name="password1" id="password1" />
    		</tr>
    		<tr>
    			<td class="labels"><label for="password2">Confirm Password : </label>
    			<td class="inputboxes"><input type="password" maxlength="8" name="password2" id="password2" />
    		</tr>
    	</table>
    	<p><input type="submit" value="Register" name="btnsubmit" id="btnsubmit" /></p>
    </fieldset>
</form>

<!--END-->
</body>
</html>
