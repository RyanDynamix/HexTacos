/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.OrderDetail;
import model.gioHang;
import util.Validate;


/**
 *
 * @author Kien
 */
public class detailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int orderID = Integer.parseInt(request.getParameter("id"));
        OrderDAO o = new OrderDAO();
        List<gioHang> list = o.orderDetail(orderID);
        
        for (gioHang od : list) {
            od.setDisString(Validate.doubleToMoney(od.getPrice()));
            od.setTotalString(Validate.doubleToMoney(od.getTotalMoney()));
            od.setThanhTien(Validate.doubleToMoney(od.getPrice() * od.getQuantity()));
        }

        session.setAttribute("lists", list);
        request.getRequestDispatcher("orders-details.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
