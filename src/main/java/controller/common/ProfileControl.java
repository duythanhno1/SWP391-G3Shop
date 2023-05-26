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
import model.User;

/**
 *
 * @author Admin
 */
public class ProfileControl extends HttpServlet {
    
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
        HttpSession session = request.getSession();
        String email = ((User) session.getAttribute("account")).getEmail();
        String fullnamepf = request.getParameter("fullnamepf");
        int gender = 0;
        if(request.getParameter("malepf").equals("true")){
            gender = 1;
        }else{
            gender = 0;
        }

        String phonepf = request.getParameter("phonepf");
        String addresspf = request.getParameter("addresspf");
        String myAvatar = request.getParameter("myAvatar");

        System.out.println("" + email);
        System.out.println("fullnamepf: " + fullnamepf);
        System.out.println("gender: " + gender);
        System.out.println("phonepf: " + phonepf);
        System.out.println("addresspf: " + addresspf);
        System.out.println("myAvatar: " + myAvatar);
        if (fullnamepf.equals("") || phonepf.equals("") || addresspf.equals("")) {
            response.getWriter().println("Please do not enter empty!");
        } else {
            dao.updateProfile(fullnamepf, gender, phonepf, addresspf, myAvatar, email);
            session.setAttribute("account", dao.getUserByEmail(email));
            response.getWriter().println("Change profile successfully!");
        }

    }
}
