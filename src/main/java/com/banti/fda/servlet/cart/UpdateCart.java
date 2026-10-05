package com.banti.fda.servlet.cart;

import com.banti.fda.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart/update")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int menuId = Integer.parseInt(req.getParameter("itemId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            if (quantity < 1) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quantity must be at least 1");
                return;
            }

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
            cart.updateItem(quantity, menuId);
            resp.sendRedirect(req.getContextPath() + "/cart/view");
        }
        catch (NumberFormatException e){
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid cart details");
        }
    }

}
