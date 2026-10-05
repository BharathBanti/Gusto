package com.banti.fda.servlet.guest;

import com.banti.fda.dto.MenuRestaurantDAO;
import com.banti.fda.dto.MenuRestaurantDTO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Restaurant;
import com.banti.fda.service.RestaurantService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/homesearch")
public class HomeSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String query = req.getParameter("query").trim();

        if(query == null || query.isEmpty()){
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        if(type.equals("dish")){
            MenuRestaurantDAO menuRestaurantDao = new MenuRestaurantDAO();
            List<MenuRestaurantDTO> menuItems = null;
            try {
                menuItems = menuRestaurantDao.MenuItemsWithItemType(query);
            } catch (DAOException e) {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
            }
            req.setAttribute("menuItems", menuItems);
            req.setAttribute("dish", query);
            req.getRequestDispatcher("/WEB-INF/views/guest/menuitems.jsp").forward(req, resp);
        }
        else if(type.equals("restaurant")){
            RestaurantService restaurantService = new RestaurantService();
            try {
                List<Restaurant> restaurants = restaurantService.getRestaurantsBySearch(query);
                req.setAttribute("restaurants", restaurants);
                req.getRequestDispatcher("/WEB-INF/views/guest/restaurant-list.jsp").forward(req, resp);
            } catch (DAOException e) {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error in fetching restuarants for " + query);
            }
        }
    }
}
