/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

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

/**
 *
 * @author Admin
 */
public class ProductManagement extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        ProductDAO productDao = new ProductDAO();
        SettingDAO settingDao = new SettingDAO();
        HttpSession session = request.getSession();
        int userId = 1;
//        Object o = session.getAttribute("account");
//        User user = (User) o;
//        userId = user.getUser_id();
        String action = request.getParameter("action");
        if (action == null) {
            //Get parameter and check the value null or not
            String brandId = request.getParameter("brandId") == null ? "" : request.getParameter("brandId");
            String categoryId = request.getParameter("categoryId") == null ? "" : request.getParameter("categoryId");
            String status = request.getParameter("status") == null ? "" : request.getParameter("status");
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");
            String typeSearch = request.getParameter("type-search");
            search = search.trim();
            String title = "";
            String brief = "";
            if ("0".equals(typeSearch)) {
                title = search;
            }
            if ("1".equals(typeSearch)) {
                brief = search;
            }
            ArrayList<Setting> categoryList = settingDao.getAllProCategory();
            ArrayList<Setting> brandList = settingDao.getAllProBrand();

            int totalproduct = productDao.getNumberProductForMarketing(brandId, categoryId, status, title, brief);
//        int totalproduct = productDao.getNumberProduct();
            int numberPage = (int) Math.ceil((double) totalproduct / 15);
            int index;
            String currentPage = request.getParameter("index");
            if (currentPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(currentPage);
            }
            ArrayList<Product> productList = productDao.getAllProductForMarketing(brandId, categoryId, status, title, brief, index);

            //Used to paginate products
            request.setAttribute("prolist", productList);
            request.setAttribute("cate", categoryList);
            request.setAttribute("brand", brandList);
            request.setAttribute("numberPage", numberPage);
            request.getRequestDispatcher("./marketing/productmanagement.jsp").forward(request, response);
        }
        if ("edit".equals(action)) {
            String index = request.getParameter("index");
            String proid = request.getParameter("proid");
            String protitle = request.getParameter("protitle");
            String categoryId = request.getParameter("categoryId");
            String brandId = request.getParameter("brandId");
            String price = request.getParameter("price");
            String salePrice = request.getParameter("salePrice");
            String stock = request.getParameter("stock");
            String createDate = request.getParameter("createDate");
            String prodstatus = request.getParameter("prodstatus");
            String Description = request.getParameter("Description");
            String proimage = request.getParameter("proimage");
            productDao.updateProduct(protitle, Integer.valueOf(brandId), Double.valueOf(price), Double.valueOf(salePrice),
                    Integer.valueOf(stock), Description, proimage, Integer.valueOf(categoryId), Integer.valueOf(proid), createDate, Integer.valueOf(prodstatus));
            response.sendRedirect("productmanagement?index=" + index);

        }
        if ("switch".equals(action)) {
            String pid = request.getParameter("pid");
            String index = request.getParameter("index");
            String sstatus = request.getParameter("sstatus");
            productDao.switchProduct(Integer.valueOf(pid), Integer.valueOf(sstatus));
            response.sendRedirect("productmanagement?index=" + index);
        }
        if ("delete".equals(action)) {
            String index = request.getParameter("index");

            String pid = request.getParameter("pid");
            productDao.deleteProduct(Integer.valueOf(pid));
            response.sendRedirect("productmanagement?index=" + index);

        }
        if ("add".equals(action)) {
            String index = request.getParameter("index");

            String protitle = request.getParameter("protitle");
            String categoryId = request.getParameter("categoryId");
            String brandId = request.getParameter("brandId");
            String price = request.getParameter("price");
            String salePrice = request.getParameter("salePrice");
            String stock = request.getParameter("stock");
            String prodstatus = request.getParameter("prodstatus");
            String Description = request.getParameter("Description");
            String proimage = request.getParameter("proimage");
            productDao.addNewProduct(protitle, Integer.valueOf(brandId), Double.valueOf(price), Double.valueOf(salePrice),
                    Integer.valueOf(stock), Description, proimage, Integer.valueOf(categoryId), userId, Integer.valueOf(prodstatus));
            response.sendRedirect("productmanagement?index=" + index);

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



