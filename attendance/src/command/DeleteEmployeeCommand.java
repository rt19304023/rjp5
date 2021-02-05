package command;

import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.DeleteEmployeeDao;

public class DeleteEmployeeCommand extends AbstractCommand {

	public DeleteEmployeeCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

RequestContext req = getRequestContext();

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		DeleteEmployeeDao dao = (DeleteEmployeeDao)factory.getDeleteEmployeeDao();

		dao.employeeDelete(req.getParameter("employeeid")[0]);

		res.setTarget("/");
		req.setInformation("mes", "削除完了");

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
