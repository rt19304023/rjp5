package context;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class WebRequestContext extends RequestContext {
    private Map parameters;
    private HttpServletRequest request;
    public WebRequestContext(){}

    public String getCommandPath(){
        String servletPath=request.getServletPath();
        String commandPath=servletPath.substring(1);
        return commandPath;
    }
    public String[] getParameter(String key){
        return (String[])parameters.get(key);
    }
    public Object getRequest(){
        return request;
    }
    public void setRequest(Object req){
        request=(HttpServletRequest)req;
        parameters=request.getParameterMap();
    }

    public void setInformation(String name,String Information){

    	request.getSession().setAttribute(name,Information);

    }

	@Override
	public String getOldPath() {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public void invalidateSession() {
		// TODO 自動生成されたメソッド・スタブ
		request.getSession().invalidate();

	}

	@Override
	public String getInformation(String key) {
		// TODO 自動生成されたメソッド・スタブ
		return (String)request.getSession().getAttribute(key);
	}
}
