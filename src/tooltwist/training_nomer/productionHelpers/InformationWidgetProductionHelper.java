package tooltwist.training_nomer.productionHelpers;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

//import org.apache.commons.httpclient.HttpClient;
//import org.apache.commons.httpclient.HttpStatus;
//import org.apache.commons.httpclient.methods.PostMethod;

import tooltwist.ecommerce.AutomaticUrlParametersMode;
import tooltwist.ecommerce.RoutingUIM;
import tooltwist.misc.JspHelper;
import tooltwist.wbd.WbdProductionHelper;
import tooltwist.wbd.WbdSession;

import com.dinaa.data.XData;
import com.dinaa.data.XNodes;
import com.dinaa.ui.UimData;
import com.dinaa.xpc.Xpc;
import com.dinaa.xpc.XpcSecurity;

public class InformationWidgetProductionHelper extends WbdProductionHelper
{
	private String personId, userName, firstName, middleName, lastName, email;

	public InformationWidgetProductionHelper(Properties params)
	{
		super(params);
	}

	@Override
	public XData preFetch(UimData ud) throws Exception
	{
		HttpServletRequest request = ((JspHelper)ud).getRequest();
		String personId = request.getParameter("personId");
		
		//Select person where with the given Id
		Xpc xpc = ud.getXpc();
		xpc.start("phinza.D.person", "select");
		xpc.attrib("personId", personId);
		XData data = xpc.run();
		
		XNodes nodes = data.getNodes("/select/person");
		nodes.next();
		
		//Put data on fields
		setPersonId(nodes.getText("personId"));
		setUserName(nodes.getText("userName"));
		setFirstName(nodes.getText("firstName"));
		setMiddleName(nodes.getText("middleName"));
		setLastName(nodes.getText("lastName"));
		setEmail(nodes.getText("email"));
		
		return null;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
}
