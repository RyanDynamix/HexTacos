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
import model.ProductDetail;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class addProduct extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(addProduct.class.getName());

    /**
     * Handles the HTTP <code>GET</code> method.
     * Forward to add-products.jsp page
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "GET request received to addProduct servlet - Method: {0}", request.getMethod());
        try {
            // Forward to add product page
            request.getRequestDispatcher("add-products.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doGet: {0}", e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error loading add product page: " + e.getMessage());
            response.sendRedirect("products");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * Process product insertion
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "POST request received to addProduct servlet - Method: {0}", request.getMethod());
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            LOGGER.log(Level.INFO, "Starting to process form data...");
            LOGGER.log(Level.INFO, "Request content type: {0}", request.getContentType());
            LOGGER.log(Level.INFO, "Request method: {0}", request.getMethod());
            
            // Use standard getParameter since we removed multipart
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

            LOGGER.log(Level.INFO, "Form parameters extracted - name: {0}, price: {1}, brand: {2}, category: {3}", 
                      new Object[]{name, priceStr, hangPrStr, loaiPrStr});

            // Get dynamic ProductDetail forms data
            String colorsStr = request.getParameter("colors");
            String storagesStr = request.getParameter("storages");
            LOGGER.log(Level.INFO, "Colors: {0}, Storages: {1}", new Object[]{colorsStr, storagesStr});

            // Validate required fields
            if (name == null || name.isEmpty() || created_at == null || created_at.isEmpty() ||
                updated_at == null || updated_at.isEmpty() || priceStr == null || priceStr.isEmpty() ||
                quantityStr == null || quantityStr.isEmpty() || hangPrStr == null || hangPrStr.isEmpty() ||
                loaiPrStr == null || loaiPrStr.isEmpty()) {
                LOGGER.log(Level.WARNING, "Missing required fields");
                request.setAttribute("errorMessage", "Thiếu thông tin bắt buộc");
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
                return;
            }

            // Parse numeric fields with error handling
            double price, discount = 0;
            int quantity, brandId, categoryId;
            Date createDate, updateDate;
            
            try {
                LOGGER.log(Level.INFO, "Parsing numeric fields...");
                price = Double.parseDouble(priceStr);
                quantity = Integer.parseInt(quantityStr);
                if (discountStr != null && !discountStr.isEmpty()) {
                    discount = Double.parseDouble(discountStr);
                }
                brandId = Integer.parseInt(hangPrStr);
                categoryId = Integer.parseInt(loaiPrStr);
                createDate = Date.valueOf(created_at);
                updateDate = Date.valueOf(updated_at);
                LOGGER.log(Level.INFO, "Numeric fields parsed successfully");
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "NumberFormatException: {0}", e.getMessage());
                request.setAttribute("errorMessage", "Dữ liệu không hợp lệ: " + e.getMessage());
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
                return;
            } catch (IllegalArgumentException e) {
                LOGGER.log(Level.SEVERE, "IllegalArgumentException: {0}", e.getMessage());
                request.setAttribute("errorMessage", "Dữ liệu ngày không hợp lệ: " + e.getMessage());
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
                return;
            }

            // Handle image names (text input instead of file upload)
            String thumbnail = request.getParameter("thumbnail");
            String imagesStr = request.getParameter("images");
            List<String> imagePaths = new ArrayList<>();
            
            LOGGER.log(Level.INFO, "Processing image names...");
            
            // Convert thumbnail name to database path format
            if (thumbnail != null && !thumbnail.trim().isEmpty()) {
                thumbnail = "./img_svg/0_picProduct/" + thumbnail.trim();
                LOGGER.log(Level.INFO, "Thumbnail path: {0}", thumbnail);
            }
            
            // Process additional images
            if (imagesStr != null && !imagesStr.trim().isEmpty()) {
                String[] imageNames = imagesStr.split(",");
                for (String imageName : imageNames) {
                    String trimmedName = imageName.trim();
                    if (!trimmedName.isEmpty()) {
                        String imagePath = "./img_svg/0_picProduct/" + trimmedName;
                        imagePaths.add(imagePath);
                        LOGGER.log(Level.INFO, "Additional image path: {0}", imagePath);
                    }
                }
            }
            LOGGER.log(Level.INFO, "Image processing completed. Total additional images: {0}", imagePaths.size());

            ProductDAO dao = new ProductDAO();
            
            // Step 1: Insert Product only
            LOGGER.log(Level.INFO, "Inserting product...");
            int productId = insertProduct(dao, name, thumbnail, createDate, updateDate, 
                                        price, description, quantity, discount);
            
            if (productId <= 0) {
                LOGGER.log(Level.WARNING, "Failed to insert product, productId: {0}", productId);
                request.setAttribute("errorMessage", "Không thể thêm sản phẩm vào cơ sở dữ liệu");
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
                return;
            }
            LOGGER.log(Level.INFO, "Product inserted successfully with ID: {0}", productId);
            
            // Step 2: Insert Product Categories (brand và category)
            LOGGER.log(Level.INFO, "Inserting product categories...");
            insertProductCategories(dao, productId, categoryId, brandId);
            
            // Step 3: Insert Product Details - Generate all color-storage combinations
            LOGGER.log(Level.INFO, "Inserting product details...");
            insertProductDetails(dao, productId, colorsStr, storagesStr, screen, os, mainCamera, selfieCamera, chip, ram, sim, battery, charger);
            
            // Step 4: Insert Galleries (multiple images)
            LOGGER.log(Level.INFO, "Inserting galleries...");
            insertGalleries(dao, productId, imagePaths);

            LOGGER.log(Level.INFO, "Product creation completed successfully. Product ID: {0}", productId);
            request.getSession().setAttribute("successMessage", "Sản phẩm đã được thêm thành công!");

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doPost: {0}", e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Lỗi khi thêm sản phẩm: " + e.getMessage());
        }
        response.sendRedirect("products");
    }

    /**
     * Insert Product only
     */
    private int insertProduct(ProductDAO dao, String name, String thumbnail, Date createDate, 
                             Date updateDate, double price, String description, int quantity, double discount) {
        try {
            return dao.insertProduct(name, thumbnail, createDate, updateDate, price, description, quantity, discount);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting product: {0}", e.getMessage());
            return 0;
        }
    }
    
    /**
     * Insert Product Categories (brand and category)
     */
    private void insertProductCategories(ProductDAO dao, int productId, int categoryId, int brandId) {
        try {
            dao.insertPCategory(productId, categoryId);
            dao.insertPCategory(productId, brandId);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting product categories: {0}", e.getMessage());
        }
    }
    
    
    /**
     * Insert Product Details - Generate all color-storage combinations and insert directly
     */
    private void insertProductDetails(ProductDAO dao, int productId, String colorsStr, String storagesStr, 
                                    String screen, String os, String mainCamera, String selfieCamera, 
                                    String chip, String ram, String sim, String battery, String charger) {
        try {
            if (colorsStr == null || colorsStr.trim().isEmpty() || 
                storagesStr == null || storagesStr.trim().isEmpty()) {
                LOGGER.log(Level.WARNING, "Colors or storages is empty");
                return;
            }
            
            // Parse colors and storages (each line is one value)
            String[] colors = colorsStr.trim().split("\\r?\\n");
            String[] storages = storagesStr.trim().split("\\r?\\n");
            
            LOGGER.log(Level.INFO, "Generating {0} colors × {1} storages = {2} combinations", 
                      new Object[]{colors.length, storages.length, colors.length * storages.length});
            
            // Generate all color-storage combinations and insert directly
            int count = 0;
            for (String color : colors) {
                color = color.trim();
                if (color.isEmpty()) continue;
                
                for (String storage : storages) {
                    storage = storage.trim();
                    if (storage.isEmpty()) continue;
                    
                    // Insert ProductDetail directly using the new method
                    dao.insertProductdetail(productId, screen, os, mainCamera, selfieCamera, 
                                          chip, ram, storage, sim, battery, charger, color);
                    count++;
                    LOGGER.log(Level.INFO, "Inserted ProductDetail {0}: color={1}, storage={2}", 
                              new Object[]{count, color, storage});
                }
            }
            
            LOGGER.log(Level.INFO, "ProductDetail insertion completed. Total: {0} items", count);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting product details: {0}", e.getMessage());
        }
    }
    
    /**
     * Insert Galleries (multiple images)
     */
    private void insertGalleries(ProductDAO dao, int productId, List<String> imagePaths) {
        try {
            if (imagePaths != null && !imagePaths.isEmpty()) {
                for (String imagePath : imagePaths) {
                    dao.insertGalleries(productId, imagePath);
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting galleries: {0}", e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Add Product Controller";
    }
}
