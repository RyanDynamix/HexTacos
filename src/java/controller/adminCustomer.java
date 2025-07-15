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
import java.util.List;
import model.Roles;
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
            return;
        }
        
        switch(action){
            case "edit":
                getAllUser(request, response);
                List<Roles> roles = u.getAllRoles();
                request.setAttribute("roles", roles);
                request.getRequestDispatcher("edit-customers.jsp").forward(request, response);
                break;
            case "block":
                blockUser(request, response);
                response.sendRedirect("customers");
                break;
            case "add":
                List<Roles> rolesList = u.getAllRoles();
                request.setAttribute("roles", rolesList);
                request.getRequestDispatcher("add-customer.jsp").forward(request, response);
                break;
            default:
                // List all customers
                List<Users> users = u.listAll();
                request.setAttribute("users", users);
                request.getRequestDispatcher("customers.jsp").forward(request, response);
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
        try {
            updateUser(request, response);
            
            // Get updated user and roles for the form
            int userId = Integer.parseInt(request.getParameter("userID"));
            Users user = u.getUserById(userId);
            List<Roles> roles = u.getAllRoles();
            
            // Set attributes for the JSP
            request.setAttribute("user", user);
            request.setAttribute("roles", roles);
            request.setAttribute("successMessage", "Cập nhật thành công!");
            
            // Forward back to the edit page
            request.getRequestDispatcher("edit-customers.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error in doPost: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("errorMessage", "Lỗi khi cập nhật: " + e.getMessage());
            
            // Forward back to the edit page with error
            int userId = Integer.parseInt(request.getParameter("userID"));
            Users user = u.getUserById(userId);
            List<Roles> roles = u.getAllRoles();
            request.setAttribute("user", user);
            request.setAttribute("roles", roles);
            request.getRequestDispatcher("edit-customers.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            String statusParam = request.getParameter("status");
            
            // Convert status string to boolean
            boolean status = "Active".equalsIgnoreCase(statusParam) || "true".equalsIgnoreCase(statusParam) || "1".equals(statusParam);
            
            System.out.println("Inserting user: " + fullname + ", " + email + ", roleID=" + roleID + ", status=" + status);
            
            u.insertUser(fullname, email, password, phone, address, roleID, status);
            
            // Redirect with success message
            response.sendRedirect("customers");
        } catch (Exception e) {
            System.out.println("Error in insert: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message and forward back to add form with roles
            request.setAttribute("errorMessage", "Lỗi khi thêm người dùng: " + e.getMessage());
            List<Roles> rolesList = u.getAllRoles();
            request.setAttribute("roles", rolesList);
            request.getRequestDispatcher("add-customer.jsp").forward(request, response);
        }
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
        try {
            // Debug: Print all parameters
            System.out.println("--- Update User Parameters ---");
            request.getParameterMap().forEach((key, value) -> {
                System.out.println(key + ": " + String.join(", ", value));
            });
            
            int id = Integer.parseInt(request.getParameter("userID"));
            String fullname = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            String statusParam = request.getParameter("status");
            
            // Convert status string to boolean
            boolean status = "Active".equalsIgnoreCase(statusParam) || "true".equalsIgnoreCase(statusParam) || "1".equals(statusParam);
            
            System.out.println("Updating user: ID=" + id + ", name=" + fullname + 
                               ", email=" + email + ", roleID=" + roleID + 
                               ", status=" + status);
            
            u.updateUser(id, fullname, email, password, phone, address, roleID, status);
            
            Users user = u.getUserById(id);
            request.setAttribute("user", user);
            
        } catch (Exception e) {
            System.out.println("Error in updateUser: " + e.getMessage());
            e.printStackTrace();
            throw e; // Re-throw to be caught in doPost
        }
    }
}
