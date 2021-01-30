package command;

import context.RequestContext;
import context.ResponseContext;

public abstract class AbstractCommand {

	private RequestContext reqContext;

	public AbstractCommand() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public void init(RequestContext reqContext){
		this.reqContext=reqContext;
	}

	public RequestContext getRequestContext(){
		return reqContext;
	}

	public abstract ResponseContext execute(ResponseContext res);

}
