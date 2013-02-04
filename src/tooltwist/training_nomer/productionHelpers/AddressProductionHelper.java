package tooltwist.training_nomer.productionHelpers;

import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import com.dinaa.data.XData;
import com.dinaa.data.XNodes;
import com.dinaa.ui.UimData;
import com.dinaa.xpc.Xpc;
import tooltwist.misc.JspHelper;
import tooltwist.wbd.WbdProductionHelper;

public class AddressProductionHelper extends WbdProductionHelper {

	private String personId, addressId, addressType, completeAddress;
	
	
	public AddressProductionHelper(Properties params) {
		super(params);
		// TODO Auto-generated constructor stub
	}

	@Override
	public XData preFetch(UimData ud) throws Exception {
		// TODO Auto-generated method stub
		
		HttpServletRequest request = ((JspHelper)ud).getRequest();
		String addressId = request.getParameter("addressId");
		
		setPersonId(request.getParameter("personId"));
		
		//Select person where with the given Id
		Xpc xpc = ud.getXpc();
		xpc.start("phinza.D.personAddress", "select");
		xpc.attrib("addressId", addressId);
		XData data = xpc.run();
		
		XNodes nodes = data.getNodes("/select/personAddress");
		nodes.next();
		
		//Put data on fields
		setAddressId(nodes.getText("addressId"));
		setAddressType(nodes.getText("addressType"));
		setCompleteAddress(nodes.getText("completeAddress"));
		
		return null;
	}
	
	public String getPersonId(){
		return this.personId;
	}
	
	public void setPersonId(String personId){
		this.personId =personId;
	}
	
	public String getAddressId(){
		return this.addressId;
	}
	
	public void setAddressId(String addressId){
		this.addressId =addressId;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getCompleteAddress() {
		return completeAddress;
	}

	public void setCompleteAddress(String completeAddress) {
		this.completeAddress = completeAddress;
	}
}
