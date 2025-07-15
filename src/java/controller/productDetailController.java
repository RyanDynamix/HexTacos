package controller;

import dal.OrderDAO;
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
import model.Orders;
import model.Users;
import model.detailProduct;
import model.gioHang;
import model.showProduct;
import util.Validate;

@WebServlet(name = "productDetailController", urlPatterns = {"/productDetail"})
public class productDetailController extends HttpServlet {

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
            out.println("<title>Servlet productDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO DB = new ProductDAO();

        //Lấy về productID tu input hidden
        int productID = Integer.parseInt(request.getParameter("productID"));

        detailProduct allDetailProduct = DB.findProductDetailByID(productID);
        List<String> allColor = DB.findAllColorOfProduct(productID);
        List<String> allPictute = DB.findAllGalleryOfProduct(productID);

        // In ra console để kiểm tra danh sách sản phẩm
        if (allDetailProduct != null) {
            System.out.println(allDetailProduct.getProductID() + " - " + allDetailProduct.getName());
            allDetailProduct.setPriceString(Validate.doubleToMoney(allDetailProduct.getPrice()));
            allDetailProduct.setDisString(Validate.doubleToMoney(allDetailProduct.getDiscount()));
        }

        // Lưu trữ chi tiết sản phẩm điện thoại vào session
        request.setAttribute("allDetailProduct", allDetailProduct);
        request.setAttribute("allColor", allColor);
        request.setAttribute("allPictute", allPictute);

        request.getRequestDispatcher("productDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giá trị action về
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        //- switch case cac action
        switch (action) {
            case "buyNow":
                handleBuyNow(request, response);
                //chuyen sang trang deliveryList
                break;
            case "addToCart":
                handleAddToCart(request, response);
                //chuyen sang trang shoppingCart
                break;
            default:
                throw new AssertionError();
        }
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

    private void handleBuyNow(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Chưa làm css nên để giống handleAddToCart
        
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();
        
        //lấy dữ liệu về
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("selectedQuantity"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String color = request.getParameter("selectedColor");
        
        //Lấy về userID từ account trong sesion khi đăng nhập
        Users account = (Users) session.getAttribute("account");

        if (account == null) {   //ng dung chua dang nhap 
            //Chuyen huong den trang dang nhap
            String targetURL = "auth";
            String encodedURL = response.encodeRedirectURL(targetURL);
            response.sendRedirect(encodedURL);
        } else {                //ng dung da dang nhap thanh cong
            //Lay orderID cua userID
            int orderID = dao.findOrderIdNotConfirmed(account.getUserID());
            
            if (orderID != 0) {  //Có giỏ hàng từ trước => Thêm vào giỏ hàng đó
                //Thêm orderDetail vào order đó
                //Kiểm tra xem thử đã có product đó từ trc chưa
                int quantityCurrent = dao.findQuantityCurrent(orderID, productID, color);
                
                if(quantityCurrent == 0) {  //chưa có product đó trong giỏ hàng
                    int orderDetailID = dao.insertOrderDetailsDB(productID, orderID, quantity, discount, color);
                } else {    //Đã có nên chỉ update số lượng
                    int quantityNew = quantityCurrent + quantity;
                    dao.updateOrderDetailsByOrderID(orderID, productID, quantityNew, color);
                }
                
                //chuyen sang trang shoppingCart.jsp
                response.sendRedirect("shopping");
            } else {        //Chưa có giỏ hàng => Tạo giỏ hàng mới và thêm vào
                Orders order = new Orders();
                order.setUserID(account.getUserID());
                order.setPhone(account.getPhone());
                order.setNameOrder(account.getFullName());
                order.setDeliveryLocation(account.getAddress());
                
                //Tạo order chư confirmed => lấy orderID mới tạo
                int orderID_new = dao.insertOrderDB(order); 
                
                //Thêm orderDetail vào order đó
                int orderDetailID = dao.insertOrderDetailsDB(productID, orderID_new, quantity, discount, color);
                //chuyen sang trang shoppingCart.jsp
                response.sendRedirect("shopping");
            }
        }
    }

    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();
        
        //lấy dữ liệu về
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("selectedQuantity"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String color = request.getParameter("selectedColor");
        
        //Lấy về userID từ account trong sesion khi đăng nhập
        Users account = (Users) session.getAttribute("account");

        if (account == null) {   //ng dung chua dang nhap 
            //Chuyen huong den trang dang nhap
            String targetURL = "auth";
            String encodedURL = response.encodeRedirectURL(targetURL);
            response.sendRedirect(encodedURL);
        } else {                //ng dung da dang nhap thanh cong
            //Lay orderID cua userID
            int orderID = dao.findOrderIdNotConfirmed(account.getUserID());
            
            if (orderID != 0) {  //Có giỏ hàng từ trước => Thêm vào giỏ hàng đó
                //Thêm orderDetail vào order đó
                //Kiểm tra xem thử đã có product đó từ trc chưa
                int quantityCurrent = dao.findQuantityCurrent(orderID, productID, color);
                
                if(quantityCurrent == 0) {  //chưa có product đó trong giỏ hàng
                    int orderDetailID = dao.insertOrderDetailsDB(productID, orderID, quantity, discount, color);
                } else {    //Đã có nên chỉ update số lượng
                    int quantityNew = quantityCurrent + quantity;
                    dao.updateOrderDetailsByOrderID(orderID, productID, quantityNew, color);
                }
                
                //chuyen sang trang shoppingCart.jsp
                response.sendRedirect("shopping");
            } else {        //Chưa có giỏ hàng => Tạo giỏ hàng mới và thêm vào
                Orders order = new Orders();
                order.setUserID(account.getUserID());
                order.setPhone(account.getPhone());
                order.setNameOrder(account.getFullName());
                order.setDeliveryLocation(account.getAddress());
                
                //Tạo order chư confirmed => lấy orderID mới tạo
                int orderID_new = dao.insertOrderDB(order); 
                
                //Thêm orderDetail vào order đó
                int orderDetailID = dao.insertOrderDetailsDB(productID, orderID_new, quantity, discount, color);
                //chuyen sang trang shoppingCart.jsp
                response.sendRedirect("shopping");
            }
        }
    }

}
