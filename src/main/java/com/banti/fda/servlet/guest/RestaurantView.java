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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/guest/restaurants/view")
public class RestaurantView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuService menuService = new MenuService();
        RestaurantService restaurantService = new RestaurantService();

        HttpSession session = req.getSession();

        int restaurantId = Integer.parseInt(req.getParameter("id"));

        try {
            List<Menu> menuList = menuService.getMenusByRestaurantId(restaurantId);
            Restaurant restaurant = restaurantService.findById(restaurantId);

            req.setAttribute("menuItems", menuList);
            req.setAttribute("restaurant", restaurant);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/guest/restaurant-view.jsp");
            requestDispatcher.forward(req, resp);
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }

    }
}
