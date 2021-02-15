package command;

import bean.SearchWorkingHoursBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.oracle.OraSearchWorkingHoursDao;
import jsp.ReadPagePath;

public class SearchWorkingHoursCommand extends AbstractCommand {

	public SearchWorkingHoursCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		SearchWorkingHoursBean bean = new SearchWorkingHoursBean();

		bean.setEmployeeId(req.getParameter("employeeid")[0]);
		System.out.println("EMPLOYEEID:" + req.getParameter("employeeid")[0]);
		bean.setMonth(req.getParameter("month")[0]);
		System.out.println("MONTH:" + req.getParameter("month")[0]);
		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		OraSearchWorkingHoursDao dao  = (OraSearchWorkingHoursDao)factory.getSearchWorkingHoursDao();

		res.setResult(dao.workingHoursSearch(bean));

		res.setTarget(ReadPagePath.getPath(req.getCommandPath()));

		req.setInformation("content", "勤務時間");

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
