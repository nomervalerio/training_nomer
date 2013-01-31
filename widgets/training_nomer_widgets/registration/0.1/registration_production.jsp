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
<%@page import="tooltwist.training_nomer.productionHelpers.RegistrationProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>

<% 
	//Get the production helper for this widget
	RegistrationProductionHelper h =(RegistrationProductionHelper) helper;
	XData data = h.getData(jh);
%>
	
<script>
function echeck(str) {
var at="@";
var dot=".";
var lat=str.indexOf(at);
var lstr=str.length;
var ldot=str.indexOf(dot);
if (str.indexOf(at)==-1){
	alert("Invalid E-mail ID");
	return false;
}
if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
alert("Invalid E-mail ID");
return false;
}
if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
alert("Invalid E-mail ID");
return false;
}
if (str.indexOf(at,(lat+1))!=-1){
alert("Invalid E-mail ID");
return false;
}
if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
alert("Invalid E-mail ID");
return false;
}
if (str.indexOf(dot,(lat+2))==-1){
alert("Invalid E-mail ID");
return false;
}

if (str.indexOf(" ")!=-1){
alert("Invalid E-mail ID");
return false;
}
return true;
}
function ValidateForm(){
var emailID=document.registration.email;

if ((emailID.value==null)||(emailID.value=="")){
alert("Please enter your Email.");
emailID.focus();
return false;
}
if (echeck(emailID.value)==false){
emailID.value="";
emailID.focus();
return false;
}
return true;
}
</script>

<form id="registrationForm" name="registration" class="box login" action="" method="post" style="width:470px" ><!-- onSubmit="return ValidateForm()" -->

	<input type="hidden" name="backNavpoint" value="%%listPage%%" />
	<input type="hidden" name="op" value="training_nomer_widgets.registration.back" />
	<input type="hidden" name="saveOp" id="saveOp" value="training_nomer_widgets.registration.save" />
	
	<fieldset class="boxbody">
    	<p>Please input the details.</p>
    	<table>
    		<tr>
    			<td><label for="username">Person ID : </label>
    			<td><input type="text" name="name" placeholder="Person ID" id="personId" value="<%=h.getPersonId()%>" />
    		</tr>
    		<tr>
    			<td><label for="username">Username : </label>
    			<td><input type="text" name="username" placeholder="Input Username" id="userName" value="<%=h.getUserName()%>" />
    		</tr>
    		<tr>
    			<td><label for="lastname">Last Name : </label>
    			<td><input type="text" name="lastname" placeholder="Input Last Name" id="lastName" value="<%=h.getLastName()%>" />
    		</tr>
    		<tr>
    			<td><label for="firstname">First Name : </label>
    			<td><input type="text" name="firstname" placeholder="Input First Name" id="firstName" value="<%=h.getFirstName()%>" />
    		</tr>
    		<tr>
    			<td><label for="middlename">Middle Name : </label>
    			<td><input type="text" name="middlename" placeholder="Input Middle Name" id="middleName" value="<%=h.getMiddleName()%>" />
    		</tr>
    		<tr>
    			<td><label for="email">Email : </label>
    			<td><input type="text" name="email" placeholder="Input Email" id="email" />
    		</tr>
    		<tr>
    			<td><label for="password1">Password : </label>
    			<td><input type="password" maxlength="8" name="password1" placeholder="Input Password" id="password1" />
    		</tr>
    		<tr>
    			<td><label for="password2">Confirm Password : </label>
    			<td><input type="password" maxlength="8" name="password2" placeholder="Re-input Password" id="password2" />
    		</tr>
    	</table>
    	<footer>
    		<input type="button" class="buttons" value="Register" name="Submit" id="Register" />
    		<input type="Submit" class="buttons" value="Back" name="Submit" id="Submit" />
    	</footer>
    </fieldset>
</form>

<!--END-->
</body>
</html>
