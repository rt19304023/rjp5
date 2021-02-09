package command;

import bean.SearchWorkingHoursBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.SearchModifyHoursDao;
import jsp.ReadPagePath;

public class SearchModifyHoursCommand extends AbstractCommand {

	public SearchModifyHoursCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		SearchWorkingHoursBean bean = new SearchWorkingHoursBean();

		bean.setEmployeeId(req.getParameter("employeeid")[0]);
		System.out.println("EMPLOYEEID:" + req.getParameter("employeeid")[0]);
		bean.setDate(req.getParameter("year")[0] + "-" + req.getParameter("month")[0] + "-" + req.getParameter("day")[0]);




		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		SearchModifyHoursDao dao = (SearchModifyHoursDao)factory.getSearchModifyHoursDao();

		res.setResult(dao.modifyHoursSearch(bean));

		res.setTarget(ReadPagePath.getPath(req.getCommandPath()));

		req.setInformation("content", "勤務時間");

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
