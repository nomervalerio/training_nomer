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
<%@page import="tooltwist.training_nomer.productionHelpers.PhoneListProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%
	// Get the production helper for this widget
	PhoneListProductionHelper h = (PhoneListProductionHelper) helper;
	XData data = h.getData(jh);
%>

<!-- ********** INSERT HTML HERE ********** -->
<div %%idDefinition%% class="PhoneList">
	<input type="hidden" name="informationNavpoint" value="%%informationPage%%" />

	<table>
		<tr>
			<td><h1>%%titlePage%%</h1></td>
			<td><input type="Submit" class="buttons" value="Add New Number" name="Submit" id="Phone" /></td>
		</tr>
	</table>
	<p>
	<table border="1" celpadding="3">
		<tr>
			<td>Person Id</td>
			<td>Phone Id</td>
			<td>Phone Type</td>
			<td>Complete Number</td>
		</tr>
		
		<%
			XNodes nodesPhone = data.getNodes("/select/personPhone");
			for(nodesPhone.first(); nodesPhone.next();){
		%>
				<tr>
					<td><a href="%%informationPage%%?personId=<%=nodesPhone.getText("personId")%>&phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("personId")%></a></td>
					<td><a href="%%informationPage%%?personId=<%=nodesPhone.getText("personId")%>&phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("phoneId")%></a></td>
					<td><a href="%%informationPage%%?personId=<%=nodesPhone.getText("personId")%>&phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("phoneType")%></a></td>
					<td><a href="%%informationPage%%?personId=<%=nodesPhone.getText("personId")%>&phoneId=<%=nodesPhone.getText("phoneId")%>"><%=nodesPhone.getText("completeNumber")%></a></td>
				</tr>
		<%} %>
	</table>
</div>

<!--END-->
</body>
</html>
