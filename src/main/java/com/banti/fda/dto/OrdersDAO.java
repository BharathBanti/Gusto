package com.banti.fda.dto;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.OrderStatus;
import com.banti.fda.model.PaymentMethod;
import com.banti.fda.utility.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {
    public List<OrdersDTO> allOrdersOfUser(int userId) throws DAOException {
        List<OrdersDTO> orders = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.UserID, o.RestaurantID, o.OrderDate, " +
                "o.TotalAmount, o.Status, o.PaymentMethod, o.Address, r.Name " +
                "AS RestaurantName FROM Orders AS o JOIN Restaurant AS r ON " +
                "o.RestaurantID = r.RestaurantID WHERE o.UserID = ? ORDER BY " +
                "o.OrderDate DESC";

        try(Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, userId);
            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    OrdersDTO ordersDTO = new OrdersDTO();
                    ordersDTO.setOrderId(rs.getInt("OrderID"));
                    ordersDTO.setUserId(rs.getInt("UserID"));
                    ordersDTO.setRestaurantId(rs.getInt("RestaurantID"));
                    ordersDTO.setRestaurantName(rs.getString("RestaurantName"));
                    ordersDTO.setOrderDate( rs.getObject("OrderDate", LocalDateTime.class));
                    ordersDTO.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    ordersDTO.setStatus(OrderStatus.valueOf(rs.getString("Status")));
                    ordersDTO.setPaymentMethod(PaymentMethod.valueOf(rs.getString("PaymentMethod")));
                    ordersDTO.setAddress(rs.getString("Address"));

                    orders.add(ordersDTO);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error in fetching menu items", e);
        }

        return orders;
    }
}
