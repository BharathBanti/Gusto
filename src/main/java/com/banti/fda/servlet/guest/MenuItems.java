package com.banti.fda.servlet.guest;

import com.banti.fda.dto.MenuRestaurantDAO;
import com.banti.fda.dto.MenuRestaurantDTO;
import com.banti.fda.exception.DAOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/guest/menuitems")
public class MenuItems extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuRestaurantDAO menuRestaurantDao = new MenuRestaurantDAO();
        String dish = req.getParameter("dish");
        dish = dish == null ? "" : dish.trim();

        try {
            List<MenuRestaurantDTO> menuItems = menuRestaurantDao.MenuItemsWithItemType(dish);

            req.setAttribute("menuItems", menuItems);
            req.setAttribute("dish", dish);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/guest/menuitems.jsp");
            requestDispatcher.forward(req, resp);

        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }

    }
}
