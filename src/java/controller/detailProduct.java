package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import model.Categories;
import model.ProductDetail;
import model.Products;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(maxFileSize = 16177215)
public class detailProduct extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(detailProduct.class.getName());
    private static final String UPLOAD_DIRECTORY = "D:\\JavaProject\\SWP391_HexTech\\HexTech\\web\\img_svg\\0_picProduct";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "POST request received to adminProduct servlet");

        try {
            // Lấy các trường text bằng getParameter (OK với multipart)
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String created_at = request.getParameter("created_at");
            String updated_at = request.getParameter("updated_at");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String discountStr = request.getParameter("discount");
            String hangPrStr = request.getParameter("hangPr");
            String loaiPrStr = request.getParameter("loaiPr");
            String screen = request.getParameter("screen");
            String os = request.getParameter("os");
            String mainCamera = request.getParameter("mCam");
            String selfieCamera = request.getParameter("sCam");
            String chip = request.getParameter("chip");
            String ram = request.getParameter("ram");
            String sim = request.getParameter("sim");
            String battery = request.getParameter("pin");
            String charger = request.getParameter("sac");
            String storageStr = request.getParameter("storage");
            String colorStr = request.getParameter("colors");

            System.out.println("name=" + name);
            System.out.println("created_at=" + created_at);
            System.out.println("updated_at=" + updated_at);

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
            String[] storageValues = (storageStr != null && !storageStr.trim().isEmpty()) ? storageStr.split("\\s*,\\s*") : new String[]{"N/A"};
            String[] colorValues = (colorStr != null && !colorStr.trim().isEmpty()) ? colorStr.split("\\s*,\\s*") : new String[]{"N/A"};

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
                    detail.setStorage(storage);
                    detail.setSim(sim);
                    detail.setBattery(battery);
                    detail.setCharger(charger);
                    detail.setColor(color);
                    productDetails.add(detail);
                }
            }

            ProductDAO dao = new ProductDAO();
            String categoryName = dao.getCategoryNameById(brandId);
            String thumbnailPath = dao.uploadFile(thumbnailPart, categoryName);

            ArrayList<String> additionalImagePaths = new ArrayList<>(imagePaths);
            int productId = dao.insertProductWithDetails(
                    name, thumbnailPath, createDate, updateDate,
                    price, description, quantity, discount,
                    categoryId, brandId, productDetails, additionalImagePaths);

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
} 