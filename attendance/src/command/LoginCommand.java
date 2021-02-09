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
				String code = bean.getCode();
				target = ReadPagePath.getPath(code);
				token = "OK";
				req.setInformation("code", code);
				req.setInformation("token", token);
				req.setInformation("uid", employeeId);
				req.setInformation("name", bean.getName());

			}else {
				message = "パスワードが違います";
				target = ReadPagePath.getPath(req.getCommandPath());
			}
		}else {
			message = "社員番号が違います";
			target = ReadPagePath.getPath(req.getCommandPath());
		}


		req.setInformation("mes", message);

		res.setTarget(target);

		System.out.println("TARGET:"+res.getTarget());
		System.out.println("TOKEN:"+req.getInformation("token"));
		System.out.println("EMP-ID:"+req.getInformation("uid"));

		return res;
	}

}
