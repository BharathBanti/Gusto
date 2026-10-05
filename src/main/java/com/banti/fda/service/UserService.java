package com.banti.fda.service;

import com.banti.fda.dao.UserDAO;
import com.banti.fda.daoImpl.UserDAOImpl;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.User;

import java.util.List;

public class UserService {
    private final UserDAO userDao;

    public UserService(){
        userDao = new UserDAOImpl();
    }

    public void addUser(User user) throws DAOException{
        userDao.save(user);
    }

    public void update(User user) throws DAOException{
        userDao.update(user);
    }

    public void delete(int userId) throws DAOException{
        userDao.delete(userId);
    }

    public User findById(int userId) throws DAOException{
        return userDao.findById(userId);
    }

    public User findByEmail(String email) throws DAOException{
        return userDao.findByEmail(email);
    }

    public User login(String email, String password) throws DAOException{
        return userDao.login(email, password);
    }

    public List<User> findAll() throws DAOException{
        return userDao.findAll();
    }
}
