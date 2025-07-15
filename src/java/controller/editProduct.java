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
import model.Categories;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class editProduct extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(editProduct.class.getName());

    /**
     * Handles the HTTP <code>GET</code> method.
     * Load product data for editing
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "GET request received to editProduct servlet");
        
        try {
            String productIdStr = request.getParameter("id");
            if (productIdStr == null || productIdStr.isEmpty()) {
                LOGGER.log(Level.WARNING, "Product ID is missing");
                request.getSession().setAttribute("errorMessage", "Product ID is required");
                response.sendRedirect("products");
                return;
            }
            
            int productId = Integer.parseInt(productIdStr);
            LOGGER.log(Level.INFO, "Loading product data for ID: {0}", productId);
            
            ProductDAO dao = new ProductDAO();
            
            // Get product basic info
            Products product = dao.findProductByID(productId);
            if (product == null) {
                LOGGER.log(Level.WARNING, "Product not found with ID: {0}", productId);
                request.getSession().setAttribute("errorMessage", "Product not found");
                response.sendRedirect("products");
                return;
            }
            
            // Get product details (all color-storage combinations)
            List<ProductDetail> productDetails = dao.findProductDetailsByID(productId);
            LOGGER.log(Level.INFO, "Found {0} ProductDetails for product ID {1}", 
                      new Object[]{productDetails.size(), productId});
            
            LOGGER.log(Level.INFO, "Product data loaded: {0} details", 
                      new Object[]{productDetails.size()});
            
            // Set attributes for JSP
            request.setAttribute("product", product);
            request.setAttribute("productDetails", productDetails);
         
            
            // Forward to edit page
            request.getRequestDispatcher("/Admin/edit-products.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid product ID format: {0}", e.getMessage());
            request.getSession().setAttribute("errorMessage", "Invalid product ID");
            response.sendRedirect("products");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doGet: {0}", e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error loading product: " + e.getMessage());
            response.sendRedirect("products");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * Process product update
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "POST request received to editProduct servlet");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            String action = request.getParameter("action");
            
            if ("updateProduct".equals(action)) {
                handleUpdateProduct(request, response);
            } else {
                // Original logic for updating product with details
                handleUpdateProductWithDetails(request, response);
            }
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doPost: {0}", e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error updating product: " + e.getMessage());
            response.sendRedirect("products");
        }
    }
    
    /**
     * Handle updating basic product information only
     */
    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get product ID
            String productIdStr = request.getParameter("productId");
            if (productIdStr == null || productIdStr.isEmpty()) {
                request.getSession().setAttribute("errorMessage", "Product ID is required");
                response.sendRedirect("products");
                return;
            }
            
            int productId = Integer.parseInt(productIdStr);
            LOGGER.log(Level.INFO, "Updating basic product info for ID: {0}", productId);
            
            // Get form data
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String created_at = request.getParameter("created_at");
            String updated_at = request.getParameter("updated_at");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String discountStr = request.getParameter("discount");
            
            // Validate required fields
            if (name == null || name.trim().isEmpty() || 
                priceStr == null || priceStr.trim().isEmpty() ||
                quantityStr == null || quantityStr.trim().isEmpty()) {
                request.getSession().setAttribute("errorMessage", "Name, price, and quantity are required");
                response.sendRedirect("editProduct?id=" + productId);
                return;
            }
            
            // Parse numeric values - remove thousand separators
            String cleanPriceStr = priceStr.replace(".", "").replace(",", "");
            String cleanDiscountStr = (discountStr != null && !discountStr.trim().isEmpty()) ? 
                                     discountStr.replace(".", "").replace(",", "") : "0";
            
            double price = Double.parseDouble(cleanPriceStr);
            int quantity = Integer.parseInt(quantityStr);
            double discount = Double.parseDouble(cleanDiscountStr);
            
            // Create Products object
            Products product = new Products();
            product.setProductID(productId);
            product.setName(name.trim());
            product.setDescription(description != null ? description.trim() : "");
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setDiscount(discount);
            
            // Parse dates
            if (created_at != null && !created_at.trim().isEmpty()) {
                product.setCreated_at(Date.valueOf(created_at));
            }
            if (updated_at != null && !updated_at.trim().isEmpty()) {
                product.setUpdated_at(Date.valueOf(updated_at));
            } else {
                // Set current date as updated_at
                product.setUpdated_at(new Date(System.currentTimeMillis()));
            }
            
            // Update in database
            ProductDAO dao = new ProductDAO();
            boolean success = dao.updateNewProduct(product);
            
            if (success) {
                LOGGER.log(Level.INFO, "Successfully updated product ID: {0}", productId);
                request.getSession().setAttribute("successMessage", "Product updated successfully");
            } else {
                LOGGER.log(Level.WARNING, "Failed to update product ID: {0}", productId);
                request.getSession().setAttribute("errorMessage", "Failed to update product");
            }
            
            // Redirect back to edit page
            response.sendRedirect("editProduct?id=" + productId);
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid number format: {0}", e.getMessage());
            request.getSession().setAttribute("errorMessage", "Invalid number format in form data");
            response.sendRedirect("products");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating product: {0}", e.getMessage());
            request.getSession().setAttribute("errorMessage", "Error updating product: " + e.getMessage());
            response.sendRedirect("products");
        }
    }
    
    /**
     * Handle updating product with all details (original logic)
     */
    private void handleUpdateProductWithDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "Using original update logic");
        request.getSession().setAttribute("errorMessage", "This feature is not yet implemented");
        response.sendRedirect("products");
    }

    @Override
    public String getServletInfo() {
        return "Edit Product Controller";
    }
}
