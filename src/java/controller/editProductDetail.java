package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDetail;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.gson.Gson;

public class editProductDetail extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(editProductDetail.class.getName());

    /**
     * Handles the HTTP <code>GET</code> method.
     * Get product detail for editing
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            String action = request.getParameter("action");
            LOGGER.log(Level.INFO, "GET request received with action: {0}", action);
            
            if ("get".equals(action)) {
                String detailIdStr = request.getParameter("detailId");
                if (detailIdStr == null || detailIdStr.isEmpty()) {
                    response.getWriter().write("{\"success\": false, \"message\": \"Detail ID is required\"}");
                    return;
                }
                
                int detailId = Integer.parseInt(detailIdStr);
                ProductDAO dao = new ProductDAO();
                ProductDetail detail = dao.getNewProductDetailById(detailId);
                
                if (detail == null) {
                    response.getWriter().write("{\"success\": false, \"message\": \"Product detail not found\"}");
                    return;
                }
                
                Gson gson = new Gson();
                String json = gson.toJson(detail);
                response.getWriter().write("{\"success\": true, \"data\": " + json + "}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"Invalid action\"}");
            }
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid detail ID format: {0}", e.getMessage());
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid detail ID\"}");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting product detail: {0}", e.getMessage());
            response.getWriter().write("{\"success\": false, \"message\": \"Error: " + e.getMessage() + "\"}");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * Add, update or delete product detail
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            String action = request.getParameter("action");
            LOGGER.log(Level.INFO, "POST request received with action: {0}", action);
            
            // Debug: log all parameters
            LOGGER.log(Level.INFO, "All parameters:");
            request.getParameterMap().forEach((key, values) -> {
                LOGGER.log(Level.INFO, "  {0} = {1}", new Object[]{key, String.join(", ", values)});
            });
            
            ProductDAO dao = new ProductDAO();
            
            if ("add".equals(action)) {
                handleAddDetail(request, response, dao);
            } else if ("update".equals(action)) {
                handleUpdateDetail(request, response, dao);
            } else if ("delete".equals(action)) {
                handleDeleteDetail(request, response, dao);
            } else {
                LOGGER.log(Level.WARNING, "Invalid action received: {0}", action);
                response.getWriter().write("{\"success\": false, \"message\": \"Invalid action: " + action + "\"}");
            }
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doPost: {0}", e.getMessage());
            response.getWriter().write("{\"success\": false, \"message\": \"Error: " + e.getMessage() + "\"}");
        }
    }
    
    /**
     * Handle adding new product detail
     */
    private void handleAddDetail(HttpServletRequest request, HttpServletResponse response, ProductDAO dao) 
            throws IOException {
        try {
            String productIdStr = request.getParameter("productId");
            LOGGER.log(Level.INFO, "Adding detail for productId: {0}", productIdStr);
            
            if (productIdStr == null || productIdStr.trim().isEmpty()) {
                response.getWriter().write("{\"success\": false, \"message\": \"Product ID is required\"}");
                return;
            }
            
            int productId = Integer.parseInt(productIdStr);
            
            ProductDetail detail = new ProductDetail();
            detail.setProductID(productId);
            detail.setScreen(request.getParameter("screen"));
            detail.setOs(request.getParameter("os"));
            detail.setMainCamera(request.getParameter("mainCamera"));
            detail.setSelfieCamera(request.getParameter("selfieCamera"));
            detail.setChip(request.getParameter("chip"));
            detail.setRam(request.getParameter("ram"));
            detail.setStorage(request.getParameter("storage"));
            detail.setSim(request.getParameter("sim"));
            detail.setBattery(request.getParameter("battery"));
            detail.setCharger(request.getParameter("charger"));
            detail.setColor(request.getParameter("color"));
            
            LOGGER.log(Level.INFO, "ProductDetail created - Color: {0}, Storage: {1}", 
                      new Object[]{detail.getColor(), detail.getStorage()});
            
            boolean success = dao.insertNewProductDetail(detail);
            
            if (success) {
                LOGGER.log(Level.INFO, "ProductDetail added successfully");
                response.getWriter().write("{\"success\": true, \"message\": \"Product detail added successfully\"}");
            } else {
                LOGGER.log(Level.WARNING, "Failed to add ProductDetail");
                response.getWriter().write("{\"success\": false, \"message\": \"Failed to add product detail\"}");
            }
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid product ID: {0}", e.getMessage());
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid product ID\"}");
        }
    }
    
    /**
     * Handle updating product detail
     */
    private void handleUpdateDetail(HttpServletRequest request, HttpServletResponse response, ProductDAO dao) 
            throws IOException {
        try {
            String detailIdStr = request.getParameter("detailId");
            String productIdStr = request.getParameter("productId");
            LOGGER.log(Level.INFO, "Updating detail - detailId: {0}, productId: {1}", 
                      new Object[]{detailIdStr, productIdStr});
            
            int detailId = Integer.parseInt(detailIdStr);
            int productId = Integer.parseInt(productIdStr);
            
            ProductDetail detail = new ProductDetail();
            detail.setID(detailId);
            detail.setProductID(productId);
            detail.setScreen(request.getParameter("screen"));
            detail.setOs(request.getParameter("os"));
            detail.setMainCamera(request.getParameter("mainCamera"));
            detail.setSelfieCamera(request.getParameter("selfieCamera"));
            detail.setChip(request.getParameter("chip"));
            detail.setRam(request.getParameter("ram"));
            detail.setStorage(request.getParameter("storage"));
            detail.setSim(request.getParameter("sim"));
            detail.setBattery(request.getParameter("battery"));
            detail.setCharger(request.getParameter("charger"));
            detail.setColor(request.getParameter("color"));
            
            LOGGER.log(Level.INFO, "ProductDetail updated - Color: {0}, Storage: {1}", 
                      new Object[]{detail.getColor(), detail.getStorage()});
            
            boolean success = dao.updateNewProductDetail(detail);
            
            if (success) {
                LOGGER.log(Level.INFO, "ProductDetail updated successfully");
                response.getWriter().write("{\"success\": true, \"message\": \"Product detail updated successfully\"}");
            } else {
                LOGGER.log(Level.WARNING, "Failed to update ProductDetail");
                response.getWriter().write("{\"success\": false, \"message\": \"Failed to update product detail\"}");
            }
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid ID format: {0}", e.getMessage());
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid ID format\"}");
        }
    }
    
    /**
     * Handle deleting product detail
     */
    private void handleDeleteDetail(HttpServletRequest request, HttpServletResponse response, ProductDAO dao) 
            throws IOException {
        try {
            String detailIdStr = request.getParameter("detailId");
            LOGGER.log(Level.INFO, "Deleting detail with ID: {0}", detailIdStr);
            
            int detailId = Integer.parseInt(detailIdStr);
            
            boolean success = dao.deleteNewProductDetail(detailId);
            
            if (success) {
                LOGGER.log(Level.INFO, "ProductDetail deleted successfully");
                response.getWriter().write("{\"success\": true, \"message\": \"Product detail deleted successfully\"}");
            } else {
                LOGGER.log(Level.WARNING, "Failed to delete ProductDetail");
                response.getWriter().write("{\"success\": false, \"message\": \"Failed to delete product detail\"}");
            }
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid detail ID: {0}", e.getMessage());
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid detail ID\"}");
        }
    }

    @Override
    public String getServletInfo() {
        return "Edit Product Detail Controller";
    }
}
