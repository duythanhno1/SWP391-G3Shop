/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;


/**
 *
 * @author Admin
 */
public class ChangePassword extends HttpServlet {

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
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        String email = ((User) session.getAttribute("account")).getEmail();
        String oldpassword = request.getParameter("oldPassword");
        String newpassword = request.getParameter("password");
        String confirmpassword = request.getParameter("rePassword");

        if(oldpassword.equals("") || newpassword.equals("") || confirmpassword.equals("")){
            response.getWriter().println("Please do not enter empty!");
        }
        else if (dao.checkLogin(email, oldpassword)==false) {
            response.getWriter().println("Old password not correct, please re-enter!");
        } else if(!newpassword.equals(confirmpassword)){
            response.getWriter().println("Please enter 2 identical passwords!");
        }else{
            dao.updatePassword(email, newpassword);
            response.getWriter().println("Change password successfully!");
        }

      
        
    }
}
