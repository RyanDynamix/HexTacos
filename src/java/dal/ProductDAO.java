package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ProductDetail;
import model.Products;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categories;
import model.detailProduct;
import model.showProduct;
import util.Validate;

public class ProductDAO extends DBContext {

    public List<Products> findAll() {
        List<Products> allProducts = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenhj sql
        String sql = "select * from Products";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int id = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int discount = resultSet.getInt("discount");
                int quantity = resultSet.getInt("quantity");
                Date created_at = resultSet.getDate("created_at");
                Date updated_at = resultSet.getDate("updated_at");
                String description = resultSet.getString("description");
                String thumbnail = resultSet.getString("thumbnail");
                Products product = new Products(id, name, price, discount, quantity, created_at, updated_at, description, thumbnail);
                allProducts.add(product);
            }
        } catch (SQLException e) {
            System.out.println("??(ProductDAO)findAll" + e.getMessage());
        }
        return allProducts;
    }

//------------------------------------------------------------------    
    public List<showProduct> findProductByName(String keyword) {
        List<showProduct> allProducts = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        //đọc thêm Wildcard sqlServer (%...%) 
//        String sql = "select * from Products where name like ?";
        String sql = "SELECT distinct p.[productID]\n"
                + "     , p.[name]\n"
                + "     , p.[price]\n"
                + "     , p.[discount]\n"
                + "     , p.[thumbnail]\n"
                + "     , pd.[screen]\n"
                + "     , pd.[chip]\n"
                + "     , pd.[ram]\n"
                + "     , pd.[storage] as str\n"
                + "FROM [dbo].[Products] AS p\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd  ON p.[productID] = pd.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].productCategories AS pc ON p.[productID] = pc.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].Categories AS c ON pc.categoryID = c.categoryID\n"
                + "where p.[name] like ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setString(1, "%" + keyword + "%");
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int discount = resultSet.getInt("discount");
                String thumbnail = resultSet.getString("thumbnail");
                String screen = resultSet.getString("screen");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");

                showProduct sp = new showProduct(productID, name, price, discount, thumbnail, screen, chip, ram, stogare, "", "", "");
                allProducts.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("??findProductByName: " + e.getMessage());
        }
        return allProducts;
    }
    
//------------------------------------------------------------------
    public List<showProduct> findProductByNameAndCategory(String keyword, String category, String str) {
        List<showProduct> allProducts = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        //đọc thêm Wildcard sqlServer (%...%) 
//        String sql = "select * from Products where name like ?";
        String sql = "SELECT distinct p.[productID]\n"
                + "     , p.[name]\n"
                + "     , p.[price]\n"
                + "     , p.[discount]\n"
                + "     , p.[thumbnail]\n"
                + "     , pd.[screen]\n"
                + "     , pd.[chip]\n"
                + "     , pd.[ram]\n"
                + "     , pd.[storage] as str\n"
                + "FROM [dbo].[Products] AS p\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd  ON p.[productID] = pd.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].productCategories AS pc ON p.[productID] = pc.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].Categories AS c ON pc.categoryID = c.categoryID\n"
                + "where p.[name] like ? and p.[description] like ? and c.[name] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setString(1, "%" + keyword + "%");
            preStatement.setString(2, "%" + str + "%");
            preStatement.setString(3,category);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                double discount = resultSet.getDouble("discount");
                String thumbnail = resultSet.getString("thumbnail");
                String screen = resultSet.getString("screen");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");

                showProduct sp = new showProduct(productID, name, price, discount, thumbnail, screen, chip, ram, stogare, "", "", "");
                allProducts.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("??findProductByName: " + e.getMessage());
        }
        return allProducts;
    }
    
//------------------------------------------------------------------    
    public List<showProduct> findProductByDis(double dis1, double dis2, String category) {
        List<showProduct> allProducts = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        //đọc thêm Wildcard sqlServer (%...%) 
//        String sql = "select * from Products where name like ?";
        String sql = "SELECT distinct p.[productID]\n"
                + "     , p.[name]\n"
                + "     , p.[price]\n"
                + "     , p.[discount]\n"
                + "     , p.[thumbnail]\n"
                + "     , pd.[screen]\n"
                + "     , pd.[chip]\n"
                + "     , pd.[ram]\n"
                + "     , pd.[storage] as str\n"
                + "FROM [dbo].[Products] AS p\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd  ON p.[productID] = pd.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].productCategories AS pc ON p.[productID] = pc.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].Categories AS c ON pc.categoryID = c.categoryID\n"
                + "where p.[discount] BETWEEN ? AND ? and c.[name] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setDouble(1, dis1);
            preStatement.setDouble(2, dis2);
            preStatement.setObject(3, category);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                double discount = resultSet.getDouble("discount");
                String thumbnail = resultSet.getString("thumbnail");
                String screen = resultSet.getString("screen");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");

                showProduct sp = new showProduct(productID, name, price, discount, thumbnail, screen, chip, ram, stogare, "", "", "");
                allProducts.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("??findProductByDis: " + e.getMessage());
        }
        return allProducts;
    }
    
//------------------------------------------------------------------    
    public List<showProduct> findProductByNameAndPrice(String keyword, double dis1, double dis2, String category, String str) {
        List<showProduct> allProducts = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        //đọc thêm Wildcard sqlServer (%...%) 
//        String sql = "select * from Products where name like ?";
        String sql = """
                     SELECT distinct p.[productID]
                          , p.[name]
                          , p.[price]
                          , p.[discount]
                          , p.[thumbnail]
                          , pd.[screen]
                          , pd.[chip]
                          , pd.[ram]
                          , pd.[storage] as str
                     FROM [dbo].[Products] AS p
                     INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd  ON p.[productID] = pd.[productID]
                     INNER JOIN [BanHangOnlineNew].[dbo].productCategories AS pc ON p.[productID] = pc.[productID]
                     INNER JOIN [BanHangOnlineNew].[dbo].Categories AS c ON pc.categoryID = c.categoryID
                     where p.[name] like ? and p.[description] like ? and  p.[discount] BETWEEN ? AND ? and c.[name] = ?""";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setString(1, "%" + keyword + "%");
            preStatement.setString(2, "%" + str + "%");
            preStatement.setDouble(3, dis1);
            preStatement.setDouble(4, dis2);
            preStatement.setObject(5, category);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                double discount = resultSet.getDouble("discount");
                String thumbnail = resultSet.getString("thumbnail");
                String screen = resultSet.getString("screen");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");

                showProduct sp = new showProduct(productID, name, price, discount, thumbnail, screen, chip, ram, stogare, "", "", "");
                allProducts.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("??findProductByName: " + e.getMessage());
        }
        return allProducts;
    }

//------------------------------------------------------------------
    public List<Products> findProductByCategory(String keyword) {
        List<Products> allProducts = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT p.*\n"
                + "FROM Products p\n"
                + "INNER JOIN productCategories pc ON p.productID = pc.productID\n"
                + "INNER JOIN Categories c ON pc.categoryID = c.categoryID\n"
                + "WHERE c.[name] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setString(1, keyword);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int id = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int discount = resultSet.getInt("discount");
//                NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
//                String formatedPrice = numberFormat.format(price);
//                String formatedDiscount = numberFormat.format(discount);
                int quantity = resultSet.getInt("quantity");
                Date created_at = resultSet.getDate("created_at");
                Date updated_at = resultSet.getDate("updated_at");
                String description = resultSet.getString("description");
                String thumbnail = resultSet.getString("thumbnail");
                Products product = new Products(id, name, price, discount, quantity, created_at, updated_at, description, thumbnail);
                allProducts.add(product);
            }
        } catch (SQLException e) {
            System.out.println("??findProductByCategory" + e.getMessage());
        }
        return allProducts;
    }

//------------------------------------------------------------------
//------------------------------------------------------------------
    public List<showProduct> findAllShowProductByCategoryName(String categoryName) {
        List<showProduct> allShowProduct = new ArrayList<>();       //Lưu ý: cột storage bị trùng tên với thuộc tính 
        //- connect w/Database                                      //nào đó của Java - ResultSet, nên phải đổi tên cột
        connection = getConnection();                               //Để hiện thị trong productList, tabletList
        //- Chuan bi cau lenh sql
        String sql = "SELECT distinct p.[productID]\n"
                + "     , p.[name]\n"
                + "     , p.[price]\n"
                + "     , p.[discount]\n"
                + "     , p.[thumbnail]\n"
                + "     , pd.[screen]\n"
                + "     , pd.[chip]\n"
                + "     , pd.[ram]\n"
                + "     , pd.[storage] as str\n"
                + "	 , c.[name] as categoryName\n"
                + "FROM [dbo].[Products] AS p\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd  ON p.[productID] = pd.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].productCategories AS pc ON p.[productID] = pc.[productID]\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].Categories AS c ON pc.categoryID = c.categoryID\n"
                + "where c.[name] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, categoryName);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int discount = resultSet.getInt("discount");
                String thumbnail = resultSet.getString("thumbnail");
                String screen = resultSet.getString("screen");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");
                String nameCategory = resultSet.getString("categoryName");

                showProduct sp = new showProduct(productID, name, price, discount, thumbnail, screen, chip, ram, stogare, "", "", nameCategory);
                allShowProduct.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("??findAllShowProductByCategoryName: " + e.getMessage());
        }
        return allShowProduct;
    }

//------------------------------------------------------------------
    public List<ProductDetail> findDetailProductNoColor(int proID) {
        List<ProductDetail> allProductDetail = new ArrayList<>();       //Lưu ý: cột storage bị trùng tên với thuộc tính 
        //- connect w/Database                                      //nào đó của Java - ResultSet, nên phải đổi tên cột
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "select distinct [productID]\n"
                + "      ,[screen]\n"
                + "      ,[os]\n"
                + "      ,[mainCamera]\n"
                + "      ,[selfieCamera]\n"
                + "      ,[chip]\n"
                + "      ,[ram]\n"
                + "      ,[storage] as str\n"
                + "      ,[sim]\n"
                + "      ,[battery]\n"
                + "      ,[charger]\n"
                + "  FROM [BanHangOnlineNew].[dbo].[ProductDetails]  WHERE [productID] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, proID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int id = resultSet.getInt("ID");
                int productID = resultSet.getInt("productID");
                String screen = resultSet.getString("screen");
                String os = resultSet.getString("os");
                String mainCamera = resultSet.getString("mainCamera");
                String selfieCamera = resultSet.getString("selfieCamera");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");
                String sim = resultSet.getString("sim");
                String battery = resultSet.getString("battery");
                String charger = resultSet.getString("charger");

                ProductDetail pd = new ProductDetail(id, productID, screen, os, mainCamera, selfieCamera, chip, ram, stogare, sim, battery, charger, "");
                allProductDetail.add(pd);
            }
        } catch (SQLException e) {
            System.out.println("??findDetailProductNoColor: " + e.getMessage());
        }
        return allProductDetail;
    }

//------------------------------------------------------------------
    public List<ProductDetail> findProDetailByColor(int proID, String colorFind) {
        List<ProductDetail> allProductDetail = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "select * FROM [dbo].[ProductDetails] WHERE [productID] = ? and [color] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, proID);
            preStatement.setObject(2, colorFind);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int id = resultSet.getInt("ID");
                int productID = resultSet.getInt("productID");
                String screen = resultSet.getString("screen");
                String os = resultSet.getString("os");
                String mainCamera = resultSet.getString("mainCamera");
                String selfieCamera = resultSet.getString("selfieCamera");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("stogare");
                String sim = resultSet.getString("sim");
                String battery = resultSet.getString("battery");
                String charger = resultSet.getString("charger");
                String color = resultSet.getString("color");

                ProductDetail pd = new ProductDetail(id, productID, screen, os, mainCamera, selfieCamera, chip, ram, stogare, sim, battery, charger, color);
                allProductDetail.add(pd);
            }
        } catch (SQLException e) {
            System.out.println("??findProDetailByColor" + e.getMessage());
        }
        return allProductDetail;
    }

//------------------------------------------------------------------
    public List<String> findAllColorOfProduct(int productID) {          //Dùng để hiển thị nội dung cho các btn chọn màu 
        List<String> allColor = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT [color]\n"
                + "FROM ProductDetails\n"
                + "WHERE productID = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, productID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                String color = resultSet.getString("color");

                allColor.add(color);
            }
        } catch (SQLException e) {
            System.out.println("??findAllColorOfProduct: " + e.getMessage());
        }
        return allColor;
    }

//------------------------------------------------------------------
    public List<String> findAllGalleryOfProduct(int productID) {          //Dùng để hiển thị nội dung cho slideshow
        List<String> allPic = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT [picLink]\n"
                + "  FROM [dbo].[Galleries]\n"
                + "  WHERE [productID] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, productID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                String picLink = resultSet.getString("picLink");

                allPic.add(picLink);
            }
        } catch (SQLException e) {
            System.out.println("??findAllGalleryOfProduct: " + e.getMessage());
        }
        return allPic;
    }

//------------------------------------------------------------------
    public detailProduct findProductDetailByID(int productID) {    //Dùng để hiển thị nội dung trong productDetail.jsp
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = "SELECT DISTINCT \n"
                + "  p.[productID],\n"
                + "  p.[name],\n"
                + "  p.[price],\n"
                + "  p.[discount],\n"
                + "  p.[quantity],\n"
                + "  p.[thumbnail],\n"
                + "  pd.[screen],\n"
                + "  pd.[os],\n"
                + "  pd.[mainCamera],\n"
                + "  pd.[selfieCamera],\n"
                + "  pd.[chip],\n"
                + "  pd.[ram],\n"
                + "  pd.[storage] as str,\n"
                + "  pd.[sim],\n"
                + "  pd.[battery],\n"
                + "  pd.[charger]\n"
                + "FROM [dbo].[Products] AS p\n"
                + "INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd ON p.[productID] = pd.[productID]\n"
                + "WHERE p.[productID] = ?";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, productID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            if (resultSet.next()) {
                int productID_found = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                double discount = resultSet.getDouble("discount");
                int quantity = resultSet.getInt("quantity");
                String thumbnail = resultSet.getString("thumbnail");
                String screen = resultSet.getString("screen");
                String os = resultSet.getString("os");
                String mainCamera = resultSet.getString("mainCamera");
                String selfieCamera = resultSet.getString("selfieCamera");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String stogare = resultSet.getString("str");
                String sim = resultSet.getString("sim");
                String battery = resultSet.getString("battery");
                String charger = resultSet.getString("charger");

                detailProduct dp = new detailProduct(productID_found, name, price, discount, quantity, thumbnail, screen, os, mainCamera, selfieCamera, chip, ram, stogare, sim, battery, charger);
                return dp;
            }
        } catch (SQLException e) {
            System.out.println("??findProductDetailByID: " + e.getMessage());
        }
        return null;
    }

//------------------------------------------------------------------
//------------------------------------------------------------------
    public List<Products> listAll() {
        List<Products> list = new ArrayList<>();
        String sql = """
            select productID, name, description, price, discount, created_at, updated_at, thumbnail, quantity
            from Products
        """;

        try {
            connection = getConnection();
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();

            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                Date create_at = resultSet.getDate("created_at");
                int price = resultSet.getInt("price");
                int discount = resultSet.getInt("discount");
                String img = resultSet.getString("thumbnail");
                int quantity = resultSet.getInt("quantity");
                String desc = resultSet.getString("description");

                Products pr = new Products();
                pr.setProductID(productID);
                pr.setName(name);
                pr.setCreated_at(create_at);
                pr.setPrice(price);
                pr.setDiscount(discount);
                pr.setThumbnail(img);
                pr.setQuantity(quantity);
                pr.setDescription(desc);
                list.add(pr);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preStatement != null) {
                    preStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
//*****************//

    public Products findProductByID(int productID) {
        Products product = null;
        connection = getConnection();
        String sql = """
        SELECT [productID],
               [name],
               [price],
               [discount],
               [quantity],
               [created_at],
               [updated_at],
               [description],
               [thumbnail]
        FROM [dbo].[Products]
        WHERE [productID] = ?
    """;

        try {
            preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, productID);
            resultSet = preStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("productID");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                int discount = resultSet.getInt("discount");
                int quantity = resultSet.getInt("quantity");
                Date createdAt = resultSet.getDate("created_at");
                Date updatedAt = resultSet.getDate("updated_at");
                String description = resultSet.getString("description");
                String thumbnail = resultSet.getString("thumbnail");

                product = new Products(id, name, price, discount, quantity, createdAt, updatedAt, description, thumbnail);
            }
        } catch (SQLException e) {
            System.out.println("??findProductByID: " + e.getMessage());
        }

        return product;
    }
    
    public List<ProductDetail> findProductDetailsByID(int productID) {
        List<ProductDetail> list = new ArrayList();
        connection = getConnection();
        String sql = """
        SELECT [ID],
               [productID],
               [screen],
               [os],
               [mainCamera],
               [selfieCamera],
               [chip],
               [ram],
               [storage],
               [sim],
               [battery],
               [charger],
               [color]
        FROM [dbo].[ProductDetails]
        WHERE [productID] = ?
    """;

        try {
            preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, productID);
            resultSet = preStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("ID");
                String screen = resultSet.getString("screen");
                String os = resultSet.getString("os");
                String mainCamera = resultSet.getString("mainCamera");
                String selfieCamera = resultSet.getString("selfieCamera");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String storage = resultSet.getString("storage");
                String sim = resultSet.getString("sim");
                String battery = resultSet.getString("battery");
                String charger = resultSet.getString("charger");
                String color = resultSet.getString("color");

                ProductDetail p = new ProductDetail(id, productID, screen, os, mainCamera, selfieCamera, chip, ram, storage, sim, battery, charger, color);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("??findProductDetailsByID: " + e.getMessage());
        }

        return list;
    }
    
    public void insertProduct(String name, String thumbnail, double price, String description, int quantity,
            double discount) {
        String sql = """
                     INSERT INTO [dbo].[Products] (
                         [name], 
                         [quantity], 
                         [price], 
                     \t[thumbnail],
                     \t[description],
                     \t[discount],
                     \t)
                     VALUES (N'""" + name + "','" + price + "','" + quantity + "','" + thumbnail + "',N'" + description + "','" + discount + "','1')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int insertProduct(String name, String thumbnail, Date created_at, Date updated_at, double price, String description, int quantity,
            double discount) {
        connection = getConnection();
        String sql = """
                     INSERT INTO [dbo].[Products] (
                         [name], 
                         [quantity], 
                         [price],
                         [created_at],
                         [updated_at],
                     \t[thumbnail],
                     \t[description],
                     \t[discount]
                     \t)
                     VALUES (?,?,?,?,?,?,?,?)""";
        int productID = 0;
        try {
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            //set values
            preStatement.setString(1, name);
            preStatement.setInt(2, quantity);
            preStatement.setDouble(3, price);
            preStatement.setDate(4, created_at);
            preStatement.setDate(5, updated_at);
            preStatement.setString(6, thumbnail);
            preStatement.setString(7, description);
            preStatement.setDouble(8, discount);

            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
            if (resultSet.next()) {
                productID = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("??insertProduct: " + e.getMessage());
        }
        return productID;
    }
    
    public void insertPCategory(int productId, int categoryId) {
        connection = getConnection();
        String sql = """
                     INSERT INTO [dbo].[productCategories]
                                ([productID]
                                ,[categoryID])
                          VALUES
                                (?, 
                                ?)
                     """;
        try {
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            //- thuc thi cau lenh
            preStatement.setObject(1, productId);
            preStatement.setObject(2, categoryId);

            preStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("??insertPCategory: " + e.getMessage());
        }
    }
    
    public void insertProductdetail(int productId, String screen, String os, String mainCam, String selfCam, String chip, String ram, String storage,
            String sim, String battery, String charger, String color) {
        connection = getConnection();
        String sql = """
                     INSERT INTO [dbo].[ProductDetails]
                                ([productID]
                                ,[screen]
                                ,[os]
                                ,[mainCamera]
                                ,[selfieCamera]
                                ,[chip]
                                ,[ram]
                                ,[storage]
                                ,[sim]
                                ,[battery]
                                ,[charger]
                                ,[color])
                          VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
                     """;
        try {
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preStatement.setObject(1, productId);
            preStatement.setObject(2, screen);
            preStatement.setObject(3, os);
            preStatement.setObject(4, mainCam);
            preStatement.setObject(5, selfCam);
            preStatement.setObject(6, chip);
            preStatement.setObject(7, ram);
            preStatement.setObject(8, storage);
            preStatement.setObject(9, sim);
            preStatement.setObject(10, battery);
            preStatement.setObject(11, charger);
            preStatement.setObject(12, color);

            preStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void insertGalleries(int productID, String pic) {
        connection = getConnection();
        String sql = """
                    INSERT INTO [dbo].[Galleries]
                     ([productID],
                     [picLink])
                    Values(?,?)
        """;
        try {
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preStatement.setObject(1, productID);
            preStatement.setObject(2, pic);

            preStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
//*****************//

    public void deleteProduct(int id) {
//        String sql = """
//                     DELETE from [dbo].[Products]
//                     Where productID = ?""";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        
        //- connect w/Database              //chạy lệnh khi xác nhận đơn hàng
        connection = getConnection();       //trigger sẽ tự động tính totalMoney
        //- Chuan bi cau lenh sql
        String sql = """
                     DELETE from [dbo].[Products]
                     Where productID = ?""";

        String sql2 = """
                      DELETE FROM [dbo].[productCategories]
                            WHERE productID = ?;
                      DELETE FROM [dbo].[Galleries]
                            WHERE productID = ?;
                      DELETE FROM [dbo].[Feedbacks]
                            WHERE productID = ?;
                      DELETE FROM [dbo].[OrderDetails]
                            WHERE productID = ?;
                      DELETE FROM [dbo].[ProductDetails]
                            WHERE productID = ?;
                      """;

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql2);   //delete ben productCategories trc
            //- set parameter
            preStatement.setObject(1, id);               //phone
            preStatement.setObject(2, id);               //phone
            preStatement.setObject(3, id);               //phone
            preStatement.setObject(4, id);               //phone
            preStatement.setObject(5, id);               //phone
            //- thuc thi cau lenh
            preStatement.executeUpdate();

            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter
            preStatement.setObject(1, id);               //phone
            //- thuc thi cau lenh
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??deleteProduct: " + e.getMessage());
        }
    }
//*****************//

    public void editProduct(int productID, String name, double price, double discount, int quantity, Date created_at, Date updated_at, String description, String thumnail) {
        connection = getConnection();

        String sql = """
        UPDATE [dbo].[Products]
           SET [name] = ?
              ,[price] = ?
              ,[discount] = ?
              ,[quantity] = ?
              ,[created_at] = ?
              ,[updated_at] = ?
              ,[description] = ?
              ,[thumbnail] = ?
         WHERE [productID] = ?
    """;

        try {
            // Update Products table
            preStatement = connection.prepareStatement(sql);

            preStatement.setString(1, name);
            preStatement.setDouble(2, price);
            preStatement.setDouble(3, discount);
            preStatement.setInt(4, quantity);
            preStatement.setDate(5, created_at);
            preStatement.setDate(6, updated_at);
            preStatement.setString(7, description);
            preStatement.setString(8, thumnail);
            preStatement.setInt(9, productID);

            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??editProduct: " + e.getMessage());
        }
    }

    public void editProductDetails(int ID, String screen, String os, String mainCamera, String selfieCamera, String chip, String ram, String storage, String sim, String battery, String charger, String color) {
        //- connect w/Database
        connection = getConnection();

        String sql = """
        UPDATE [dbo].[ProductDetails]
        SET [screen] = ?,
            [os] = ?,
            [mainCamera] = ?,
            [selfieCamera] = ?,
            [chip] = ?,
            [ram] = ?,
            [storage] = ?,
            [sim] = ?,
            [battery] = ?,
            [charger] = ?,
            [color] = ?
        WHERE [ID] = ?
    """;

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setString(1, screen);
            preStatement.setString(2, os);
            preStatement.setString(3, mainCamera);
            preStatement.setString(4, selfieCamera);
            preStatement.setString(5, chip);
            preStatement.setString(6, ram);
            preStatement.setString(7, storage);
            preStatement.setString(8, sim);
            preStatement.setString(9, battery);
            preStatement.setString(10, charger);
            preStatement.setString(11, color);
            preStatement.setInt(12, ID);
            
            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??editProductDetails: " + e.getMessage());
        }
    }

    public void deleteProductDetail(int ID) {
        connection = getConnection();
        String sql = """
                    DELETE FROM [dbo].[ProductDetails]
                          WHERE [ID] = ?
                                    """;
        try {
            preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, ID);
            

            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??deleteProductDetails: " + e.getMessage());
        }
    }

    public List<ProductDetail> findAllPDByProductId(int productID) {
        List<ProductDetail> allPds = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenhj sql
        String sql = """
                     SELECT [ID]
                           ,[productID]
                           ,[screen]
                           ,[os]
                           ,[mainCamera]
                           ,[selfieCamera]
                           ,[chip]
                           ,[ram]
                           ,[storage]
                           ,[sim]
                           ,[battery]
                           ,[charger]
                           ,[color]
                       FROM [dbo].[ProductDetails]
                       where [productID] = ?""";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, productID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int id = resultSet.getInt("ID");
                int productID_found = resultSet.getInt("productID");
                String screen = resultSet.getString("screen");
                String os = resultSet.getString("os");
                String mainCam = resultSet.getString("mainCamera");
                String selfCam = resultSet.getString("selfieCamera");
                String chip = resultSet.getString("chip");
                String ram = resultSet.getString("ram");
                String storage = resultSet.getString("storage");
                String sim = resultSet.getString("sim");
                String battery = resultSet.getString("battery");
                String charger = resultSet.getString("charger");
                String color = resultSet.getString("color");

                ProductDetail pd = new ProductDetail(id, productID_found, screen, os, mainCam, selfCam, chip, ram, storage, sim, battery, charger, color);
                allPds.add(pd);
            }
        } catch (SQLException e) {
            System.out.println("??findAllPDByProductId: " + e.getMessage());
        }
        return allPds;
    }

    public void editProductCategory(int productID, int old_categoryID, int new_categoryID) {
        connection = getConnection();
        String sql = """
                    UPDATE [dbo].[productCategories]
                    SET [categoryID] = ?
                    WHERE [productID] = ? and [categoryID] = ?
                                    """;

        try {
            preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, new_categoryID);
            preStatement.setInt(2, productID);
            preStatement.setInt(3, old_categoryID);

            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??editProductCategory: " + e.getMessage());
        }
    }

    public void editGalleries(int productID, String pic) {
        connection = getConnection();
        String sql = """
        UPDATE [dbo].[Galleries]
        SET [picLink] = ?
        WHERE [productID] = ?
    """;

        try {
            preStatement = connection.prepareStatement(sql);

            preStatement.setString(1, pic);
            preStatement.setInt(2, productID);

            preStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("??editGalleries: " + e.getMessage());
        }
    }

    public List<Categories> findAllCategoryOfProduct(int productID) {
        List<Categories> allCate = new ArrayList<>();
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     SELECT pc.[categoryID], c.[name]
                       FROM [dbo].[productCategories] pc
                       INNER JOIN Categories c ON pc.categoryID = c.categoryID
                       where [productID] = ?""";

        try {
            //- Tao doi tuong prepareStatement
            preStatement = connection.prepareStatement(sql);
            //- set parameter (optional)
            preStatement.setObject(1, productID);
            //- thuc thi cau lenh
            resultSet = preStatement.executeQuery();
            //- tra ve ket qua
            while (resultSet.next()) {
                int cateId = resultSet.getInt("categoryID");    //id của categories
                String name = resultSet.getString("name");

                allCate.add(new Categories(cateId, name, ""));
            }
        } catch (SQLException e) {
            System.out.println("??findAllCategoryOfProduct: " + e.getMessage());
        }
        return allCate;
    }

    // KLEQING ONLY - INDEX.JSP
    public int TotalProduct() {
        int totalQuantity = 0;
        connection = getConnection();
        String sql = """
        SELECT 
            SUM(quantity) AS total_quantity
        FROM Products;
    """;
        try {
            preStatement = connection.prepareStatement(sql);

            resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                totalQuantity = resultSet.getInt("total_quantity");
            }
        } catch (SQLException e) {
            System.out.println("??Error: " + e.getMessage());
        }
        return totalQuantity;
    }
    
    Validate val = new Validate();
    
    public String TotalOrderDetail() {
        double orderDetail = 0;
        connection = getConnection();
        String sql = """
        SELECT SUM(price) AS total_price
        FROM OrderDetails;
    """;
        try {
            preStatement = connection.prepareStatement(sql);

            resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                orderDetail = resultSet.getDouble("total_price");
            }
        } catch (SQLException e) {
            System.out.println("??Error: " + e.getMessage());
        }
        String formattedOrderDetail = val.doubleToMoney(orderDetail);
        return formattedOrderDetail;
    }
    
    public int CountReport() {
        int report = 0;
        connection = getConnection();
        String sql = """
        SELECT COUNT(*) AS report
        FROM Feedbacks;
    """;
        try {
            preStatement = connection.prepareStatement(sql);

            resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                report = resultSet.getInt("report");
            }
        } catch (SQLException e) {
            System.out.println("??Error: " + e.getMessage());
        }
        return report;
    }
    
    public int CountOrder() {
        int order = 0;
        connection = getConnection();
        String sql = """
        SELECT COUNT(*) AS total_orders
        FROM Orders;
    """;
        try {
            preStatement = connection.prepareStatement(sql);

            resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                order = resultSet.getInt("total_orders");
            }
        } catch (SQLException e) {
            System.out.println("??Error: " + e.getMessage());
        }
        return order;
    }
    
    public List<Products> listTop5() {
        List<Products> list = new ArrayList<>();
        String sql = """
            SELECT TOP 5 *
            FROM Products
        """;

        try {
            connection = getConnection();
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                Date create_at = resultSet.getDate("created_at");
                Double discount = resultSet.getDouble("discount");
                
                String con_price = val.doubleToMoney(price);
                String con_discount = val.doubleToMoney(discount);
                
                Products pr = new Products();
                pr.setName(name);
                pr.setCreated_at(create_at);
                pr.setPriceString(con_price);
                pr.setDisString(con_discount);
                pr.setQuantity(quantity);
                list.add(pr);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preStatement != null) {
                    preStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

//------------------------------------------------------------------
//------------------------------------------------------------------
    public static void main(String[] args) {
        ProductDAO DB = new ProductDAO();
//        List<showProduct> list1 = DB.findAllShowProductByCategoryName("Smartphones");
//        for (showProduct item : list1) {
//            System.out.println(item.toString());
//        }
        DB.deleteProduct(3);
//        List<ProductDetail> list2 = DB.findDetailByProductID(1);
//        for (ProductDetail item : list2) {
//            System.out.println(item.toString());
//        }
    }

//------------------------------------------------------------------
}
