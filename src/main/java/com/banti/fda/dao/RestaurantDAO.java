package com.banti.fda.dao;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Restaurant;

import java.util.List;

public interface RestaurantDAO {

    void save(Restaurant restaurant) throws DAOException;

    void update(Restaurant restaurant) throws DAOException;

    void delete(int restaurantId) throws DAOException;

    Restaurant findById(int restaurantId) throws DAOException;

    List<Restaurant> getAllRestaurants() throws DAOException;

    List<Restaurant> getPopularRestaurants() throws DAOException;

    List<Restaurant> getRestaurantsBySearch(String name) throws DAOException;
}
