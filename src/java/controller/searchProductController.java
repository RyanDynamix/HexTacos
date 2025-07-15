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
@WebServlet(name = "searchProductController", urlPatterns = {"/search"})
public class searchProductController extends HttpServlet {

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
            out.println("<title>Servlet searchProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO DB = new ProductDAO();
        HttpSession session = request.getSession();

        List<showProduct> allShowProduct = null;
        String keyWord = null;

        String brand = request.getParameter("brand").trim();
        double price = Double.parseDouble(request.getParameter("price"));
        String storage = request.getParameter("storage").trim();
        String category = request.getParameter("category").trim();

        if (brand.equals("all") && price == 0 && storage.equals("all")) {   //tất cả là all
            keyWord = " ";
            allShowProduct = DB.findProductByNameAndCategory(" ", category, " ");

        } else if (price == 0 && storage.equals("all")) {                       //switch theo brand
            keyWord = brand;
            allShowProduct = DB.findProductByNameAndCategory(brand, category, " ");

        } else if (brand.equals("all") && storage.equals("all")) {       //switch theo price   
            double dis1 = 0;
            double dis2 = price;
            if (price >= 30000000) {
                dis1 = 24000100;
                dis2 = 99999999;
            }
            allShowProduct = DB.findProductByDis(dis1, dis2, category);

        } else if (brand.equals("all") && price == 0) {                       //switch theo stogare   
            keyWord = storage;
            allShowProduct = DB.findProductByNameAndCategory(" ", category, storage);

        } else if (storage.equals("all")) {                                    //switch theo brand and price
            keyWord = brand;
            double dis1 = 0;
            double dis2 = price;
            if (price >= 30000000) {
                dis1 = 24000100;
                dis2 = 99999999;
            }
            allShowProduct = DB.findProductByNameAndPrice(brand, dis1, dis2, category, " ");

        } else if (brand.equals("all")) {                                      //switch theo stogare and price
            keyWord = storage;
            double dis1 = 0;
            double dis2 = price;
            if (price >= 30000000) {
                dis1 = 24000100;
                dis2 = 99999999;
            }
            allShowProduct = DB.findProductByNameAndPrice(" ", dis1, dis2, category, storage);

        } else if (price == 0) {                                                       //switch theo stogare and brand
            allShowProduct = DB.findProductByNameAndCategory(brand, category, storage);

        } else {                                                                        //switch theo cả 3
            double dis1 = 0;
            double dis2 = price;
            if (price >= 30000000) {
                dis1 = 24000100;
                dis2 = 99999999;
            }
            allShowProduct = DB.findProductByNameAndPrice(brand, dis1, dis2, category, storage);
        }

        // In ra console để kiểm tra danh sách sản phẩm
        for (showProduct sp : allShowProduct) {
            System.out.println(sp.getProductID() + " - " + sp.getName());
            sp.setPriceString(Validate.doubleToMoney(sp.getPrice()));
            sp.setDisString(Validate.doubleToMoney(sp.getDiscount()));
        }

        // Lưu trữ chi tiết sản phẩm điện thoại vào session
        request.setAttribute("allShowProduct", allShowProduct);
        request.setAttribute("keyWord", " ");
        if (category.equalsIgnoreCase("Smartphones")) {
            request.getRequestDispatcher("searchPage.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("searchPageTablet.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO DB = new ProductDAO();
        HttpSession session = request.getSession();

        String keyWord = request.getParameter("keyword");

        List<showProduct> allShowProduct = DB.findProductByName(keyWord);

        // In ra console để kiểm tra danh sách sản phẩm
        for (showProduct sp : allShowProduct) {
            System.out.println(sp.getProductID() + " - " + sp.getName());
            sp.setPriceString(Validate.doubleToMoney(sp.getPrice()));
            sp.setDisString(Validate.doubleToMoney(sp.getDiscount()));
        }

        // Lưu trữ chi tiết sản phẩm điện thoại vào session
        request.setAttribute("allShowProduct", allShowProduct);
        request.setAttribute("keyWord", keyWord);
        request.getRequestDispatcher("searchPage.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
