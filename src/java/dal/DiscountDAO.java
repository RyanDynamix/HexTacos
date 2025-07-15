package dal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.Discounts;

public class DiscountDAO extends DBContext {
    
    public List<Discounts> getAllDiscounts() {
        List<Discounts> discountList = new ArrayList<>();
        String sql = "SELECT * FROM Discounts ORDER BY createdAt DESC";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Discounts discount = mapResultSetToDiscount(rs);
                discountList.add(discount);
            }
            
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error in getAllDiscounts: " + e.getMessage());
        }
        return discountList;
    }
    
    public List<Discounts> getActiveDiscounts() {
        List<Discounts> discountList = new ArrayList<>();
        String sql = "SELECT * FROM Discounts WHERE status = 1 AND endDate >= GETDATE() ORDER BY createdAt DESC";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Discounts discount = mapResultSetToDiscount(rs);
                discountList.add(discount);
            }
            
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error in getActiveDiscounts: " + e.getMessage());
        }
        return discountList;
    }
    
    public Discounts getDiscountById(int discountId) {
        String sql = "SELECT * FROM Discounts WHERE discountID = ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, discountId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Discounts discount = mapResultSetToDiscount(rs);
                rs.close();
                ps.close();
                return discount;
            }
            
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error in getDiscountById: " + e.getMessage());
        }
        return null;
    }
    
    public Discounts getDiscountByCode(String code) {
        String sql = "SELECT * FROM Discounts WHERE code = ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Discounts discount = mapResultSetToDiscount(rs);
                rs.close();
                ps.close();
                return discount;
            }
            
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error in getDiscountByCode: " + e.getMessage());
        }
        return null;
    }
    
    public boolean addDiscount(Discounts discount) {
        String sql = "INSERT INTO Discounts (code, name, type, value, minOrderValue, quantity, startDate, endDate, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setString(1, discount.getCode());
            ps.setString(2, discount.getName());
            ps.setString(3, discount.getType());
            ps.setBigDecimal(4, discount.getValue());
            ps.setBigDecimal(5, discount.getMinOrderValue());
            ps.setInt(6, discount.getQuantity());
            ps.setTimestamp(7, new Timestamp(discount.getStartDate().getTime()));
            ps.setTimestamp(8, new Timestamp(discount.getEndDate().getTime()));
            ps.setBoolean(9, discount.isStatus());
            
            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.out.println("Error in addDiscount: " + e.getMessage());
            return false;
        }
    }
    
    public boolean updateDiscount(Discounts discount) {
        String sql = "UPDATE Discounts SET code = ?, name = ?, type = ?, value = ?, minOrderValue = ?, "
                + "quantity = ?, startDate = ?, endDate = ?, status = ? WHERE discountID = ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setString(1, discount.getCode());
            ps.setString(2, discount.getName());
            ps.setString(3, discount.getType());
            ps.setBigDecimal(4, discount.getValue());
            ps.setBigDecimal(5, discount.getMinOrderValue());
            ps.setInt(6, discount.getQuantity());
            ps.setTimestamp(7, new Timestamp(discount.getStartDate().getTime()));
            ps.setTimestamp(8, new Timestamp(discount.getEndDate().getTime()));
            ps.setBoolean(9, discount.isStatus());
            ps.setInt(10, discount.getDiscountID());
            
            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.out.println("Error in updateDiscount: " + e.getMessage());
            return false;
        }
    }
    
    public boolean deactivateDiscount(int discountId) {
        String sql = "UPDATE Discounts SET status = 0 WHERE discountID = ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, discountId);
            
            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.out.println("Error in deactivateDiscount: " + e.getMessage());
            return false;
        }
    }
    
    public boolean activateDiscount(int discountId) {
        String sql = "UPDATE Discounts SET status = 1 WHERE discountID = ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, discountId);
            
            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.out.println("Error in activateDiscount: " + e.getMessage());
            return false;
        }
    }
    
    public boolean isCodeUnique(String code) {
        String sql = "SELECT COUNT(*) FROM Discounts WHERE code = ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                boolean isUnique = rs.getInt(1) == 0;
                rs.close();
                ps.close();
                return isUnique;
            }
            
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error in isCodeUnique: " + e.getMessage());
        }
        return false;
    }
    
    public boolean isCodeUniqueExcept(String code, int discountId) {
        String sql = "SELECT COUNT(*) FROM Discounts WHERE code = ? AND discountID != ?";
        
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ps.setInt(2, discountId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                boolean isUnique = rs.getInt(1) == 0;
                rs.close();
                ps.close();
                return isUnique;
            }
            
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error in isCodeUniqueExcept: " + e.getMessage());
        }
        return false;
    }
    
    public Date calculateEndDate(Date startDate, int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);
        calendar.add(Calendar.DAY_OF_MONTH, days);
        return calendar.getTime();
    }
    
    private Discounts mapResultSetToDiscount(ResultSet rs) throws SQLException {
        int discountId = rs.getInt("discountID");
        String code = rs.getString("code");
        String name = rs.getString("name");
        String type = rs.getString("type");
        BigDecimal value = rs.getBigDecimal("value");
        BigDecimal minOrderValue = rs.getBigDecimal("minOrderValue");
        int quantity = rs.getInt("quantity");
        Date startDate = rs.getTimestamp("startDate");
        Date endDate = rs.getTimestamp("endDate");
        boolean status = rs.getBoolean("status");
        Date createdAt = rs.getTimestamp("createdAt");
        
        return new Discounts(discountId, code, name, type, value, minOrderValue, 
                            quantity, startDate, endDate, status, createdAt);
    }
} 