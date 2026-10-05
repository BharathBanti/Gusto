package com.banti.fda.daoImpl;

import com.banti.fda.dao.OrderDAO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Order;
import com.banti.fda.model.OrderStatus;
import com.banti.fda.model.PaymentMethod;
import com.banti.fda.utility.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public void save(Order order) throws DAOException {
        String sql = "INSERT INTO Orders (UserID, RestaurantID, OrderDate, TotalAmount, Status, PaymentMethod, Address) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setTimestamp(3, order.getOrderDate() != null ? Timestamp.valueOf(order.getOrderDate()) : null);
            ps.setBigDecimal(4, order.getTotalAmount());
            ps.setString(5, order.getStatus().name());
            ps.setString(6, order.getPaymentMethod().name());
            ps.setString(7, order.getAddress());

            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    order.setOrderId(keys.getInt(1));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error saving Order: " + order, e);
        }
    }

    @Override
    public void update(Order order) throws DAOException {
        String sql = "UPDATE Orders SET UserID = ?, RestaurantID = ?, OrderDate = ?, TotalAmount = ?, " +
                "Status = ?, PaymentMethod = ?, Address = ? WHERE OrderID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setTimestamp(3, order.getOrderDate() != null ? Timestamp.valueOf(order.getOrderDate()) : null);
            ps.setBigDecimal(4, order.getTotalAmount());
            ps.setString(5, order.getStatus().name());
            ps.setString(6, order.getPaymentMethod().name());
            ps.setString(7, order.getAddress());
            ps.setInt(8, order.getOrderId());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error updating Order with id " + order.getOrderId(), e);
        }
    }

    @Override
    public void delete(int orderId) throws DAOException {
        String sql = "DELETE FROM Orders WHERE OrderID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error deleting Order with id " + orderId, e);
        }
    }

    @Override
    public Order findById(int orderId) throws DAOException {
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error finding Order with id " + orderId, e);
        }

        return null;
    }

    @Override
    public List<Order> getAllOrdersByUserId(int userId) throws DAOException{
        String sql = "SELECT * FROM Orders WHERE UserID = ?";
        List<Order> orders = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ) {

            ps.setInt(1, userId);
            try(ResultSet rs = ps.executeQuery()){
                while (rs.next()) {
                    orders.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error in fetching all Orders for User Id" + userId, e);
        }

        return orders;
    }

    @Override
    public List<Order> getAllOrders() throws DAOException {
        String sql = "SELECT * FROM Orders";
        List<Order> orders = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orders.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error fetching all Orders", e);
        }

        return orders;
    }

    private Order mapRow(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("OrderID"));
        order.setUserId(rs.getInt("UserID"));
        order.setRestaurantId(rs.getInt("RestaurantID"));

        Timestamp orderDate = rs.getTimestamp("OrderDate");
        order.setOrderDate(orderDate != null ? orderDate.toLocalDateTime() : null);

        order.setTotalAmount(rs.getBigDecimal("TotalAmount"));
        order.setStatus(OrderStatus.valueOf(rs.getString("Status")));
        order.setPaymentMethod(PaymentMethod.valueOf(rs.getString("PaymentMethod")));
        order.setAddress(rs.getString("Address"));

        return order;
    }
}
