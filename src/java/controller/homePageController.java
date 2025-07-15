
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
import model.Products;
import util.Validate;

@WebServlet(name = "homePageController", urlPatterns = {"/homePage"})
public class homePageController extends HttpServlet {

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
            out.println("<title>Servlet homePageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homePageController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ProductDAO dao = new ProductDAO();
        
        //Lấy dữ liệu từ DB để hiển thị
        List<Products> allProductsPhone = dao.findProductByCategory("Smartphones");
        List<Products> allProductsTablet = dao.findProductByCategory("Tablets");
        
        //Chuyển đổi giá trị double sang String để hiển thị
        for (Products phone : allProductsPhone) {
            phone.setPriceString(Validate.doubleToMoney(phone.getPrice()));
            phone.setDisString(Validate.doubleToMoney(phone.getDiscount()));
        }
        for (Products tablet : allProductsTablet) {
            tablet.setPriceString(Validate.doubleToMoney(tablet.getPrice()));
            tablet.setDisString(Validate.doubleToMoney(tablet.getDiscount()));
        }
        
        //set du lieu vao trong session
        session.setAttribute("allProductsPhone", allProductsPhone);
        session.setAttribute("allProductsTablet", allProductsTablet);
        request.getRequestDispatcher("userMainPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        //- Lấy giá trị action về
//        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
//        //- switch case cac action
//        switch (action) {
//            case "search":
//                handleSearch(request, response);
//                response.sendRedirect("products");      //Chuyển đến servlet hiển thị listSearch
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
