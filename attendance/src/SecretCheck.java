

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println("Filter");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;

		HttpSession session = (HttpSession)req.getSession();
		req.setCharacterEncoding("UTF-8");

		System.out.println(session.getAttribute("scode"));

		System.out.println("secret-r");

		if(session.getAttribute("scode").equals("0")) {
			System.out.println("FilterIf:true");

			RequestDispatcher disp = req.getRequestDispatcher("/secret-r");

			disp.forward(req, res);

		}else {
			// pass the request along the filter chain
			System.out.println("FilterIf:else");
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
