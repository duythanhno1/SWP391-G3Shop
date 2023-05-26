/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import dao.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Blog;
import model.User;

/**
 *
 * @author Admin
 */
public class PostList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String search = request.getParameter("search");
        String category = request.getParameter("category") == null || request.getParameter("category").equals("") ? "-1" : request.getParameter("category");
        int author = request.getParameter("author") == null || request.getParameter("author").equals("") ? -1 : Integer.parseInt(request.getParameter("author"));
        int order = request.getParameter("order") == null || request.getParameter("order").equals("") ? 0 : Integer.parseInt(request.getParameter("order"));
        int status = request.getParameter("status") == null || request.getParameter("status").equals("") ? -1 : Integer.parseInt(request.getParameter("status"));
        int sort = request.getParameter("sort") == null || request.getParameter("sort").equals("") ? -1 : Integer.parseInt(request.getParameter("sort"));
        
        ArrayList<Blog> listBlog = new BlogDAO().getPostMarketing(category, author, status, sort, search, order);
        int pageSize = 6;
        int total = 0;
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        total = (listBlog.size() % pageSize == 0) ? (listBlog.size() / pageSize) : (listBlog.size() / pageSize + 1);
        if (!listBlog.isEmpty()) {
            if (total != page) {
                request.setAttribute("listBlog", listBlog.subList((page - 1) * pageSize, page * pageSize));
            } else {
                request.setAttribute("listBlog", listBlog.subList((page - 1) * pageSize, listBlog.size()));
            }
        } else {
            request.setAttribute("listBlog", listBlog);
        }
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        ArrayList<String> catList = new BlogDAO().getCatPost();
        ArrayList<User> userList = new BlogDAO().getAllAuthor();
        request.setAttribute("catList", catList);
        request.setAttribute("userList", userList);
        System.out.println(category + " " + author + " " + order + " " + status + " " + sort + " " + search);
        request.getRequestDispatcher("/marketing/postlist.jsp").forward(request, response);
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



