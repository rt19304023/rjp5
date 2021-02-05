	package command;

import bean.LoginBean;
import connector.ReadDBInformation;
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

		String message = null;
		String target = null;
		String token = "NG";

		LoginBean bean;

		RequestContext req = getRequestContext();

		String employeeId = req.getParameter("employeeid")[0];
		String pass = req.getParameter("pass")[0];

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		LoginDao dao = (LoginDao)factory.getLoginDao();

		bean = dao.loginDataSelect(employeeId);

		if(employeeId.equals(bean.getEmployeeId())){

			if(pass.equals(bean.getPass())) {
				target = ReadPagePath.getPath(bean.getCode());
				token = "OK";
			}else {
				message = "パスワードが違います";
				target = "login";
			}
		}else {
			message = "社員番号が違います";
			target = "login";
		}

		req.setInformation("mes", message);
		req.setToken(token);
		res.setTarget(target);

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
