package com.banti.fda.servlet.cart;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Cart;
import com.banti.fda.model.CartItem;
import com.banti.fda.model.Menu;
import com.banti.fda.service.MenuService;
import com.banti.fda.service.RestaurantService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cart/add")
public class AddCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuService menuService = new MenuService();

        int menuId = Integer.parseInt(req.getParameter("itemId"));
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try {
            Menu menu = menuService.findById(menuId);

            if (menu == null || !menu.getIsAvailable()) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Menu item is not available");
                return;
            }

            HttpSession session = req.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

            if(cart == null && menu.getIsAvailable()){

                CartItem cartItem = new CartItem();
                cartItem.setMenu(menu);
                cartItem.setQuantity(quantity);

                cart = new Cart();
                RestaurantService restaurantService = new RestaurantService();
                cart.setRestId(restaurantId);
                cart.setRestName(restaurantService.findById(restaurantId).getName());
                cart.addItem(menuId, cartItem);

                session.setAttribute("cart", cart);
            }
            else{
                if(restaurantId == cart.getRestId()){
                    if(cart.getCartItemMap().containsKey(menuId)){
                        CartItem cartItem = cart.getItem(menuId);
                        if(quantity < 1){
                            cart.removeItem(menuId);
                            resp.sendRedirect(req.getContextPath()+"/guest/restaurants/view?id="+restaurantId);
                            return;
                        }
                        cartItem.setQuantity(quantity);
                        cart.addItem(menuId, cartItem);

                        session.setAttribute("cart", cart);
                    }
                    else{
                        CartItem cartItem = new CartItem();
                        cartItem.setMenu(menu);
                        cartItem.setQuantity(quantity);
                        cart.addItem(menuId, cartItem);

                        session.setAttribute("cart", cart);
                    }
                }
                else{
                    req.getRequestDispatcher("/cart/confirm").forward(req, resp);
                    return;
                }
            }

            resp.sendRedirect(req.getContextPath()+"/guest/restaurants/view?id="+restaurantId);

        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }

    }
}
