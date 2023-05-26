/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.FeedbackDAO;
import dao.ProductDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class SendFeedback extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
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
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            ProductDAO productDao = new ProductDAO();
            SettingDAO settingDao = new SettingDAO();
            ArrayList<Setting> categoryList = settingDao.getAllProCategory();
            ArrayList<Setting> brandList = settingDao.getAllProBrand();
            ArrayList<Setting> orderStatus = settingDao.getAllOrderStatus();
            ArrayList<Product> fearturedProduct = productDao.getFearturedProduct();
            int userId = 1;
            String pid = request.getParameter("pid");
            Object o = session.getAttribute("account");
            User user = (User) o;

            userId = user.getUser_id();
            Product product = productDao.getProductByID(Integer.valueOf(pid));

            request.setAttribute("prolist5", fearturedProduct);
            request.setAttribute("cate", categoryList);
            request.setAttribute("brand", brandList);
            request.setAttribute("status", orderStatus);
            request.setAttribute("product", product);
            request.getRequestDispatcher("sendFeedback.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }
    }

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
        try {
            FeedbackDAO fdao = new FeedbackDAO();
            HttpSession session = request.getSession();
            String content = request.getParameter("feedbackContent");
            String rate = request.getParameter("rate");
            String img = request.getParameter("img");
            String proid = request.getParameter("pid");
            int userId = 3;
            Object o = session.getAttribute("account");
            User user = (User) o;
            userId = user.getUser_id();
            fdao.insertFeedback(Integer.valueOf(proid), userId, content, rate, img);
            response.sendRedirect("./MyOrder ");
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
