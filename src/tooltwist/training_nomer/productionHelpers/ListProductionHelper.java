package tooltwist.training_nomer.productionHelpers;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.dinaa.data.XData;
import com.dinaa.ui.UimData;
import com.dinaa.xpc.Xpc;

import tooltwist.misc.JspHelper;
import tooltwist.wbd.WbdProductionHelper;

public class ListProductionHelper extends WbdProductionHelper {

	public ListProductionHelper(Properties params) {
		super(params);
		// TODO Auto-generated constructor stub
	}

	@Override
	public XData preFetch(UimData ud) throws Exception {
		// TODO Auto-generated method stub

		HttpServletRequest request = ((JspHelper)ud).getRequest();
		String filter = request.getParameter("filter");
		
		StringBuffer whereClause = new StringBuffer();
		if (filter !=null && !filter.equals("")){
			whereClause.append("<whereClause>");
				whereClause.append("<expr op='or' returnType='char'>");
					whereClause.append("<expr op='like' returnType='char' >");
						whereClause.append("<operand>userName</operand>");
						whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
					whereClause.append("</expr>");
					whereClause.append("<expr op='like' returnType='char' >");
						whereClause.append("<operand>firstName</operand>");
						whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
					whereClause.append("</expr>");
					whereClause.append("<expr op='like' returnType='char' >");
						whereClause.append("<operand>middleName</operand>");
						whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
					whereClause.append("</expr>");
					whereClause.append("<expr op='like' returnType='char' >");
						whereClause.append("<operand>lastName</operand>");
						whereClause.append("<operand type='literal'>%"+filter+"%</operand>");
					whereClause.append("</expr>");
				whereClause.append("</expr>");
			whereClause.append("</whereClause>");
		}
		
		Xpc xpc = ud.getXpc();
		xpc.start("phinza.D.person", "select");
		xpc.input(whereClause.toString());
		XData data = xpc.run();
		
		return data;
	}

}
