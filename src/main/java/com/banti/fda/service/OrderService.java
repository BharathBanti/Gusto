package com.banti.fda.service;

import com.banti.fda.dao.OrderDAO;
import com.banti.fda.daoImpl.OrderDAOImpl;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Order;

import java.util.List;

public class OrderService {
    private OrderDAO orderDao = new OrderDAOImpl();

    public void createOrder(Order order) throws DAOException{
        orderDao.save(order);
    }

    public void update(Order order) throws DAOException{
        orderDao.update(order);
    }

    public void delete(int orderId) throws DAOException{
        orderDao.delete(orderId);
    }

    public Order findById(int orderId) throws DAOException{
        return orderDao.findById(orderId);
    }

    public List<Order> getAllOrdersByUserId(int userId) throws DAOException{
        return orderDao.getAllOrdersByUserId(userId);
    }

    public List<Order> getAllOrders() throws DAOException{
        return orderDao.getAllOrders();
    }
}
