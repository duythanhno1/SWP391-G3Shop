/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import dao.DashboarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author Admin
 */
public class MarketingDasboard extends HttpServlet {

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
        DashboarDAO dao = new  DashboarDAO();
        int numProduct = dao.getTotalNumberPoduct();
        int numUser= dao.getTotalNumberUser();
        int numFeedback = dao.getTotalNumberFeedback();
        int numOrder = dao.getTotalNumberOrder();
        int profit = dao.getTotalProfit();
        ArrayList<Order> allOrderStatus = dao.getTotalStautusOrder();
        List<OrderDetail> topSelling = dao.getTopSelling();
        ArrayList<Order> OrderList = dao.getLastestOrder();
         ArrayList numberOrderinLast7day = dao.getTotalOrderLast7day();
         ArrayList getTotalProductLast7day = dao.getTotalProductLast7day();
         ArrayList getTotalFeedbackLast7day = dao.getTotalFeedbackLast7day();
         ArrayList getTotalPostLast7day = dao.getTotalPostLast7day();
         request.setAttribute("numProduct", numProduct);
         request.setAttribute("numUser", numUser);
         request.setAttribute("numFeedback",numFeedback );
         request.setAttribute("numOrder", numOrder);
         request.setAttribute("profit", profit);
         request.setAttribute("allOrderStatus", allOrderStatus);
         request.setAttribute("topSelling", topSelling);
         request.setAttribute("OrderList", OrderList);
         request.setAttribute("numberOrderinLast7day", numberOrderinLast7day);
         request.setAttribute("getTotalProductLast7day", getTotalProductLast7day);
         request.setAttribute("getTotalFeedbackLast7day", getTotalFeedbackLast7day);
         request.setAttribute("getTotalPostLast7day", getTotalPostLast7day);
        request.getRequestDispatcher("./marketing/dashboard.jsp").forward(request, response);
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



