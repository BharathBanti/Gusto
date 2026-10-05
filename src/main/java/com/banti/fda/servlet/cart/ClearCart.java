package com.banti.fda.servlet.cart;

import com.banti.fda.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart/clear")
public class ClearCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cart not found");
            return;
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cart not found");
            return;
        }
        cart.clearCart();
        session.removeAttribute("cart");
        resp.sendRedirect(req.getContextPath() + "/cart/view");
    }
}
