CREATE DATABASE QuanLyBanGiay;

USE QuanLyBanGiay;

-- Để MySQL tự động tăng kích thước file, bạn có thể bỏ qua các tùy chọn FILEGROWTH và MAXSIZE.



CREATE USER 'demo'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON QuanLyBanGiay.* TO 'demo'@'localhost';

CREATE TABLE Account (
    uID INT AUTO_INCREMENT NOT NULL,
    user CHAR(10) NULL,
    pass CHAR(10) NULL,
    isSell TINYINT(1) NULL,
    isAdmin TINYINT(1) NULL,
    email NVARCHAR(50) NULL,
    PRIMARY KEY (uID)
) ENGINE=InnoDB;

CREATE TABLE Cart (
    accountID INT NOT NULL,
    productID INT NOT NULL,
    amount INT NULL,
    maCart INT AUTO_INCREMENT NOT NULL,
    size NVARCHAR(50) NULL,
    PRIMARY KEY (maCart)
) ENGINE=InnoDB;

-- Category Table
CREATE TABLE Category (
    cid INT NOT NULL,
    cname NVARCHAR(50) NULL,
    PRIMARY KEY (cid)
) ENGINE=InnoDB;

-- Invoice Table
CREATE TABLE Invoice (
    maHD INT AUTO_INCREMENT NOT NULL,
    accountID INT NULL,
    tongGia FLOAT NULL,
    ngayXuat DATETIME NULL,
    PRIMARY KEY (maHD)
) ENGINE=InnoDB;

-- Product Table
CREATE TABLE Product (
    id INT AUTO_INCREMENT NOT NULL,
    name NVARCHAR(200) NULL,
    image NVARCHAR(500) NULL,
    price FLOAT NULL,
    title NVARCHAR(500) NULL,
    description TEXT NULL,
    cateID INT NOT NULL,
    sell_ID INT NOT NULL,
    model NVARCHAR(50) NULL,
    color NVARCHAR(50) NULL,
    delivery NVARCHAR(50) NULL,
    image2 NVARCHAR(500) NULL,
    image3 NVARCHAR(500) NULL,
    image4 NVARCHAR(500) NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Review Table
CREATE TABLE Review (
    accountID INT NULL,
    productID INT NULL,
    contentReview NVARCHAR(500) NULL,
    dateReview DATE NULL,
    maReview INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (maReview)
) ENGINE=InnoDB;

-- SoLuongDaBan Table
CREATE TABLE SoLuongDaBan (
    productID INT NULL,
    soLuongDaBan INT NULL
) ENGINE=InnoDB;

-- Supplier Table
CREATE TABLE Supplier (
    idSupplier INT AUTO_INCREMENT NOT NULL,
    nameSupplier NVARCHAR(100) NULL,
    phoneSupplier NVARCHAR(50) NULL,
    emailSupplier NVARCHAR(200) NULL,
    addressSupplier NVARCHAR(200) NULL,
    cateID INT NULL,
    PRIMARY KEY (idSupplier)
) ENGINE=InnoDB;

-- TongChiTieuBanHang Table
CREATE TABLE TongChiTieuBanHang (
    userID INT NULL,
    TongChiTieu FLOAT NULL,
    TongBanHang FLOAT NULL
) ENGINE=InnoDB;

-- Enable Identity Insert
SET @@auto_increment_increment=1;
SET @@auto_increment_offset=1;

-- Ensure that the IDENTITY_INSERT is disabled in MySQL
SET @@session.sql_mode='NO_AUTO_VALUE_ON_ZERO';
SET @@auto_increment_increment=1;

-- Insert data into MySQL table
INSERT INTO `Account` (`uID`, `user`, `pass`, `isSell`, `isAdmin`, `email`) VALUES 
(1, 'duchm', '123456', 1, 1, 'huynhminhduc01082001@gmail.com'),
(2, 'abc', '123456', 0, 0, 'huynhminhduc01082001@gmail.com'),
(3, 'songoky', '123456', 1, 0, 'huynhminhduc01082001@gmail.com'),
(6, 'mrd', '123', 1, 1, 'huynhminhduc01082001@gmail.com'),
(1014, 'naruto', '123456', 1, 1, 'naruto@gmail.com'),
(1015, 'sasuke', '123456', 1, 1, 'sasuke@gmail.com'),
(1016, 'sakura', '123456', 1, 1, 'sasuke@gmail.com'),
(1017, 'itachi', '123456', 1, 1, 'sasuke@gmail.com'),
(1018, 'kakashi', '123456', 1, 1, 'kakashi@gmail.com'),
(1019, 'jiraiya', '123456', 1, 1, 'kakashi@gmail.com');

-- Insert data into MySQL table
INSERT INTO `Category` (`cid`, `cname`) VALUES 
(1, 'GIAY ADIDAS'),
(2, 'GIAY NIKE'),
(3, 'GIAY BITIS'),
(4, 'GIAY CONVERSE');

-- Enable auto-increment for Invoice table in MySQL
SET @@auto_increment_increment=1;

-- Insert data into MySQL table
INSERT INTO `Invoice` (`maHD`, `accountID`, `tongGia`, `ngayXuat`) VALUES 
(1, 1, 999, '2021-11-20'),
(2, 1, 800, '2021-11-20'),
(3, 1, 400, '2021-11-20'),
(4, 1, 511.2, '2021-11-20'),
(5, 1, 241.2, '2021-11-20'),
(6, 1, 392.4, '2021-11-20'),
(7, 1, 482.4, '2021-11-20'),
(8, 2, 300, '2021-11-18'),
(9, 2, 400, '2021-11-17'),
(10, 1, 180, '2021-11-20'),
(11, 1, 1079.1, '2021-11-20'),
(12, 1, 122.4, '2021-11-20'),
(13, 1, 1394.1, '2021-11-20'),
(14, 2, 256, '2021-10-01'),
(15, 3, 450, '2021-10-03'),
(16, 2, 200, '2021-09-05'),
(17, 2, 100, '2021-08-06'),
(18, 3, 156, '2021-07-07'),
(19, 3, 256, '2021-06-06'),
(20, 3, 158, '2021-05-05'),
(21, 2, 800, '2021-04-04'),
(22, 3, 750, '2021-03-03'),
(23, 2, 657, '2021-02-02'),
(24, 1, 800, '2021-01-01'),
(25, 1, 1491.6, '2021-11-25'),
(26, 1, 396, '2021-11-26'),
(27, 1, 761.2, '2021-11-29'),
(28, 1, 1687.4, '2021-11-29'),
(29, 1, 1760, '2021-11-29'),
(30, 1, 2175.8, '2021-12-01'),
(31, 1, 396, '2021-12-01'),
(32, 1, 739.2, '2021-12-02'),
(33, 1, 567.6, '2021-12-03'),
(34, 1, 803, '2021-12-14');

-- Enable auto-increment for Product table in MySQL
SET @@auto_increment_increment=1;

INSERT Product ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (11, N'GIÀY NIKE AIR MAX AP NAM - XÁM XANH _ Baocao', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', 180, N'GIÀY NIKE AIR MAX AP NAM - XÁM XANH', N'Giày Nike Air Max AP là mẫu giày với thiết kế vô cùng thời trang của Nike với sự kết hợp hài hòa giữa quá khứ và hiện đại.

Phần đế giữa của Nike Air Max AP được thiết kế rất hợp lý mềm mại với công nghệ tiên tiến nhất của Nike. Chắc chắn đây là mẫu giày mà bất cứ fan Sneaker không thể bỏ qua', 2, 1, N'G87', N'Gray', N'Hải Phòng', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_F_PREM-550x550.jpg')
-- Chèn dữ liệu vào bảng Product trong MySQL
INSERT INTO `Product` (`id`, `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`)
VALUES 
(11, 'GIÀY NIKE AIR MAX AP NAM - XÁM XANH _ Baocao', 'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', 180, 'GIÀY NIKE AIR MAX AP NAM - XÁM XANH',
'Giày Nike Air Max AP là mẫu giày với thiết kế vô cùng thời trang của Nike với sự kết hợp hài hòa giữa quá khứ và hiện đại. Phần đế giữa của Nike Air Max AP được thiết kế rất hợp lý mềm mại với công nghệ tiên tiến nhất của Nike. Chắc chắn đây là mẫu giày mà bất cứ fan Sneaker không thể bỏ qua',
2, 1, 'G87', 'Gray', 'Hải Phòng',
'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg',
'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg',
'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_F_PREM-550x550.jpg');

-- Chèn dữ liệu vào bảng Product trong MySQL
INSERT INTO `Product` (`id`, `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`)
VALUES 
(15, N'Adidas Ultraboost 4.0 -2', 'https://product.hstatic.net/1000282067/product/giay_ultraboost_mau_xanh_da_troi_g54002_e902370c1de04294ad2602df86bc7c7c_1024x1024.jpg', 156, N'Adidas Ultraboost 4.0', N'KIỂM SOÁT LỰC KHI CHẠM ĐẤT, THOẢI MÁI TRONG TỪNG BƯỚC CHẠY. Giày Sneaker Nam Nữ Adidas Ultraboost 4.0 FU9993 – Hàng Chính Hãng',
2, 1, N'G87', N'Blue', N'Long An',
'https://images.solecollector.com/complex/images/fl_lossy,q_auto/c_scale,w_690,dpr_2.0/v1/dq2zuhqxoufskbl1ycjd/adidas-ultra-boost-4-navy',
'https://product.hstatic.net/1000282067/product/529360_01.jpg_37102ca9b517400d8159d0dd501ac79e_1024x1024.jpeg',
'https://product.hstatic.net/1000282067/product/ultraboost_shoes_blue_g54002_05_standard_bc063c8c6fa5466f868a6765dd896386_1024x1024.jpg');

INSERT INTO Product (id, name, image, price, title, description, cateID, sell_ID, model, color, delivery, image2, image3, image4)
VALUES 
(19, N'Giày Nike Air Max SC Nam- Đen Trắng', 'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-01-550x550.jpg', 190, N'Giày Nike Air Max SC Nam- Đen Trắng', N'mang nét huyền thoại của Nike, với bộ đệm Air Max trứ danh đây là mẫu giày có thể kết hợp với bất cứ trang phục nào mà bạn vẫn hoàn toàn tự tin trong mọi hoàn cảnh.', 2, 1, N'G68', N'Black', N'Long An', 'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-06-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-05-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-04-550x550.jpg'),
(20, N'Giày Nike Court Royale 2 Nam - Đen', 'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-01-550x550.jpg', 490, N'Giày Nike Court Royale 2 Nam - Đen', '', 2, 1, N'G68', N'Black', N'Long An', 'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-06-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-05-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-04-550x550.jpg'),
(21, N'Giày Nike Air Max AP Nam - Đen', 'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-01-550x550.jpg', 690, N'Giày Nike Air Max AP Nam - Đen', '', 2, 1, N'G68', N'Black', N'Long An', 'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-06-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-05-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-04-550x550.jpg'),
(22, N'Giày Nike Renew Retaliation TR 3 Nam - Đen Trắng ', 'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-01-550x550.jpg', 890, N'Giày Nike Renew Retaliation TR 3 Nam - Đen Trắng', N'', 2, 1, N'G68', N'Black', N'Long An', 'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-03-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-02-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-05-550x550.jpg'),
(24, N'Giày Nike Air Zoom Structure 24 Nam - Trắng', 'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-01-550x550.jpg', 390, N'Giày Nike Air Zoom Structure 24 Nam - Trắng', N'Ở phiên bản này được các chuyên gia đánh giá cao phần bởi sự ổn định nhưng vẫn có cảm giác êm chân trong suốt quá trình sử dụng. Bạn yêu thích thể thao và đang tìm kiếm cho mình một đôi giày để tập luyện thì Nike Air Zoom Structure 24 sẽ là một lựa chọn hoàn toàn chính xác. Bởi một đôi giày tốt sẽ là một người đồng hành quan trọng trong cả 1 quá trình.', 2, 1, N'G68', N'White', N'Long An', 'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-02-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-03-550x550.jpg', 'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-04-550x550.jpg'),
(25, N'Giày Nike Court Royale 2 Nam Nữ - Trắng', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-01-550x550.jpg', 490, N'Giày Nike Court Royale 2 Nam Nữ - Trắng', N'Mua Hàng Ngay', 2, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-02-550x550.jpg'),
(26, N'Giày Nike Revolution 5 Nữ - Trắng Full', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-01-550x550.jpg', 590, N'Giày Nike Revolution 5 Nữ - Trắng Full', N'', 2, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-04-550x550.jpg'),
(27, N'Giày Nike Air Max Zero Essential Nam Trắng Full', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-01-550x550.jpg', 690, N'Giày Nike Air Max Zero Essential Nam Trắng Full', N'', 2, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-04-550x550.jpg'),
(28, N'Giày Nike Court Majestic Leather Nam Trắng Đen 2', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-01-550x550.jpg', 890, N'Giày Nike Court Majestic Leather Nam Trắng Đen', N'- Giày Nike Court Royale SL chính hãng 100%. Phát hiện hàng Fake đền tiền gấp 2 lần giá sản phẩm.', 1, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-04-550x550.jpg'),
(29, N'Giày Puma Smash V2 L Nam Xám', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-01-550x550.jpg', 590, N'Giày Puma Smash V2 L Nam Xám', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-07-550x550.jpg', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-01-80x80.jpg'),
(30, N'Giày Lacoste Europa 120 Nam - Xám Trắng', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-01-550x550.jpg', 590, N'Giày Lacoste Europa 120 Nam - Xám Trắng', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-03-550x550.jpg'),
(31, N'Giày Nike Air Zoom Structure 23 Nam - Xám', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-01-550x550.jpg', 90, N'Giày Nike Air Zoom Structure 23 Nam - Xám', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-04-550x550.jpg'),
(32, N'Giày Nike Air Max AP Nam - Xám Xanh', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', 690, N'Giày Nike Air Max AP Nam - Xám Xanh', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_E_PREM-550x550.jpg'),
(33, N'Giày adidas Edge Lux Nữ - Xám', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-01-550x550.jpg', 90, N'Giày adidas Edge Lux Nữ - Xám', N'* Myshoes.vn cam kết:', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-04-550x550.jpg'),
(34, N'Giày adidas Super Nova Nữ Xám', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-01-550x550.jpg', 390, N'Giày adidas Super Nova Nữ Xám', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-04-550x550.jpg'),
(35, N'Giày Nike Epic React Flyknit 2 Nam - Xám Xanh', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-01-550x550.jpg', 790, N'Giày Nike Epic React Flyknit 2 Nam - Xám Xanh', N'* Myshoes.vn cam kết:', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-04-550x550.jpg'),
(36, N'Giày Nike Air Zoom Pegasus 37 Nam - Đen Vàng', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-01-550x550.jpg', 790, N'Giày Nike Air Zoom Pegasus 37 Nam - Đen Vàng', N'Tiếp theo, phần Upper đã được cải tiến, thay thế bằng một lớp Mesh khác hoàn toàn trước kia. Lớp lưới này nhẹ hơn, dày hơn nhưng tuyệt đối vẫn giữ được sự thông thoáng, thoải mái trong từng mọi hoạt động của bàn chân. Lưỡi gà, cũng được Cut Out tinh tế để fit vừa vặn với các kiểu cổ chân khác nhau đồng thời tăng khả năng điều chỉnh đến một cách linh hoạt nhất.', 2, 1, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-05-550x550.jpg'),
(37, N'Giày Thể Thao Asics GEL-Nimbus® 19 Nam - Xanh vàng', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-0-550x550.jpg', 490, N'Giày Thể Thao Asics GEL-Nimbus® 19 Nam - Xanh vàng', N'Giày Thể Thao Asics GEL-Nimbus® 19 là đôi giày được ứng dụng công nghệ FlyteFoam™ sau khi được thay đổi hoàn toàn, mang lại sự thoải mái tối ưu nhất và một bộ đệm đàn hồi cho bàn chân người sử dụng. Upper lưới dệt 3D độc đáo, không đường may, có thể linh hoạt theo từng chuyển động chân một cách tự nhiên nhất.', 2, 1, N'G68', N'Blue', N'Long An', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-06-550x550.jpg'),
(38, N'Giày Bóng Đá Nam Bitis Hunter Football', N'https://product.hstatic.net/1000230642/product/02400vag__1__5d559f914caf4864ad99a37c18cc1a1b_1024x1024.jpg', 535, N'Giày Bóng Đá Nam Biti Hunter Football', N'Với thiết kế năng động, Giày bóng đá Biti’s Hunter được tung ra với 5 màu sắc nổi bật tạo điểm nhấn trên sân đấu.', 3, 1, N'G39', N'Yellow', N'Ho Chi Minh', N'https://product.hstatic.net/1000230642/product/02400vag__3__3a83e45335054285a27fba37cafb23c1_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02400vag__4__d3693ef3babe4fc3a2908d8eb2df6e3b_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02400vag__4__d3693ef3babe4fc3a2908d8eb2df6e3b_1024x1024.jpg'),
(39, N'Converse Chuck Taylor 1970s Sunflower', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/B%E1%BA%AFt%20trend%20v%E1%BB%9Bi%20converse%20v%C3%A0ng/battrendmuahe3.jpg', 399, N'Converse Chuck Taylor 1970s Sunflower', N'Thiết kế 1970s Sunflower vẫn giữ nguyên bản của dòng Chuck 70. Đôi giày Converse vàng Sunflower là sự kết hợp giữa hai yếu tố cổ điển và hiện đại, mang màu sắc rất riêng biệt. Phần vải ở thân giày được làm bằng chất liệu vải nặng và dày hơn một chút, phần logo được may thẳng vào thân giày với lớp da cực mướt, tạo vẻ tinh tế và cổ điển cho đôi giày. Bên trong giày sử dụng lớp đệm xốp đặc biệt thoải mái, trong khi bên ngoài đế giày có lớp cao su bóng, vừa dễ vệ sinh lại mang vẻ đẹp vintage cực đẹp.', 4, 1, N'G89', N'Yellow', N'Hà Nội', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/giay-converse-vang/giay-converse-vang-5.jpg', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/giay-converse-vang/giay-converse-vang-12.jpg', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/B%E1%BA%AFt%20trend%20v%E1%BB%9Bi%20converse%20v%C3%A0ng/battrendmuahe3.jpg'),
(40, N'GIÀY ADIDAS ADVANTAGE BASE NAM - TRẮNG XANH', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-01.html-550x550.jpg', 140, N'GIÀY ADIDAS ADVANTAGE BASE NAM - TRẮNG XANH', N'Được thừa hưởng lối thiết kế của đàn anh Giày adidas VS Advantage CL song vẫn có thêm nhiều điểm mới cải thiện. Với thiết kế đơn giản nhưng lại vô cùng thanh lịch. Phần Upper của giày được các nhà thiết kế của Adidas sử dụng bằng da bạn tăng thêm độ lịch lãm khi mang. Với các đường kim mũi chỉ hoàn hảo đến từng chi tiết giúp bạn tự tin sải bước. Đây quả thật là một lựa chọn mà các phải mạnh không nên bỏ lỡ.', 1, 1, N'G76', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-02.html-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-04.html-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-03.html-550x550.jpg'),
(41, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-court-nu-trang-full-01-550x550.jpg', 189, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'Bạn đang tìm kiếm cho mình một đôi giày sẽ có thể trường tồn với thời gian, không bị lỗi mốt theo năm tháng. Adidas Super Court là 1 lựa chọn không nên bỏ lỡ. Kiểu dáng thiết kế trẻ trung, màu sắc tươi sắc nên Adidas Super Court sẽ là kiểu giày giúp bạn dễ dàng chuyển từ ''bánh bèo" sang '' cá tính'' trong một nốt nhạc.', 1, 1, N'G89', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-02-550x550.jpg'),
(42, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-court-nu-trang-full-01-550x550.jpg', 190, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'Bạn đang tìm kiếm cho mình một đôi giày sẽ có thể trường tồn với thời gian, không bị lỗi mốt theo năm tháng. Adidas Super Court là 1 lựa chọn không nên bỏ lỡ . Kiểu dáng thiết kế trẻ trung, màu sắc tươi sắc nên Adidas Super Court sẽ là kiểu giày giúp bạn dễ dàng chuyển từ ''bánh bèo" sang '' cá tính'' trong một nốt nhạc.', 1, 1, N'G76', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-02-550x550.jpg'),
(43, N'Converse Run Star Hike Keith Haring', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/171859V/171859V-4-410x574.jpg', 225, N'Converse Run Star Hike Keith Haring', N'Thiết kế Run Star Hike mang tone màu Black làm nổi bật những hình ảnh ngộ nghĩnh thuộc phong cách vẽ Botanical Art đầy bắt mắt của Keith Haring. Đặc biệt, gây ấn tượng là sự xuất hiện của chữ ký của Keith Haring xuất hiện trên lưỡi gà và cả trong lót giày. Đôi giày hứa hẹn sẽ mang lại cho bạn trải nghiệm tuyệt vời trên bộ đế chunky răng cưa đầy táo bạo cùng nội thất đáng “đồng tiền bát gạo', 4, 1, N'G89', N'Black', N'Nha Trang', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/171859V/171859V-5-410x574.jpg', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/171859V/171859V-6-410x574.jpg', N'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/171859V/171859V-8-410x574.jpg'),
(44, 'Converse Chuck Taylor All Star Renew Sock Knit', 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-1-410x574.jpg', 198, 'Converse Chuck Taylor All Star Renew Sock Knit', 'Converse Chuck Taylor All Star Crate Knit đã trở lại để mang sự cổ điển đến gần hơn với một tương lai không lãng phí. Kiểu dáng Chuck Taylor với phần đế cao su được làm từ Công nghệ Nike Grind kết hợp với xốp Nike và cao su tái chế. Ngoài ra, upper được làm từ chất vải Polyester với công nghệ dệt kỹ thuật tiên tiến, sợi vải được dệt từ 75% poly tái chế và 25% nilon spandex (loại sợi nhân tạo có khả năng co giãn 4 chiều). ', 4, 1, 'G87', 'Gray', 'Nha Trang', 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-8-410x574.jpg', 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-3-410x574.jpg', 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170367C/170367C-2-410x574.jpg'),
(45, 'Hunter Layered Upper', 'https://product.hstatic.net/1000230642/product/dsc_0024_a6274cb2948449c785a7269de5fa6349_1024x1024.jpg', 800, 'Hunter Layered Upper', 'Sản phẩm rất tốt đi thoải mái', 3, 1, 'G68', 'White', 'Nha Trang', 'https://product.hstatic.net/1000230642/product/dsc_0025_703ee09f5db24cd9a0c8604cdd2592aa_1024x1024.jpg', 'https://product.hstatic.net/1000230642/product/dsc_0026_60087f45b9394f0682f5126309f5d3f6_1024x1024.jpg', 'https://product.hstatic.net/1000230642/product/dsc_0027_647fb72ecf3d455590cddb79c2418458_1024x1024.jpg'),
(46, 'Hunter Layered Upper', 'https://product.hstatic.net/1000230642/product/02800den__2__f00d5533d44b47ac84212239f93ebac6_1024x1024.jpg', 767, 'Hunter Layered Upper', 'Sản phẩm rất tốt đi rất thoải mái', 3, 1, 'G45', 'Black', 'Nha Trang', 'https://product.hstatic.net/1000230642/product/02800den__3__0f4c2b667bb44347ac302726b71ce9a2_1024x1024.jpg', 'https://product.hstatic.net/1000230642/product/02800den__4__ef90bd83d09942fd87d72165e5ce2fc7_1024x1024.jpg', 'https://product.hstatic.net/1000230642/product/02800den__5__fb6f5367106342348f60cd7b9b70dee6_1024x1024.jpg');

INSERT INTO Review (accountID, productID, contentReview, dateReview, maReview) VALUES 
(1, 15, 'xin chao san pham nay rat tot', '2021-11-19', 2),
(1, 11, 'xin chào', '2021-11-24', 14),
(1, 11, 'sản phẩm này rất tốt', '2021-11-25', 15),
(1, 11, 'xin chao 2', '2021-11-26', 16),
(1, 11, 'fsdf', '2021-12-01', 17),
(1, 11, 'xin chao 3', '2021-12-02', 18),
(1, 11, 'xin chao 4', '2021-12-03', 19),
(1, 11, 'bao cao', '2021-12-14', 20);

-- Chèn dữ liệu vào bảng SoLuongDaBan trong MySQL
INSERT INTO SoLuongDaBan (productID, soLuongDaBan) VALUES 
(11, 23),
(15, 13),
(19, 21),
(20, 9),
(21, 7),
(24, 10),
(46, 2),
(45, 4),
(41, 2);
-- Cho phép chèn giá trị vào cột có tính tự tăng
SET @@auto_increment_increment=1;
SET @@auto_increment_offset=1;
INSERT INTO Supplier (idSupplier, nameSupplier, phoneSupplier, emailSupplier, addressSupplier, cateID) VALUES
(1, 'Cty TNHH D.ADDIDAS', '091121786', 'cty@gmail.com', 'so 1 Vo Van Ngan', 1),
(2, 'Cty TNHH D.NIKE', '091121786', 'cty@gmail.com', 'so 2 Vo Van Ngan', 2),
(3, 'Cty TNHH D.BITIS', '091121786', 'cty@gmail.com', 'so 3 Vo Van Ngan', 3),
(4, 'Cty TNHH D.CONVERSE', '091121786', 'cty@gmail.com', 'so 4 Vo Van Ngan', 4);

-- Chèn dữ liệu vào bảng TongChiTieuBanHang trong MySQL
INSERT INTO TongChiTieuBanHang (userID, TongChiTieu, TongBanHang) VALUES
(1, 10340.200000000003, 14082),
(1014, 600, 4000),
(1015, 450, 3500),
(1017, 900, 3000),
(1018, 800, 2500),
(1019, 660, 2700),
(2, 100, 150);

DELIMITER //
CREATE PROCEDURE proc_CapNhatSoLuongDaBan(IN p_productID INT, IN p_soLuongBanThem INT)
BEGIN
    UPDATE SoLuongDaBan SET soLuongDaBan = soLuongDaBan + p_soLuongBanThem WHERE productID = p_productID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE proc_CapNhatTongBanHang(IN p_sell_ID INT, IN p_banHangThem FLOAT)
BEGIN
    UPDATE TongChiTieuBanHang SET TongBanHang = TongBanHang + p_banHangThem WHERE userID = p_sell_ID;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE proc_CapNhatTongChiTieu(IN p_userID INT, IN p_chiTieuThem FLOAT)
BEGIN
    UPDATE TongChiTieuBanHang SET TongChiTieu = TongChiTieu + p_chiTieuThem WHERE userID = p_userID;
END //
DELIMITER ;





















