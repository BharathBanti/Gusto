package com.banti.fda.dto;

import com.banti.fda.exception.DAOException;
import com.banti.fda.utility.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuRestaurantDAO {
    public List<MenuRestaurantDTO> MenuItemsWithItemType(String type) throws DAOException{
        List<MenuRestaurantDTO> menuItems = new ArrayList<>();
        String sql = "SELECT m.MenuId, m.ItemName, m.Price, m.ImagePath, r.Name, " +
                "r.DeliveryTime, r.RestaurantId FROM Menu m JOIN Restaurant r " +
                "ON m.RestaurantId = r.RestaurantId WHERE LOWER(m.ItemName) " +
                "LIKE LOWER(?) ORDER BY DeliveryTime";

        try(Connection connection = DBConnectionUtil.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1, "%" + type + "%");
            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    MenuRestaurantDTO item = new MenuRestaurantDTO();
                    item.setMenuId(rs.getInt("MenuId"));
                    item.setItemName(rs.getString("ItemName"));
                    item.setPrice(rs.getBigDecimal("Price"));
                    item.setImagePath(rs.getString("ImagePath"));
                    item.setRestaurantId(rs.getInt("RestaurantId"));
                    item.setRestaurantName(rs.getString("Name"));
                    item.setDeliveryTime(rs.getInt("DeliveryTime"));

                    menuItems.add(item);
                }
            }
        }
        catch (SQLException e){
            throw new DAOException("Error in fetching menu items", e);
        }

        return menuItems;
    }
}
