package com.banti.fda.servlet.profile;

import com.banti.fda.exception.DAOException;
import com.banti.fda.model.User;
import com.banti.fda.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile/change-password")
public class ChangePassword extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        req.getRequestDispatcher("/WEB-INF/views/profile/change-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");

        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (currentPassword == null || currentPassword.trim().isEmpty()
                || newPassword == null || newPassword.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {

            resp.sendRedirect(req.getContextPath() + "/profile/change-password?error=empty");
            return;
        }

        try {

            User user = userService.findById(loggedInUser.getUserId());

            if (user == null) {
                session.invalidate();
                resp.sendRedirect(req.getContextPath() + "/auth/login");
                return;
            }

            if (!BCrypt.checkpw(currentPassword, user.getPassword())) {
                resp.sendRedirect(req.getContextPath() + "/profile/change-password?error=current");
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                resp.sendRedirect(req.getContextPath() + "/profile/change-password?error=match");
                return;
            }

            if (newPassword.equals(currentPassword)) {
                resp.sendRedirect(req.getContextPath() + "/profile/change-password?error=same");
                return;
            }

            user.setPassword(newPassword);
            userService.update(user);
            session.setAttribute("loggedInUser", user);
            resp.sendRedirect(req.getContextPath() + "/profile/change-password?success=changed");

        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to change password");
        }
    }
}
