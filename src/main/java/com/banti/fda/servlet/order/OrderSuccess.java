package com.banti.fda.servlet.order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/order/success")
public class OrderSuccess extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderIdParam = req.getParameter("orderId");

        if(orderIdParam == null || orderIdParam.trim().isEmpty()){
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        try{
            int orderId = Integer.parseInt(orderIdParam);
            if(orderId <= 0){
                resp.sendRedirect(req.getContextPath() + "/home");
                return;
            }
            req.setAttribute("orderId", orderId);
            req.getRequestDispatcher( "/WEB-INF/views/order/order-success.jsp" ).forward(req, resp);
        }
        catch(NumberFormatException e){
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}
