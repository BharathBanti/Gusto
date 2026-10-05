package com.banti.fda.dao;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Menu;

import java.util.List;

public interface MenuDAO {

    void save(Menu menu) throws DAOException;

    void update(Menu menu) throws DAOException;

    void delete(int menuId) throws DAOException;

    Menu findById(int menuId) throws DAOException;

    List<Menu> getAllMenus() throws DAOException;

    List<Menu> getPopularMenuItems() throws DAOException;

    List<Menu> getMenusByRestaurantId(int restaurantId) throws DAOException;
}
