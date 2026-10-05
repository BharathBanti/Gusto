package com.banti.fda.model;

import com.banti.fda.exception.DAOException;
import com.banti.fda.service.RestaurantService;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private int restId;
    private String restName;
    private Map<Integer, CartItem> cartItemMap = new HashMap<>();
    private BigDecimal platformFee = BigDecimal.valueOf(10);

    public Cart(){
    }

    public String getRestName() {
        return restName;
    }
    public void setRestName(String restName) {
        this.restName = restName;
    }

    public int getRestId() {
        return restId;
    }
    public void setRestId(int restId) {
        this.restId = restId;
    }

    public Map<Integer, CartItem> getCartItemMap() {
        return cartItemMap;
    }

    public void addItem(int menuId, CartItem cartItem) {
        this.cartItemMap.put(menuId, cartItem);
    }

    public CartItem getItem(int menuId){
        return cartItemMap.get(menuId);
    }

    public void updateItem(int quantity, int menuId){
        CartItem cartItem = getItem(menuId);
        if(cartItem != null){
            cartItem.setQuantity(quantity);
        }
    }

    public void removeItem(int menuId){
        cartItemMap.remove(menuId);
    }

    public void clearCart(){
        cartItemMap.clear();
    }

//    Calculations
    // subtotal
    public BigDecimal getSubtotal(){
        BigDecimal subtotal = BigDecimal.ZERO;
        for(CartItem cartItem : cartItemMap.values()){
            subtotal = subtotal.add(cartItem.getSubtotal());
        }
        return subtotal;
    }

    // delivery fee
    public BigDecimal getDeliveryFee(){
        if(getSubtotal().compareTo(BigDecimal.valueOf(500)) >= 0){
            return BigDecimal.ZERO;
        }
        return BigDecimal.valueOf(40);
    }

    // GST
    public BigDecimal getGst(){
        return getSubtotal().multiply(BigDecimal.valueOf(0.05));
    }

    // Platform Fee
    public BigDecimal getPlatformFee(){
        return platformFee;
    }

    // GrandTotal
    public BigDecimal getGrandTotal(){
       return getSubtotal().
               add(getDeliveryFee())
               .add(getPlatformFee())
               .add(getGst());
    }

    // Total items
    public int getTotalItems() {
        int totalItems = 0;
        for (CartItem cartItem : cartItemMap.values()) {
            totalItems += cartItem.getQuantity();
        }
        return totalItems;
    }
}
