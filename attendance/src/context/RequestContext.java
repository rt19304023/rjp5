package context;

public abstract class RequestContext {
	public abstract String getCommandPath();
    public abstract String[] getParameter(String key);
    public abstract Object getRequest();
    public abstract void setRequest(Object request);

	public abstract String getOldPath();
	public abstract void invalidateSession();
    public void setInformation(String name,String Information) {
    	System.out.println("使えません。");
    }
    public abstract String getInformation(String key);
}
