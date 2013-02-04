package tooltwist.training_nomer.productionHelpers;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.dinaa.data.XData;
import com.dinaa.data.XNodes;
import com.dinaa.ui.UimData;
import com.dinaa.xpc.Xpc;

import tooltwist.misc.JspHelper;
import tooltwist.wbd.WbdProductionHelper;

public class AddressListProductionHelper extends WbdProductionHelper {

	public AddressListProductionHelper(Properties params) {
		super(params);
		// TODO Auto-generated constructor stub
	}

	@Override
	public XData preFetch(UimData ud) throws Exception {
		// TODO Auto-generated method stub

		HttpServletRequest request = ((JspHelper)ud).getRequest();
		String userName = request.getParameter("userName");
		String filter = request.getParameter("filter");
		
		Xpc xpc1 = ud.getXpc();
		xpc1.start("phinza.D.person", "select");
		xpc1.attrib("userName", userName);
		XData data1 = xpc1.run();
		
		XNodes nodes = data1.getNodes("/select/person");
		nodes.next();
		
		String personId = nodes.getText("personId");
		
		StringBuffer whereClause = new StringBuffer();
		if (filter !=null && !filter.equals("")){
			whereClause.append("<whereClause>");
				whereClause.append("<expr op='and' returnType='char'>");
					whereClause.append("<expr op='eq' returnType='char' >");
						whereClause.append("<operand>personId</operand>");
						whereClause.append("<operand type='literal'>%"+personId+"%</operand>");
					whereClause.append("</expr>");
					whereClause.append("<expr op='or' returnType='char'>");
						whereClause.append("<expr op='like' returnType='char' >");
							whereClause.append("<operand>addressId</operand>");
							whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
						whereClause.append("</expr>");
						whereClause.append("<expr op='like' returnType='char' >");
							whereClause.append("<operand>addressType</operand>");
							whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
						whereClause.append("</expr>");
						whereClause.append("<expr op='like' returnType='char' >");
							whereClause.append("<operand>completeAddress</operand>");
							whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
						whereClause.append("</expr>");
					whereClause.append("</expr>");
				whereClause.append("</expr>");
			whereClause.append("</whereClause>");
		}
		
		Xpc xpc2 = ud.getXpc();
		xpc2.start("phinza.D.personAddress", "select");
		xpc2.input(whereClause.toString());
		XData data2 = xpc2.run();
		
		return data2;
	}

}
