package com.banti.fda.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Menu {

    private int menuId;
    private int restaurantId;
    private String itemName;
    private String description;
    private BigDecimal price;
    private boolean isAvailable;
    private String imagePath;

    public Menu() {
    }

    public Menu(int menuId, int restaurantId, String itemName, String description, BigDecimal price,
                boolean isAvailable, String imagePath) {
        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
        this.imagePath = imagePath;
    }

    public int getMenuId() {
        return menuId;
    }
    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }
    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getItemName() {
        return itemName;
    }
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public boolean getIsAvailable() {
        return isAvailable;
    }
    public void setIsAvailable(boolean available) {
        isAvailable = available;
    }

    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menuId=" + menuId +
                ", restaurantId=" + restaurantId +
                ", itemName='" + itemName + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", isAvailable=" + isAvailable +
                ", imagePath='" + imagePath +
                '}';
    }
}
