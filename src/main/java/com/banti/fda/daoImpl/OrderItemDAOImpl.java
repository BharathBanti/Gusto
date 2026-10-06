package com.banti.fda.daoImpl;

import com.banti.fda.dao.OrderItemDAO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.OrderItem;
import com.banti.fda.utility.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public void save(Connection connection, OrderItem orderItem) throws DAOException {
        String sql = "INSERT INTO OrderItem (OrderID, MenuID, Quantity, ItemTotal) VALUES (?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setBigDecimal(4, orderItem.getItemTotal());

            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    orderItem.setOrderItemId(keys.getInt(1));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error saving OrderItem: " + orderItem, e);
        }
    }

    @Override
    public void update(OrderItem orderItem) throws DAOException {
        String sql = "UPDATE OrderItem SET OrderID = ?, MenuID = ?, Quantity = ?, ItemTotal = ? WHERE OrderItemID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setBigDecimal(4, orderItem.getItemTotal());
            ps.setInt(5, orderItem.getOrderItemId());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error updating OrderItem with id " + orderItem.getOrderItemId(), e);
        }
    }

    @Override
    public void delete(int orderItemId) throws DAOException {
        String sql = "DELETE FROM OrderItem WHERE OrderItemID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderItemId);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error deleting OrderItem with id " + orderItemId, e);
        }
    }

    @Override
    public OrderItem findById(int orderItemId) throws DAOException {
        String sql = "SELECT * FROM OrderItem WHERE OrderItemID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderItemId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error finding OrderItem with id " + orderItemId, e);
        }

        return null;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) throws DAOException {
        String sql = "SELECT * FROM OrderItem WHERE OrderID = ?";
        List<OrderItem> orderItems = new ArrayList<>();
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    orderItems.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Error fetching OrderItems for Order Id " + orderId, e);
        }
        return orderItems;
    }

    @Override
    public List<OrderItem> getAllOrderItems() throws DAOException {
        String sql = "SELECT * FROM OrderItem";
        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orderItems.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error fetching all OrderItems", e);
        }

        return orderItems;
    }

    private OrderItem mapRow(ResultSet rs) throws SQLException {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderItemId(rs.getInt("OrderItemID"));
        orderItem.setOrderId(rs.getInt("OrderID"));
        orderItem.setMenuId(rs.getInt("MenuID"));
        orderItem.setQuantity(rs.getInt("Quantity"));
        orderItem.setItemTotal(rs.getBigDecimal("ItemTotal"));

        return orderItem;
    }
}
