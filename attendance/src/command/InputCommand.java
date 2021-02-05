package command;

import context.RequestContext;
import context.ResponseContext;
import jsp.ReadPagePath;

public class InputCommand extends AbstractCommand {

	public InputCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		res.setTarget(ReadPagePath.getPath(req.getCommandPath()));

		System.out.println("TARGET:" + res.getTarget());


		return res;
	}

}
