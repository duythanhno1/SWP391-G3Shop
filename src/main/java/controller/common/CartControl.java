/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.ProductDAO;
import dao.SettingDAO;
import java.io.IOException;
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

/**
 *
 * @author Admin
 */
public class CartControl extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        int productID = Integer.parseInt(request.getParameter("pid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
        }
        if (((String) request.getSession().getAttribute("url")).equals("CartView")) {
             if (cart.containsKey(productID)) 
                cart.get(productID).setQuantity(quantity);            
        } else {
            if (cart.containsKey(productID)) {
                int oldQuan = cart.get(productID).getQuantity();
                cart.get(productID).setQuantity(oldQuan + quantity);
            } else {
                Product p = new ProductDAO().getProductByID(productID);
                cart.put(productID, new CartItem(p, quantity));
            }
        }
        ProductDAO productDao = new ProductDAO();
        SettingDAO settingDao = new SettingDAO();
        //Get parameter and check the value null or not
        

        ArrayList<Setting> categoryList = settingDao.getAllProCategory();
        ArrayList<Setting> brandList = settingDao.getAllProBrand();
        ArrayList<Product> fearturedProduct = productDao.getFearturedProduct();


        //Used to paginate products
        request.setAttribute("prolist5", fearturedProduct);
        request.setAttribute("cate", categoryList);
        request.setAttribute("brand", brandList);
        session.setAttribute("cart", cart);
        response.sendRedirect((String) request.getSession().getAttribute("url"));
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