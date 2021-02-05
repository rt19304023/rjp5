package command;

import context.RequestContext;
import context.ResponseContext;

public class LogoutCommand extends AbstractCommand {

	public LogoutCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		String message = null;
		String target = null;
		String token = "NG";

		RequestContext req = getRequestContext();

		req.invalidateSession();

		message = "ログアウトしました。";

		req.setInformation("mes", message);

		res.setTarget("/");

		return res;
	}

}
