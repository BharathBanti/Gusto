package com.banti.fda.servlet.auth;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.User;
import com.banti.fda.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/auth/login")
public class Login extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if(email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()){
            req.setAttribute("errorMessage", "Email and Password are required.");
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            return;
        }

        email = email.trim();

        try {
            User user = userService.login(email, password);

            if(user == null){
                req.setAttribute("errorMessage", "Invalid Credentials. Try Again.");
                req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", user);

            String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");
            if(redirectAfterLogin != null && !redirectAfterLogin.trim().isEmpty()){
                session.removeAttribute("redirectAfterLogin");
                resp.sendRedirect(req.getContextPath() + redirectAfterLogin);
                return;
            }

            resp.sendRedirect(req.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Something went wrong. Please try again.");
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
        }
    }
}
