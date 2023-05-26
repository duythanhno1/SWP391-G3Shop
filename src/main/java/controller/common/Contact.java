/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.SettingDAO;
import java.io.IOException;
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
 * @author admin
 */
public class Contact extends HttpServlet {


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
        HttpSession session = request.getSession();
        try {
            if (((User) (session.getAttribute("account"))).getRole() == 18) {
                response.sendRedirect("marketingdasboard");
                return;
            }
        } catch (Exception e) {
        }
        response.setContentType("text/html;charset=UTF-8");
        User account = (User) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("messageError", "Please login before contact");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }
        if (session.getAttribute("cart").toString().equals("{}")) {
            request.setAttribute("messageError", "Your cart is empty, please add your product to cart!");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        session.setAttribute("account", account);
        ArrayList<Setting> categoryList = new SettingDAO().getAllProCategory();
        ArrayList<Setting> brandList = new SettingDAO().getAllProBrand();
        ArrayList<Product> fearturedProduct = new ProductDAO().getFearturedProduct();
        request.setAttribute("prolist5", fearturedProduct);
        request.setAttribute("cate", categoryList);
        request.setAttribute("brand", brandList);
        request.setAttribute("order_id", new OrderDAO().getOrderID());
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

}
