/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.showProduct;
import util.Validate;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "tabletListController", urlPatterns = {"/tabletList"})
public class tabletListController extends HttpServlet {

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
            out.println("<title>Servlet tabletListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tabletListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO DB = new ProductDAO();
        HttpSession session = request.getSession();

        List<showProduct> allShowTablets = DB.findAllShowProductByCategoryName("Tablets");

        // In ra console để kiểm tra danh sách sản phẩm
        for (showProduct sp : allShowTablets) {
            System.out.println(sp.getProductID() + " - " + sp.getName());
            sp.setPriceString(Validate.doubleToMoney(sp.getPrice()));
            sp.setDisString(Validate.doubleToMoney(sp.getDiscount()));
        }

        // Lưu trữ chi tiết sản phẩm điện thoại vào session
        session.setAttribute("allShowProduct", allShowTablets);
        request.getRequestDispatcher("tablet_list.jsp").forward(request, response);
    }

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
