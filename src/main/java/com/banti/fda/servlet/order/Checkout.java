package com.banti.fda.servlet.order;

import com.banti.fda.model.Cart;
import com.banti.fda.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/order/checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        Cart cart = (Cart) session.getAttribute("cart");

        if(loggedInUser == null){
            session.setAttribute("redirectAfterLogin", "/order/checkout");
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }
        if(cart == null){
            resp.sendRedirect(req.getContextPath() + "/cart/view");
            return;
        }
        req.getRequestDispatcher( "/WEB-INF/views/order/checkout.jsp" ).forward(req, resp);
    }
}
