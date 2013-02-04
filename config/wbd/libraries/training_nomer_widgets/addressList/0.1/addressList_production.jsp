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
	<input type="hidden" name="addressNavpoint" value="%%addressPage%%" />
	<input type="hidden" name="op" value="training_nomer_widgets.addressList.address" />

	<h1>%%titlePage%%</h1><input type="Submit" class="buttons" value="Add New Address" name="Submit" id="Submit" />
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
</div>

<!--END-->
</body>
</html>
