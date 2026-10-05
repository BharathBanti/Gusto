package com.banti.fda.servlet.order;

import com.banti.fda.dto.OrderItemDAO;
import com.banti.fda.dto.OrderItemDTO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Order;
import com.banti.fda.model.Restaurant;
import com.banti.fda.model.User;
import com.banti.fda.service.OrderService;
import com.banti.fda.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order/orderdetails")
public class OrderDetails extends HttpServlet {
    private OrderService orderService;
    private OrderItemDAO orderItemDAO;
    private RestaurantService restaurantService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
        orderItemDAO = new OrderItemDAO();
        restaurantService = new RestaurantService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        String orderIdParam = req.getParameter("orderId");
        if (orderIdParam == null || orderIdParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/order/myorders");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdParam);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/order/myorders");
            return;
        }

        if (orderId <= 0) {
            resp.sendRedirect(req.getContextPath() + "/order/myorders");
            return;
        }

        try {
            Order order = orderService.findById(orderId);
            if (order == null) {
                resp.sendRedirect(req.getContextPath() + "/order/myorders");
                return;
            }

            if (order.getUserId() != loggedInUser.getUserId()) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "You are not authorized to view this order");
                return;
            }

            Restaurant restaurant = restaurantService.findById(order.getRestaurantId());
            List<OrderItemDTO> orderItemsList = orderItemDAO.getOrderItemDTOsByOrderId(orderId);
            req.setAttribute("restaurant", restaurant);
            req.setAttribute("order", order);
            req.setAttribute("orderItemsList", orderItemsList);
            req.getRequestDispatcher("/WEB-INF/views/order/order-details.jsp").forward(req, resp);
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error in fetching your order details");
        }
    }
}
