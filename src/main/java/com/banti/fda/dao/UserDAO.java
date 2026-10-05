package com.banti.fda.dao;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.User;

import java.util.List;

public interface UserDAO {

    void save(User user) throws DAOException;

    void update(User user) throws DAOException;

    void delete(int userId) throws DAOException;

    User findById(int userId) throws DAOException;

    User findByEmail(String email) throws DAOException;

    User login(String email, String password) throws DAOException;

    List<User> findAll() throws DAOException;
}
