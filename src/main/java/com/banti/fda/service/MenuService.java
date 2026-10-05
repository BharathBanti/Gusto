package com.banti.fda.service;

import com.banti.fda.dao.MenuDAO;
import com.banti.fda.daoImpl.MenuDAOImpl;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Menu;

import java.util.List;

public class MenuService {
    MenuDAO menuDao = new MenuDAOImpl();

    public void save(Menu menu) throws DAOException{
        menuDao.save(menu);
    }

    public void update(Menu menu) throws DAOException{
        menuDao.update(menu);
    }

    public void delete(int menuId) throws DAOException{
        menuDao.delete(menuId);
    }

    public Menu findById(int menuId) throws DAOException{
        return menuDao.findById(menuId);
    }

    public List<Menu> getAllMenus() throws DAOException{
        return menuDao.getAllMenus();
    }

    public List<Menu> getPopularMenuItems() throws DAOException{
        return menuDao.getPopularMenuItems();
    }

    public List<Menu> getMenusByRestaurantId(int restaurantId) throws DAOException{
        return menuDao.getMenusByRestaurantId(restaurantId);
    }
}
