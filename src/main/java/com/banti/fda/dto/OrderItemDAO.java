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

public class OrderItemDAO {
    public List<OrderItemDTO> getOrderItemDTOsByOrderId(int orderId) throws DAOException{
        List<OrderItemDTO> orderItems = new ArrayList<>();
        String sql = "SELECT oi.OrderItemID, oi.OrderID, oi.MenuID, oi.Quantity, oi.ItemTotal, m.ItemName, " +
                "m.Description, m.Price, m.ImagePath FROM OrderItem AS oi JOIN Menu AS m ON " +
                "oi.MenuID = m.MenuID WHERE oi.OrderID = ? ORDER BY oi.OrderItemID";

        try(Connection connection = DBConnectionUtil.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, orderId);
            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    OrderItemDTO orderItemDTO = new OrderItemDTO();

                    orderItemDTO.setOrderItemId(rs.getInt("OrderItemID"));
                    orderItemDTO.setOrderId(rs.getInt("OrderID"));
                    orderItemDTO.setMenuId(rs.getInt("MenuID"));
                    orderItemDTO.setQuantity(rs.getInt("Quantity"));
                    orderItemDTO.setItemTotal(rs.getBigDecimal("ItemTotal"));
                    orderItemDTO.setItemName(rs.getString("ItemName"));
                    orderItemDTO.setDescription(rs.getString("Description"));
                    orderItemDTO.setPrice(rs.getBigDecimal("Price"));
                    orderItemDTO.setImagePath(rs.getString("ImagePath"));

                    orderItems.add(orderItemDTO);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error in fetching menu items", e);
        }

        return orderItems;
    }
}
