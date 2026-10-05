package com.banti.fda.dao;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.OrderItem;

import java.util.List;

public interface OrderItemDAO {

    void save(OrderItem orderItem) throws DAOException;

    void update(OrderItem orderItem) throws DAOException;

    void delete(int orderItemId) throws DAOException;

    OrderItem findById(int orderItemId) throws DAOException;

    List<OrderItem> getOrderItemsByOrderId(int orderId) throws DAOException;

    List<OrderItem> getAllOrderItems() throws DAOException;
}
