

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import context.RequestContext;
import context.ResponseContext;
import controller.ApplicationController;
import controller.ControllerFactory;

/**
 * Servlet Filter implementation class SecretCheck
 */
@WebFilter("/SecretCheck")
public class SecretCheck implements Filter {

    /**
     * Default constructor.
     */
    public SecretCheck() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		req.setCharacterEncoding("UTF-8");
		ApplicationController app=(ApplicationController) ControllerFactory.getController("web");
		RequestContext reqc = app.getRequest(req);
		ResponseContext resc= app.handleRequest(reqc);
		if(reqc.getInformation("secret") == "NO") {
			req.getSession().setAttribute("oldpath", req.getServletPath());
			resc.setResponse(res);
			app.handleResponse(reqc,resc);
		}else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
