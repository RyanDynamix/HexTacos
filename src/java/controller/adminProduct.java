
package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.ProductDetail;
import model.Products;

public class adminProduct extends HttpServlet {

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
        String insert = request.getParameter("insert") == null ? "" : request.getParameter("insert");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if (insert.equalsIgnoreCase("insert")) {
            insert(request, response);
        }
        switch (action) {
            case "edit":
                getAllProduct(request, response);
                request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                response.sendRedirect("products");
                break;
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

//    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    
//    }
    private void update(HttpServletRequest request, HttpServletResponse response) {

    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //Product
        String pname = request.getParameter("name");
        String pdescription = request.getParameter("description");
        String created_at = request.getParameter("created_at");
        String updated_at = request.getParameter("updated_at");
        double pprice = Double.parseDouble(request.getParameter("price"));
        int pquantity = Integer.parseInt(request.getParameter("quantity"));
        double pdiscount = Double.parseDouble(request.getParameter("discount"));
        String thumbnail = request.getParameter("thumbnail");
        int pcategory;
        String image = "";

        try {
            Date createDate = Date.valueOf(created_at);
            Date updateDate = Date.valueOf(updated_at);
            pcategory = Integer.parseInt(request.getParameter("hangPr"));

            switch (pcategory) {
                case 3:
                    image = "./img_svg/0_picProduct/Apple/" + thumbnail;
                    break;
                case 4:
                    image = "./img_svg/0_picProduct/Samsung/" + thumbnail;
                    break;
                case 5:
                    image = "./img_svg/0_picProduct/Oppo/" + thumbnail;
                    break;
                case 6:
                    image = "./img_svg/0_picProduct/Xiaomi/" + thumbnail;
                    break;
            }

            ProductDAO dao = new ProductDAO();
            //Tra ve key
            int productId = dao.insertProduct(pname, image, createDate, updateDate, pprice, pdescription, pquantity, pdiscount);
            // Add category to product according to categoryId
            int loaiPr = Integer.parseInt(request.getParameter("loaiPr"));
            dao.insertPCategory(productId, loaiPr);
            //Add vao galleries
//            dao.insertGalleries(productId, image);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        //Hiện alert và trả về trang detailProduct admin
        request.setAttribute("mess", "Product Added!");
        response.sendRedirect("products");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            ProductDAO p = new ProductDAO();
            p.deleteProduct(id);
            request.setAttribute("mess", "Product Deleted!");
        } catch (NumberFormatException e) {
            System.out.println(e);
            request.setAttribute("mess", "Invalid Product ID!");
        }
    }

    //đang di dời qua /detailProduct
    private void getAllProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("productID"));
//        if (id == 0) {
//            id = Integer.parseInt((String) request.getAttribute("productID_update"));
//        }
        ProductDAO p = new ProductDAO();
        Products pr = p.findProductByID(id);
        List<ProductDetail> list = p.findProductDetailsByID(id);

        System.out.println(pr);
        System.out.println(list);

        request.setAttribute("product", pr);
        request.setAttribute("productDetail", list);
    }

}
