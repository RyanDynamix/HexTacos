package dal;

import java.sql.*;
import java.util.*;
import model.Feedbacks;

public class FeedbackDAO extends DBContext {

    private Connection connection;

    public FeedbackDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Feedbacks> getAllFeedbacks() {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedbacks ORDER BY id DESC"; // bỏ createdDate
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Feedbacks(
                        rs.getInt("id"),
                        rs.getInt("productID"),
                        rs.getInt("userID"),
                        rs.getString("note"),
                        rs.getInt("rating")
                // bỏ createdDate
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insertFeedback(Feedbacks f) {
        String sql = "INSERT INTO Feedbacks (productID, userID, note, rating) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, f.getProductID());
            ps.setInt(2, f.getUserID());
            ps.setString(3, f.getNote());
            ps.setInt(4, f.getRating());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateFeedback(Feedbacks f) {
        String sql = "UPDATE Feedbacks SET note=?, rating=? WHERE id=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, f.getNote());
            ps.setInt(2, f.getRating());
            ps.setInt(3, f.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteFeedback(int id) {
        String sql = "DELETE FROM Feedbacks WHERE id=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Feedbacks getFeedbackById(int id) {
        String sql = "SELECT * FROM Feedbacks WHERE id=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Feedbacks(
                        rs.getInt("id"),
                        rs.getInt("productID"),
                        rs.getInt("userID"),
                        rs.getString("note"),
                        rs.getInt("rating")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
return null;
    }

    public List<Feedbacks> getFeedbacksByProductId(int productId) {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedbacks WHERE productID = ? ORDER BY id DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedbacks(
                        rs.getInt("id"),
                        rs.getInt("productID"),
                        rs.getInt("userID"),
                        rs.getString("note"),
                        rs.getInt("rating")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}