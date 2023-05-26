/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import dao.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class actionPost extends HttpServlet {

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
        String action = request.getParameter("action");
        String search = request.getParameter("search")== null || request.getParameter("search").equals("") ? "" : request.getParameter("search");
        String category = request.getParameter("category") == null || request.getParameter("category").equals("") ? "-1" : request.getParameter("category");
        int author = request.getParameter("author") == null || request.getParameter("author").equals("") ? -1 : Integer.parseInt(request.getParameter("author"));
        int order = request.getParameter("order") == null || request.getParameter("order").equals("") ? 0 : Integer.parseInt(request.getParameter("order"));
        int status = request.getParameter("status") == null || request.getParameter("status").equals("") ? -1 : Integer.parseInt(request.getParameter("status"));
        int sort = request.getParameter("sort") == null || request.getParameter("sort").equals("") ? -1 : Integer.parseInt(request.getParameter("sort"));
        int page = 1;
        if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        if ("change".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            int value = Integer.parseInt(request.getParameter("value"));

            new BlogDAO().updateStatus(id, value);
            response.sendRedirect("PostList?page=" + page + "&category=" + category + "&author=" + author + "&status=" + status + "&sort=" + sort + "&search=" + search + "&order=" + order);

        }
        if ("edit".equals(action) || "editLink".equals(action)) {

            int idEdit = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String image = request.getParameter("postimage");
            String categoryEdit = request.getParameter("categoryEdit");
            int status2 = Integer.parseInt(request.getParameter("status2"));
            int cate = 0;
            switch(categoryEdit){
                case "Review":
                    cate = 1;
                    break;
                case "Promoted":
                    cate = 2;
                    break;
                default:
                    cate = 3;
                    break;
                        
            }
            new BlogDAO().updatePost(title, description, image, status2,cate, idEdit);
            if("edit".equals(action))
                response.sendRedirect("PostList?page=" + page + "&category=" + category + "&author=" + author + "&status=" + status2 + "&sort=" + sort + "&search=" + search + "&order=" + order);
            else
                response.sendRedirect("PostDetail?id="+idEdit+"&title="+title+"&description="+description+"&category="+categoryEdit+"&status2="+status2);
        }
        if("add".equals(action)){
            String titleAdd = request.getParameter("titleAdd");
            String descriptionAdd = request.getParameter("descriptionAdd");
            int status3 = Integer.parseInt(request.getParameter("status3"));
            String categoryAdd = request.getParameter("categoryAdd");
            String imgAdd = request.getParameter("img");
            int cate = 0;
            switch(categoryAdd){
                case "Review":
                    cate = 1;
                    break;
                case "Promoted":
                    cate = 2;
                    break;
                default:
                    cate = 3;
                    break;
            }
            User account = (User)request.getSession().getAttribute("account");
            int authorID = account.getUser_id() ;
            new BlogDAO().addPost(titleAdd,descriptionAdd,imgAdd,authorID,LocalDate.now(),cate,0,status3);
            System.out.println(titleAdd+" "+descriptionAdd+" "+status3+" "+categoryAdd+" "+imgAdd);
            response.sendRedirect("PostList");
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

//    public static void main(String[] args) {
//        System.out.println(new BlogDAO().getAllPost());
//        new BlogDAO().updatePost("Using multiroom audio ", "Perhaps you remember the iPhone 7 Plus - the phone that brought a telephoto camera and made multiple cameras mainstream, something we've been taking for granted for years now. It wasn't the first one to feature more than one rear camera", "phone.jpg", 14);
//        System.out.println(new BlogDAO().getAllPost());
//    }
}