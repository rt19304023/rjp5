package command;

import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.LoginDao;

public class LoginCommand extends AbstractCommand {

	public LoginCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {

		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		String employeeid = req.getParameter("employeeid")[0];
		String pass = req.getParameter("pass")[0];

		AbstractDaoFactory dao = (AbstractDaoFactory)AbstractDaoFactory.getFactory("oracle");

		LoginDao login = (LoginDao)dao.getLoginDao();

		res.setResult(login.loginDataSelect(employeeid, pass));

		res.setTarget(req.getCommandPath());

		return res;
	}

}
