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
<%@page import="tooltwist.training_nomer.productionHelpers.InformationWidgetProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%
	// Get the production helper for this widget
	InformationWidgetProductionHelper h = (InformationWidgetProductionHelper) helper;
	XData data = h.getData(jh);
%>

<!-- ********** INSERT HTML HERE ********** -->
<form id="registrationForm" name="registration" class="box login" action="" method="post" style="width:800px" >

	<input type="hidden" name="backNavpoint" value="%%informationPage%%" />
	<input type="hidden" name="loginOp" value="training_nomer_widgets.login.login" />
	
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

	<h1>Address Details</h1>
	<table border="1" celpadding="3">
		<tr>
			<td>Address Id</td>
			<td>Address Type</td>
			<td>Complete Address</td>
		</tr>
		
		<%
			XNodes nodesAddress = data.getNodes("/select/personAddress");
			for(nodesAddress.first(); nodesAddress.next();){
		%>
				<tr>
					<td><a href="%%informationPage%%?addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("addressId")%></a></td>
					<td><a href="%%informationPage%%?addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("addressType")%></a></td>
					<td><a href="%%informationPage%%?addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("completeAddress")%></a></td>
				</tr>
		<%} %>
	</table>
	
	<h1>Phone Details</h1>
	<table border="1" celpadding="3">
		<tr>
			<td>Phone Id</td>
			<td>Phone Type</td>
			<td>Complete Number</td>
		</tr>
		
		<%
			XNodes nodesPhone = data.getNodes("/select/personPhone");
			for(nodesPhone.first(); nodesPhone.next();){
		%>
				<tr>
					<td><a href="%%informationPage%%?phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("phoneId")%></a></td>
					<td><a href="%%informationPage%%?phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("phoneType")%></a></td>
					<td><a href="%%informationPage%%?phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("completeNumber")%></a></td>
				</tr>
		<%} %>
	</table>

</form>

<!--END-->
</body>
</html>
