/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Verify extends HttpServlet {

/**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO dao = new UserDAO();
            String action = request.getParameter("action");
            String email = request.getParameter("email");
            String key = request.getParameter("key");

            if (action.equals("register")) {
                if (dao.checkEmailAndKey(email, key)) {
                    dao.activeAccount(email);
                    request.setAttribute("msg", "Register Success. Please login!");
                } else {
                    request.setAttribute("msg", "Invalid verification code!");
                }
                request.setAttribute("activeLogin", "style='display: flex;'");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
                if (dao.checkEmailAndKey(email, key)) {
                    request.setAttribute("email", email);
                    request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("404.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
        }
    }

}
