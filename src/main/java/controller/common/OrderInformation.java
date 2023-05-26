/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dao.OrderDAO;
import dao.OrderDetailsDAO;
import dao.ProductDAO;
import dao.SettingDAO;
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
public class OrderInformation extends HttpServlet {

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
        try {
            int userId = 1;
            Object o = session.getAttribute("account");
            User user = (User) o;
            userId = user.getUser_id();
            ProductDAO productDao = new ProductDAO();
            SettingDAO settingDao = new SettingDAO();
            OrderDetailsDAO orderInfoDAO = new OrderDetailsDAO();
            OrderDAO orderDAO = new OrderDAO();
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            if (orderDAO.getOrderByOrderID(orderid).getSetting().getValue().equals("Pending") || orderDAO.getOrderByOrderID(orderid).getSetting().getValue().equals("Shipping")) {
                request.setAttribute("canCancel", "canCancel");
            }

            request.setAttribute("orderdetails", orderInfoDAO.getOrderDetailByOrderID(orderid));
            request.setAttribute("order", orderDAO.getOrderByOrderID(orderid));
            request.setAttribute("latesproduct", productDao.getFearturedProduct());
            request.setAttribute("cate", settingDao.getAllProCategory());
            request.setAttribute("brand", settingDao.getAllProBrand());
            request.getRequestDispatcher("orderinformation.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }
    }

}
