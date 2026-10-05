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

@WebServlet("/profile/update")
public class ProfileUpdate extends HttpServlet {
    private UserService userService;

    @Override public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if(session == null){
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if(loggedInUser == null){
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        String userName = req.getParameter("userName");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");

        if(userName == null || userName.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                address == null || address.trim().isEmpty()){
            resp.sendRedirect(req.getContextPath() + "/profile?error=invalid");
            return;
        }

        userName = userName.trim();
        phone = phone.trim();
        address = address.trim();

        try{
            User updatedUser = userService.findById(loggedInUser.getUserId());
            if(updatedUser == null){
                session.invalidate();
                resp.sendRedirect(req.getContextPath() + "/auth/login");
                return;
            }

            updatedUser.setUserName(userName);
            updatedUser.setPhone(phone);
            updatedUser.setAddress(address);

            userService.update(updatedUser);
            session.setAttribute("loggedInUser", updatedUser);
            resp.sendRedirect(req.getContextPath() + "/profile?success=updated");
        } catch (DAOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to update profile");
        }
    }
}
