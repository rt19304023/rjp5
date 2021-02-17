package command;

import bean.OutputEmployeeInformationBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.RegistEmployeeDao;
import jsp.ReadPagePath;

public class RegistEmployeeCommand extends AbstractCommand {

	public RegistEmployeeCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		OutputEmployeeInformationBean bean = new OutputEmployeeInformationBean();

		bean.setName(req.getParameter("name")[0]);
		bean.setCardNumber(req.getParameter("cardnumber")[0]);
		bean.setDepartmentCode(req.getParameter("departmentcode")[0]);
		bean.setPass(GeneratePassword.generatePassword(15));

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		RegistEmployeeDao dao = (RegistEmployeeDao)factory.getRegistEmployeeDao();


		res.setResult(dao.employeeRegist(bean));
		res.setTarget(ReadPagePath.getPath(req.getCommandPath()));

		req.setInformation("contents", "社員登録完了");

		System.out.println("TARGET:"+res.getTarget());


		return res;
	}

}
