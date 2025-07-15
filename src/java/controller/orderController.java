
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Orders;
import util.Validate;

//url orders

public class orderController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String orderID = request.getParameter("orderID");

        if (action != null && orderID != null) {
            OrderDAO p = new OrderDAO();
//            Orders order = p.getOrderById(orderID); // Assuming you have a method to get order by ID
            
//            request.setAttribute("order", order);

            switch (action) {
                case "view":
                    request.getRequestDispatcher("orders-details.jsp").forward(request, response);
                    break;
                case "edit":
//                    handleEdit(request, response);
                    request.getRequestDispatcher("edit-orders.jsp").forward(request, response);
                    break;
                case "delete":
//                    p.deleteOrder(orderID); // Assuming you have a method to delete order by ID
                    response.sendRedirect("orders"); // Redirect to refresh the orders list
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action or orderID");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        OrderDAO p = new OrderDAO();
        List<Orders> order = p.showOrderAdmin();
        for (Orders orders : order) {
            double ad = Double.parseDouble(orders.getTotalString() == null ? "0" : orders.getTotalString());
            orders.setTotalString(Validate.doubleToMoney(ad));
        }
        session.setAttribute("orders", order);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   

}
