package dal;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Roles;
import model.Users;

public class UserDAO extends DBContext {

    public Users findByEmailPassword(String email, String password) {
        //- connect w/database
        connection = getConnection();
        //- Chuẩn bị câu lệnh sql
        String sql = "SELECT [userID]\n"
                + "      ,[fullName]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[phone]\n"
                + "      ,[address]\n"
                + "      ,[roleID]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Users] where [email] = ? and [password] = ?";
        try {
            //- tạo đối tượng PrepareStatement
            preStatement = connection.prepareStatement(sql);
            //- Set parameter (optional)
            preStatement.setObject(1, email);
            preStatement.setObject(2, password);
            //- Thực thi câu lệnh
            resultSet = preStatement.executeQuery();
            //- Trả về kết quả
            if (resultSet.next()) {
                String fullname_found = resultSet.getString("fullname").trim();
                String email_found = resultSet.getString("email").trim();
                String password_found = resultSet.getString("password").trim();
                String phone_found = resultSet.getString("phone").trim();
                String address_found = resultSet.getString("address").trim();
                int userID = resultSet.getInt("userID");
                int roleID = resultSet.getInt("roleID");
                boolean status = resultSet.getBoolean("status");

                Users user1 = new Users(userID, fullname_found, email_found, password_found, phone_found, address_found, roleID, status);
                return user1;
            }
        } catch (SQLException e) {
            System.out.println("??findByEmailPassword: " + e.getMessage());
        }
        return null;
    }
    
    public Users findByEmail(String email) {
        //- connect w/database
        connection = getConnection();
        //- Chuẩn bị câu lệnh sql
        String sql = "SELECT [userID]\n"
                + "      ,[fullName]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[phone]\n"
                + "      ,[address]\n"
                + "      ,[roleID]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Users] where [email] = ?";
        try {
            //- tạo đối tượng PrepareStatement
            preStatement = connection.prepareStatement(sql);
            //- Set parameter (optional)
            preStatement.setObject(1, email);
            //- Thực thi câu lệnh
            resultSet = preStatement.executeQuery();
            //- Trả về kết quả
            if (resultSet.next()) {
                String fullname_found = resultSet.getString("fullname").trim();
                String email_found = resultSet.getString("email").trim();
                String password_found = resultSet.getString("password").trim();
                String phone_found = resultSet.getString("phone").trim();
                String address_found = resultSet.getString("address").trim();
                int userID = resultSet.getInt("userID");
                int roleID = resultSet.getInt("roleID");
                boolean status = resultSet.getBoolean("status");

                Users user1 = new Users(userID, fullname_found, email_found, password_found, phone_found, address_found, roleID, status);
                return user1;
            }
        } catch (SQLException e) {
            System.out.println("??findByEmail: " + e.getMessage());
        }
        return null;
    }

    public void updatePasswordUserDB(int userID, String newPassword) {
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     UPDATE [dbo].[Users]
                                   SET [password] = ?
                                 WHERE [userID] = ?""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //- set parameter
            preStatement.setObject(1, newPassword);
            preStatement.setObject(2, userID);
            
            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
        } catch (SQLException e) {
            System.out.println("??updatePasswordUserDB: " + e.getMessage());
        }
    }
    
    public int insertUserDB(Users user) {
        int userID = 0;
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     INSERT INTO [dbo].[Users]
                                ([fullName]
                                ,[email]
                                ,[password]
                                ,[roleID]
                                ,[phone]
                                ,[address]
                                ,[status])
                          VALUES
                                (?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?)""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //- set parameter
            preStatement.setObject(1, user.getFullName());
            preStatement.setObject(2, user.getEmail());
            preStatement.setObject(3, user.getPassword());
            preStatement.setObject(4, user.getRoleID());
            preStatement.setObject(5, user.getPhone());
            preStatement.setObject(6, user.getAddress());
            preStatement.setObject(7, user.isStatus());
            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
            if (resultSet.next()) {
                userID = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("??insertUserDB: " + e.getMessage());
        }
        return userID;
    }
//--------------------------------------------------------------------
//--------------------------------------------------------------------
    public ArrayList<Users> listAll() {
        ArrayList<Users> list = new ArrayList<>();
        connection = getConnection();
        String sql = """
                     SELECT u.userID, u.fullName, u.phone, u.email, u.address, u.roleID, u.status, r.name as roleName
                     FROM [dbo].[Users] u
                     JOIN [dbo].[Roles] r ON u.roleID = r.roleID
                     """;
        try {
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int userID = resultSet.getInt("userID");
                String fullName = resultSet.getString("fullName");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int roleID = resultSet.getInt("roleID");
                boolean status = resultSet.getBoolean("status");
                Users u = new Users(userID, fullName, email, phone, address, roleID, status);
                list.add(u);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {
            System.out.println("??listAll: " + ex.getMessage());
        }
        return null;
    }
    
    public Users getUserById(int id) {
        connection = getConnection();
        String sql = """
                     SELECT *
                     FROM [dbo].[Users] 
                     WHERE [userID] = ? 
                     """;
        try {
            preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, id);
            resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int userID = resultSet.getInt("userID");
                String fullName = resultSet.getString("fullName");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String address = resultSet.getString("address");
                int roleID = resultSet.getInt("roleID");
                boolean status = resultSet.getBoolean("status");
                Users u = new Users(userID, fullName, email, password, phone, address, roleID, status);
                return u;
            }
            connection.close();
        } catch (SQLException ex) {
            System.out.println("??getUserById: " + ex.getMessage());
        }
        return null;
    }
    
    public void insertUser(String fullname, String email, String password, String phone, String address, int roleID, boolean status) {
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     INSERT INTO [dbo].[Users]
                                ([fullName]
                                ,[email]
                                ,[password]
                                ,[phone]
                                ,[address]
                                ,[roleID]
                                ,[status])
                          VALUES
                                (?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?)""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //- set parameter
            preStatement.setObject(1, fullname);
            preStatement.setObject(2, email);
            preStatement.setObject(3, password);
            preStatement.setObject(4, phone);
            preStatement.setObject(5, address);
            preStatement.setObject(6, roleID);
            preStatement.setBoolean(7, status);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
        } catch (SQLException e) {
            System.out.println("??insertUser: " + e.getMessage());
        }
    }

    public void updateUser(int userID, String fullname, String email, String password, String phone, String address, int roleID, boolean status){
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     UPDATE [dbo].[Users]
                     SET [fullName] = ?, [email] = ?, [password] = ?, [phone] = ?, [address] = ?, [roleID] = ?, [status] = ?
                     WHERE [userID] = ?""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, fullname);
            preStatement.setObject(2, email);
            preStatement.setObject(3, password);
            preStatement.setObject(4, phone);
            preStatement.setObject(5, address);
            preStatement.setObject(6, roleID);
            preStatement.setBoolean(7, status);
            preStatement.setObject(8, userID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateUser: " + e.getMessage());
        }
    }

    public void blockUser(int id){
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     UPDATE [dbo].[Users]
                     SET [status] = 0
                     WHERE [userID] = ?""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setInt(1, id);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??blockUser: " + e.getMessage());
        }
    }
    
    public int countTotalUsers() {
        int count = 0;
        connection = getConnection();
        String sql = """
                     SELECT COUNT(*) AS total_users
                     FROM [dbo].[Users]
                     """;
        try {
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("total_users");
            }
        } catch (SQLException e) {
            System.out.println("??countTotalUsers: " + e.getMessage());
        }
        return count;
    }
    
    public List<Roles> getAllRoles() {
        List<Roles> roles = new ArrayList<>();
        connection = getConnection();
        String sql = """
                     SELECT [roleID], [name]
                     FROM [dbo].[Roles]
                     """;
        try {
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int roleID = resultSet.getInt("roleID");
                String name = resultSet.getString("name");
                roles.add(new Roles(roleID, name));
            }
        } catch (SQLException e) {
            System.out.println("??getAllRoles: " + e.getMessage());
        }
        return roles;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<Roles> roles = dao.getAllRoles();
        for (Roles role : roles) {
            System.out.println(role);
        }
    }
}
