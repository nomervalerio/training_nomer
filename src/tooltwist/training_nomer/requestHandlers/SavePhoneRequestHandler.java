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
 * Request handler "savePhone" - Save Phone Request Handler
 * 
 * This handler can be called from a client browser before control is passed to a normal
 * navpoint. To call it, add this parameter to a normal ToolTwist URL:
 * 
 *         op=training_nomer_widgets.phone.savePhone
 * 
 * After this method is called, the requested navpoint will be displayed in the usual
 * manner. To pass control to a different navpoint, use RoutingUIM.gotoNavpoint(), and
 * then return true.
 *
 * @author ?
 */
public class SavePhoneRequestHandler extends WbdRequestHandler
{

	@Override
	public boolean handler(UimHelper uh, String widgetId, String method) throws UiModuleException, ServletException, IOException
	{
		HttpServletRequest request = uh.getRequest();
		
		//Retrieve data from client request
		String personId = request.getParameter("personId");
		String phoneId = request.getParameter("phoneId");
		String phoneType = request.getParameter("phoneType");
		String completeNumber = request.getParameter("completeNumber");
		
		try {
			
			boolean hasNumber = hasNumber(uh, completeNumber, personId);
			
			if (hasNumber) {
				//Number already exist
				uh.reply("false");
			}
			else if((phoneId!=null)&&(phoneId!="")){
				//Update phone data
				Xpc xpc = uh.getXpc();
				xpc.start("phinza.D.personPhone", "update");
				xpc.attrib("phoneId", phoneId);
				xpc.attrib("phoneType", phoneType);
				xpc.attrib("completeNumber", completeNumber);
				xpc.run();
				
				uh.reply("true");
			}
			else{
				//Add phone data
				Xpc xpc = uh.getXpc();
				xpc.start("phinza.D.personPhone", "insert");
				xpc.attrib("personId", personId);
				xpc.attrib("phoneType", phoneType);
				xpc.attrib("completeNumber", completeNumber);
				xpc.run();
				
				uh.reply("new");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	private boolean hasNumber(UimHelper uh, String completeNumber, String personId){
		try {
			
			//Generate whereClause
			String whereClause="" +
					"<whereClause>" +
						"<expr op='and' returnType='char'>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>completeNumber</operand>" +
								"<operand type='literal'>" + completeNumber + "</operand>" +
							"</expr>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>personId</operand>" +
								"<operand type='literal'>" + personId + "</operand>" +
							"</expr>" +
						"</expr>" +
					"</whereClause>";
					
			Xpc xpc = uh.getXpc();
			xpc.start("phinza.D.personPhone", "select");
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
