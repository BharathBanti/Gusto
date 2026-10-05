package com.banti.fda.service;

import com.banti.fda.dao.RestaurantDAO;
import com.banti.fda.daoImpl.RestaurantDAOImpl;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Restaurant;

import java.util.List;

public class RestaurantService {
    RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    public void save(Restaurant restaurant) throws DAOException{
        restaurantDAO.save(restaurant);
    }

    public void update(Restaurant restaurant) throws DAOException{
        restaurantDAO.update(restaurant);
    }

    public void delete(int restaurantId) throws DAOException{
        restaurantDAO.delete(restaurantId);
    }

    public Restaurant findById(int restaurantId) throws DAOException{
        return restaurantDAO.findById(restaurantId);
    }

    public List<Restaurant> getAllRestaurants() throws DAOException{
        return restaurantDAO.getAllRestaurants();
    }

    public List<Restaurant> getPopularRestaurants() throws DAOException{
        return restaurantDAO.getPopularRestaurants();
    }

    public List<Restaurant> getRestaurantsBySearch(String name) throws DAOException{
        return restaurantDAO.getRestaurantsBySearch(name);
    }
}
