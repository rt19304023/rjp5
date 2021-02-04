package command;

import bean.SearchDepartmentWorkingHoursBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.SearchDepartmentWorkingHoursDao;

public class SearchDepartmentWorkingHoursCommand extends AbstractCommand {

	public SearchDepartmentWorkingHoursCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		SearchDepartmentWorkingHoursBean bean = new SearchDepartmentWorkingHoursBean();

		bean.setDepartmentCode(req.getParameter("departmentcode")[0]);
		bean.setMonth(req.getParameter("month")[0]);

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		SearchDepartmentWorkingHoursDao dao = (SearchDepartmentWorkingHoursDao)factory.getSearchDepartmentWorkingHoursDao();

		res.setResult(dao.workingHoursSerch(bean));

		res.setTarget("/");

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
