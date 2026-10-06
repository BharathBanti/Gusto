-- =========================================================
-- Food Delivery App - Database Schema
-- MySQL Workbench compatible script
-- =========================================================

-- CREATE DATABASE IF NOT EXISTS food_delivery_app;
-- USE food_delivery_app;

-- =========================================================
-- 1. Users Table
-- =========================================================
CREATE TABLE Users (
                       UserID       INT AUTO_INCREMENT PRIMARY KEY,
                       UserName     VARCHAR(100) NOT NULL,
                       Email        VARCHAR(150) NOT NULL UNIQUE,
                       Role         ENUM('CUSTOMER', 'ADMIN', 'DELIVERY_AGENT', 'SUPER_ADMIN') NOT NULL DEFAULT 'CUSTOMER',
                       Address      TEXT,
                       Phone        VARCHAR(15),
                       Password     VARCHAR(255) NOT NULL
);

-- =========================================================
-- 2. Restaurant Table
-- =========================================================
CREATE TABLE Restaurant (
                            RestaurantID  INT AUTO_INCREMENT PRIMARY KEY,
                            Name          VARCHAR(255) NOT NULL,
                            CuisineType   VARCHAR(100),
                            DeliveryTime  INT,                 -- in minutes
                            Address       TEXT,
                            AdminUserID   INT,
                            Rating        DECIMAL(3,2) DEFAULT 0.00,
                            IsActive      BOOLEAN DEFAULT TRUE,
                            ImagePath	  VARCHAR(255),
                            CONSTRAINT fk_restaurant_admin
                                FOREIGN KEY (AdminUserID) REFERENCES Users(UserID)
                                    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- =========================================================
-- 3. Menu Table
-- =========================================================
CREATE TABLE Menu (
                      MenuID        INT AUTO_INCREMENT PRIMARY KEY,
                      RestaurantID  INT NOT NULL,
                      ItemName      VARCHAR(255) NOT NULL,
                      Description   TEXT,
                      Price         DECIMAL(10,2) NOT NULL,
                      IsAvailable   BOOLEAN DEFAULT TRUE,
                      ImagePath     VARCHAR(255),
                      CONSTRAINT fk_menu_restaurant
                          FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
                              ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================================================
-- 4. OrderTable
-- =========================================================
CREATE TABLE Orders (
                        OrderID        INT AUTO_INCREMENT PRIMARY KEY,
                        UserID         INT NOT NULL,
                        RestaurantID   INT NOT NULL,
                        OrderDate      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        TotalAmount    DECIMAL(10,2) NOT NULL DEFAULT 0.0,
                        Status         ENUM('PENDING', 'CONFIRMED', 'PREPARING', 'OUT_FOR_DELIVERY', 'DELIVERED', 'CANCELLED')
                       NOT NULL DEFAULT 'PENDING',
                        PaymentMethod  ENUM('CASH', 'CARD', 'UPI', 'WALLET') NOT NULL,
                        Address        VARCHAR(255),
                        CONSTRAINT fk_order_user
                            FOREIGN KEY (UserID) REFERENCES Users(UserID)
                                ON DELETE RESTRICT ON UPDATE CASCADE,
                        CONSTRAINT fk_order_restaurant
                            FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
                                ON DELETE RESTRICT ON UPDATE CASCADE
);

-- =========================================================
-- 5. OrderItem Table
-- =========================================================
CREATE TABLE OrderItem (
                           OrderItemID  INT AUTO_INCREMENT PRIMARY KEY,
                           OrderID      INT NOT NULL,
                           MenuID       INT NOT NULL,
                           Quantity     INT NOT NULL DEFAULT 1,
                           ItemTotal    DECIMAL(10,2) NOT NULL DEFAULT 0.0,
                           CONSTRAINT fk_orderitem_order
                               FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
                                   ON DELETE CASCADE ON UPDATE CASCADE,
                           CONSTRAINT fk_orderitem_menu
                               FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
                                   ON DELETE RESTRICT ON UPDATE CASCADE
);