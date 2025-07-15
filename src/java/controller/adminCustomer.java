/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author TRUNG KIEN
 */
public class adminCustomer extends HttpServlet {
    UserDAO u = new UserDAO();
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminCustomer</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminCustomer at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String insert = request.getParameter("insert") == null ? "" : request.getParameter("insert");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        
        if(insert.equalsIgnoreCase("insert")){
            insert(request, response);
        }
        
        switch(action){
            case "edit":
                getAllUser(request, response);
                request.getRequestDispatcher("edit-customers.jsp").forward(request, response);
                break;
            case "block":
                blockUser(request, response);
                response.sendRedirect("customers");
                break;
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        updateUser(request,response);
        request.getRequestDispatcher("edit-customers.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        
        u.insertUser(fullname, email, password, phone, address, roleID);
        response.sendRedirect("customers");
    }

    private void blockUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        u.blockUser(id);
    }

    private void getAllUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int id = Integer.parseInt(request.getParameter("userID"));
  
    Users user = u.getUserById(id);
    request.setAttribute("user", user);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("userID"));
        String fullname = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        
        u.updateUser(id, fullname, email, password, phone, address, roleID);
        
        Users user = u.getUserById(id);
        request.setAttribute("user", user);
    }

}
