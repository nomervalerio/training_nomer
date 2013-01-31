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
<%@page import="tooltwist.training_nomer.productionHelpers.ListProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%
	// Get the production helper for this widget
	ListProductionHelper h = (ListProductionHelper) helper;
	XData data = h.getData(jh);
%>

<!-- ********** INSERT HTML HERE ********** -->
<div %%idDefinition%% class="List">
	<center><h1>%%titlePage%%</h1></center>
	<table border="1" celpadding="3">
		<tr>
			<td>Person Id</td>
			<td>User Name</td>
			<td>First Name</td>
			<td>Middle Name</td>
			<td>Last Name</td>
		</tr>
		
		<%
			XNodes nodes = data.getNodes("/select/person");
			for(nodes.first(); nodes.next();){
		%>
				<tr>
					<td><a href="%%registrationPage%%?personId=<%=nodes.getText("personId")%>"><%=nodes.getText("personId")%></a></td>
					<td><a href="%%registrationPage%%?personId=<%=nodes.getText("personId")%>"><%=nodes.getText("userName")%></a></td>
					<td><a href="%%registrationPage%%?personId=<%=nodes.getText("personId")%>"><%=nodes.getText("firstName")%></a></td>
					<td><a href="%%registrationPage%%?personId=<%=nodes.getText("personId")%>"><%=nodes.getText("middleName")%></a></td>
					<td><a href="%%registrationPage%%?personId=<%=nodes.getText("personId")%>"><%=nodes.getText("lastName")%></a></td>
				</tr>
		<%} %>
	</table>
</div>

<!--END-->
</body>
</html>
