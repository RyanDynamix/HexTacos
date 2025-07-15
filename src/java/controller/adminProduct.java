package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import model.ProductDetail;
import model.Products;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
public class adminProduct extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(adminProduct.class.getName());

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
        try {
            String action = request.getParameter("action") == null ? "" : request.getParameter("action");
                
            switch (action) {
                case "edit":
                    getAllProduct(request, response);
                    request.getRequestDispatcher("edit-products.jsp").forward(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    response.sendRedirect("products");
                    break;
                default:
                    // Handle default case - redirect to products page
                    response.sendRedirect("products");
                    break;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doGet: {0}", e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error processing request: " + e.getMessage());
            response.sendRedirect("products");
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
        LOGGER.log(Level.INFO, "POST request received to adminProduct servlet");
        try {
            // Lấy các tham số từ form
            String name = request.getParameter("name");
            System.out.println("name=" + name);
            String description = request.getParameter("description");
            System.out.println("description=" + description);
            String created_at = request.getParameter("created_at");
            System.out.println("created_at=" + created_at);
            String updated_at = request.getParameter("updated_at");
            System.out.println("updated_at=" + updated_at);
            String priceStr = request.getParameter("price");
            System.out.println("priceStr=" + priceStr);
            String quantityStr = request.getParameter("quantity");
            System.out.println("quantityStr=" + quantityStr);
            String discountStr = request.getParameter("discount");
            System.out.println("discountStr=" + discountStr);
            String hangPrStr = request.getParameter("hangPr");
            System.out.println("hangPrStr=" + hangPrStr);
            String loaiPrStr = request.getParameter("loaiPr");
            System.out.println("loaiPrStr=" + loaiPrStr);
            String screen = request.getParameter("screen");
            System.out.println("screen=" + screen);
            String os = request.getParameter("os");
            System.out.println("os=" + os);
            String mainCamera = request.getParameter("mCam");
            System.out.println("mainCamera=" + mainCamera);
            String selfieCamera = request.getParameter("sCam");
            System.out.println("selfieCamera=" + selfieCamera);
            String chip = request.getParameter("chip");
            System.out.println("chip=" + chip);
            String ram = request.getParameter("ram");
            System.out.println("ram=" + ram);
            String sim = request.getParameter("sim");
            System.out.println("sim=" + sim);
            String battery = request.getParameter("pin");
            System.out.println("battery=" + battery);
            String charger = request.getParameter("sac");
            System.out.println("charger=" + charger);

            // Lấy tất cả các giá trị màu sắc từ form
            String[] colors = request.getParameterValues("colors");
            StringBuilder colorStr = new StringBuilder();
            if (colors != null) {
                for (int i = 0; i < colors.length; i++) {
                    if (i > 0) colorStr.append(",");
                    colorStr.append(colors[i]);
                }
            }
            System.out.println("colorStr=" + colorStr.toString());

            // Lấy tất cả các giá trị storage từ form
            String[] storages = request.getParameterValues("storage");
            StringBuilder storageStr = new StringBuilder();
            if (storages != null) {
                for (int i = 0; i < storages.length; i++) {
                    if (i > 0) storageStr.append(",");
                    storageStr.append(storages[i]);
                }
            }
            System.out.println("storageStr=" + storageStr.toString());

            // Validate required fields
            if (name == null || name.isEmpty() || created_at == null || created_at.isEmpty() ||
                updated_at == null || updated_at.isEmpty()) {
                request.getSession().setAttribute("errorMessage", "Thiếu thông tin bắt buộc");
                response.sendRedirect("add-products.jsp");
                return;
            }

            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);
            double discount = (discountStr != null && !discountStr.isEmpty()) ? Double.parseDouble(discountStr) : 0;
            int brandId = Integer.parseInt(hangPrStr);
            int categoryId = Integer.parseInt(loaiPrStr);
            Date createDate = Date.valueOf(created_at);
            Date updateDate = Date.valueOf(updated_at);

            // Lấy file thumbnail
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnail = null;
            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                thumbnail = uploadFile(thumbnailPart);
            }

            // Lấy danh sách ảnh chi tiết
            List<String> imagePaths = new ArrayList<>();
            for (Part part : request.getParts()) {
                if ("images".equals(part.getName()) && part.getSize() > 0) {
                    imagePaths.add(uploadFile(part));
                }
            }

            // Xử lý storage và color
            String[] storageValues = storageStr.toString().split(",");
            String[] colorValues = colorStr.toString().split(",");

            ArrayList<ProductDetail> productDetails = new ArrayList<>();
            for (String storage : storageValues) {
                for (String color : colorValues) {
                    ProductDetail detail = new ProductDetail();
                    detail.setScreen(screen);
                    detail.setOs(os);
                    detail.setMainCamera(mainCamera);
                    detail.setSelfieCamera(selfieCamera);
                    detail.setChip(chip);
                    detail.setRam(ram);
                    detail.setStorage(storage.trim());
                    detail.setSim(sim);
                    detail.setBattery(battery);
                    detail.setCharger(charger);
                    detail.setColor(color.trim());
                    productDetails.add(detail);
                }
            }

            ProductDAO dao = new ProductDAO();
            // Lưu sản phẩm vào DB
            int productId = dao.insertProductWithDetails(
                    name, thumbnail, createDate, updateDate,
                    price, description, quantity, discount,
                    categoryId, brandId, productDetails, imagePaths);

            if (productId > 0) {
                request.getSession().setAttribute("successMessage", "Sản phẩm đã được thêm thành công!");
            } else {
                request.getSession().setAttribute("errorMessage", "Có lỗi khi thêm sản phẩm vào cơ sở dữ liệu");
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doPost: {0}", e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Lỗi khi thêm sản phẩm: " + e.getMessage());
        }
        response.sendRedirect("products");
    }

    public static final String UPLOAD_DIRECTORY = "D:/JavaProject/SWP391_HexTech/HexTech/web/img_svg/0_picProduct";
    public static String uploadFile(Part part) throws IOException {
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (fileName.isEmpty()) {
            return null;
        }
        File uploadDir = new File(UPLOAD_DIRECTORY);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
        part.write(filePath);
        return fileName;
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
            LOGGER.log(Level.SEVERE, "Error deleting product: {0}", e.getMessage());
            request.setAttribute("mess", "Invalid Product ID!");
        }
    }

    private void getAllProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("productID"));
        ProductDAO p = new ProductDAO();
        Products pr = p.findProductByID(id);
        List<ProductDetail> list = p.findProductDetailsByID(id);

        LOGGER.log(Level.INFO, "Found product: {0}", pr);
        LOGGER.log(Level.INFO, "Found product details: {0}", list != null ? list.size() : 0);

        request.setAttribute("product", pr);
        request.setAttribute("productDetail", list);
    }
}
