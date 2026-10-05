package com.banti.fda.servlet.cart;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Cart;
import com.banti.fda.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart/confirm")
public class CartConfirm extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        RestaurantService restaurantService = new RestaurantService();

        try {
            String restaurantName = restaurantService.findById(restaurantId).getName();
            req.setAttribute("restaurantName", restaurantName);
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }

        req.getRequestDispatcher("/WEB-INF/views/cart/cart-confirm.jsp").forward(req, resp);
    }
}
