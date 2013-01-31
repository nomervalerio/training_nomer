package tooltwist.training_nomer.productionHelpers;

import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import com.dinaa.data.XData;
import com.dinaa.data.XNodes;
import com.dinaa.ui.UimData;
import com.dinaa.xpc.Xpc;
import tooltwist.misc.JspHelper;
import tooltwist.wbd.WbdProductionHelper;

public class RegistrationProductionHelper extends WbdProductionHelper {

	private String personId, userName, firstName, middleName, lastName;
	
	
	public RegistrationProductionHelper(Properties params) {
		super(params);
		// TODO Auto-generated constructor stub
	}

	@Override
	public XData preFetch(UimData ud) throws Exception {
		// TODO Auto-generated method stub
		
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
		
		return null;
	}
	
	public String getPersonId(){
		return this.personId;
	}
	
	public void setPersonId(String personId){
		this.personId =personId;
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
}
