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
<%@page import="tooltwist.training_nomer.productionHelpers.AddressListProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%
	// Get the production helper for this widget
	AddressListProductionHelper h = (AddressListProductionHelper) helper;
	XData data = h.getData(jh);
%>

<!-- ********** INSERT HTML HERE ********** -->
<div %%idDefinition%% class="AddressList">
	<input type="hidden" name="informationNavpoint" value="%%informationPage%%" />

	<table>
		<tr>
			<td><h1>%%titlePage%%</h1></td>
			<td><input type="Submit" class="buttons" value="Add New Address" name="Submit" id="Address" /></td>
		</tr>
	</table>
	<p>
	<table border="1" celpadding="3">
		<tr>
			<td>Person Id</td>
			<td>Address Id</td>
			<td>Address Type</td>
			<td>Complete Address</td>
		</tr>
		
		<%
			XNodes nodesAddress = data.getNodes("/select/personAddress");
			for(nodesAddress.first(); nodesAddress.next();){
		%>
				<tr>
					<td><a href="%%informationPage%%?personId=<%=nodesAddress.getText("personId")%>&addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("personId")%></a></td>
					<td><a href="%%informationPage%%?personId=<%=nodesAddress.getText("personId")%>&addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("addressId")%></a></td>
					<td><a href="%%informationPage%%?personId=<%=nodesAddress.getText("personId")%>&addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("addressType")%></a></td>
					<td><a href="%%informationPage%%?personId=<%=nodesAddress.getText("personId")%>&addressId=<%=nodesAddress.getText("addressId")%>"><%=nodesAddress.getText("completeAddress")%></a></td>
				</tr>
		<%} %>
	</table>
</div>

<!--END-->
</body>
</html>
