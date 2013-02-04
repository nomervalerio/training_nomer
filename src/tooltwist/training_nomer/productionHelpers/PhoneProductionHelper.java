package tooltwist.training_nomer.productionHelpers;

import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import com.dinaa.data.XData;
import com.dinaa.data.XNodes;
import com.dinaa.ui.UimData;
import com.dinaa.xpc.Xpc;
import tooltwist.misc.JspHelper;
import tooltwist.wbd.WbdProductionHelper;

public class PhoneProductionHelper extends WbdProductionHelper {

	private String personId, phoneId, phoneType, completeNumber;
	
	
	public PhoneProductionHelper(Properties params) {
		super(params);
		// TODO Auto-generated constructor stub
	}

	@Override
	public XData preFetch(UimData ud) throws Exception {
		// TODO Auto-generated method stub
		
		HttpServletRequest request = ((JspHelper)ud).getRequest();
		String phoneId = request.getParameter("phoneId");
		
		setPersonId(request.getParameter("personId"));
		
		//Select person where with the given Id
		Xpc xpc = ud.getXpc();
		xpc.start("phinza.D.personPhone", "select");
		xpc.attrib("phoneId", phoneId);
		XData data = xpc.run();
		
		XNodes nodes = data.getNodes("/select/personPhone");
		nodes.next();
		
		//Put data on fields
		setPhoneId(nodes.getText("phoneId"));
		setPhoneType(nodes.getText("phoneType"));
		setCompleteNumber(nodes.getText("completeNumber"));
		
		return null;
	}
	
	public String getPersonId(){
		return this.personId;
	}
	
	public void setPersonId(String personId){
		this.personId =personId;
	}
	
	public String getPhoneId(){
		return this.phoneId;
	}
	
	public void setPhoneId(String phoneId){
		this.phoneId =phoneId;
	}

	public String getPhoneType() {
		return phoneType;
	}

	public void setPhoneType(String phoneType) {
		this.phoneType = phoneType;
	}

	public String getCompleteNumber() {
		return completeNumber;
	}

	public void setCompleteNumber(String completeNumber) {
		this.completeNumber = completeNumber;
	}
}
