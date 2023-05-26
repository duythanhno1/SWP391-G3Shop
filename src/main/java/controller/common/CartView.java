/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.ProductDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Product;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class CartView extends HttpServlet {

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
        Map<Integer,CartItem> cart = (Map<Integer,CartItem>) session.getAttribute("cart");
        if(cart == null)
            cart = new LinkedHashMap<>();
        double total = 0;
        for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
            Integer key = entry.getKey();
            CartItem value = entry.getValue();
            total += value.getProduct().getSalePrice()* value.getQuantity();
            
        }
        ArrayList<Setting> categoryList = new SettingDAO().getAllProCategory();
        ArrayList<Setting> brandList = new SettingDAO().getAllProBrand();
        ArrayList<Product> fearturedProduct = new ProductDAO().getFearturedProduct();
        request.setAttribute("prolist5", fearturedProduct);
        request.setAttribute("cate", categoryList);
        request.setAttribute("brand", brandList);
        session.setAttribute("total", total);
        session.setAttribute("count", cart.size());
        session.setAttribute("cart", cart);
        request.getSession().setAttribute("url", "CartView");
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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