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
public class RegisterControl extends HttpServlet {
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
            PrintWriter out = response.getWriter();
            UserDAO dao = new UserDAO();
            int gender = 0;
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            try {
                String male = request.getParameter("male");
                gender = 1;
            } catch (Exception e) {
            }
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            
            if (dao.checkEmail(email)) {
                out.println("Email already exists!");
            } else if (!password.equals(repassword)) {
                out.println("Please enter 2 equal passwords!");
            } else {
                dao.insertUser(fullname, phone, address, email, password, gender);
                out.println("Check your email and verify!");
            }

        } catch (Exception e) {
        }
    }

}
