package com.banti.fda.servlet.order;

import com.banti.fda.dto.OrdersDAO;
import com.banti.fda.dto.OrdersDTO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order/myorders")
public class MyOrders extends HttpServlet {
    private OrdersDAO ordersDAO;

    @Override
    public void init() throws ServletException {
        ordersDAO = new OrdersDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedInUser = (User) req.getSession().getAttribute("loggedInUser");

        if (loggedInUser == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        try {
            List<OrdersDTO> myOrders = ordersDAO.allOrdersOfUser(loggedInUser.getUserId());
            req.setAttribute("myOrders", myOrders);
            req.getRequestDispatcher("/WEB-INF/views/order/my-orders.jsp").forward(req, resp);
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error in fetching your orders");
        }
    }
}
