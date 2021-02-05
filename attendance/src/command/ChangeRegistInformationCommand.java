package command;

import bean.OutputEmployeeInformationBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.ChangeRegistInformationDao;

public class ChangeRegistInformationCommand extends AbstractCommand {

	public ChangeRegistInformationCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		OutputEmployeeInformationBean bean = new OutputEmployeeInformationBean();

		bean.setEmployeeId(req.getParameter("emlpoyeeid")[0]);
		bean.setName(req.getParameter("name")[0]);
		bean.setCardNumber(req.getParameter("cardnumber")[0]);
		bean.setDepartmentCode(req.getParameter("depertmentcode")[0]);

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		ChangeRegistInformationDao dao = (ChangeRegistInformationDao)factory.getChangeRegistInformationDao();

		dao.registInformationChange(bean);

		String message = "変更完了";

		req.setInformation("mes", message);

		res.setTarget("/");

		System.out.println("TARGET:" + res.getTarget());

		return res;
	}

}
