package tooltwist.training_nomer.requestHandlers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.dinaa.data.XData;
import com.dinaa.ui.UiModuleException;
import com.dinaa.ui.UimHelper;
import com.dinaa.xpc.Xpc;

import tooltwist.wbd.WbdRequestHandler;

/**
 * Request handler "login" - Login Request Handler
 * 
 * This handler can be called from a client browser before control is passed to a normal
 * navpoint. To call it, add this parameter to a normal ToolTwist URL:
 * 
 *         op=training_nomer_widgets.login.login
 * 
 * After this method is called, the requested navpoint will be displayed in the usual
 * manner. To pass control to a different navpoint, use RoutingUIM.gotoNavpoint(), and
 * then return true.
 *
 * @author ?
 */
public class LoginRequestHandler extends WbdRequestHandler
{

	@Override
	public boolean handler(UimHelper uh, String widgetId, String method) throws UiModuleException, ServletException, IOException
	{
		HttpServletRequest request = uh.getRequest();
		
		//Retrieve data from client request
		String userName= request.getParameter("userName");
		String password = request.getParameter("password");
		
		if ((userName==null)||(userName=="")){
			uh.reply("invalid");
			return true;
			}
			
		if ((password==null)||(password=="")){
			uh.reply("invalid");
			return true;
			}
		
		try {
			
			boolean hasProfile = hasProfile(uh, userName, password);
			
			if (hasProfile) {
				//Profile already exist
				uh.reply("true");
			}
			else {
				//Profile doesn't exist
				uh.reply("false");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}

	private boolean hasProfile(UimHelper uh, String userName, String password){
		try {
			
			//Generate whereClause
			String whereClause="" +
					"<whereClause>" +
						"<expr op='and' returnType='char'>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>userName</operand>" +
								"<operand type='literal'>" + userName + "</operand>" +
							"</expr>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>password</operand>" +
								"<operand type='literal'>" + password + "</operand>" +
							"</expr>" +
						"</expr>" +
					"</whereClause>";
					
			Xpc xpc = uh.getXpc();
			xpc.start("phinza.D.person", "select");
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
