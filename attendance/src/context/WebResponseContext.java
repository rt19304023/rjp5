package context;

import javax.servlet.http.HttpServletResponse;

public class WebResponseContext implements ResponseContext {
    private Object result;
    private String tage;
    public WebResponseContext(){}
    private HttpServletResponse _reponse;
    public void setTarget(String transeforInfo){
        tage="/WEB-INF/jsp/"+transeforInfo+".jsp";
    }
    public String getTarget(){
        return tage;
    }
    public void setResult(Object bean){
        result=bean;
    }
    public Object getResponse(){
        return _reponse;
    }
    public Object getResult(){
        return result;
    }
    public void setResponse(Object obj){
        _reponse=(HttpServletResponse)obj;
    }
}
