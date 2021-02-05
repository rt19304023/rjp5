package command;

import bean.SearchWorkingHoursBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.FixWorkingHoursDao;

public class FixWorkingHoursCommand extends AbstractCommand {

	public FixWorkingHoursCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		SearchWorkingHoursBean bean = new SearchWorkingHoursBean();

		bean.setEmployeeId(req.getParameter("employeeid")[0]);
		bean.setDate(req.getParameter("month")[0] + "-" + req.getParameter("day")[0]);
		bean.setAttendance(req.getParameter("attendance")[0]);
		bean.setGooutTime(req.getParameter("goout")[0]);
		bean.setReturnTime(req.getParameter("returntime")[0]);
		bean.setLeaveWork(req.getParameter("leave")[0]);


		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		FixWorkingHoursDao dao = (FixWorkingHoursDao)factory.getFixWorkingHoursDao();

		dao.workingHoursFix(bean);

		String message = "時間変更完了";

		req.setInformation("mes", message);

		res.setTarget("/");

		System.out.println("TARGET:" + res.getTarget());


		return res;
	}

}
