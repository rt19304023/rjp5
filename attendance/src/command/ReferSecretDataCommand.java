package command;

import bean.ReferSecretDataBean;
import connector.ReadDBName;
import context.RequestContext;
import context.ResponseContext;
import dao.AbstractDaoFactory;
import dao.ReferSecretDataDao;
import jsp.ReadPagePath;

public class ReferSecretDataCommand extends AbstractCommand {

	public ReferSecretDataCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		ReferSecretDataBean bean = null;

		String message = null;
		String target = null;

		RequestContext req = getRequestContext();

		String employeeId = req.getParameter("id")[0];
		String birthday = req.getParameter("birthday")[0];
		String secretProblem = req.getParameter("problem")[0];
		String secretAnswer = req.getParameter("answer")[0];

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBName.getDataBaseName());

		ReferSecretDataDao dao = (ReferSecretDataDao)factory.getReferSecretDataDao();

		bean = dao.secretDataSelect(employeeId);


		if(birthday.equals(bean.getBirthday())) {
			if(secretProblem.equals(bean.getSecretProblem()) && secretAnswer.equals(bean.getSecretAnswer())) {

				target = ReadPagePath.getPath(bean.getCode());

			}else {
				message = "秘密の問題または回答が違います";
				target = "/";
			}
		}else {
			message = "誕生日が違います";
			target = "/";
		}

		req.setInformation("mes", message);
		res.setTarget(target);

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
