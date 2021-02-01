package command;

import bean.ReferSecretDataBean;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.ReferSecretDataDao;

public class ReferSecretDataCommand extends AbstractCommand {

	public ReferSecretDataCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		ReferSecretDataBean bean = null;

		RequestContext rec = getRequestContext();

		String employeeid = rec.getParameter("id")[0];
		String birthday = rec.getParameter("birthday")[0];
		String secretproblem = rec.getParameter("problem")[0];
		String secretanswer = rec.getParameter("answer")[0];

		AbstractDaoFactory dao = (AbstractDaoFactory)AbstractDaoFactory.getFactory("oracle");

		ReferSecretDataDao refer = (ReferSecretDataDao)dao.getReferSecretDataDao();

		return res;
	}

}
