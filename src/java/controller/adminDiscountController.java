package controller;

import dal.DiscountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Discounts;

public class adminDiscountController extends HttpServlet {
    private final DiscountDAO discountDAO = new DiscountDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        
        switch (action) {
            case "add":
                // Forward to add discount page
                request.getRequestDispatcher("add-discount.jsp").forward(request, response);
                break;
            case "edit":
                // Get discount by ID and forward to edit page
                int discountId = Integer.parseInt(request.getParameter("id"));
                Discounts discount = discountDAO.getDiscountById(discountId);
                request.setAttribute("discount", discount);
                request.getRequestDispatcher("edit-discount.jsp").forward(request, response);
                break;
            case "deactivate":
                // Deactivate discount
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = discountDAO.deactivateDiscount(id);
                if (success) {
                    request.setAttribute("successMessage", "Mã giảm giá đã được hủy kích hoạt thành công!");
                } else {
                    request.setAttribute("errorMessage", "Không thể hủy kích hoạt mã giảm giá!");
                }
                // Fall through to list all discounts
                List<Discounts> discounts = discountDAO.getAllDiscounts();
                request.setAttribute("discounts", discounts);
                request.getRequestDispatcher("discounts.jsp").forward(request, response);
                break;
            case "activate":
                // Activate discount
                int activateId = Integer.parseInt(request.getParameter("id"));
                boolean activateSuccess = discountDAO.activateDiscount(activateId);
                if (activateSuccess) {
                    request.setAttribute("successMessage", "Mã giảm giá đã được kích hoạt lại thành công!");
                } else {
                    request.setAttribute("errorMessage", "Không thể kích hoạt lại mã giảm giá!");
                }
                // List all discounts
                List<Discounts> discountsList = discountDAO.getAllDiscounts();
                request.setAttribute("discounts", discountsList);
                request.getRequestDispatcher("discounts.jsp").forward(request, response);
                break;
            default:
                // List all discounts
                List<Discounts> allDiscounts = discountDAO.getAllDiscounts();
                request.setAttribute("discounts", allDiscounts);
                request.getRequestDispatcher("discounts.jsp").forward(request, response);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        
        switch (action) {
            case "add":
                addDiscount(request, response);
                break;
            case "edit":
                updateDiscount(request, response);
                break;
            default:
                response.sendRedirect("adminDiscount");
                break;
        }
    }
    
    private void addDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form parameters
            String code = request.getParameter("code").toUpperCase();
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            BigDecimal value = new BigDecimal(request.getParameter("value"));
            BigDecimal minOrderValue = new BigDecimal(request.getParameter("minOrderValue"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Parse start date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(request.getParameter("startDate"));
            
            // Calculate end date based on duration
            int duration = Integer.parseInt(request.getParameter("duration"));
            Date endDate = discountDAO.calculateEndDate(startDate, duration);
            
            // Validate code uniqueness
            if (!discountDAO.isCodeUnique(code)) {
                request.setAttribute("errorMessage", "Mã giảm giá đã tồn tại!");
                request.getRequestDispatcher("add-discount.jsp").forward(request, response);
                return;
            }
            
            // Create discount object
            Discounts discount = new Discounts(code, name, type, value, minOrderValue, quantity, startDate, endDate, true);
            
            // Save to database
            boolean success = discountDAO.addDiscount(discount);
            
            if (success) {
                // Redirect with success message
                request.setAttribute("successMessage", "Mã giảm giá đã được thêm thành công!");
                List<Discounts> discounts = discountDAO.getAllDiscounts();
                request.setAttribute("discounts", discounts);
                request.getRequestDispatcher("discounts.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không thể thêm mã giảm giá!");
                request.getRequestDispatcher("add-discount.jsp").forward(request, response);
            }
            
        } catch (ParseException | NumberFormatException e) {
            request.setAttribute("errorMessage", "Lỗi dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("add-discount.jsp").forward(request, response);
        }
    }
    
    private void updateDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form parameters
            int discountId = Integer.parseInt(request.getParameter("discountID"));
            String code = request.getParameter("code").toUpperCase();
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            BigDecimal value = new BigDecimal(request.getParameter("value"));
            BigDecimal minOrderValue = new BigDecimal(request.getParameter("minOrderValue"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            
            // Parse start date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(request.getParameter("startDate"));
            
            // Calculate end date based on duration
            int duration = Integer.parseInt(request.getParameter("duration"));
            Date endDate = discountDAO.calculateEndDate(startDate, duration);
            
            // Get existing discount
            Discounts existingDiscount = discountDAO.getDiscountById(discountId);
            
            // Validate code uniqueness (only if code has changed)
            if (!code.equals(existingDiscount.getCode()) && !discountDAO.isCodeUniqueExcept(code, discountId)) {
                request.setAttribute("errorMessage", "Mã giảm giá đã tồn tại!");
                request.setAttribute("discount", existingDiscount);
                request.getRequestDispatcher("edit-discount.jsp").forward(request, response);
                return;
            }
            
            // Create updated discount object
            Discounts discount = new Discounts(discountId, code, name, type, value, minOrderValue, 
                                              quantity, startDate, endDate, status, existingDiscount.getCreatedAt());
            
            // Update in database
            boolean success = discountDAO.updateDiscount(discount);
            
            if (success) {
                // Redirect with success message
                request.setAttribute("successMessage", "Mã giảm giá đã được cập nhật thành công!");
                List<Discounts> discounts = discountDAO.getAllDiscounts();
                request.setAttribute("discounts", discounts);
                request.getRequestDispatcher("discounts.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không thể cập nhật mã giảm giá!");
                request.setAttribute("discount", existingDiscount);
                request.getRequestDispatcher("edit-discount.jsp").forward(request, response);
            }
            
        } catch (ParseException | NumberFormatException e) {
            int discountId = Integer.parseInt(request.getParameter("discountID"));
            Discounts existingDiscount = discountDAO.getDiscountById(discountId);
            request.setAttribute("errorMessage", "Lỗi dữ liệu: " + e.getMessage());
            request.setAttribute("discount", existingDiscount);
            request.getRequestDispatcher("edit-discount.jsp").forward(request, response);
        }
    }
} 