package dal;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Orders;
import model.donHang;
import model.gioHang;
import util.Validate;

public class OrderDAO extends DBContext {

    public int findOrderIdNotConfirmed(int userID) {    //nếu chưa có giỏ hàng => trả về 0
        int orderID = 0;                                //nếu tồn tại giở hàng => trả về orderID của giỏ hàng chưa confirmed
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT orderID\n"
                + "                     FROM Orders\n"
                + "                     WHERE userID = ? AND orderConfirmed = ?;";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setInt(1, userID);
            preStatement.setInt(2, 0);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();        //vì đây là select nên executeQuery
            //- tra ve ket qua
            if (resultSet.next()) {
                orderID = resultSet.getInt("orderID");
            }
        } catch (SQLException e) {
            System.out.println("??findOrderIdNotConfirmed: " + e.getMessage());
        }
        return orderID;
    }

    public int insertOrderDB(Orders order) {         //tạo giỏ hàng, chỉ TẠO ĐC khi ko có Order nào
        int orderID = 0;                            //của cùng userID có orderConfirmed = 0 (nghĩa là lỗi đã tồn tại giỏ hàng)
        //- connect w/Database                      //nếu trả về orderID = 0 => lỗi
        connection = getConnection();               //sẽ dùng trigger để tính totalMoney
        //- Chuan bi cau lenh sql
        String sql = "INSERT INTO [BanHangOnlineNew].[dbo].[Orders]\n"
                + "           ([userID]		\n"
                + "           ,[orderConfirmed]\n"
                + "           ,[orderDate]\n"
                + "           ,[totalMoney]\n"
                + "           ,[phone]\n"
                + "           ,[paymentStatus]\n"
                + "           ,[deliveryStatus]\n"
                + "           ,[paymentType]\n"
                + "           ,[deliveryInfo]\n"
                + "           ,[nameOrder]\n"
                + "           ,[deliveryLocation])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //- set parameter
            preStatement.setObject(1, order.getUserID());
            preStatement.setObject(2, 0);

            preStatement.setObject(3, 0);
            preStatement.setString(4, order.getPhone());
            preStatement.setString(5, "Watting");
            preStatement.setString(6, "Watting");
            preStatement.setString(7, "Watting");
            preStatement.setString(8, "Watting");
            preStatement.setObject(9, order.getNameOrder());           //nameOrder
            preStatement.setString(10, order.getDeliveryLocation());    //deliveryLocation

            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
            if (resultSet.next()) {
                orderID = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("??insertOrderDB: " + e.getMessage());
        }
        return orderID;
    }

    public void updateOrderConfirmedDB(int orderID, String nameOrder, String phone, String location) {
        //- connect w/Database              //chạy lệnh khi xác nhận đơn hàng
        connection = getConnection();       //trigger sẽ tự động tính totalMoney
        //- Chuan bi cau lenh sql
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [orderConfirmed] = 1\n"
                + "      ,[orderDate] = GETDATE()\n"
                + "      ,[phone] = ?\n"
                + "      ,[paymentStatus] = ?\n"
                + "      ,[deliveryStatus] = ?\n"
                + "      ,[paymentType] = ?\n"
                + "      ,[deliveryInfo] = ?\n"
                + "      ,[nameOrder] = ?\n"
                + "      ,[deliveryLocation] = ?\n"
                + " WHERE [orderID] = ?";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, phone);               //phone
            preStatement.setObject(2, "Unpaid");            //paymentStatus
            preStatement.setObject(3, "Processing");        //deliveryStatus
            preStatement.setObject(4, "COD");               //paymentType
            preStatement.setObject(5, "Giaohangtietkiem");  //deliveryInfo
            preStatement.setObject(6, nameOrder);           //nameOrder
            preStatement.setObject(7, location);            //location
            preStatement.setObject(8, orderID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateOrderConfirmedDB: " + e.getMessage());
        }
    }

//****************Chỉ cho Admin    
    public void updateOrderDB(int orderID, int userID, boolean orderConfirmed, Date orderDate, double totalMoney, String phone, String paymentStatus, String deliveryStatus, String paymentType, String deliveryInfo, String nameOrder, String deliveryLocation) {
        //- connect w/Database              //chạy lệnh khi update bảng Orders của Admin
        connection = getConnection();       //trigger sẽ tự động tính totalMoney
        //- Chuan bi cau lenh sql
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [userID] = ?\n"
                + "      ,[orderConfirmed] = ?\n"
                + "      ,[orderDate] = ?\n"
                + "      ,[totalMoney] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[paymentStatus] = ?\n"
                + "      ,[deliveryStatus] = ?\n"
                + "      ,[paymentType] = ?\n"
                + "      ,[deliveryInfo] = ?\n"
                + "      ,[nameOrder] = ?\n"
                + "      ,[deliveryLocation] = ?\n"
                + " WHERE [orderID] = ?";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, userID);              //userID
            preStatement.setObject(2, orderConfirmed);      //orderConfirmed
            preStatement.setObject(3, orderDate);           //orderDate
            preStatement.setObject(4, totalMoney);          //totalMoney
            preStatement.setObject(5, phone);               //phone
            preStatement.setObject(6, paymentStatus);       //paymentStatus
            preStatement.setObject(7, deliveryStatus);      //deliveryStatus
            preStatement.setObject(8, paymentType);         //paymentType
            preStatement.setObject(9, deliveryInfo);        //deliveryInfo
            preStatement.setObject(10, nameOrder);           //nameOrder
            preStatement.setObject(11, deliveryLocation);    //deliveryLocation
            preStatement.setObject(12, orderID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateOrderDB: " + e.getMessage());
        }
    }

    //******************************************************************************** 
    public List<gioHang> showShoppingCartByID(int orderID) {    //Trả về các thông tin để hiển thị các sản phẩm trong giỏ hàng 
        List<gioHang> allProducts = new ArrayList<>();          //muốn thêm thuộc tính vào thì phải thêm bên gioHang.java
        //- connect w/Database                                  //Thông báo Nam trước khi thêm thuộc tính
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT DISTINCT \n"
                + "    o.orderID,\n"
                + "    od.[productID],\n"
                + "    p.[name] AS productName,\n"
                + "    p.thumbnail,\n"
                + "    pd.storage as str,\n"
                + "    od.color,\n"
                + "    od.quantity,\n"
                + "    od.price,\n" //là discoud bên product
                + "    o.totalMoney\n"
                + "FROM \n"
                + "    Orders o\n"
                + "JOIN \n"
                + "    OrderDetails od ON o.orderID = od.orderID\n"
                + "JOIN \n"
                + "    Products p ON od.productID = p.productID\n"
                + "JOIN \n"
                + "    ProductDetails pd ON p.productID = pd.productID\n"
                + "WHERE \n"
                + "    o.orderID = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, orderID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int id = resultSet.getInt("orderID");
                int productID = resultSet.getInt("productID");
                String productName = resultSet.getString("productName");
                String thumbnail = resultSet.getString("thumbnail");
                String storage = resultSet.getString("str");
                String color = resultSet.getString("color");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                double totalMoney = resultSet.getDouble("totalMoney");

                gioHang gh = new gioHang(id, productID, productName, thumbnail, storage, color, quantity, price, totalMoney);
                allProducts.add(gh);
            }
        } catch (SQLException e) {
            System.out.println("??showShoppingCartByID: " + e.getMessage());
        }
        return allProducts;
    }

//******************************************************************************** 
    public void updateOrderDetailsByOrderID(int orderID, int productID, int quantity, String color) { //update quantity
        //- connect w/Database              //không chỉnh sửa userID, lấy orderID từ input hidden chứa orderID
        connection = getConnection();       //tạo thêm 1 nút ok, hiển thị khi khách hàng thay đổi số lượng mua
        //- Chuan bi cau lenh sql           //hoặc thi ấn Thanh toán thì phải update lại toàn bộ lại tất cả detailOrder có trong Order
        String sql = "UPDATE [dbo].[OrderDetails]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE [orderID] = ? and [productID] = ? and [color] = ?";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, quantity);
            preStatement.setObject(2, orderID);
            preStatement.setObject(3, productID);
            preStatement.setObject(4, color);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateOrderDetailsByOrderID: " + e.getMessage());
        }
    }

//********************************************************************************
    public List<donHang> showDonHang(int userID) {    //Trả về các thông tin để hiển thị các sản phẩm giao hàng 
        List<donHang> allProducts = new ArrayList<>();          //muốn thêm thuộc tính vào thì phải thêm bên gioHang.java
        //- connect w/Database                                  //Thông báo Nam trước khi thêm thuộc tính
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT DISTINCT\n"
                + "    o.orderID,\n"
                + "    od.[productID],\n"
                + "    p.[name] AS productName,\n"
                + "    p.thumbnail,\n"
                + "    pd.storage AS str,\n"
                + "    od.color,\n"
                + "    od.quantity,\n"
                + "    od.price,\n"
                + "    o.totalMoney,\n"
                + "	o.userID,\n"
                + "	o.paymentStatus,\n"
                + "	o.deliveryStatus,\n"
                + "	o.paymentType,\n"
                + "	o.orderDate,\n"
                + "	o.phone\n"
                + "FROM\n"
                + "    Orders o\n"
                + "JOIN\n"
                + "    OrderDetails od ON o.orderID = od.orderID\n"
                + "JOIN\n"
                + "    Products p ON od.productID = p.productID\n"
                + "JOIN\n"
                + "    ProductDetails pd ON p.productID = pd.productID\n"
                + "WHERE\n"
                + "    o.userID = ? and o.orderConfirmed = 1 and o.deliveryStatus = 'Processing'";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, userID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int orderID = resultSet.getInt("orderID");
                int productID = resultSet.getInt("productID");
                String productName = resultSet.getString("productName");
                String thumbnail = resultSet.getString("thumbnail");
                String storage = resultSet.getString("str");
                String color = resultSet.getString("color");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                double totalMoney = resultSet.getDouble("totalMoney");

                int userID_found = resultSet.getInt("userID");
                String paymentStatus = resultSet.getString("paymentStatus");
                String deliveryStatus = resultSet.getString("deliveryStatus");
                String paymentType = resultSet.getString("paymentType");
                Date orderDate = resultSet.getDate("orderDate");
                String phone = resultSet.getString("phone");

                donHang dh = new donHang(orderID, productID, productName, thumbnail, storage, color, quantity, price, totalMoney, userID_found, paymentStatus, deliveryStatus, paymentType, orderDate);
                dh.setPhone(phone);
                allProducts.add(dh);
            }
        } catch (SQLException e) {
            System.out.println("??showDonHang: " + e.getMessage());
        }
        return allProducts;
    }

//******************************************************************************** 
    public List<Orders> showOrderAdmin() {    //Trả về các thông tin để hiển thị các sản phẩm giao hàng 
        List<Orders> allProducts = new ArrayList<>();          //muốn thêm thuộc tính vào thì phải thêm bên gioHang.java
        //- connect w/Database                                  //Thông báo Nam trước khi thêm thuộc tính
        connection = getConnection();
        //- Chuan bi cau lenh sql

        String sql = "SELECT\n"
                + "    o.orderID,\n"
                + "    o.totalMoney,\n"
                + "	o.paymentStatus,\n"
                + "	o.deliveryStatus,\n"
                + "	o.orderDate,\n"
                + "	o.phone\n"
                + "FROM\n"
                + "    Orders o\n"
                + "WHERE\n"
                + "     o.orderConfirmed = 1";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int orderID = resultSet.getInt("orderID");
                String totalMoney = resultSet.getString("totalMoney");      //vì qua trigger nó thanh dang text
                String paymentStatus = resultSet.getString("paymentStatus");
                String deliveryStatus = resultSet.getString("deliveryStatus");
                Date orderDate = resultSet.getDate("orderDate");
                String phone = resultSet.getString("phone");

                double total = Double.parseDouble(totalMoney == null ? "0" : totalMoney);
                Orders od = new Orders(orderID, orderDate, paymentStatus, total, phone, deliveryStatus);
                od.setTotalString(totalMoney);

                allProducts.add(od);
            }
        } catch (SQLException e) {
            System.out.println("??showOrderAdmin: " + e.getMessage());
        }
        return allProducts;
    }

//******************************************************************************** 
    public int findQuantityCurrent(int orderID, int productID, String color) {    //nếu chưa có giỏ hàng => trả về 0
        int ID = 0;     //chưa cần dùng
        int quantityCurrent = 0;
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT [ID]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[OrderDetails]\n"
                + "  Where [orderID] = ? and [productID] = ? and [color] = ?";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setInt(1, orderID);
            preStatement.setInt(2, productID);
            preStatement.setString(3, color);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();        //vì đây là select nên executeQuery
            //- tra ve ket qua
            if (resultSet.next()) {
                ID = resultSet.getInt("ID");
                quantityCurrent = resultSet.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println("??findQuantityCurrent: " + e.getMessage());
        }
        return quantityCurrent;
    }

//******************************************************************************** 
    public int insertOrderDetailsDB(int productID, int orderID, int quantity, double price, String color) {
        int ID = 0;                     //Lệnh chạy khi thêm sản phầm vào giỏ hàng
        //- connect w/Database          //trước khi chạy lệnh này phải check orderID trước
        connection = getConnection();   //lấy ID về để làm 1 cái input hidden để lưu giá trị của ID
        //- Chuan bi cau lenh sql
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([productID]\n"
                + "           ,[orderID]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[color])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //- set parameter
            preStatement.setObject(1, productID);
            preStatement.setObject(2, orderID);
            preStatement.setObject(3, quantity);
            preStatement.setObject(4, price);
            preStatement.setObject(5, color);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
            if (resultSet.next()) {
                ID = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("??insertOrderDetailsDB: " + e.getMessage());
        }
        return ID;
    }

//******************************************************************************** 
    public void updateOrderDetailsByID(int orderDetailID, int productID, int quantity, int price) {
        //- connect w/Database              //không chỉnh sửa userID, lấy ID từ input hidden chứa ID
        connection = getConnection();       //tạo thêm 1 nút ok, hiển thị khi khách hàng thay đổi số lượng mua
        //- Chuan bi cau lenh sql           //hoặc thi ấn Thanh toán thì phải update lại toàn bộ lại tất cả detailOrder có trong Order
        String sql = "UPDATE [dbo].[OrderDetails]\n"
                + "   SET [productID] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + " WHERE ID = ?";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, productID);
            preStatement.setObject(2, quantity);
            preStatement.setObject(3, price);
            preStatement.setObject(4, orderDetailID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateOrderDetailsByID: " + e.getMessage());
        }
    }
    
//******************************************************************************** 
    public void updateAdminOrderDetailsByID(int orderDetailID, int quantity, String color) {
        //- connect w/Database              //không chỉnh sửa userID, lấy ID từ input hidden chứa ID
        connection = getConnection();       //tạo thêm 1 nút ok, hiển thị khi khách hàng thay đổi số lượng mua
        //- Chuan bi cau lenh sql           //hoặc thi ấn Thanh toán thì phải update lại toàn bộ lại tất cả detailOrder có trong Order
        String sql = """
                     UPDATE [dbo].[OrderDetails]
                        SET [quantity] = ?
                           ,[color] = ?
                      WHERE ID = ?""";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, quantity);
            preStatement.setObject(2, color);
            preStatement.setObject(3, orderDetailID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateAdminOrderDetailsByID: " + e.getMessage());
        }
    }
//******************************************************************************** 
    public void updateAdminOrderByID(int orderID, String phone, String paymentStatus, String deliveryStatus, String paymentType,
                                    String deliveryInfo, String nameOrder, String deliveryLocation) {
        //- connect w/Database              //không chỉnh sửa userID, lấy ID từ input hidden chứa ID
        connection = getConnection();       //tạo thêm 1 nút ok, hiển thị khi khách hàng thay đổi số lượng mua
        //- Chuan bi cau lenh sql           //hoặc thi ấn Thanh toán thì phải update lại toàn bộ lại tất cả detailOrder có trong Order
        String sql = """
                     UPDATE [dbo].[Orders]
                         SET [phone] = ?
                            ,[paymentStatus] = ?
                            ,[deliveryStatus] = ?
                            ,[paymentType] = ?
                            ,[deliveryInfo] = ?
                            ,[nameOrder] = ?
                            ,[deliveryLocation] = ?
                       WHERE [orderID] = ?""";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, phone);
            preStatement.setObject(2, paymentStatus);
            preStatement.setObject(3, deliveryStatus);
            preStatement.setObject(4, paymentType);
            preStatement.setObject(5, deliveryInfo);
            preStatement.setObject(6, nameOrder);
            preStatement.setObject(7, deliveryLocation);
            preStatement.setObject(8, orderID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??updateAdminOrderByID: " + e.getMessage());
        }
    }

//******************************************************************************** 
    public void deleteOrderDetailsById(int orderDetailID) {
        //- connect w/Database              //chạy khi ấn X hoặc delete product từ giỏ hàng
        connection = getConnection();       //làm thêm nút X để delete
        //- Chuan bi cau lenh sql
        String sql = "DELETE FROM [dbo].[OrderDetails]\n"
                + "      WHERE ID = ?";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, orderDetailID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??deleteOrderDetailsById: " + e.getMessage());
        }
    }
//******************************************************************************** 

    public void deleteOrderById(int orderID) {
        //- connect w/Database              //chạy khi ấn X hoặc delete product từ giỏ hàng
        connection = getConnection();       //làm thêm nút X để delete
        //- Chuan bi cau lenh sql
        String sql = """
                     DELETE FROM [dbo].[OrderDetails]
                           WHERE orderID = ?
                     
                     DELETE FROM [dbo].[Orders]
                           WHERE orderID = ?""";
        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, orderID);
            preStatement.setObject(2, orderID);
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??deleteOrderById: " + e.getMessage());
        }
    }

//******************************************************************************** 
    public Orders findOderByID(int orderID) {    //trả thông tin ở admin order edit
        Orders od = null;
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT [orderID]\n"
                + "      ,[userID]\n"
                + "      ,[orderConfirmed]\n"
                + "      ,[orderDate]\n"
                + "      ,[totalMoney]\n"
                + "      ,[phone]\n"
                + "      ,[paymentStatus]\n"
                + "      ,[deliveryStatus]\n"
                + "      ,[paymentType]\n"
                + "      ,[deliveryInfo]\n"
                + "      ,[nameOrder]\n"
                + "      ,[deliveryLocation]\n"
                + "  FROM [dbo].[Orders]\n"
                + "  WHERE [orderID] = ?";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setInt(1, orderID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();        //vì đây là select nên executeQuery
            //- tra ve ket qua
            if (resultSet.next()) {
                int orderID_found = resultSet.getInt("orderID");
                int userID = resultSet.getInt("userID");
                boolean orderConfirmed = resultSet.getBoolean("orderConfirmed");
                Date orderDate = resultSet.getDate("orderDate");
                double totalMoney = resultSet.getDouble("totalMoney");
                String phone = resultSet.getString("phone");
                String paymentStatus = resultSet.getString("paymentStatus");
                String deliveryStatus = resultSet.getString("deliveryStatus");
                String paymentType = resultSet.getString("paymentType");
                String deliveryInfo = resultSet.getString("deliveryInfo");
                String nameOrder = resultSet.getString("nameOrder");
                String deliveryLocation = resultSet.getString("deliveryLocation");

                od = new Orders(orderID_found, userID, orderConfirmed, orderDate, totalMoney, phone, paymentStatus, deliveryStatus, paymentType, deliveryInfo, nameOrder, deliveryLocation);
                od.setTotalString(Validate.doubleToMoney(totalMoney));
                return od;
            }
        } catch (SQLException e) {
            System.out.println("??findQuantityCurrent: " + e.getMessage());
        }
        return od;
    }
//******************************************************************************** 

    public List<OrderDetail> findOderDetailByID(int orderID) {    //trả thông tin ở admin order edit
        List<OrderDetail> list = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     SELECT od.[ID]
                           ,od.[productID]
                           ,od.[orderID]
                           ,od.[quantity]
                           ,od.[price]
                           ,od.[color]
                     	  ,p.[name]
                       FROM [dbo].[OrderDetails] od
                       JOIN Products p ON od.productID = p.productID
                       WHERE [orderID] = ?""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setInt(1, orderID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();        //vì đây là select nên executeQuery
            //- tra ve ket qua
            while (resultSet.next()) {
                int ID = resultSet.getInt("ID");
                int productID = resultSet.getInt("productID");
                int orderID_found = resultSet.getInt("orderID");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                String color = resultSet.getString("color");
                String name = resultSet.getString("name");

                OrderDetail od = new OrderDetail(ID, productID, orderID_found, quantity, price, color, name);
                od.setPriceString(Validate.doubleToMoney(price));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println("??findQuantityCurrent: " + e.getMessage());
        }
        return list;
    }

//******************************************************************************** 
//******************************************************************************** 
    public ArrayList<Orders> listAll() {
        ArrayList<Orders> list = new ArrayList<>();
        connection = getConnection();
        String sql = """
                     select orderID, orderDate, paymentStatus, totalMoney, phone, deliveryStatus
                     from [dbo].[Orders] """;
        try {
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int orderID = resultSet.getInt("orderID");
                Date order_date = resultSet.getDate("orderDate");
                String paymentStatus = resultSet.getString("paymentStatus");
                double totalMoney = resultSet.getDouble("totalMoney");
                String phone = resultSet.getString("phone");
                String deliveryStatus = resultSet.getString("deliveryStatus");

                Orders or = new Orders(orderID, order_date, paymentStatus, totalMoney, phone, deliveryStatus);
                //Orders or = new Orders(resultSet.getInt(1) , resultSet.getDate(2), resultSet.getNString(3), resultSet.getDouble(4), resultSet.getString(5), resultSet.getNString(6));
                list.add(or);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {

        }
        return null;
    }

    public ArrayList<gioHang> orderDetail(int orderID) {
        ArrayList<gioHang> list = new ArrayList<>();
        connection = getConnection();
        String sql = """
                     SELECT DISTINCT 
                         o.orderID,
                         p.[name] AS productName,
                         pd.storage as str,
                         od.color,
                         od.quantity,
                         od.price,
                         o.totalMoney,
                         o.nameOrder,
                         o.deliveryLocation,
                         o.phone,
                         o.deliveryStatus
                     FROM 
                         Orders o
                     JOIN 
                         OrderDetails od ON o.orderID = od.orderID
                     JOIN 
                         Products p ON od.productID = p.productID
                     JOIN 
                         ProductDetails pd ON p.productID = pd.productID
                     WHERE 
                         o.orderID = ?""" //là discoud bên product
                ;
        try {
            preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, orderID);
            resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("orderID");
                String name = resultSet.getString("productName");
                int quantity = resultSet.getInt("quantity");
                String storage = resultSet.getString("str");
                String color = resultSet.getString("color");
                double price = resultSet.getDouble("price");
                double totalMoney = resultSet.getDouble("totalMoney");
                String nameOrder = resultSet.getString("nameOrder");
                String deliveryLocation = resultSet.getString("deliveryLocation");
                String phone = resultSet.getString("phone");
                String deliveryStatus = resultSet.getString("deliveryStatus");

                gioHang gh = new gioHang(orderID, name, storage, color, quantity, price, totalMoney);
                gh.setNameOrder(nameOrder);
                gh.setDeliveryLocation(deliveryLocation);
                gh.setPhone(phone);
                gh.setDeliveryStatus(deliveryStatus);
                //Orders or = new Orders(resultSet.getInt(1) , resultSet.getDate(2), resultSet.getNString(3), resultSet.getDouble(4), resultSet.getString(5), resultSet.getNString(6));
                list.add(gh);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {

        }
        return null;
    }

//******************************************************************************** 
//******************************************************************************** 
    public static void main(String[] args) {
//        OrderDAO DB = new OrderDAO();
//        List<donHang> list = DB.showDonHang(3);
//        for (donHang hang : list) {
//            System.out.println(hang.toString());
//            double price = hang.getPrice();
//            double quantity = hang.getQuantity();
//            double thanhTien = price * quantity;
//            hang.setThanhTien(Validate.doubleToMoney(thanhTien));
//            System.out.println(hang.getThanhTien());
//        }
//        System.out.println(DB.findOrderIdNotConfirmed(2));

        //DB.updateOrderDetailsByOrderID(1, 2, 4);
        OrderDAO dao = new OrderDAO();
//        Orders order = new Orders();
//        order.setUserID(9);
//        order.setPhone("12312312312");
//        order.setPaymentStatus("Watting");
//        order.setDeliveryStatus("1");
//        order.setPaymentType("Watting");
//        order.setDeliveryInfo("Watting");
//        order.setNameOrder("tessssssst");
//        order.setDeliveryLocation("tessssssst");
//        int orderID_new = dao.insertOrderDB(order);
//        System.out.println(orderID_new);
        List<Orders> od = dao.showOrderAdmin();
//        for (Orders orders : od) {
//            System.out.println(orders.toString());
//            System.out.println(orders.getTotalString());
//            
//            double ad = Double.parseDouble(orders.getTotalString() == null ? "0" : orders.getTotalString());
//            orders.setTotalMoney(ad);
//            
//            System.out.println(ad);
//            System.out.println(orders.toString());
//        }
//        System.out.println(dao.orderDetail(1).toString());
//        System.out.println(dao.orderDetail(1).get(0).getDeliveryStatus());
//        System.out.println(dao.showDonHang(2).toString());
        System.out.println(dao.findOderByID(1).toString());
        dao.updateAdminOrderDetailsByID(2, 4, "Xanh");
//        System.out.println(dao.findOderDetailByID(1).toString());
    }
}
