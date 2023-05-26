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
import java.util.List;
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
public class ProductList extends HttpServlet {


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
        ProductDAO productDao = new ProductDAO();
        SettingDAO settingDao = new SettingDAO();
        //Get parameter and check the value null or not
        String brandId = request.getParameter("brandId") == null ? "" : request.getParameter("brandId");
        String categoryId = request.getParameter("categoryId") == null ? "" : request.getParameter("categoryId");
        String orderBy = request.getParameter("orderby") == null ? "" : request.getParameter("orderby");
        String search = request.getParameter("search") == null ? "" : request.getParameter("search");
        search = search.trim();

        ArrayList<Setting> categoryList = settingDao.getAllProCategory();
        ArrayList<Setting> brandList = settingDao.getAllProBrand();
        ArrayList<Product> fearturedProduct = productDao.getFearturedProduct();

        int totalproduct = productDao.getNumberProduct(brandId, categoryId, search);
//        int totalproduct = productDao.getNumberProduct();
        int numberPage = (int) Math.ceil((double) totalproduct / 9);
        int index;
        String currentPage = request.getParameter("index");
        if (currentPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(currentPage);
        }
        ArrayList<Product> productList = productDao.getAllProductByCondition(brandId, categoryId, orderBy,search, index);

        //Used to paginate products
        request.setAttribute("prolist", productList);
        request.setAttribute("prolist5", fearturedProduct);
        request.setAttribute("cate", categoryList);
        request.setAttribute("brand", brandList);
        request.setAttribute("numberPage", numberPage);
        request.getSession().setAttribute("url", "ProductList?brandId="+brandId+"&categoryId="+categoryId+"&orderby="+orderBy+"&index="+index+"&search="+search);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
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
