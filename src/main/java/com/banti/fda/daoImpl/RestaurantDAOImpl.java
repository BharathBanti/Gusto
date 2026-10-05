package com.banti.fda.daoImpl;

import com.banti.fda.dao.RestaurantDAO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Restaurant;
import com.banti.fda.utility.DBConnectionUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public void save(Restaurant restaurant) throws DAOException {
        String sql = "INSERT INTO Restaurant (Name, CuisineType, DeliveryTime, Address, AdminUserID, " +
                "Rating, IsActive, ImagePath) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setInt(3, restaurant.getDeliveryTime());
            ps.setString(4, restaurant.getAddress());
            ps.setInt(5, restaurant.getAdminUserId());
            ps.setBigDecimal(6, restaurant.getRating());
            ps.setBoolean(7, restaurant.getIsActive());
            ps.setString(8, restaurant.getImagePath());

            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    restaurant.setRestaurantId(keys.getInt(1));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error saving Restaurant: " + restaurant, e);
        }
    }

    @Override
    public void update(Restaurant restaurant) throws DAOException {
        String sql = "UPDATE Restaurant SET Name = ?, CuisineType = ?, DeliveryTime = ?, Address = ?, " +
                "AdminUserID = ?, Rating = ?, IsActive = ?, ImagePath = ? WHERE RestaurantID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setInt(3, restaurant.getDeliveryTime());
            ps.setString(4, restaurant.getAddress());
            ps.setInt(5, restaurant.getAdminUserId());
            ps.setBigDecimal(6, restaurant.getRating());
            ps.setBoolean(7, restaurant.getIsActive());
            ps.setString(8, restaurant.getImagePath());
            ps.setInt(9, restaurant.getRestaurantId());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error updating Restaurant with id " + restaurant.getRestaurantId(), e);
        }
    }

    @Override
    public void delete(int restaurantId) throws DAOException {
        String sql = "DELETE FROM Restaurant WHERE RestaurantID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error deleting Restaurant with id " + restaurantId, e);
        }
    }

    @Override
    public Restaurant findById(int restaurantId) throws DAOException {
        String sql = "SELECT * FROM Restaurant WHERE RestaurantID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error finding Restaurant with id " + restaurantId, e);
        }

        return null;
    }

    @Override
    public List<Restaurant> getAllRestaurants() throws DAOException {
        String sql = "SELECT * FROM Restaurant";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                restaurants.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error fetching all Restaurants", e);
        }

        return restaurants;
    }

    @Override
    public List<Restaurant> getPopularRestaurants() throws DAOException {
        String sql = "SELECT * FROM Restaurant WHERE Rating >= 4.5 ORDER BY Rating DESC LIMIT 8";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                restaurants.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error fetching popular Restaurants", e);
        }

        return restaurants;
    }

    @Override
    public List<Restaurant> getRestaurantsBySearch(String name) throws DAOException {
        String sql = "SELECT * FROM Restaurant WHERE lower(Name) LIKE LOWER(?)";

        List<Restaurant> restaurants = new ArrayList<>();

        try(Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, "%" + name + "%");
            try (ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    restaurants.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Error in searching Restaurants", e);
        }

        return restaurants;
    }

    private Restaurant mapRow(ResultSet rs) throws SQLException {
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantId(rs.getInt("RestaurantID"));
        restaurant.setName(rs.getString("Name"));
        restaurant.setCuisineType(rs.getString("CuisineType"));
        restaurant.setDeliveryTime(rs.getInt("DeliveryTime"));
        restaurant.setAddress(rs.getString("Address"));
        restaurant.setAdminUserId(rs.getInt("AdminUserID"));
        BigDecimal rating = rs.getBigDecimal("Rating");
        restaurant.setRating(rating);
        restaurant.setActive(rs.getBoolean("IsActive"));
        restaurant.setImagePath(rs.getString("ImagePath"));

        return restaurant;
    }
}
