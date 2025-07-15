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
import java.util.ArrayList;
import java.util.List;
import model.ProductDetail;
import model.Products;
import model.showProduct;
import util.Validate;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "phoneListController", urlPatterns = {"/phoneList"})
public class phoneListController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet phoneListController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet phoneListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    ProductDAO DB = new ProductDAO();
    HttpSession session = request.getSession();

    List<showProduct> allShowProduct = DB.findAllShowProductByCategoryName("Smartphones");

    // In ra console để kiểm tra danh sách sản phẩm
    for (showProduct sp : allShowProduct) {
        System.out.println(sp.getProductID() + " - " + sp.getName());
        sp.setPriceString(Validate.doubleToMoney(sp.getPrice()));
        sp.setDisString(Validate.doubleToMoney(sp.getDiscount()));
    }

    // Lưu trữ chi tiết sản phẩm điện thoại vào session
    session.setAttribute("allShowProduct", allShowProduct);
    request.getRequestDispatcher("phone_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        //- Lấy giá trị action về
//        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
//        //- switch case cac action
//        List<Products> listSearch;
//        switch (action) {
//            case "search":
//                listSearch = searchProduct(request, response);
//                break;
//            case "insert":
//                listSearch = insertProduct(request, response);
//                break;
//            case "update":
//                listSearch = updateProduct(request, response);
//                break;
//            case "delete":
//                listSearch = deleteProduct(request, response);
//                break;
//            default:
//                throw new AssertionError();
//        }
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
