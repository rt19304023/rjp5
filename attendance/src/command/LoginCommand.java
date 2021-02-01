package command;

import bean.LoginBean;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.LoginDao;
import jsp.ReadPagePath;

public class LoginCommand extends AbstractCommand {

	public LoginCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {

		// TODO 自動生成されたメソッド・スタブ

		LoginBean bean;

		RequestContext req = getRequestContext();

		String employeeId = req.getParameter("employeeid")[0];
		String pass = req.getParameter("pass")[0];

		AbstractDaoFactory dao = (AbstractDaoFactory)AbstractDaoFactory.getFactory("oracle");

		LoginDao login = (LoginDao)dao.getLoginDao();

		bean = login.loginDataSelect(employeeId);

		String emp;
		String pa;
		String code;

		emp = bean.getEmployeeId();
		pa = bean.getPass();
		code = bean.getCode();

		if(employeeId.equals(emp)){

			if(pass.equals(pa)) {
				res.setTarget(ReadPagePath.getPath(code));
				req.setSession("true");
			}
		}else {
			res.setTarget("/");
		}



		return res;
	}

}
