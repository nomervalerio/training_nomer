package tooltwist.training_nomer.requestHandlers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joni.Regex;
import org.tuckey.web.filters.urlrewrite.utils.RegexMatcher;

import antlr.StringUtils;

import com.dinaa.DinaaException;
import com.dinaa.data.XData;
import com.dinaa.ui.UiModuleException;
import com.dinaa.ui.UimHelper;
import com.dinaa.xpc.Xpc;
import com.dinaa.xpc.XpcException;

import sun.misc.Compare;
import tooltwist.wbd.WbdRequestHandler;

/**
 * Request handler "save" - Save Request Handler
 * 
 * This handler can be called from a client browser before control is passed to a normal
 * navpoint. To call it, add this parameter to a normal ToolTwist URL:
 * 
 *         op=training_nomer_widgets.registration.save
 * 
 * After this method is called, the requested navpoint will be displayed in the usual
 * manner. To pass control to a different navpoint, use RoutingUIM.gotoNavpoint(), and
 * then return true.
 *
 * @author ?
 */
public class SaveRequestHandler extends WbdRequestHandler
{

	@Override
	public boolean handler(UimHelper uh, String widgetId, String method) throws UiModuleException, ServletException, IOException
	{
		HttpServletRequest request = uh.getRequest();
		
		//Retrieve data from client request
		String personId = request.getParameter("personId");
		String userName = request.getParameter("userName");
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		
		if (validateEmail(email)==false) {
			uh.reply("invalid");
			return true;
		}
		
		if (!(password1.equals(password2))) {
			uh.reply("mismatch");
			return true;
		}
		
		try {
			
			boolean hasUserName = hasUserName(uh, userName, personId);
			
			if (hasUserName) {
				//Username already exist
				uh.reply("false");
			}
			else {
				//Update person data
				Xpc xpc = uh.getXpc();
				xpc.start("phinza.D.person", "update");
				xpc.attrib("personId", personId);
				xpc.attrib("userName", userName);
				xpc.attrib("firstName", firstName);
				xpc.attrib("middleName", middleName);
				xpc.attrib("lastName", lastName);
				xpc.attrib("email", email);
				xpc.attrib("password1", password1);
				xpc.attrib("password2", password2);
				xpc.run();
				
				uh.reply("true");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	private boolean hasUserName(UimHelper uh, String userName, String personId){
		try {
			
			//Generate whereClause
			String whereClause="" +
					"<whereClause>" +
						"<expr op='and' returnType='char'>" +
							"<expr op='eq' returnType='char'>" +
								"<operand>userName</operand>" +
								"<operand type='literal'>" + userName + "</operand>" +
							"</expr>" +
							"<expr op='ne' returnType='char'>" +
								"<operand>personId</operand>" +
								"<operand type='literal'>" + personId + "</operand>" +
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
	
	private boolean validateEmail(String email){

		if ((email==null)||(email=="")){
			return false;
		}
		
		if (emailCheck(email)==false){
			return false;
		}
		
		return true;
	}
	
	private boolean emailCheck(String str){
		String at = "@";
		String dot = ".";
		Integer lat = str.indexOf(str);
		Integer lstr = str.length();
		Integer ldot = str.indexOf(dot);
		
		if (str.indexOf(at)==-1){
			return false;
		}
		
		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr-1){
			return false;
		}
		
		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr-1){
			return false;
		}
		
		if ((str.indexOf(dot)-1)==str.indexOf(at)){
			return false;
		}

		if (str.indexOf(" ")!=-1){
			return false;
		}
		
		return true;
	}
}
