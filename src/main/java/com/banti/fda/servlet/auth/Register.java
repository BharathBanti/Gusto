package com.banti.fda.servlet.auth;

import com.banti.fda.model.Role;
import com.banti.fda.model.User;
import com.banti.fda.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth/register")
public class Register extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if(userName == null || userName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || address == null || address.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()){
            req.setAttribute("errorMessage", "All fields are required.");
            req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
            return;
        }

        email = email.trim().toLowerCase();

        if(!password.equals(confirmPassword)){
            req.setAttribute("errorMessage", "Passwords do not match.");
            req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
            return;
        }

        try{
            User user = userService.findByEmail(email);

            if(user != null){
                req.setAttribute("errorMessage", "Email already registered. Please Sign In");
                req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
                return;
            }

            user = new User();
            user.setUserName(userName);
            user.setEmail(email);
            user.setPhone(phone.trim());
            user.setAddress(address.trim());
            user.setPassword(password);
            user.setRole(Role.CUSTOMER);

            userService.addUser(user);

            req.getSession().setAttribute("loggedInUser", user);

            req.getRequestDispatcher("/auth/login" ).forward(req, resp);

        }
        catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Something went wrong. Please try again.");
            req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp") .forward(req, resp);
        }
    }
}
