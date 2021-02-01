package context;

public abstract class RequestContext {
	public abstract String getCommandPath();
    public abstract String[] getParameter(String key);
    public abstract Object getRequest();
    public abstract void setRequest(Object request);
    public void setSession(String session) {
    	System.out.println("使えません。");
    }
}
