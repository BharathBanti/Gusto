package com.banti.fda.servlet.order;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.*;
import com.banti.fda.service.OrderItemService;
import com.banti.fda.service.OrderService;
import com.banti.fda.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet("/order/place")
public class PlaceOrder extends HttpServlet {

    private OrderService orderService;
    private OrderItemService orderItemService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
        orderItemService = new OrderItemService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order = new Order();

        HttpSession session = req.getSession();
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getCartItemMap() == null
                || cart.getCartItemMap().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart/view");
            return;
        }

        order.setUserId(loggedInUser.getUserId());
        order.setRestaurantId(cart.getRestId());
        order.setOrderDate(LocalDateTime.now());
        order.setTotalAmount(cart.getGrandTotal());
        order.setStatus(OrderStatus.PENDING);
        order.setPaymentMethod(PaymentMethod.CASH);
        order.setAddress(req.getParameter("address"));

        try {
            orderService.createOrder(order);
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding order");
            return;
        }

        for(CartItem cartItem : cart.getCartItemMap().values()){
            OrderItem orderItem = new OrderItem();

            int menuId = cartItem.getMenu().getMenuId();
            int quantity = cartItem.getQuantity();
            BigDecimal itemTotal = cartItem.getSubtotal();

            orderItem.setOrderId(order.getOrderId());
            orderItem.setMenuId(menuId);
            orderItem.setQuantity(quantity);
            orderItem.setItemTotal(itemTotal);

            try {
                orderItemService.addOrderItem(orderItem);
            } catch (DAOException e) {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error in adding order items");
                return;
            }
        }

        session.removeAttribute("cart");
        resp.sendRedirect( req.getContextPath() + "/order/success?orderId=" + order.getOrderId() );
    }
}
