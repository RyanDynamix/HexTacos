/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Users;
import model.donHang;
import model.gioHang;
import util.Validate;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "deliveryListController", urlPatterns = {"/deliveryList"})
public class deliveryListController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet deliveryListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deliveryListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();

        //Lấy về userID từ account trong sesion khi đăng nhập
        Users account = (Users) session.getAttribute("account");

        if (account == null) {   //ng dung chua dang nhap 
            //Chuyen huong den trang dang nhap
            String targetURL = "auth";
            String encodedURL = response.encodeRedirectURL(targetURL);
            response.sendRedirect(encodedURL);
        } else {                //ng dung da dang nhap thanh cong
            //Lấy các đơn hàng đang giao
            List<donHang> allDonHang = dao.showDonHang(account.getUserID());
            for (donHang hang : allDonHang) {
                hang.setDisString(Validate.doubleToMoney(hang.getPrice()));             //set tiền dạng String cho price
                hang.setTotalString(Validate.doubleToMoney(hang.getTotalMoney()));     //set tiền dạng String cho total
                double price = hang.getPrice();
                double quantity = hang.getQuantity();
                double thanhTien = price * quantity;
                hang.setThanhTien(Validate.doubleToMoney(thanhTien));
            }

            //Lưu trữ vào trong request
            request.setAttribute("allDonHang", allDonHang);     //Lấy cái này để chạy for:Each
            //chuyen sang trang shoppingCart.jsp
            request.getRequestDispatcher("deliveryList.jsp").forward(request, response);
        }
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
