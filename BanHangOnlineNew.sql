Create database BanHangOnlineNew;--Create database BanHangOnlineNew
USE BanHangOnlineNew;		--Xóa database cũ đi rồi thêm bản mới này vào

CREATE TABLE Roles (
  roleID	int IDENTITY PRIMARY KEY NOT NULL, 
  [name]    nvarchar(50) NOT NULL UNIQUE
);

CREATE TABLE Users (
  userID		int IDENTITY PRIMARY KEY NOT NULL, 
  fullName		nvarchar(100) NOT NULL, 
  email			nvarchar(100) NOT NULL UNIQUE, 
  [password]    nvarchar(255) NOT NULL, 
  phone			nvarchar(20) NULL, 
  [address]     nvarchar(255) NULL, 
  roleID		int NOT NULL, 
  FOREIGN KEY (roleID) REFERENCES Roles (roleID)
);

CREATE TABLE Categories (
  categoryID        int IDENTITY PRIMARY KEY NOT NULL, 
  [name]			nvarchar(100) NOT NULL, 
  [description]		nvarchar(300) NULL, 
);

CREATE TABLE Products (
  productID		int IDENTITY PRIMARY KEY NOT NULL, 
  [name]		nvarchar(100) NOT NULL, 
  price			decimal(20, 2) NOT NULL, 
  discount		decimal(20, 2) NULL, 
  quantity		int NULL, 
  created_at    datetime NULL, 
  updated_at    datetime NULL, 
  [description] nvarchar(2000) NULL, 
  thumbnail		nvarchar(255) NULL, 
);

CREATE TABLE productCategories (		--Bảng nối, phục vụ tìm kiếm và phân loại
  productID  int NOT NULL, 
  categoryID int NOT NULL,
  FOREIGN KEY (productID) REFERENCES Products (productID),
  FOREIGN KEY (categoryID) REFERENCES Categories (categoryID)
);

CREATE TABLE Orders (
  orderID        int IDENTITY PRIMARY KEY NOT NULL, 
  userID         int NOT NULL,
  orderConfirmed bit NOT NULL,
  orderDate      datetime NULL, 
  totalMoney     decimal(20, 2) NOT NULL, 
  phone          nvarchar(20) NOT NULL, 
  paymentStatus  nvarchar(50) NULL, 
  deliveryStatus nvarchar(50) NULL, 
  paymentType    nvarchar(100) NULL,
  deliveryInfo   nvarchar(100) NULL,
  [nameOrder]	 nvarchar(100) NULL,
  deliveryLocation nvarchar(300) NOT NULL,
  FOREIGN KEY (userID) REFERENCES Users (userID)
);

--ALTER TABLE Orders
--ADD deliveryLocation nvarchar(300) NOT NULL;
--ALTER TABLE Orders
--ADD [nameOrder] nvarchar(100);

--drop table Orders;
--drop table OrderDetails;

CREATE TABLE OrderDetails (
  ID        int IDENTITY PRIMARY KEY NOT NULL, 
  productID int NOT NULL, 
  orderID   int NOT NULL, 
  quantity  int NOT NULL, 
  price     decimal(20, 2) NOT NULL, 
  FOREIGN KEY (orderID) REFERENCES Orders (orderID),
  FOREIGN KEY (productID) REFERENCES Products (productID)
);

ALTER TABLE OrderDetails
ADD color nvarchar(200);

CREATE TABLE ProductDetails (
  ID           int IDENTITY PRIMARY KEY NOT NULL, 
  productID    int NOT NULL, 
  screen       nvarchar(200) NULL, 
  os           nvarchar(100) NULL, 
  mainCamera   nvarchar(200) NULL, 
  selfieCamera nvarchar(200) NULL, 
  chip         nvarchar(100) NULL, 
  ram          nvarchar(100) NULL, 
  storage      nvarchar(200) NULL, 
  sim          nvarchar(200) NULL, 
  battery      nvarchar(100) NULL, 
  charger      nvarchar(200) NULL,
  color	       nvarchar(200) NULL,
  FOREIGN KEY (productID) REFERENCES Products (productID)
);

--drop table ProductDetails

CREATE TABLE Feedbacks (
  ID        int IDENTITY PRIMARY KEY NOT NULL, 
  productID int NOT NULL, 
  userID    int NOT NULL, 
  note      nvarchar(255) NOT NULL, 
  FOREIGN KEY (userID) REFERENCES Users (userID),
  FOREIGN KEY (productID) REFERENCES Products (productID)
);

CREATE TABLE Galleries (
  galleryID int IDENTITY PRIMARY KEY NOT NULL, 
  productID int NOT NULL, 
  picLink   nvarchar(255) NULL, 
  FOREIGN KEY (productID) REFERENCES Products (productID)
);
--//////////////////////////////////////////////////////////////////
--TRIGGER tự động update total money
CREATE TRIGGER trg_UpdateTotalMoney
ON OrderDetails
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Xử lý INSERT và UPDATE
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Cập nhật totalMoney cho các đơn hàng bị ảnh hưởng
        UPDATE Orders
        SET totalMoney = (SELECT SUM(price * quantity)
                          FROM OrderDetails
                          WHERE OrderDetails.orderID = Orders.orderID)
        WHERE Orders.orderID IN (SELECT DISTINCT orderID FROM inserted);
    END

    -- Xử lý DELETE
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Cập nhật totalMoney cho các đơn hàng bị ảnh hưởng
        UPDATE Orders
        SET totalMoney = (SELECT SUM(price * quantity)
                          FROM OrderDetails
                          WHERE OrderDetails.orderID = Orders.orderID)
        WHERE Orders.orderID IN (SELECT DISTINCT orderID FROM deleted);
    END
END;

--//////////////////////////////////////////////////////////////////
CREATE TRIGGER trg_UpdateQuantity
ON OrderDetails
AFTER UPDATE
AS
BEGIN
    DELETE FROM OrderDetails
    WHERE ID IN (SELECT ID FROM inserted WHERE quantity = 0);
END;


--//////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////

--Dữ liệu mẫu

-- Insert dữ liệu vào bảng Roles
INSERT INTO Roles ([name]) VALUES ('admin');		--1
INSERT INTO Roles ([name]) VALUES ('customer');		--2

-- Insert dữ liệu vào bảng Users
INSERT INTO Users (fullName, email, password, phone, address, roleID)
VALUES
  ('admin', 'admin@gmail.com', '12345', '0987654111', '123 Admin Street', 1),
  ('customer', 'customer@gmail.com', '12345', '0987654222', '123 Customer Street', 2),
  (N'Nguyễn Văn A', 'nguyen.a@example.com', '6789', '0123456789', N'123 ABC Hà Nội', 2),  -- Vietnamese name and address
  (N'Trần Thị B', 'tran.thi.b@example.com', '6789', '0987654321', N'456 DEF Sài Gòn', 2),   -- Vietnamese name and address
  ('John Smith', 'john.smith@example.com', 'secret123', '1234567890', '789 Main Street', 2),
  ('Jane Doe', 'jane.doe@example.com', 'secure456', '0987654000', '456 Elm Street', 2),
  ('David Lee', 'david.lee@example.com', 'password789', '5551234567', '100 Oak Street', 2),
  ('Emily Jones', 'emily.jones@example.com', 'secret012', '9876543210', '200 Maple Street', 2),
  ('Michael Brown', 'michael.brown@example.com', 'secure345', '4567890123', '300 Pine Street', 2),
  ('Sarah Garcia', 'sarah.garcia@example.com', 'password678', '8765432091', '400 Birch Street', 2);


-- Insert dữ liệu vào bảng Categories
INSERT INTO Categories ([name], [description])
VALUES ('Smartphones', N'High-performance mobile phones with advanced features.'),  -- 1
       ('Tablets', N'Mobile computers with larger screens than smartphones, ideal for entertainment, productivity, and creativity.'),	-- 2
       ('Apple', N'Premium smartphones,... known for their sleek design, powerful performance, and innovative iOS operating system.'),		-- 3
       ('Samsung', N'Leading Android smartphone manufacturer offering a wide range of devices for various budgets and needs.'),			-- 4
       ('Oppo', N'Popular smartphone brand known for its innovative camera technology and fast charging capabilities.'),					-- 5
       ('Xiaomi', N'Cost-effective smartphone brand offering high-performance features at competitive prices.'),							-- 6
       ('Realme', N'Emerging smartphone brand focusing on powerful processors and stylish designs at affordable prices.'),				-- 7
       ('Honor', N'Sub-brand of Huawei known for its innovative features and competitive pricing for budget-conscious users.'),			-- 8
       ('Tecno', N'Smartphone brand offering budget-friendly devices with long battery life and impressive camera features.'),			-- 9
	   --Dòng điện thoại
	   ('Iphone 11', N'Cao cấp'),	--10
	   ('Iphone 12', N'Cao cấp'),	--11
	   ('Iphone 13', N'Cao cấp'),	--12
	   ('Iphone 14', N'Cao cấp'),	--13
	   ('Iphone 15', N'Cao cấp'),	--14
	   ('Galaxy Z', N'Cao cấp, gập'),	--15
	   ('Galaxy S', N'Cao cấp'),		--16
	   ('Galaxy A', N'Tầm trung'),		--17
	   ('Galaxy M', N'Giá rẻ'),			--18
	   ('OPPO Find N', N'Cao cấp, gập'), --19
	   ('OPPO Find X', N'Cao cấp'),		 --20
	   ('OPPO Reno', N'Tầm trung'),		 --21
	   ('OPPO A', N'Giá rẻ'),			 --22
	   --Dòng Máy tính bảng
	   ('iPad Gen', N'Tầm trung'),						--23
	   ('iPad Air', N'Tầm trung, kích thước lớn'),		--24
	   ('iPad Mini', N'Tầm trung, kích thước nhỏ gọn'),	--25
	   ('iPad Pro', N'Cao cấp'),						--26
	   ('Galaxy Tab S', N'Cao cấp'),			--27
	   ('Galaxy Tab A', N'Giá rẻ'),				--28
	   ('Xiaomi Redmi Pad', N'Tầm trung'),		--29
	   ('Xiaomi Pad', N'Tầm trung');			--30

-- Insert dữ liệu vào bảng Products
INSERT INTO Products ([name], price, discount, quantity, created_at, updated_at, [description], thumbnail) 
VALUES
('OPPO Reno11 F 5G 8GB-256GB', 8490, 7990, 100, GETDATE(), GETDATE(), 'OPPO Reno11 F 5G 8GB-256GB', './img_svg/0_picProduct/Oppo/oppo-reno11-thumnail.jpg'),
('iPhone 11 Pro 256GB', 25000000, 20990000, 100, GETDATE(), GETDATE(), 'iPhone 11 Pro 256GB', './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-thumnail.jpg'),
('iPhone 11 Pro 512GB', 27900000, 23990000, 100, GETDATE(), GETDATE(), 'iPhone 11 Pro 512GB', './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-thumnail.jpg'),
('iPhone 11 64GB', 11990000, 8500000, 100, GETDATE(), GETDATE(), 'iPhone 11 64GB', './img_svg/0_picProduct/Iphone/11/iphone-11-thumnail.jpg'),
('iPhone 12 64GB', 17990000, 11990000, 100, GETDATE(), GETDATE(), 'iPhone 12 64GB', './img_svg/0_picProduct/Iphone/12/12_12-mini/iphone-12-thumnail.jpg'),
('iPhone 12 Pro Max 128GB', 21990000, 17990000, 100, GETDATE(), GETDATE(), 'iPhone 12 Pro Max 128GB', './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-thumnail.jpg'),
('iPhone 12 Pro 256GB', 19990000, 15990000, 100, GETDATE(), GETDATE(), 'iPhone 12 Pro Max 256GB', './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-thumnail.jpg'),
('iPhone 13 128GB', 18990000, 13890000, 100, GETDATE(), GETDATE(), 'iPhone 13 128GB', './img_svg/0_picProduct/Iphone/13/13_13-mini/iphone-13-thumnail.jpg'),
('iPhone 13 Pro 128GB', 24990000, 20990000, 100, GETDATE(), GETDATE(), 'iPhone 13 Pro 128GB', './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-thumnail.jpg'),
('iPhone 13 Pro Max 256GB', 28990000, 24990000, 100, GETDATE(), GETDATE(), 'iPhone 13 Pro Max 256GB', './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-thumnail.jpg'),
('iPhone 14 128GB', 21990000, 17790000, 100, GETDATE(), GETDATE(), 'iPhone 14 128GB', './img_svg/0_picProduct/Iphone/14/14_14-plus/iphone-14-thumnail.jpg'),
('iPhone 14 Pro 128GB', 27990000, 24690000, 100, GETDATE(), GETDATE(), 'iPhone 14 Pro 128GB', './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-thumnail.jpg'),
('iPhone 14 Pro Max 256GB', 32990000, 27990000, 100, GETDATE(), GETDATE(), 'iPhone 14 Pro Max 256GB', './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-thumnail.jpg'),
('iPhone 15 Plus 128GB', 25990000, 22990000, 100, GETDATE(), GETDATE(), 'iPhone 15 Plus 128GB', './img_svg/0_picProduct/Iphone/15/15_15-plus/iphone-15-thumnail.jpg'),
('iPhone 15 Pro Max 256GB', 34990000, 29290000, 100, GETDATE(), GETDATE(), 'iPhone 15 Pro Max 256GB', './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-thumnail.jpg'),
('iPhone 15 Pro Max 1TB', 46990000, 42990000, 100, GETDATE(), GETDATE(), 'iPhone 15 Pro Max 512GB', './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-thumnail.jpg'),
('Samsung Galaxy A55 5G 128GB', 9990000, 9690000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy A55 5GB 128GB', './img_svg/0_picProduct/Samsung/Galaxy-A/samsung-galaxy-a55-thumnail.png'),
('Samsung Galaxy M15 5G 128GB', 5990000, 4690000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy M15 5GB 128GB', './img_svg/0_picProduct/Samsung/Galaxy-M/m15/samsung-galaxy-m15-thumnail.jpg'),
('Samsung Galaxy M55 5G 256GB', 11690000, 10690000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy M55 5GB 256GB', './img_svg/0_picProduct/Samsung/Galaxy-M/m55/samsung-galaxy-m55-thumnail.jpg'),
('Samsung Galaxy Z Flip4 5G 128GB', 23990000, 12990000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy Z Flip4 5G 128GB', './img_svg/0_picProduct/Samsung/Galaxy-Z/z-flip4/samsung-galaxy-z-flip4-thumnail.jpg'),
('Samsung Galaxy Z Fold5 5G 256GB', 40990000, 27990000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy Z Fold5 5G 256GB', './img_svg/0_picProduct/Samsung/Galaxy-Z/z-fold5/samsung-galaxy-zfold-5-thumnail.jpg'),
('Samsung Galaxy S24 Plus 5G 256GB', 26990000, 24990000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy S24 Plus 5G 256GB', './img_svg/0_picProduct/Samsung/s24_s24-plus/samsung-galaxy-s24-thumnail.jpg'),
('Samsung Galaxy S24 Ultra 5G 256GB', 33990000, 29990000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy S24 Ultra 5G 256GB', './img_svg/0_picProduct/Samsung/s24-ultra/samsung-galaxy-s24-ultra-thumnail.jpg'),
('Xiaomi Poco M6 Pro 8GB-256GB', 6490000, 5900000, 100, GETDATE(), GETDATE(), 'Xiaomi Poco M6 Pro 8GB-256GB', './img_svg/0_picProduct/Xiaomi/xiaomi-poco-m6-thumnail.jpg'),
--Tablet
('Samsung Galaxy Tab S9 2024 128GB', 19900000, 16990000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy Tab S9 2024 128GB', './img_svg/0_picProduct/Samsung/Galaxy-Tab/samsung-galaxy-tab-s9-thumnail.jpg'),
('Samsung Galaxy Tab S9 2024 256GB', 21000000, 18900000, 100, GETDATE(), GETDATE(), 'Samsung Galaxy Tab S9 2024 256GB', './img_svg/0_picProduct/Samsung/Galaxy-Tab/samsung-galaxy-tab-s9-thumnail.jpg'),
('iPad Gen 10 2022 WiFi 64GB', 12900000, 9990000, 100, GETDATE(), GETDATE(), 'iPad Gen 10 2022 WiFi 64GB', './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-thumnail.jpg'),
('iPad Gen 10 2022 WiFi 256GB', 16990000, 13690000, 100, GETDATE(), GETDATE(), 'iPad Gen 10 2022 WiFi 256GB', './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-thumnail.jpg'),
('iPad Air 11inch M2 WiFi 128GB', 20000000, 16990000, 100, GETDATE(), GETDATE(), 'iPad Air 11inch M2 WiFi 128GB', './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-thumnail.jpg'),
('iPad Air 11inch M2 WiFi 1TB', 32000000, 30500000, 100, GETDATE(), GETDATE(), 'iPad Air 11inch M2 WiFi 1TB', './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-thumnail.jpg'),
('iPad mini 6 2021 8.3 inch WiFi 64GB', 13200000, 12800000, 100, GETDATE(), GETDATE(), 'iPad mini 6 2021 8.3 inch WiFi 64GB', './img_svg/0_picProduct/iPad/mini/ipad-mini-6-thumnail.jpg'),
('iPad Pro 13 inch M4 2024 Wifi 256GB', 43490000, 43390000, 100, GETDATE(), GETDATE(), 'iPad Pro 13 inch M4 2024 Wifi 256GB', './img_svg/0_picProduct/iPad/pro/ipad-pro-13inch-M4-wifi-thumnail.jpg'),
('iPad Pro 11 inch M4 2024 Wifi 256GB', 30000000, 28990000, 100, GETDATE(), GETDATE(), 'iPad Pro 11 inch M4 2024 Wifi 256GB', './img_svg/0_picProduct/iPad/pro/ipad-pro-13inch-M4-wifi-thumnail.jpg');
INSERT INTO Products ([name], price, discount, quantity, created_at, updated_at, [description], thumbnail)
VALUES
('OPPO Reno11 F 5G 8GB-256GB', 8490, 7990, 100, GETDATE(), GETDATE(), 'OPPO Reno11 F 5G 8GB-256GB', './img_svg/0_picProduct/Oppo/oppo-reno11-thumnail.jpg')

INSERT INTO productCategories (productID, categoryID)
values
(1,1), (2,1), (3,1), (4,1), (5,1), (6,1), (7,1), (8,1), (9,1), (10,1), (11,1), (12,1),(13,1),(14,1),(15,1),
(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),
/*tablet*/
(25, 2),(26, 2),(27, 2),(28, 2),(29, 2),(30, 2),(31, 2),(32, 2),(33, 2),
/*apple*/
(2,3), (3,3), (4,3), (5,3), (6,3), (7,3), (8,3), (9,3), (10,3), (11,3), (12,3), (13,3), (14,3), (15,3), (16,3),
(27,3), (28,3), (29,3), (30,3), (31,3), (32,3), (33,3),
/*Samsung*/
(17,4), (18,4), (19,4), (20,4), (21,4), (22,4), (23,4), 
(25, 4), (26, 4),
/*Oppo*/
(1, 5),
/*Xiaomi*/
(24, 6);

-------
-- Insert dữ liệu vào bảng ProductDetails
-- Insert into ProductDetails
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
VALUES
-- OPPO Reno11 F 5G 8GB-256GB
(1, '6.4 inches', 'Android 14', '50 MP', '32 MP', 'MediaTek Dimensity 7050', '8 GB', '256 GB', 'Dual SIM', '4500 mAh', '65W', N'Xanh'),
(1, '6.4 inches', 'Android 14', '50 MP', '32 MP', 'MediaTek Dimensity 7050', '8 GB', '256 GB', 'Dual SIM', '4500 mAh', '65W', N'Xanh biển'),
-- iPhone 11 Pro 256GB
(2, '5.8 inches', 'iOS 13', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '256 GB', 'Dual SIM', '3046 mAh', '18W', N'Bạc'),
(2, '5.8 inches', 'iOS 13', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '256 GB', 'Dual SIM', '3046 mAh', '18W', N'Vàng'),
(2, '5.8 inches', 'iOS 13', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '256 GB', 'Dual SIM', '3046 mAh', '18W', N'Xám'),
-- iPhone 11 Pro 512GB
(3, '5.8 inches', 'iOS 13', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '512 GB', 'Dual SIM', '3046 mAh', '18W', N'Bạc'),
(3, '5.8 inches', 'iOS 13', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '512 GB', 'Dual SIM', '3046 mAh', '18W', N'Vàng'),
(3, '5.8 inches', 'iOS 13', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '512 GB', 'Dual SIM', '3046 mAh', '18W', N'Xám'),
-- iPhone 11 64GB
(4, '6.1 inches', 'iOS 13', '12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '64 GB', 'Dual SIM', '3110 mAh', '18W', N'Đen'),
(4, '6.1 inches', 'iOS 13', '12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '64 GB', 'Dual SIM', '3110 mAh', '18W', N'Trắng'),
(4, '6.1 inches', 'iOS 13', '12 MP + 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '64 GB', 'Dual SIM', '3110 mAh', '18W', N'Vàng'),
-- iPhone 12 64GB
(5, '6.1 inches', 'iOS 14', '12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'Dual SIM', '2815 mAh', '20W', N'Đen'),
(5, '6.1 inches', 'iOS 14', '12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'Dual SIM', '2815 mAh', '20W', N'Đỏ'),
(5, '6.1 inches', 'iOS 14', '12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'Dual SIM', '2815 mAh', '20W', N'Tím'),
(5, '6.1 inches', 'iOS 14', '12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'Dual SIM', '2815 mAh', '20W', N'Trắng'),
-- iPhone 12 Pro Max 128GB
(6, '6.7 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '128 GB', 'Dual SIM', '3687 mAh', '20W', N'Bạc'),
(6, '6.7 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '128 GB', 'Dual SIM', '3687 mAh', '20W', N'Vàng'),
(6, '6.7 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '128 GB', 'Dual SIM', '3687 mAh', '20W', N'Xám'),
(6, '6.7 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '128 GB', 'Dual SIM', '3687 mAh', '20W', N'Xanh'),
-- iPhone 12 Pro 256GB
(7, '6.1 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '256 GB', 'Dual SIM', '2815 mAh', '20W', N'Bạc'),
(7, '6.1 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '256 GB', 'Dual SIM', '2815 mAh', '20W', N'Vàng'),
(7, '6.1 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '256 GB', 'Dual SIM', '2815 mAh', '20W', N'Xám'),
(7, '6.1 inches', 'iOS 14', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '256 GB', 'Dual SIM', '2815 mAh', '20W', N'Xanh'),
-- iPhone 13 128GB
(8, '6.1 inches', 'iOS 15', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '128 GB', 'Dual SIM', '3240 mAh', '20W', N'Đen'),
(8, '6.1 inches', 'iOS 15', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '128 GB', 'Dual SIM', '3240 mAh', '20W', N'Hồng'),
(8, '6.1 inches', 'iOS 15', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '128 GB', 'Dual SIM', '3240 mAh', '20W', N'Trắng'),
(8, '6.1 inches', 'iOS 15', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '128 GB', 'Dual SIM', '3240 mAh', '20W', N'Xanh'),
-- iPhone 13 Pro 128GB
(9, '6.1 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3095 mAh', '20W', N'Bạc'),
(9, '6.1 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3095 mAh', '20W', N'Vàng'),
(9, '6.1 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3095 mAh', '20W', N'Xám'),
(9, '6.1 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3095 mAh', '20W', N'Xanh'),
-- iPhone 13 Pro Max 256GB
(10, '6.7 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '256 GB', 'Dual SIM', '4352 mAh', '20W', N'Bạc'),
(10, '6.7 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '256 GB', 'Dual SIM', '4352 mAh', '20W', N'Vàng'),
(10, '6.7 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '256 GB', 'Dual SIM', '4352 mAh', '20W', N'Xám'),
(10, '6.7 inches', 'iOS 15', '12 MP + 12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '256 GB', 'Dual SIM', '4352 mAh', '20W', N'Xanh'),
-- iPhone 14 128GB
(11, '6.1 inches', 'iOS 16', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3279 mAh', '20W', N'Đen'),
(11, '6.1 inches', 'iOS 16', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3279 mAh', '20W', N'Tím'),
(11, '6.1 inches', 'iOS 16', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3279 mAh', '20W', N'Trắng'),
(11, '6.1 inches', 'iOS 16', '12 MP + 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB', 'Dual SIM', '3279 mAh', '20W', N'Vàng'),
-- iPhone 14 Pro 128GB
(12, '6.1 inches', 'iOS 16', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '128 GB', 'Dual SIM', '3200 mAh', '20W', N'Bạc'),
(12, '6.1 inches', 'iOS 16', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '128 GB', 'Dual SIM', '3200 mAh', '20W', N'Đen'),
(12, '6.1 inches', 'iOS 16', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '128 GB', 'Dual SIM', '3200 mAh', '20W', N'Tím'),
-- iPhone 14 Pro Max 256GB
(13, '6.7 inches', 'iOS 16', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Bạc'),
(13, '6.7 inches', 'iOS 16', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Đen'),
(13, '6.7 inches', 'iOS 16', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Tím'),
-- iPhone 15 Plus 128GB
(14, '6.7 inches', 'iOS 17', '48 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '128 GB', 'Dual SIM', '4383 mAh', '20W', N'Hồng'),
(14, '6.7 inches', 'iOS 17', '48 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '128 GB', 'Dual SIM', '4383 mAh', '20W', N'Vàng'),
(14, '6.7 inches', 'iOS 17', '48 MP + 12 MP', '12 MP', 'Apple A16 Bionic', '6 GB', '128 GB', 'Dual SIM', '4383 mAh', '20W', N'Xanh'),
-- iPhone 15 Pro Max 256GB
(15, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Titan tự nhiên'),
(15, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Trắng'),
(15, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Đen'),
(15, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '256 GB', 'Dual SIM', '4323 mAh', '20W', N'Xanh'),
-- iPhone 15 Pro Max 1TB
(16, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '1 TB', 'Dual SIM', '4323 mAh', '20W', N'Titan tự nhiên'),
(16, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '1 TB', 'Dual SIM', '4323 mAh', '20W', N'Trắng'),
(16, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '1 TB', 'Dual SIM', '4323 mAh', '20W', N'Đen'),
(16, '6.7 inches', 'iOS 17', '48 MP + 12 MP + 12 MP', '12 MP', 'Apple A17 Pro', '8 GB', '1 TB', 'Dual SIM', '4323 mAh', '20W', N'Xanh'),
-- Samsung Galaxy A55 5G 128GB
(17, '6.5 inches', 'Android 14', '50 MP + 12 MP + 5 MP', '32 MP', 'Exynos 1480', '8 GB', '128 GB', 'Dual SIM', '5000 mAh', '25W', N'Đen'),
(17, '6.5 inches', 'Android 14', '50 MP + 12 MP + 5 MP', '32 MP', 'Exynos 1480', '8 GB', '128 GB', 'Dual SIM', '5000 mAh', '25W', N'Tím'),
(17, '6.5 inches', 'Android 14', '50 MP + 12 MP + 5 MP', '32 MP', 'Exynos 1480', '8 GB', '128 GB', 'Dual SIM', '5000 mAh', '25W', N'Xanh'),
-- Samsung Galaxy M15 5G 128GB
(18, '6.4 inches', 'Android 14', '50 MP + 5 MP + 2MP', '8 MP', 'Dimensity 6100+', '6 GB', '128 GB', 'Dual SIM', '5000 mAh', '25W', N'Xám'),
(18, '6.4 inches', 'Android 14', '50 MP + 5 MP + 2MP', '8 MP', 'Dimensity 6100+', '6 GB', '128 GB', 'Dual SIM', '5000 mAh', '25W', N'Xanh'),
(18, '6.4 inches', 'Android 14', '50 MP + 5 MP + 2MP', '8 MP', 'Dimensity 6100+', '6 GB', '128 GB', 'Dual SIM', '5000 mAh', '25W', N'Xanh ngọc'),
-- Samsung Galaxy M55 5G 256GB
(19, '6.7 inches', 'Android 14', '50 MP + 8 MP + 2 MP', '32 MP', 'Snapdragon 7 Gen 1', '8 GB', '256 GB', 'Dual SIM', '5000 mAh', '45W', N'Đen'),
(19, '6.7 inches', 'Android 14', '50 MP + 8 MP + 2 MP', '32 MP', 'Snapdragon 7 Gen 1', '8 GB', '256 GB', 'Dual SIM', '5000 mAh', '45W', N'Xanh ngọc'),
-- Samsung Galaxy Z Flip4 5G 128GB
(20, '6.7 inches', 'Android 12', '12 MP + 12 MP', '10 MP', 'Snapdragon 8+ Gen 1', '8 GB', '128 GB', 'Dual SIM', '3700 mAh', '25W', N'Tím'),
(20, '6.7 inches', 'Android 12', '12 MP + 12 MP', '10 MP', 'Snapdragon 8+ Gen 1', '8 GB', '128 GB', 'Dual SIM', '3700 mAh', '25W', N'Vàng'),
(20, '6.7 inches', 'Android 12', '12 MP + 12 MP', '10 MP', 'Snapdragon 8+ Gen 1', '8 GB', '128 GB', 'Dual SIM', '3700 mAh', '25W', N'Xanh'),
-- Samsung Galaxy Z Fold5 5G 256GB
(21, '7.6 inches', 'Android 13', '50 MP + 12 MP + 10 MP', '10 MP + 4MP', 'Snapdragon 8+ Gen 1', '12 GB', '256 GB', 'Dual SIM', '4400 mAh', '25W', N'Vàng'),
(21, '7.6 inches', 'Android 13', '50 MP + 12 MP + 10 MP', '10 MP + 4MP', 'Snapdragon 8+ Gen 1', '12 GB', '256 GB', 'Dual SIM', '4400 mAh', '25W', N'Đen'),
(21, '7.6 inches', 'Android 13', '50 MP + 12 MP + 10 MP', '10 MP + 4MP', 'Snapdragon 8+ Gen 1', '12 GB', '256 GB', 'Dual SIM', '4400 mAh', '25W', N'Xanh'),
-- Samsung Galaxy S24 Plus 5G 256GB
(22, '6.6 inches', 'Android 14', '50 MP + 12 MP + 10 MP', '12 MP', 'Exynos 2400', '12 GB', '256 GB', 'Dual SIM', '4900 mAh', '45W', N'Đen'),
(22, '6.6 inches', 'Android 14', '50 MP + 12 MP + 10 MP', '12 MP', 'Exynos 2400', '12 GB', '256 GB', 'Dual SIM', '4900 mAh', '45W', N'Tím'),
(22, '6.6 inches', 'Android 14', '50 MP + 12 MP + 10 MP', '12 MP', 'Exynos 2400', '12 GB', '256 GB', 'Dual SIM', '4900 mAh', '45W', N'Vàng'),
(22, '6.6 inches', 'Android 14', '50 MP + 12 MP + 10 MP', '12 MP', 'Exynos 2400', '12 GB', '256 GB', 'Dual SIM', '4900 mAh', '45W', N'Xám'),
-- Samsung Galaxy S24 Ultra 5G 256GB
(23, '6.8 inches', 'Android 14', '200 MP + 12 MP + 10 MP + 10 MP', '12 MP', 'Snapdragon 8 Gen 3', '12 GB', '256 GB', 'Dual SIM', '5000 mAh', '45W', N'Đen'),
(23, '6.8 inches', 'Android 14', '200 MP + 12 MP + 10 MP + 10 MP', '12 MP', 'Snapdragon 8 Gen 3', '12 GB', '256 GB', 'Dual SIM', '5000 mAh', '45W', N'Tím'),
(23, '6.8 inches', 'Android 14', '200 MP + 12 MP + 10 MP + 10 MP', '12 MP', 'Snapdragon 8 Gen 3', '12 GB', '256 GB', 'Dual SIM', '5000 mAh', '45W', N'Vàng'),
(23, '6.8 inches', 'Android 14', '200 MP + 12 MP + 10 MP + 10 MP', '12 MP', 'Snapdragon 8 Gen 3', '12 GB', '256 GB', 'Dual SIM', '5000 mAh', '45W', N'Xám'),
-- Xiaomi Poco M6 Pro 8GB-256GB
(24, '6.67 inches', 'Android 13', '64 MP + 8 MP + 2 MP', '16 MP', 'MediaTek Helio G99-Ultra', '8 GB', '256 GB', 'Dual SIM', '5000 mAh', '18W', N'Đen'),
(24, '6.67 inches', 'Android 13', '64 MP + 8 MP + 2 MP', '16 MP', 'MediaTek Helio G99-Ultra', '8 GB', '256 GB', 'Dual SIM', '5000 mAh', '18W', N'Bạc'),
(24, '6.67 inches', 'Android 13', '64 MP + 8 MP + 2 MP', '16 MP', 'MediaTek Helio G99-Ultra', '8 GB', '256 GB', 'Dual SIM', '5000 mAh', '18W', N'Tím'),
-- Samsung Galaxy Tab S9 2024 128GB
(25, '11 inches', 'Android 13', '13 MP', '12 MP', 'Snapdragon 8 Gen 2', '8 GB', '128 GB', 'Nano-SIM', '8400 mAh', '45W', N'Kem'),
(25, '11 inches', 'Android 13', '13 MP', '12 MP', 'Snapdragon 8 Gen 2', '8 GB', '128 GB', 'Nano-SIM', '8400 mAh', '45W', N'Xám'),
-- Samsung Galaxy Tab S9 2024 256GB
(26, '11 inches', 'Android 13', '13 MP', '12 MP', 'Snapdragon 8 Gen 2', '12 GB', '256 GB', 'Nano-SIM', '8400 mAh', '45W', N'Kem'),
(26, '11 inches', 'Android 13', '13 MP', '12 MP', 'Snapdragon 8 Gen 2', '12 GB', '256 GB', 'Nano-SIM', '8400 mAh', '45W', N'Xám'),
-- iPad Gen 10 2022 WiFi 64GB
(27, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'No SIM', '28.6 Wh', '20W', N'Bạc'),
(27, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'No SIM', '28.6 Wh', '20W', N'Hồng'),
(27, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', 'No SIM', '28.6 Wh', '20W', N'Xanh'),
-- iPad Gen 10 2022 WiFi 256GB
(28, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '256 GB', 'No SIM', '28.6 Wh', '20W', N'Bạc'),
(28, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '256 GB', 'No SIM', '28.6 Wh', '20W', N'Hồng'),
(28, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '256 GB', 'No SIM', '28.6 Wh', '20W', N'Xanh'),
-- iPad Air 11inch M2 WiFi 128GB
(29, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple M2', '8 GB', '128 GB', 'No SIM', '28.6 Wh', '20W', N'Tím'),
(29, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple M2', '8 GB', '128 GB', 'No SIM', '28.6 Wh', '20W', N'Xám'),
(29, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple M2', '8 GB', '128 GB', 'No SIM', '28.6 Wh', '20W', N'Xanh'),
-- iPad Air 11inch M2 WiFi 1TB
(30, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple M2', '8 GB', '1 TB', 'No SIM', '28.6 Wh', '20W', N'Tím'),
(30, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple M2', '8 GB', '1 TB', 'No SIM', '28.6 Wh', '20W', N'Xám'),
(30, '10.9 inches', 'iPadOS 16', '12 MP', '12 MP', 'Apple M2', '8 GB', '1 TB', 'No SIM', '28.6 Wh', '20W', N'Xanh'),
-- iPad mini 6 2021 8.3 inch WiFi 64GB
(31, '8.3 inches', 'iPadOS 15', '12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '64 GB', 'No SIM', '19.3 Wh', '20W', N'Tím'),
(31, '8.3 inches', 'iPadOS 15', '12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '64 GB', 'No SIM', '19.3 Wh', '20W', N'Vàng'),
(31, '8.3 inches', 'iPadOS 15', '12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '64 GB', 'No SIM', '19.3 Wh', '20W', N'Xám'),
-- iPad Pro 13 inch M4 2024 Wifi 256GB
(32, '12.9 inches', 'iPadOS 17', '12 MP + 10 MP', '12 MP', 'Apple M4', '16 GB', '256 GB', 'No SIM', '40.88 Wh', '30W', N'Bạc'),
(32, '12.9 inches', 'iPadOS 17', '12 MP + 10 MP', '12 MP', 'Apple M4', '16 GB', '256 GB', 'No SIM', '40.88 Wh', '30W', N'Đen'),
-- iPad Pro 11 inch M4 2024 Wifi 256GB
(33, '11 inches', 'iPadOS 17', '12 MP + 10 MP', '12 MP', 'Apple M4', '16 GB', '256 GB', 'No SIM', '28.65 Wh', '30W', N'Bạc'),
(33, '11 inches', 'iPadOS 17', '12 MP + 10 MP', '12 MP', 'Apple M4', '16 GB', '256 GB', 'No SIM', '28.65 Wh', '30W', N'Đen');

-- Insert dữ liệu vào bảng Orders
INSERT INTO Orders ([userID],[orderConfirmed],[orderDate],[totalMoney],[phone],[paymentStatus],[deliveryStatus],[paymentType],[deliveryInfo],[nameOrder],[deliveryLocation]) 
VALUES 
	(2, 0, '2024-06-30', 0, '0987654321', 'Unpaid', 'Processing', 'COD', N'Giaohangtietkiem', N'Ngọc Trung', N'123 Nguyễn Trãi, Đà Nẵng'),	--1
	(2, 1, '2024-07-01', 0, '0987654321', 'Paid', 'Delivered', 'COD', N'Giaohangtietkiem', N'Ngọc Trung', N'123 Nguyễn Trãi, Đà Nẵng'),		--2	
	(3, 0, '2024-05-02', 0, '0123456789', 'Unpaid', 'Processing', 'COD', N'Giaohangtietkiem', N'Nguyễn Văn A', N'123 ABC Hà Nội'),			--3
	(4, 1, '2024-04-03', 0, '0123456799', 'Paid', 'Delivered', 'COD', N'Giaohangtietkiem', N'Trần Thị B', N'456 DEF Hồ Chí Minh'),			--4
	(5, 1, '2024-03-04', 0, '0987654321', 'Paid', 'Delivered', 'COD', N'Giaohangtietkiem', N'John Smith', N'123 Lê Lợi, Hồ Chí Minh'),		--5
	(6, 1, '2024-02-05', 0, '0987654321', 'Paid', 'Delivered', 'COD', N'Giaohangtietkiem', N'Jane Doe', N'456 Elm Street'),					--6
	(7, 1, '2024-01-06', 0, '0123456789', 'Paid', 'Delivered', 'COD', N'Giaohangtietkiem', N'300 Pine Street', N'300 Pine Street'),			--7
	(8, 1, '2024-04-07', 0, '0123456789', 'Payment Failed', 'Cancelled', 'COD', N'Giaohangtietkiem', N'Emily Jones', N'200 Maple Street');	--8

-- Insert dữ liệu vào bảng OrderDetails
INSERT INTO [dbo].[OrderDetails]
           ([productID],[orderID],[quantity],[price])
     VALUES
		--Đơn 1 - Chưa confirmed
		(2, 1, 1, 20990000),
		(1, 1, 2, 7990000),
		(13, 1, 1, 27990000),
		--Đơn 2
		(30, 2, 1, 30500000),
		(31, 2, 1, 12800000),
		--Đơn 3: - Chưa confirmed
		(4, 3, 1, 8500000),
		(5, 3, 1, 11990000),
		--Đơn 4:
		(10, 4, 3, 24990000), 
		(11, 4, 1, 17790000),
		--Đơn 5:
		(2, 5, 2, 20990000),
		(3, 5, 1, 23990000),
		--Đơn 6:
		(4, 6, 1, 8500000),
		(5, 6, 1, 11990000),
		--Đơn 7:
		(8, 7, 2, 13890000),
		(9, 7, 1, 20990000),
		--Đơn 8:
		(10, 8, 3, 24990000), 
		(11, 8, 1, 17790000);

--select * from [OrderDetails];

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 2 THEN N'Bạc'
    WHEN productID = 1 THEN N'Xanh'
    WHEN productID = 13 THEN N'Tím'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 1;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 30 THEN N'Xanh'
    WHEN productID = 31 THEN N'Xám'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 2;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 4 THEN N'Đen'
    WHEN productID = 5 THEN N'Đen'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 3;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 10 THEN N'Vàng'
    WHEN productID = 11 THEN N'Vàng'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 4;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 2 THEN N'Bạc'
    WHEN productID = 3 THEN N'Vàng'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 5;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 4 THEN N'Trắng'
    WHEN productID = 5 THEN N'Trắng'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 6;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 8 THEN N'Hồng'
    WHEN productID = 9 THEN N'Xám'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 7;

UPDATE OrderDetails
SET [color] = CASE
    WHEN productID = 10 THEN N'Vàng'
    WHEN productID = 11 THEN N'Đen'
    -- Thêm các trường hợp khác
    ELSE NULL
END
WHERE orderID = 8;

/*
-- Insert dữ liệu vào bảng Feedbacks
INSERT INTO Feedbacks (productID, userID, note) 
VALUES 
(1, 2, 'Great phone!'),
(2, 2, 'Very satisfied with the performance.'),
(3, 1, 'Excellent camera quality.'),
(4, 1, 'A bit expensive but worth it.'),
(5, 2, 'Amazing battery life.'),
(6, 2, 'Great value for money.'),
(7, 1, 'Impressive design.'),
(8, 1, 'Good for basic use.'),
(9, 2, 'Fast and smooth performance.'),
(10, 2, 'Perfect for mid-range phone.'),
(1, 1, 'I love the iOS experience.'),
(2, 2, 'Battery could be better.');
*/

-- Insert dữ liệu vào bảng Galleries
INSERT INTO Galleries (productID, picLink) 
VALUES 
-- OPPO Reno11 F 5G 8GB-256GB
(1, './img_svg/0_picProduct/Oppo/oppo-reno11-xanh.png'),
(1, './img_svg/0_picProduct/Oppo/oppo-reno11-xanh-bien.png'),
-- iPhone 11 Pro 256GB
(2, './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-bac.jpg'),
(2, './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-vang.jpg'),
(2, './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-xam.jpg'),
-- iPhone 11 Pro 512GB
(3, './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-bac.jpg'),
(3, './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-vang.jpg'),
(3, './img_svg/0_picProduct/Iphone/11/pro_pro-max/iphone-11-pro-xam.jpg'),
-- iPhone 11 64GB
(4, './img_svg/0_picProduct/Iphone/11/iphone-11-den.jpg'),
(4, './img_svg/0_picProduct/Iphone/11/iphone-11-trang.jpg'),
(4, './img_svg/0_picProduct/Iphone/11/iphone-11-vang.jpg'),
-- iPhone 12 64GB
(5, './img_svg/0_picProduct/Iphone/12/12_12-mini/iphone-12-den.jpg'),
(5, './img_svg/0_picProduct/Iphone/12/12_12-mini/iphone-12-do.jpg'),
(5, './img_svg/0_picProduct/Iphone/12/12_12-mini/iphone-12-tim.jpg'),
(5, './img_svg/0_picProduct/Iphone/12/12_12-mini/iphone-12-trang.jpg'),
-- iPhone 12 Pro Max 128GB
(6, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-bac.jpg'),
(6, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-vang.jpg'),
(6, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-xam.jpg'),
(6, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-xanh.jpg'),
-- iPhone 12 Pro 256GB
(7, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-bac.jpg'),
(7, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-vang.jpg'),
(7, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-xam.jpg'),
(7, './img_svg/0_picProduct/Iphone/12/pro_pro-max/iphone-12-pro-xanh.jpg'),
-- iPhone 13 128GB
(8, './img_svg/0_picProduct/Iphone/13/13_13-mini/iphone-13-den.jpg'),
(8, './img_svg/0_picProduct/Iphone/13/13_13-mini/iphone-13-hong.jpg'),
(8, './img_svg/0_picProduct/Iphone/13/13_13-mini/iphone-13-trang.jpg'),
(8, './img_svg/0_picProduct/Iphone/13/13_13-mini/iphone-13-xanh.jpg'),
-- iPhone 13 Pro 128GB
(9, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-bac.jpg'),
(9, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-vang.jpg'),
(9, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-xam.jpg'),
(9, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-xanh.jpg'),
-- iPhone 13 Pro Max 256GB
(10, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-bac.jpg'),
(10, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-vang.jpg'),
(10, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-xam.jpg'),
(10, './img_svg/0_picProduct/Iphone/13/pro_pro-max/iphone-13-pro-xanh.jpg'),
-- iPhone 14 128GB
(11, './img_svg/0_picProduct/Iphone/14/14_14-plus/iphone-14-den.jpg'),
(11, './img_svg/0_picProduct/Iphone/14/14_14-plus/iphone-14-tim.jpg'),
(11, './img_svg/0_picProduct/Iphone/14/14_14-plus/iphone-14-trang.jpg'),
(11, './img_svg/0_picProduct/Iphone/14/14_14-plus/iphone-14-vang.jpg'),
-- iPhone 14 Pro 128GB
(12, './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-bac.jpg'),
(12, './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-den.jpg'),
(12, './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-tim.jpg'),
-- iPhone 14 Pro Max 256GB
(13, './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-bac.jpg'),
(13, './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-den.jpg'),
(13, './img_svg/0_picProduct/Iphone/14/pro_pro-max/iphone-14-pro-tim.jpg'),
-- iPhone 15 Plus 128GB
(14, './img_svg/0_picProduct/Iphone/15/15_15-plus/iphone-15-hong.jpg'),
(14, './img_svg/0_picProduct/Iphone/15/15_15-plus/iphone-15-vang.jpg'),
(14, './img_svg/0_picProduct/Iphone/15/15_15-plus/iphone-15-xanh.jpg'),
-- iPhone 15 Pro Max 256GB
(15, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-den.jpg'),
(15, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-tunhien.jpg'),
(15, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-trang.jpg'),
(15, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-xanh.jpg'),
-- iPhone 15 Pro Max 1TB
(16, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-den.jpg'),
(16, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-tunhien.jpg'),
(16, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-trang.jpg'),
(16, './img_svg/0_picProduct/Iphone/15/pro_pro-max/iphone-15-pro-titan-xanh.jpg'),
-- Samsung Galaxy A55 5G 128GB
(17, './img_svg/0_picProduct/Samsung/Galaxy-A/samsung-galaxy-a55-den.png'),
(17, './img_svg/0_picProduct/Samsung/Galaxy-A/samsung-galaxy-a55-tim.png'),
(17, './img_svg/0_picProduct/Samsung/Galaxy-A/samsung-galaxy-a55-xanh.png'),
-- Samsung Galaxy M15 5G 128GB
(18, './img_svg/0_picProduct/Samsung/Galaxy-M/m15/samsung-galaxy-m15-xam.jpg'),
(18, './img_svg/0_picProduct/Samsung/Galaxy-M/m15/samsung-galaxy-m15-xanh.jpg'),
(18, './img_svg/0_picProduct/Samsung/Galaxy-M/m15/samsung-galaxy-m15-xanh-ngoc.jpg'),
-- Samsung Galaxy M55 5G 256GB
(19, './img_svg/0_picProduct/Samsung/Galaxy-M/m55/samsung-galaxy-m55-den.jpg'),
(19, './img_svg/0_picProduct/Samsung/Galaxy-M/m55/samsung-galaxy-m55-xanh-la.jpg'),
-- Samsung Galaxy Z Flip4 5G 128GB
(20, './img_svg/0_picProduct/Samsung/Galaxy-Z/z-flip4/samsung-galaxy-z-flip4-tim.jpg'),
(20, './img_svg/0_picProduct/Samsung/Galaxy-Z/z-flip4/samsung-galaxy-z-flip4-vang.jpg'),
(20, './img_svg/0_picProduct/Samsung/Galaxy-Z/z-flip4/samsung-galaxy-z-flip4-xanh.jpg'),
-- Samsung Galaxy Z Fold5 5G 256GB
(21, './img_svg/0_picProduct/Samsung/Galaxy-Z/z-fold5/=samsung-galaxy-zfold-5-vang.jpg'),
(21, './img_svg/0_picProduct/Samsung/Galaxy-Z/z-fold5/samsung-galaxy-zfold-5-den.jpg'),
(21, './img_svg/0_picProduct/Samsung/Galaxy-Z/z-fold5/samsung-galaxy-zfold-5-xanh.jpg'),
-- Samsung Galaxy S24 Plus 5G 256GB
(22, './img_svg/0_picProduct/Samsung/s24_s24-plus/samsung-galaxy-s24-plus-den.png'),
(22, './img_svg/0_picProduct/Samsung/s24_s24-plus/samsung-galaxy-s24-plus-tim.png'),
(22, './img_svg/0_picProduct/Samsung/s24_s24-plus/samsung-galaxy-s24-plus-vang.png'),
(22, './img_svg/0_picProduct/Samsung/s24_s24-plus/samsung-galaxy-s24-plus-xam.png'),
-- Samsung Galaxy S24 Ultra 5G 256GB
(23, './img_svg/0_picProduct/Samsung/s24-ultra/samsung-galaxy-s24-ultra-den.png'),
(23, './img_svg/0_picProduct/Samsung/s24-ultra/samsung-galaxy-s24-ultra-tim.png'),
(23, './img_svg/0_picProduct/Samsung/s24-ultra/samsung-galaxy-s24-ultra-vang.png'),
(23, './img_svg/0_picProduct/Samsung/s24-ultra/samsung-galaxy-s24-ultra-xam.png'),
-- Xiaomi Poco M6 Pro 8GB-256GB
(24, './img_svg/0_picProduct/Xiaomi/xiaomi-poco-m6-bac.jpg'),
(24, './img_svg/0_picProduct/Xiaomi/xiaomi-poco-m6-den.jpg'),
(24, './img_svg/0_picProduct/Xiaomi/xiaomi-poco-m6-tim.jpg'),
-- Samsung Galaxy Tab S9 2024 128GB
(25, './img_svg/0_picProduct/Samsung/Galaxy-Tab/samsung-galaxy-tab-s9-kem.jpg'),
(25, './img_svg/0_picProduct/Samsung/Galaxy-Tab/samsung-galaxy-tab-s9-xam.jpg'),
-- Samsung Galaxy Tab S9 2024 256GB
(26, './img_svg/0_picProduct/Samsung/Galaxy-Tab/samsung-galaxy-tab-s9-kem.jpg'),
(26, './img_svg/0_picProduct/Samsung/Galaxy-Tab/samsung-galaxy-tab-s9-xam.jpg'),
-- iPad Gen 10 2022 WiFi 64GB
(27, './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-bac.jpg'),
(27, './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-hong.jpg'),
(27, './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-xanh.jpg'),
-- iPad Gen 10 2022 WiFi 256GB
(28, './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-bac.jpg'),
(28, './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-hong.jpg'),
(28, './img_svg/0_picProduct/iPad/gen/ipad-gen-10-wifi-xanh.jpg'),
-- iPad Air 11inch M2 WiFi 128GB
(29, './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-tim.jpg'),
(29, './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-xam.jpg'),
(29, './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-xanh.jpg'),
-- iPad Air 11inch M2 WiFi 1TB
(30, './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-tim.jpg'),
(30, './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-xam.jpg'),
(30, './img_svg/0_picProduct/iPad/air/ipad-air-11inch-M2-wifi-xanh.jpg'),
-- iPad mini 6 2021 8.3 inch WiFi 64GB
(31, './img_svg/0_picProduct/iPad/mini/ipad-mini-6-tim.jpg'),
(31, './img_svg/0_picProduct/iPad/mini/ipad-mini-6-vang.jpg'),
(31, './img_svg/0_picProduct/iPad/mini/ipad-mini-6-xam.jpg'),
-- iPad Pro 13 inch M4 2024 Wifi 256GB
(32, './img_svg/0_picProduct/iPad/pro/ipad-pro-13inch-M4-wifi-bac.jpg'),
(32, './img_svg/0_picProduct/iPad/pro/ipad-pro-13inch-M4-wifi-bac.jpg'),
-- iPad Pro 11 inch M4 2024 Wifi 256GB
(33, './img_svg/0_picProduct/iPad/pro/ipad-pro-13inch-M4-wifi-bac.jpg'),
(33, './img_svg/0_picProduct/iPad/pro/ipad-pro-13inch-M4-wifi-den.jpg');

--///////////////////////////////////
/*
USE [BanHangOnlineNew]
GO

SELECT [orderID]
      ,[userID]
      ,[orderConfirmed]
      ,[orderDate]
      ,[totalMoney]
      ,[phone]
      ,[paymentStatus]
      ,[deliveryStatus]
      ,[paymentType]
      ,[deliveryInfo]
      ,[nameOrder]
      ,[deliveryLocation]
  FROM [dbo].[Orders]

GO

UPDATE [Orders]
SET orderConfirmed = 1
WHERE orderID = 3;

select * from Users

select * from OrderDetails

select * from Orders

SELECT DISTINCT
    o.orderID,
    od.[productID],
    p.[name] AS productName,
    p.thumbnail,
    pd.storage AS str,
    od.color,
    od.quantity,
    od.price,
    o.totalMoney,
	o.userID,
	o.paymentStatus,
	o.deliveryStatus,
	o.paymentType,
	o.orderDate
FROM
    Orders o
JOIN
    OrderDetails od ON o.orderID = od.orderID
JOIN
    Products p ON od.productID = p.productID
JOIN
    ProductDetails pd ON p.productID = pd.productID
WHERE
    o.userID = 2 and o.orderConfirmed = 1 and o.deliveryStatus = 'Delivered'
	
*/
/*
select * from Products

SELECT DISTINCT 
  p.[productID],
  p.[name],
  p.[price],
  p.[discount],
  p.[thumbnail],
  pd.[screen],
  pd.[os],
  pd.[mainCamera],
  pd.[selfieCamera],
  pd.[chip],
  pd.[ram],
  pd.[storage] as str,
  pd.[sim],
  pd.[battery],
  pd.[charger]
FROM [dbo].[Products] AS p
INNER JOIN [BanHangOnlineNew].[dbo].[ProductDetails] AS pd ON p.[productID] = pd.[productID]
WHERE p.[productID] = 2  -- Use parameterized query for security


INSERT INTO [dbo].[Orders]
(
  [userID],
  [orderConfirmed],
  [orderDate],
  [phone],
  [paymentStatus],
  [deliveryStatus],
  [paymentType],
  [deliveryInfo],
  [nameOrder],
  [deliveryLocation],
  [totalMoney]
)
VALUES
(
  9, -- userID (parameterized for security)
  0, -- orderConfirmed (default value)
  GETDATE(), -- orderDate (current date and time)
  4567890123, -- phone (parameterized for security)
  'Watting', -- paymentStatus (parameterized for security)
  'Watting', -- deliveryStatus (parameterized for security)
  'Watting', -- paymentType (parameterized for security)
  'Watting', -- deliveryInfo (parameterized for security)
  'Michael Brown', -- nameOrder (parameterized for security)
  '300 Pine Street',  -- deliveryLocation (parameterized for security)
  0
)

USE [BanHangOnlineNew]
GO

DELETE FROM [dbo].OrderDetails
      WHERE ID = 22

GO

select * from Users

select * from OrderDetails

select * from Orders
*/