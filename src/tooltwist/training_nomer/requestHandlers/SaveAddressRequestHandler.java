package tooltwist.training_nomer.requestHandlers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dinaa.DinaaException;
import com.dinaa.data.XData;
import com.dinaa.ui.UiModuleException;
import com.dinaa.ui.UimHelper;
import com.dinaa.xpc.Xpc;
import com.dinaa.xpc.XpcException;

import tooltwist.wbd.WbdRequestHandler;

/**
 * Request handler "saveAddress" - Save Address Request Handler
 * 
 * This handler can be called from a client browser before control is passed to a normal
 * navpoint. To call it, add this parameter to a normal ToolTwist URL:
 * 
 *         op=training_nomer_widgets.address.saveAddress
 * 
 * After this method is called, the requested navpoint will be displayed in the usual
 * manner. To pass control to a different navpoint, use RoutingUIM.gotoNavpoint(), and
 * then return true.
 *
 * @author ?
 */
public class SaveAddressRequestHandler extends WbdRequestHandler
{

	@Override
	public boolean handler(UimHelper uh, String widgetId, String method) throws UiModuleException, ServletException, IOException
	{
		HttpServletRequest request = uh.getRequest();
		
		//Retrieve data from client request
		String personId = request.getParameter("personId");
		String addressId = request.getParameter("addressId");
		String addressType = request.getParameter("addressType");
		String completeAddress = request.getParameter("completeAddress");
		
		try {
			
			boolean hasAddress = hasAddress(uh, addressType, completeAddress, personId);
			
			if (hasAddress) {
				//Address already exist
				uh.reply("false");
			}
			else if((addressId!=null)&&(addressId!="")){
				//Update address data
				Xpc xpc = uh.getXpc();
				xpc.start("phinza.D.personAddress", "update");
				xpc.attrib("addressId", addressId);
				xpc.attrib("addressType", addressType);
				xpc.attrib("completeAddress", completeAddress);
				xpc.run();
				
				uh.reply("true");
			}
			else{
				//Add address data
				Xpc xpc = uh.getXpc();
				xpc.start("phinza.D.personAddress", "insert");
				xpc.attrib("personId", personId);
				xpc.attrib("addressType", addressType);
				xpc.attrib("completeAddress", completeAddress);
				xpc.run();
				
				uh.reply("new");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	private boolean hasAddress(UimHelper uh, String addressType, String completeAddress, String personId){
		try {
			
			//Generate whereClause
			String whereClause="" +
					"<whereClause>" +
						"<expr op='and' returnType='char'>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>addressType</operand>" +
								"<operand type='literal'>" + addressType + "</operand>" +
							"</expr>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>completeAddress</operand>" +
								"<operand type='literal'>" + completeAddress + "</operand>" +
							"</expr>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>personId</operand>" +
								"<operand type='literal'>" + personId + "</operand>" +
							"</expr>" +
						"</expr>" +
					"</whereClause>";
					
			Xpc xpc = uh.getXpc();
			xpc.start("phinza.D.personAddress", "select");
			xpc.input(whereClause);
			XData data = xpc.run();
			
			if (data.getRootType().equals("select")){
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
}
