package command;

import bean.ReferSecretDataBean;
import connector.ReadDBInformation;
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

		String key = null;
		String message = null;
		String target = null;

		RequestContext req = getRequestContext();

		String employeeId = req.getParameter("id")[0];
		String birthday = req.getParameter("year")[0] + "-" +req.getParameter("month")[0] +"-" +req.getParameter("day")[0];
		String secretProblem = req.getParameter("problem")[0];
		String secretAnswer = req.getParameter("answer")[0];
		System.out.println(birthday);

		AbstractDaoFactory factory = (AbstractDaoFactory)AbstractDaoFactory.getFactory(ReadDBInformation.getDataBaseInfo("dbname"));

		ReferSecretDataDao dao = (ReferSecretDataDao)factory.getReferSecretDataDao();

		bean = dao.secretDataSelect(employeeId);

		System.out.println("RESULTBEAN:" + bean);

		if(bean != null) {
			if(birthday.equals(bean.getBirthday())) {
				if(secretProblem.equals(bean.getSecretProblem()) && secretAnswer.equals(bean.getSecretAnswer())) {

					target = "change-pass";
					key = "mes";
					message = "秘密の問題認証完了";

				}else {
					key = "mes";
					message = "秘密の問題または回答が違います";
					target = ReadPagePath.getPath(req.getCommandPath());
				}
			}else {
				System.out.println(bean.getBirthday());
				key = "mes";
				message = "誕生日が違います";
				target = ReadPagePath.getPath(req.getCommandPath());
			}
		}else {
			key = "secret";
			message = "NO";
			target = "question-chack";
		}

		req.setInformation(key, message);
		res.setTarget(target);

		System.out.println("TARGET:"+res.getTarget());

		return res;
	}

}
