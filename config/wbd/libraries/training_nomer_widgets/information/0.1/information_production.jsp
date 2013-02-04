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
<%@page import="com.dinaa.data.XNodes"%>
<%@page import="tooltwist.wbd.WbdProductionHelper"%>
<%@page import="com.dinaa.data.XData"%>
<%@page import="tooltwist.training_nomer.productionHelpers.InformationProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%
	// Get the production helper for this widget
	InformationProductionHelper h = (InformationProductionHelper) helper;
	XData data = h.getData(jh);
%>

<!-- ********** INSERT HTML HERE ********** -->
<form id="informationForm" name="information" class="box login" action="" method="post" style="width:800px" >
	<h1>Information Details</h1>
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
   			<td><input type="text" name="email" placeholder="Input Email" id="email" value="<%=h.getEmail()%>" />
   		</tr>
   	</table>
</form>

<!--END-->
</body>
</html>
