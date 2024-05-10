-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 07:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `natura_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Contact` varchar(12) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Added_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Name`, `Contact`, `Email`, `Password`, `Added_At`) VALUES
(400, 'Hanna Cleark', '011234512', 'hanna@gmail.com', 'hanna', '2024-05-06 13:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Added_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_ID`, `User_ID`, `Added_At`) VALUES
(500, 101, '2024-05-05 13:56:55'),
(502, 103, '2024-05-10 02:52:13'),
(503, 104, '2024-05-10 02:55:29'),
(504, 105, '2024-05-10 02:55:29'),
(505, 106, '2024-05-10 02:55:29'),
(506, 107, '2024-05-10 02:55:29'),
(507, 108, '2024-05-10 02:55:29'),
(508, 109, '2024-05-10 02:55:29'),
(509, 110, '2024-05-10 02:55:29'),
(510, 111, '2024-05-10 02:55:29'),
(512, 113, '2024-05-10 02:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `Item_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Added_At` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `Image_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Image_Path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`Image_ID`, `Product_ID`, `Image_Path`) VALUES
(7, 21, 'banana.jpg'),
(8, 22, 'cabbage.jpg'),
(9, 23, 'carrots.jpg'),
(10, 24, 'eggplant.jpg'),
(11, 25, 'leaks.jpg'),
(12, 26, 'mango.jpg'),
(13, 27, 'papaya.jpg'),
(14, 28, 'pumpkin.jpg'),
(15, 29, 'tomato.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Shipping_Address` text NOT NULL,
  `Payment` varchar(50) NOT NULL,
  `Total_Cost` int(11) NOT NULL,
  `Order_Status` varchar(40) NOT NULL,
  `Orderd_Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `User_ID`, `Shipping_Address`, `Payment`, `Total_Cost`, `Order_Status`, `Orderd_Date`) VALUES
(3002, 101, 'John Doe \n34 \nLotus Lane \nNew York \nNY \n10643', 'cash', 1040, 'pending', '2024-05-05'),
(3003, 101, 'John Doe \n34 \nLotus Lane \nNew York \nNY \n10643', 'cash', 240, 'completed', '2024-05-05'),
(3004, 101, 'John Doe\n10,\nMain Road,\nColombo,\nColombo,\n546788', 'cash', 330, 'completed', '2024-05-05'),
(3007, 101, 'John Doe \n38 \nLotus Lane \nNew York \nNY \n10643', 'cash', 630, 'pending', '2024-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `Orditem_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`Orditem_ID`, `Order_ID`, `Product_ID`, `Qty`, `Price`) VALUES
(1000, 3002, 21, 4, 480),
(1001, 3002, 22, 4, 560),
(1002, 3003, 21, 2, 240),
(1003, 3004, 22, 1, 140),
(1004, 3004, 23, 1, 190),
(1007, 3007, 21, 3, 360),
(1008, 3007, 22, 1, 140),
(1009, 3007, 27, 1, 130);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Added_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Title`, `Description`, `Price`, `Qty`, `Added_At`) VALUES
(21, 'Banana', '100g', 120, 200, '2024-05-01 03:14:11'),
(22, 'Cabbage', '100g', 140, 100, '2024-05-01 03:14:11'),
(23, 'Carrot', '100g', 190, 100, '2024-05-01 03:15:00'),
(24, 'Egg Plant', '100g', 170, 100, '2024-05-01 03:15:00'),
(25, 'Leeks', '100g', 240, 100, '2024-05-01 03:15:47'),
(26, 'Mango', '100g', 110, 100, '2024-05-01 03:15:47'),
(27, 'Papaya', '100g', 130, 100, '2024-05-01 03:16:21'),
(28, 'Pumpkin', '100g', 150, 100, '2024-05-01 03:16:21'),
(29, 'Tomato', '100g', 220, 100, '2024-05-01 03:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Apt_No` varchar(20) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `ZipCode` varchar(5) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Name`, `Contact`, `Apt_No`, `Street`, `City`, `State`, `ZipCode`, `Email`, `Password`, `Added_at`) VALUES
(101, 'John Doe', '0118932456', '38', 'Lotus Lane', 'New York', 'NY', '10643', 'john@gmail.com', 'john', '2024-04-30 18:09:18'),
(103, 'Kera Carlson', '0776543271', '45', 'Elm Street', 'Mahragama', 'Colombo', '56788', 'kera@gmail.com', 'kera', '2024-05-10 02:52:13'),
(104, 'Amila Perera', '0771234567', '10', 'Lotus Road', 'Colombo', 'Western', '10000', 'amila@gmail.com', 'amila123', '2024-05-10 02:55:29'),
(105, 'Sunil Rajapaksa', '0776543210', '32', 'Main Street', 'Kandy', 'Central', '20000', 'sunil@gmail.com', 'sunil123', '2024-05-10 02:55:29'),
(106, 'Nimali Silva', '0776543456', '78', 'Church Road', 'Galle', 'Southern', '80000', 'nimali@gmail.com', 'nimali123', '2024-05-10 02:55:29'),
(107, 'Kasun Jayawardena', '0776543123', '56', 'School Lane', 'Negombo', 'Western', '11500', 'kasun@gmail.com', 'kasun123', '2024-05-10 02:55:29'),
(108, 'Priya Liyanage', '0776543789', '90', 'Temple Road', 'Matara', 'Southern', '81000', 'priya@gmail.com', 'priya123', '2024-05-10 02:55:29'),
(109, 'Dinesh De Silva', '0776555555', '120', 'Market Street', 'Kalutara', 'Western', '12000', 'dinesh@gmail.com', 'dinesh123', '2024-05-10 02:55:29'),
(110, 'Manjula Fernando', '0776500000', '12', 'Garden Street', 'Ratnapura', 'Sabaragamuwa', '70000', 'manjula@gmail.com', 'manju123', '2024-05-10 02:55:29'),
(111, 'Lahiru Kumara', '0776598765', '36', 'River Road', 'Anuradhapura', 'North Central', '50000', 'lahiru@gmail.com', 'lahiru123', '2024-05-10 02:55:29'),
(113, 'Kamal Perera', '077637422', '43', 'Main Road', 'Homagama', 'Colombo', '56432', 'kamal@gmail.com', 'kamal', '2024-05-10 02:58:05');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `CreateCart` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    INSERT INTO cart (User_ID) VALUES (NEW.User_ID);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `fk_cart_user` (`User_ID`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `fk_cart` (`Cart_ID`),
  ADD KEY `fk_cart_item` (`Product_ID`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`Image_ID`),
  ADD KEY `fk_product_image` (`Product_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `fk_order_user` (`User_ID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`Orditem_ID`),
  ADD KEY `fk_ordItem_Order` (`Order_ID`),
  ADD KEY `fk_orderProduct` (`Product_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `Image_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3008;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `Orditem_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_cart` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_item` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_product_image` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_ordItem_Order` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orderProduct` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
