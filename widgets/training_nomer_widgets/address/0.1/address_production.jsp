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
<%@page import="tooltwist.training_nomer.productionHelpers.AddressProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>

<% 
	//Get the production helper for this widget
	AddressProductionHelper h =(AddressProductionHelper) helper;
	XData data = h.getData(jh);
%>

<form id="addressForm" name="address" class="box login" action="" method="post" style="width:470px" ><!-- onSubmit="return ValidateForm()" -->

	<input type="hidden" name="addressNavpoint" value="%%informationPage%%" />
	<input type="hidden" name="op" value="training_nomer_widgets.address.address" />
	<input type="hidden" name="saveAddressOp" id="saveAddressOp" value="training_nomer_widgets.address.saveAddress" />
	
	<fieldset class="boxbody">
    	<p>Please input the details.</p>
    	<table>
    		<tr>
    			<td><label for="personId">Person ID : </label>
    			<td><input type="text" name="name" disabled="disabled" placeholder="Person ID" id="personId" value="<%=h.getPersonId()%>" />
    		</tr>
    		<tr>
    			<td><label for="addressId">Address ID : </label>
    			<td><input type="text" name="addressId" disabled="disabled" placeholder="Address ID" id="addressId" value="<%=h.getAddressId()%>" />
    		</tr>
    		<tr>
    			<td><label for="addressType">Address Type : </label>
    			<td>
    				<select id="addressType" name="addressType" selectedIndex="<%=h.getAddressType()%>">
    					<option value="0">Present</option>
    					<option value="1">Provincial</option>
    					<option value="2">City</option>
    				</select>
    			<!-- <td><input type="text" name="addressType" placeholder="Input Address Type" id="addressType" value="<%=h.getAddressType()%>" /> -->
    		</tr>
    		<tr>
    			<td><label for="completeAddress">Complete Address : </label>
    			<td><input type="text" name="completeAddress" placeholder="Input Complete Address" id="completeAddress" value="<%=h.getCompleteAddress()%>" />
    		</tr>
    	</table>
    	<footer>
    		<input type="button" class="buttons" value="Save" name="Submit" id="saveAddress" />
    		<!-- <input type="Submit" class="buttons" value="Information" name="Submit" id="Info" /> -->
    	</footer>
    </fieldset>
</form>

<!--END-->
</body>
</html>
