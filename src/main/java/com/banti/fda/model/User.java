package com.banti.fda.model;

import java.time.LocalDateTime;

public class User {

    private int userId;
    private String userName;
    private String email;
    private Role role;
    private String address;
    private String phone;
    private String password;

    public User() {
    }

    public User(int userId, String userName, String email, Role role, String address,
                String phone, String password) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.role = role;
        this.address = address;
        this.phone = phone;
        this.password = password;
    }

    public User(String userName, String email, Role role, String address, String phone,
                String password) {
        this.userName = userName;
        this.email = email;
        this.role = role;
        this.address = address;
        this.phone = phone;
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
