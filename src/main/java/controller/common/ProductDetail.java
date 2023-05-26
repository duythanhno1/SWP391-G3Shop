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
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Feedback;
import model.Product;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class ProductDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (((User) (session.getAttribute("account"))).getRole() == 18) {
                response.sendRedirect("marketingdasboard");
                return;
            }
        } catch (Exception e) {
        }
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();
        SettingDAO settingDao = new SettingDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));
            Product product = productDao.getProductByID(pid);
            ArrayList<Setting> categoryList = settingDao.getAllProCategory();
            ArrayList<Setting> brandList = settingDao.getAllProBrand();
            ArrayList<Product> fearturedProduct = productDao.getFearturedProduct();
            ArrayList<Product> recommend1 = productDao.getRecommendPro(product.getCategory(), 0);
            ArrayList<Product> recommend2 = productDao.getRecommendPro(product.getCategory(), 3);
            ArrayList<Feedback> FeedbackList = feedbackDAO.getFeedbackBypid(pid);
            String numberFb = feedbackDAO.getNumberFeedbackByProId(pid);
            int quantityincart = 0;
            if (session.getAttribute("cart") == null) {
                quantityincart = 0;
            } else {
                Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
                if (cart.containsKey(pid)) {
                    quantityincart = cart.get(pid).getQuantity();
                } else {
                    quantityincart = 0;
                }
            }
            request.setAttribute("product", product);
            request.setAttribute("quantityincart", quantityincart);
            request.setAttribute("prolist5", fearturedProduct);
            request.setAttribute("recommend1", recommend1);
            request.setAttribute("recommend2", recommend2);
            request.setAttribute("cate", categoryList);
            request.setAttribute("brand", brandList);
            request.setAttribute("fblist", FeedbackList);
            request.setAttribute("numberFb", numberFb);
            request.getSession().setAttribute("url", "ProductDetail?pid=" + pid);
            request.getRequestDispatcher("productdetails.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
