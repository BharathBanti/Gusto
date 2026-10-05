package com.banti.fda.service;

import com.banti.fda.dao.OrderItemDAO;
import com.banti.fda.daoImpl.OrderItemDAOImpl;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.OrderItem;

import java.util.List;

public class OrderItemService {
    private OrderItemDAO orderItemDao = new OrderItemDAOImpl();

    public void addOrderItem(OrderItem orderItem) throws DAOException{
        orderItemDao.save(orderItem);
    }

    public void update(OrderItem orderItem) throws DAOException{
        orderItemDao.update(orderItem);
    }

    public void delete(int orderItemId) throws DAOException{
        orderItemDao.delete(orderItemId);
    }

    public OrderItem findById(int orderItemId) throws DAOException{
        return orderItemDao.findById(orderItemId);
    }

    public List<OrderItem> getOrderItemsByOrderId(int orderId) throws DAOException{
        return orderItemDao.getOrderItemsByOrderId(orderId);
    }

    public List<OrderItem> getAllOrderItems() throws DAOException{
        return orderItemDao.getAllOrderItems();
    }
}
