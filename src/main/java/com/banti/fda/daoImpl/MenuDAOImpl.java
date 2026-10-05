package com.banti.fda.daoImpl;

import com.banti.fda.dao.MenuDAO;
import com.banti.fda.exception.DAOException;
import com.banti.fda.model.Menu;
import com.banti.fda.model.Restaurant;
import com.banti.fda.utility.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public void save(Menu menu) throws DAOException {
        String sql = "INSERT INTO Menu (RestaurantID, ItemName, Description, Price, IsAvailable, " +
                "ImagePath) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setBigDecimal(4, menu.getPrice());
            ps.setBoolean(5, menu.getIsAvailable());
            ps.setString(6, menu.getImagePath());

            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    menu.setMenuId(keys.getInt(1));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error saving Menu: " + menu, e);
        }
    }

    @Override
    public void update(Menu menu) throws DAOException {
        String sql = "UPDATE Menu SET RestaurantID = ?, ItemName = ?, Description = ?, Price = ?, " +
                "IsAvailable = ?, ImagePath = ? WHERE MenuID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setBigDecimal(4, menu.getPrice());
            ps.setBoolean(5, menu.getIsAvailable());
            ps.setString(6, menu.getImagePath());
            ps.setInt(7, menu.getMenuId());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error updating Menu with id " + menu.getMenuId(), e);
        }
    }

    @Override
    public void delete(int menuId) throws DAOException {
        String sql = "DELETE FROM Menu WHERE MenuID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, menuId);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Error deleting Menu with id " + menuId, e);
        }
    }

    @Override
    public Menu findById(int menuId) throws DAOException {
        String sql = "SELECT * FROM Menu WHERE MenuID = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, menuId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error finding Menu with id " + menuId, e);
        }

        return null;
    }

    @Override
    public List<Menu> getAllMenus() throws DAOException {
        String sql = "SELECT * FROM Menu";
        List<Menu> menus = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                menus.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error fetching all Menus", e);
        }

        return menus;
    }

    @Override
    public List<Menu> getPopularMenuItems() throws DAOException {
        String sql = "SELECT m.*, COUNT(*) AS total_orders FROM Menu m JOIN " +
                "OrderItem oi ON m.MenuID= oi.MenuID GROUP BY " +
                "m.MenuID ORDER BY total_orders DESC LIMIT 8";
        List<Menu> popularDishes = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                popularDishes.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new DAOException("Error in fetching popular dishes", e);
        }

        return popularDishes;
    }

    @Override
    public List<Menu> getMenusByRestaurantId(int restaurantId) throws DAOException {
        String sql = "SELECT * FROM Menu WHERE RestaurantID = ?";

        List<Menu> results = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    results.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new DAOException("Error in viewing restaurant with id " + restaurantId, e);
        }

        return results;
    }

    private Menu mapRow(ResultSet rs) throws SQLException {
        Menu menu = new Menu();
        menu.setMenuId(rs.getInt("MenuID"));
        menu.setRestaurantId(rs.getInt("RestaurantID"));
        menu.setItemName(rs.getString("ItemName"));
        menu.setDescription(rs.getString("Description"));
        menu.setPrice(rs.getBigDecimal("Price"));
        menu.setIsAvailable(rs.getBoolean("IsAvailable"));
        menu.setImagePath(rs.getString("ImagePath"));

        return menu;
    }
}
