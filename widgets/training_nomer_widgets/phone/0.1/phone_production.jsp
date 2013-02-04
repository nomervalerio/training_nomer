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
<%@page import="tooltwist.training_nomer.productionHelpers.PhoneProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>

<% 
	//Get the production helper for this widget
	PhoneProductionHelper h =(PhoneProductionHelper) helper;
	XData data = h.getData(jh);
%>

<form id="phoneForm" name="phone" class="box login" action="" method="post" style="width:470px" ><!-- onSubmit="return ValidateForm()" -->

	<input type="hidden" name="phoneNavpoint" value="%%informationPage%%" />
	<input type="hidden" name="op" value="training_nomer_widgets.phone.phone" />
	<input type="hidden" name="savePhoneOp" id="savePhoneOp" value="training_nomer_widgets.phone.savePhone" />
	
	<fieldset class="boxbody">
    	<p>Please input the details.</p>
    	<table>
    		<tr>
    			<td><label for="personId">Person ID : </label>
    			<td><input type="text" name="name" disabled="disabled" placeholder="Person ID" id="personId" value="<%=h.getPersonId()%>" />
    		</tr>
    		<tr>
    			<td><label for="phoneId">Phone ID : </label>
    			<td><input type="text" name="phoneId" disabled="disabled" placeholder="Phone ID" id="phoneId" value="<%=h.getPhoneId()%>" />
    		</tr>
    		<tr>
    			<td><label for="phoneType">Phone Type : </label>
    			<td> 
    				<select id="phoneType" name="phoneType" selectedIndex="<%=h.getPhoneType()%>">
    					<option value="0">Home</option>
    					<option value="1">Business</option>
    					<option value="2">Personal</option>
    				</select>
    			<!-- <td><input type="text" name="phoneType" placeholder="Input Phone Type" id="phoneType" value="<%=h.getPhoneType()%>" /> -->
    		</tr>
    		<tr>
    			<td><label for="completeNumber">Complete Number : </label>
    			<td><input type="text" name="completeNumber" placeholder="Input Complete Number" id="completeNumber" value="<%=h.getCompleteNumber()%>" />
    		</tr>
    	</table>
    	<footer>
    		<input type="button" class="buttons" value="Save" name="Submit" id="savePhone" />
    		<!-- <input type="Submit" class="buttons" value="Information" name="Submit" id="Info" /> -->
    	</footer>
    </fieldset>
</form>

<!--END-->
</body>
</html>
