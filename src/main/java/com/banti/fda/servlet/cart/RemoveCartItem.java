package com.banti.fda.servlet.cart;

import com.banti.fda.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart/remove")
public class RemoveCartItem extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int menuId = Integer.parseInt(req.getParameter("itemId"));

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
        cart.removeItem(menuId);
        if(cart.getCartItemMap().isEmpty()){
            session.removeAttribute("cart");
        }
        resp.sendRedirect(req.getContextPath() + "/cart/view");
    }
}
