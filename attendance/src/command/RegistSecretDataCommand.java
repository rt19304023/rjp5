package command;

import bean.ReferSecretDataBean;
import connector.ReadDBInformation;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.RegistSecretDataDao;
import jsp.ReadPagePath;

public class RegistSecretDataCommand extends AbstractCommand {


	public RegistSecretDataCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		ReferSecretDataBean bean = new ReferSecretDataBean();

		bean.setId(req.getParameter("id")[0]);
		bean.setBirthday(req.getParameter("year")[0] + "/" + req.getParameter("month")[0] + "/" + req.getParameter("day")[0]);
		bean.setSecretProblem(req.getParameter("problem")[0]);
		bean.setSecretAnswer(req.getParameter("answer")[0]);

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		RegistSecretDataDao dao = (RegistSecretDataDao)factory.getRegistSecretDataDao();

		dao.secretDataRegist(bean);

		res.setTarget(ReadPagePath.getPath(req.getCommandPath()));
		req.setInformation("contents", "シークレット情報登録完了");

		System.out.println("TARGET:"+res.getTarget());


		return res;
	}

}
