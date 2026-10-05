package com.banti.fda.servlet.guest;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Menu;
import com.banti.fda.model.Restaurant;
import com.banti.fda.service.MenuService;
import com.banti.fda.service.RestaurantService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RestaurantService restaurantService = new RestaurantService();
        MenuService menuService = new MenuService();

        try {
            List<Restaurant> popularRestaurants = restaurantService.getPopularRestaurants();
            List<Menu> popularMenuItems = menuService.getPopularMenuItems();

            req.setAttribute("popularRestaurants", popularRestaurants);
            req.setAttribute("popularMenuItems", popularMenuItems);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/guest/homepage.jsp");
            requestDispatcher.forward(req, resp);

        } catch (DAOException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }
    }
}
