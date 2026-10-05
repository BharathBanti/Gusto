package com.banti.fda.servlet.guest;

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
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/guest/restaurants")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RestaurantService restaurantService = new RestaurantService();

        try {
            List<Restaurant> allRestaurants = restaurantService.getAllRestaurants();
            req.setAttribute("restaurants", allRestaurants);
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/guest/restaurant-list.jsp");
        requestDispatcher.forward(req, resp);

    }
}

