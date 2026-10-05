package com.banti.fda.servlet.profile;

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

@WebServlet("/profile")
public class Profile extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session == null){
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if(loggedInUser == null){
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        try {
            User user = userService.findById(loggedInUser.getUserId());
            if (user == null) {
                session.invalidate();
                resp.sendRedirect(req.getContextPath() + "/auth/login");
                return;
            }
            req.setAttribute("user", user);
            req.getRequestDispatcher("/WEB-INF/views/profile/profile.jsp").forward(req, resp);
        }
        catch (DAOException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load profile");
        }
    }
}
