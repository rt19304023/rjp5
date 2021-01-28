package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.AbstractCommand;
import command.CommandFactory;
import context.ContextFactory;
import context.RequestContext;
import context.ResponseContext;
import exception.ApplicationException;

public class WebApplicationController implements ApplicationController {
    public RequestContext getRequest(Object request){
        RequestContext reqc = (RequestContext)ContextFactory.getContext("webreq");
        reqc.setRequest(request);
        return reqc;
    }
    

    public ResponseContext handleRequest(RequestContext reqc){
        AbstractCommand command = (AbstractCommand) CommandFactory.getCommand(reqc);
        command.init(reqc);
        ResponseContext resc = command.execute((RequestContext)ContextFactory.getContext("webres"));
        return resc;
    }

    public void handleResponse(RequestContext reqc,ResponseContext resc){
        HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
        HttpServletResponse res = (HttpServletResponse)resc.getResponse();
        req.setAttribute("result",resc.getResult());
        RequestDispatcher disp = req.getRequestDispatcher(resc.getTarget());

        try{
            disp.forward(req,res);
        }catch(ServletException e){
            throw new ApplicationException(e);
        }catch(IOException e){
            throw new ApplicationException(e);
        }
    }
}
