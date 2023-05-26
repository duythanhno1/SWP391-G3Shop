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

/**
 *
 * @author Admin
 */
public class ResetPasswordControl extends HttpServlet {


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        if (!password.equals(repassword)) {
            request.setAttribute("msg", "Please enter 2 identical passwords!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        } else {
            dao.updatePassword(email, password);
            request.setAttribute("msg", "Change password Success. Please login!");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        }

    }

}
