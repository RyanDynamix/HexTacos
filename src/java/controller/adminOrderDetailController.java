/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.OrderDetail;
import model.Orders;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "adminOrderDetailController", urlPatterns = {"/Admin/adminOrder"})
public class adminOrderDetailController extends HttpServlet {

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
            out.println("<title>Servlet adminOrderDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminOrderDetailController at " + request.getContextPath() + "</h1>");
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
        // Lấy giá trị action về
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String handle = request.getParameter("updateOrderDetail") == null ? "" : request.getParameter("updateOrderDetail");
        //- switch case cac action
        switch (action) {
            case "edit":
                handleEdit(request, response);
                request.getRequestDispatcher("edit-orders.jsp").forward(request, response);
                break;
            case "delete":      //Xóa order ở trang orders.jsp
                handleDelete(request, response);
                response.sendRedirect("orders");
                break;
            case "":
                if (handle.equalsIgnoreCase("1")) {         //chạy updateOrderDetail
                    handleUpdateOrderDetail(request, response);
                    //Chạy lại để update dữ liệu mới
                    handleEdit(request, response);
//                    String targetURL = "edit-orders.jsp";
//                    String encodedURL = response.encodeRedirectURL(targetURL);
//                    response.sendRedirect(encodedURL);
                } else if (handle.equalsIgnoreCase("2")) {   //chạy deleteOrderDetail
                    handleDeleteOrderDetail(request, response);
                    //Chạy lại để update dữ liệu mới
                    handleEdit(request, response);
                }
                request.getRequestDispatcher("edit-orders.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //chạy hàm update order
        handleUpdateOrder(request, response);
        //Chạy lại để update dữ liệu mới
        handleEdit(request, response);
        request.getRequestDispatcher("edit-orders.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void handleEdit(HttpServletRequest request, HttpServletResponse response) {
        //đọc ko hiểu ask Nam
        //Lấy về orderID
        int orderID = 0;
        orderID = Integer.parseInt(request.getParameter("orderID"));

        //Xử lý reload trang khi update order
        if (orderID == 0) {
            orderID = Integer.parseInt((String) request.getAttribute("orderID_update"));
        }

        //Lấy dữ liệu để hiển thị theo orderID
        OrderDAO dao = new OrderDAO();
        //Lấy Order
        Orders order = dao.findOderByID(orderID);
        //Lấy OrderDetail
        List<OrderDetail> orderDetailList = dao.findOderDetailByID(orderID);

        //Lấy tất cả màu của từng product trong orderDetailList
        ProductDAO pdao = new ProductDAO();
        for (int i = 0; i < orderDetailList.size(); i++) {
            int productID = orderDetailList.get(i).getProductID();
            //set colorList cho orderDetailList
            orderDetailList.get(i).setColorList(pdao.findAllColorOfProduct(productID));
        }

        //Set attribute
        request.setAttribute("order", order);
        request.setAttribute("orderDetailList", orderDetailList);
    }

    private void handleUpdateOrderDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("ID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        System.out.println(color);
        int orderID_update = Integer.parseInt(request.getParameter("orderID"));

        OrderDAO dao = new OrderDAO();

        dao.updateAdminOrderDetailsByID(id, quantity, color);
        request.setAttribute("orderID_update", orderID_update);
    }

    private void handleDeleteOrderDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("ID"));
        int orderID_update = Integer.parseInt(request.getParameter("orderID"));

        OrderDAO dao = new OrderDAO();

        dao.deleteOrderDetailsById(id);
        request.setAttribute("orderID_update", orderID_update);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) {       //Xóa order ở trang orders.jsp
        int orderID = 0;
        orderID = Integer.parseInt(request.getParameter("orderID"));
//        deleteOrderById
        //Xóa order
        OrderDAO dao = new OrderDAO();
        dao.deleteOrderById(orderID);
    }

    private void handleUpdateOrder(HttpServletRequest request, HttpServletResponse response) {
        OrderDAO dao = new OrderDAO();
        //Lấy dữ liệu từ form về
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        String paymentStatus = request.getParameter("paymentStatus");
        String phone = request.getParameter("phone");
        String deliveryStatus = request.getParameter("deliveryStatus");
        String paymentType = request.getParameter("paymentType");
        String deliveryInfo = request.getParameter("deliveryInfo");
        String nameOrder = request.getParameter("nameOrder");
        String deliveryLocation = request.getParameter("deliveryLocation");
        
        dao.updateAdminOrderByID(orderID, phone, paymentStatus, deliveryStatus, paymentType, deliveryInfo, nameOrder, deliveryLocation);
        request.setAttribute("orderID_update", orderID);
    }

}
