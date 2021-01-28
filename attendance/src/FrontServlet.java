import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import context.RequestContext;
import context.ResponseContext;
import controller.ApplicationController;
import controller.ControllerFactory;


public class FrontServlet extends javax.servlet.http.HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// doPostを呼び出す
		doPost(req, res);

	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");
		ApplicationController app=(ApplicationController) ControllerFactory.getController("web");
		RequestContext reqc = app.getRequest(req);
		ResponseContext resc= app.handleRequest(reqc);

		resc.setResponse(res);
		app.handleResponse(reqc,resc);
	}
}