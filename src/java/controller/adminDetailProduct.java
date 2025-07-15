/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Categories;
import model.ProductDetail;
import model.Products;

/**
 *
 * @author TRUNG KIEN
 */
@WebServlet(name="adminDetailProduct", urlPatterns={"/Admin/detailProduct"})
public class adminDetailProduct extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminDetailProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminDetailProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action) {
            case "edit":
                getAllProduct(request, response);
                request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                break;
            case "updateProduct":
                handleUpdateProduct(request, response);
                //hiển thị lại từ db dữ liệu mới update
                getAllProduct(request, response);
                request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                break;
            case "insertDetailProduct":
                handleInsertDetailProduct(request, response);
                //hiển thị lại từ db dữ liệu mới update
                getAllProduct(request, response);
                request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                break;
            case "updateDetailProduct":
                handleUpdateDetailProduct(request, response);
                //hiển thị lại từ db dữ liệu mới update
                getAllProduct(request, response);
                request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                break;
            case "deleteDetailProduct":
                handleDeleteDetailProduct(request, response);
                //hiển thị lại từ db dữ liệu mới update
                getAllProduct(request, response);
                request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                break;
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void getAllProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("productID"));

        ProductDAO p = new ProductDAO();
        Products pr = p.findProductByID(id);        //dữ liệu từ product
        List<ProductDetail> list = p.findProductDetailsByID(id);    //dữ liệu từ detailProduct
        //Lấy category của sản phẩm theo id (bao gồm : 2 category: 1 là loại dt, 2 là tên hãng)
        List<Categories> cateList = p.findAllCategoryOfProduct(id);
        String loaiPr = "";
        String hangPr = "";
        int idLoai= 0;
        int idHang= 0;
        for (Categories cate : cateList) {
            if(cate.getName().equalsIgnoreCase("Smartphones") || cate.getName().equalsIgnoreCase("Tablets")) {
                loaiPr = cate.getName();         //0 là loại; 1 là hãng
                idLoai = cate.getCategoryID();
                hangPr = cateList.get(1).getName();
                idHang = cateList.get(1).getCategoryID();
            } else {
                hangPr = cate.getName();        // 0 là hãng; 1 là loại
                idHang = cate.getCategoryID();
                loaiPr = cateList.get(1).getName();
                idLoai = cateList.get(1).getCategoryID();
            }
        }
        
        //Lấy tất cả detailProduct
        List<ProductDetail> pdList = p.findAllPDByProductId(id);
        request.setAttribute("pdList", pdList);
        
//        System.out.println(pr);
//        System.out.println(list);
        //Set req.Attribute để trả về cho trang jsp
        request.setAttribute("product", pr);
        request.setAttribute("loaiPr", loaiPr);
        request.setAttribute("hangPr", hangPr);
        request.setAttribute("idLoai", idLoai);
        request.setAttribute("idHang", idHang);
        request.setAttribute("productDetail", list);
    }

    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response) {
        //Lấy dữ liệu từ form
        int idLoai = Integer.parseInt(request.getParameter("idLoai"));  //id loại pr cũ
        int idHang = Integer.parseInt(request.getParameter("idHang"));  //id hãng pr cũ
        int productID = Integer.parseInt(request.getParameter("productID"));
        int loaiPr = Integer.parseInt(request.getParameter("loaiPr"));  //id loại pr mới
        int hangPr = Integer.parseInt(request.getParameter("hangPr"));  //id hãng pr mới
        
        String pname = request.getParameter("name");
        String pdescription = request.getParameter("description");
        String created_at = request.getParameter("created_at");
        String updated_at = request.getParameter("updated_at");
        double pprice = Double.parseDouble(request.getParameter("price"));
        int pquantity = Integer.parseInt(request.getParameter("quantity"));
        double pdiscount = Double.parseDouble(request.getParameter("discount"));
        String thumbnail = request.getParameter("thumbnail");
        
        Date createDate = Date.valueOf(created_at);
        Date updateDate = Date.valueOf(updated_at);
        
        //update Product
        ProductDAO dao = new ProductDAO();
        dao.editProduct(productID, pname, pprice, pdiscount, pquantity, createDate, updateDate, pdescription, thumbnail);
        
        //update categories
        dao.editProductCategory(productID, idLoai, loaiPr);
        dao.editProductCategory(productID, idHang, hangPr);
    }

    private void handleInsertDetailProduct(HttpServletRequest request, HttpServletResponse response) {
        ProductDAO dao = new ProductDAO();
        //ProductDetail
        int productId = Integer.parseInt(request.getParameter("productID"));
        String mCam = request.getParameter("mCam");
        String sCam = request.getParameter("sCam");
        String chip = request.getParameter("chip");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String screen = request.getParameter("screen");
        String os = request.getParameter("os");
        String sim = request.getParameter("sim");
        String pin = request.getParameter("pin");
        String sac = request.getParameter("sac");
        String[] colors = request.getParameterValues("colors");
        
        String[] pics = request.getParameterValues("pics");
        
        //Add vao productDetail
        for(String color : colors){
            dao.insertProductdetail(productId, screen, os, mCam, sCam, chip, ram, storage, sim, pin, sac, color);
        }
        
        //Add pic vào gallery
        for (String pic : pics) {
            dao.insertGalleries(productId, pic);
        }
    }

    private void handleUpdateDetailProduct(HttpServletRequest request, HttpServletResponse response) {
       ProductDAO dao= new ProductDAO();
        //ProductDetail
        int productId = Integer.parseInt(request.getParameter("productID"));
        int ID = Integer.parseInt(request.getParameter("ID"));      //Id unique trong productDetail
        String mCam = request.getParameter("mCam");
        String sCam = request.getParameter("sCam");
        String chip = request.getParameter("chip");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String screen = request.getParameter("screen");
        String os = request.getParameter("os");
        String sim = request.getParameter("sim");
        String pin = request.getParameter("pin");
        String sac = request.getParameter("sac");
        String color = request.getParameter("color");
        
        //Update product dt
        dao.editProductDetails(ID, screen, os, mCam, sCam, chip, ram, storage, sim, pin, sac, color);
    }

    private void handleDeleteDetailProduct(HttpServletRequest request, HttpServletResponse response) {
        ProductDAO dao= new ProductDAO();
        //ProductDetail
        int ID = Integer.parseInt(request.getParameter("ID"));      //Id unique trong productDetail
        int productId = Integer.parseInt(request.getParameter("productID"));
        //delete detail
        dao.deleteProductDetail(ID);
    }
    
    

}
