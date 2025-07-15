package controller;

import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Feedbacks;
import model.Orders;
import model.Users;
import model.detailProduct;
import util.Validate;

@WebServlet(name = "productDetailController", urlPatterns = {"/productDetail"})
public class productDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        // Lấy productID từ query parameter
        int productID = Integer.parseInt(request.getParameter("productID"));

        // Lấy thông tin chi tiết sản phẩm
        detailProduct allDetailProduct = productDAO.findProductDetailByID(productID);
        List<String> allColor = productDAO.findAllColorOfProduct(productID);
        List<String> allPictute = productDAO.findAllGalleryOfProduct(productID);

        // Lấy danh sách feedback theo productID
        List<Feedbacks> feedbackList = feedbackDAO.getFeedbacksByProductId(productID);

        // Format giá và giảm giá
        if (allDetailProduct != null) {
            allDetailProduct.setPriceString(Validate.doubleToMoney(allDetailProduct.getPrice()));
            allDetailProduct.setDisString(Validate.doubleToMoney(allDetailProduct.getDiscount()));
        }

        // Set attribute để render bên JSP
        request.setAttribute("allDetailProduct", allDetailProduct);
        request.setAttribute("allColor", allColor);
        request.setAttribute("allPictute", allPictute);
        request.setAttribute("feedbackList", feedbackList); // Gửi feedback về trang JSP

        request.getRequestDispatcher("productDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        switch (action) {
            case "buyNow":
                handleBuyNow(request, response);
                break;
            case "addToCart":
                handleAddToCart(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    private void handleBuyNow(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("selectedQuantity"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String color = request.getParameter("selectedColor");

        Users account = (Users) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect(response.encodeRedirectURL("auth"));
        } else {
            int orderID = dao.findOrderIdNotConfirmed(account.getUserID());

            if (orderID != 0) {
                int quantityCurrent = dao.findQuantityCurrent(orderID, productID, color);
                if (quantityCurrent == 0) {
                    dao.insertOrderDetailsDB(productID, orderID, quantity, discount, color);
                } else {
                    dao.updateOrderDetailsByOrderID(orderID, productID, quantityCurrent + quantity, color);
                }
            } else {
                Orders order = new Orders();
                order.setUserID(account.getUserID());
                order.setPhone(account.getPhone());
                order.setNameOrder(account.getFullName());
                order.setDeliveryLocation(account.getAddress());

                int newOrderID = dao.insertOrderDB(order);
                dao.insertOrderDetailsDB(productID, newOrderID, quantity, discount, color);
            }
            response.sendRedirect("shopping");
        }
    }

    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();

        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("selectedQuantity"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String color = request.getParameter("selectedColor");

        Users account = (Users) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect(response.encodeRedirectURL("auth"));
        } else {
            int orderID = dao.findOrderIdNotConfirmed(account.getUserID());

            if (orderID != 0) {
                int quantityCurrent = dao.findQuantityCurrent(orderID, productID, color);
                if (quantityCurrent == 0) {
                    dao.insertOrderDetailsDB(productID, orderID, quantity, discount, color);
                } else {
                    dao.updateOrderDetailsByOrderID(orderID, productID, quantityCurrent + quantity, color);
                }
            } else {
                Orders order = new Orders();
                order.setUserID(account.getUserID());
                order.setPhone(account.getPhone());
                order.setNameOrder(account.getFullName());
                order.setDeliveryLocation(account.getAddress());
                int newOrderID = dao.insertOrderDB(order);
                dao.insertOrderDetailsDB(productID, newOrderID, quantity, discount, color);
            }
            response.sendRedirect("shopping");
        }
    }
}
