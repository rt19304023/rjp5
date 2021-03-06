package command;


import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.ChangePasswordDao;
import jsp.ReadPagePath;

public class ChangePasswordCommand extends AbstractCommand {


	public ChangePasswordCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		String id = req.getParameter("id")[0];
		String pass = req.getParameter("pass")[0];


		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		ChangePasswordDao dao = (ChangePasswordDao)factory.getChangePasswordDao();

		dao.passChange(id,pass);

		res.setTarget(ReadPagePath.getPath(req.getCommandPath()));
		req.setInformation("contents", "パスワード変更完了");

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
