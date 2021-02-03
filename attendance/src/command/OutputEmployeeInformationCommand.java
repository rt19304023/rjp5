package command;

import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.OutputEmployeeInformationDao;

public class OutputEmployeeInformationCommand extends AbstractCommand {

	public OutputEmployeeInformationCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		String id = req.getParameter("employee")[0];

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		OutputEmployeeInformationDao dao = (OutputEmployeeInformationDao)factory.getOutputEmployeeInformationDao();

		res.setResult(dao.employeeInFormationSelect(id));

		res.setTarget("");

		req.setInformation("contents", "社員情報");

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
