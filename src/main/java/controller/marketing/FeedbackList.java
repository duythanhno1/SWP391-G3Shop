/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import dao.FeedbackDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class FeedbackList extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        FeedbackDAO dao = new FeedbackDAO();

        String action = request.getParameter("action");
        if (action == null) {
            if (request.getParameter("star") == null) {
                int numberFeedback = dao.getNumberFeedbackWithCondition("", "", "", "");
                int numberPage = (int) Math.ceil((double) numberFeedback / 9);
                request.setAttribute("numberPage", numberPage);
                request.setAttribute("feedbackList", dao.getAllFeedbacks());
            } else {
                String search = request.getParameter("search");
                String typeSearch = request.getParameter("type-search");
                String fullname = "";
                String title = "";
                if (typeSearch.equals("0")) {
                    fullname = search;
                } else {
                    title = search;
                }
                int index;
                String currentPage = request.getParameter("index");
                if (currentPage == null) {
                    index = 1;
                } else {
                    index = Integer.parseInt(currentPage);
                }
                int numberFeedback = dao.getNumberFeedbackWithCondition(request.getParameter("star"), request.getParameter("status"),
                        fullname, title);
                int numberPage = (int) Math.ceil((double) numberFeedback / 9);
                request.setAttribute("numberPage", numberPage);
                request.setAttribute("feedbackList", dao.getFeedbackByConditions(request.getParameter("star"), request.getParameter("status"),
                        fullname, title, index));
            }
            request.getRequestDispatcher("./marketing/feedbacklist.jsp").forward(request, response);

        } else {
            if ("edit".equals(action)) {
                dao.updateStatusByFbID(request.getParameter("status"), request.getParameter("fid"));
            }
            if ("switch".equals(action)) {
                dao.updateStatusByFbID(request.getParameter("status"), request.getParameter("fid"));
            }
            response.sendRedirect("FeedbackList");

        }

    }

}
