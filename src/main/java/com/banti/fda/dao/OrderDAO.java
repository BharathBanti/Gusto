package com.banti.fda.dao;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Order;

import java.util.List;

public interface OrderDAO {

    void save(Order order) throws DAOException;

    void update(Order order) throws DAOException;

    void delete(int orderId) throws DAOException;

    Order findById(int orderId) throws DAOException;

    List<Order> getAllOrdersByUserId(int userId) throws DAOException;

    List<Order> getAllOrders() throws DAOException;
}
