# BanHangOnline
 
[Cú pháp tệp .md](https://viblo.asia/helps/cach-su-dung-markdown-bxjvZYnwkJZ)

[TaskList04](https://docs.google.com/spreadsheets/d/1TRzkmKXl0PPJ9r2hRO8fXAs3M5102JuubnB2NXfu_Gs/edit?usp=sharing)

[Hướng dẫn thiết kế web](https://www.youtube.com/playlist?list=PLMPBVRu4TjAzulJw0CK1Qlxzi3cXXYEio)

[Hướng dẫn sử dụng Extension Live Share (in VSCode)](https://www.youtube.com/watch?v=I7TZdfSaAhk)

## I) Phân tích dự án
1. Frontend: (phía người dùng)
   * Trang chủ
   * Trang danh sách sản phẩm
   * Trang chi tiết sản phẩm
   * Trang giỏ hàng (thêm, xóa,..)
   * Trang checkout(địa chỉ nhận hàng, sđt,...)
   * Trang thanh toán hoàn thành
   * Trang liên hệ(from điền thông tin, map,..)
2. Admin:
   * Tài khoản người dùng:
     - Quản lý role (admin, user,...)
     - Quản lý người dùng: admin/user (phải dùng trang quản trị để tạo tk admin)
     - Hiển thị danh sách/thêm/sửa/xóa
     - Đăng kí tài khoản
     - Đăng nhập(cho cả admin và user)
   * Quản lý danh mục sản phẩm
   * Quản lý sản phẩm
   * Quản lý đơn hàng (Hiển thị đc danh sách đơn hàng, quản lý đc trạng thái đơn hàng)
   * Quản lý phản hồi


## II) Phân tích database (chưa đủ thuộc tính đâu, phải test để thêm)
1. Bảng Role
   * id : int (primary key) tự tăng
   * name: string (nvarchar) _ độ dài phải lớn tầm >=50 ký tự
2. Bảng User
   * id : int (primary key) tự tăng
   * fullname: string (varchar) _ >=50 ký tự
   * email : string (varchar) _ >=150 ký tự -> unique
   * phoneNumber : string (varchar) _ >=20 ký tự -> unique
   * address : string (varchar) _ >=200 ký tự
   * password : string -> md5 -> 32 ký tự -> chính xác
   * roleId : int -> foreign key
3. Bảng Category (Danh Mục)
   * id : int (primary key) tự tăng
   * name : string -> 100 ký tự
4. Bảng Product(Sản phẩm)
   * id : int (primary key) tự tăng
   * categoryId : int (foreign key)  -> bảng Category
   * title : string -> 350 ký tự
   * price : float
   * discount : float
   * thumbnail : string -> 500 ký tự
   * description : longtext
   * created_at : datetime -> lần đầu tạo bản ghi
   * updated_at : datetime -> lần cuối sửa bản ghi đó
5. Bảng quản lý galery
   * id : int (primary key) tự tăng
   * productId : int (foreign key) -> bảng product
   * thumbnail : string -> 500 ký tự
6. Bảng Feedback(quản lý phản hồi) (Cho các sản phẩm) (đã chỉnh lại để phải đăng nhập mới feedback đc)
   * id : int (primary key) tự tăng
   * productId : int (foreign key) -> bảng product
   * userId : int (foreign key) -> bảng User
   * note : string (nvarchar) -> độ dài tối đa 500 ký tự
7. Quản lý đơn hàng (đây chỉ là note)
   * id : int (primary key) tự tăng
   * fullname
   * email
   * phone
   * address
   * note
   * order_date: datetime -> thời điểm đặt hàng
   * Danh sách sản phẩm
     - sản phẩm 1 x số lượng x ***giá tại thời điểm mua***
     - sản phẩm 2 x số lượng x ***giá tại thời điểm mua***
8. Bảng Order
   * id : int (primary key) tự tăng
   * userId : int (foreign key) -> bảng User
   * fullname
   * email
   * phone
   * address
   * note
   * order_date: datetime -> thời điểm đặt hàng
   * status : int -> (pending, approved,...)
   * totalMonney : float -> Tổng tiền (tuy ko cần thiết nhưng có thể thêm vào để thuận tiện truy vấn)
9. Bảng OrderDetail (chi tiết đơn hàng)
    * id : int (primary key) tự tăng
    * orderId : int (foreign key) -> bảng Order
    * productId : int (foreign key) -> bảng product
    * price : float
    * numProductBuy : int
