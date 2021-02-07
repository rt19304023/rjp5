package command;

import context.RequestContext;
import context.ResponseContext;
import jsp.ReadPagePath;

public class TransferTopCommand extends AbstractCommand {

	public TransferTopCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ResponseContext execute(ResponseContext res) {
		// TODO 自動生成されたメソッド・スタブ

		RequestContext req = getRequestContext();

		res.setTarget(ReadPagePath.getPath(req.getInformation("code")));

		System.out.println("TARGET:" + res.getTarget());

		return res;
	}

}
