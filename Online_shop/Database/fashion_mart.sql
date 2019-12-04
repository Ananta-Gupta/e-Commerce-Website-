-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.37-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for fashion_mart
CREATE DATABASE IF NOT EXISTS `fashion_mart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fashion_mart`;

-- Dumping structure for table fashion_mart.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `Sno` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.admin: ~0 rows (approximately)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`Sno`, `user`, `pass`) VALUES
	(1, 'admin', 'admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `date` datetime DEFAULT NULL,
  `prod_code` int(20) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `costprice` int(11) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `prod_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=3311 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.cart: ~2 rows (approximately)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`sno`, `email`, `date`, `prod_code`, `prod_name`, `costprice`, `quant`, `prod_path`) VALUES
	(3309, 'sample@gmail.com', NULL, 2, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 699, 1, 'images/img57517.jpg'),
	(3310, 'sample@gmail.com', NULL, 16, 'Symbol Men\'s Relaxed Fit Jeans', 1209, 1, 'images/img65569.jpg');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.category
CREATE TABLE IF NOT EXISTS `category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `discp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.category: ~2 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`catid`, `catname`, `status`, `discp`) VALUES
	(1, 'Men', 'a', 'Men Section'),
	(2, 'Women', 'a', 'Women Section'),
	(3, 'Kids', 'a', 'Kids Section');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.order_prod
CREATE TABLE IF NOT EXISTS `order_prod` (
  `Sno` int(20) NOT NULL AUTO_INCREMENT,
  `Order_num` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `prod_code` int(20) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `costprice` int(11) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `prod_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.order_prod: ~9 rows (approximately)
DELETE FROM `order_prod`;
/*!40000 ALTER TABLE `order_prod` DISABLE KEYS */;
INSERT INTO `order_prod` (`Sno`, `Order_num`, `email`, `prod_code`, `prod_name`, `costprice`, `quant`, `prod_path`) VALUES
	(1, '1565617476888', 'ananta.manu@gmail.com', 1, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 699, 1, 'images/img239958.jpg'),
	(2, '1565617476888', 'ananta.manu@gmail.com', 11, 'Newport University Men\'s Skinny Fit Jeans', 499, 1, 'images/img20305.jpg'),
	(3, '1565617476888', 'ananta.manu@gmail.com', 1, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 699, 1, 'images/img239958.jpg'),
	(4, '1565617476888', 'ananta.manu@gmail.com', 2, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 699, 1, 'images/img57517.jpg'),
	(5, '1565617476888', 'ananta.manu@gmail.com', 14, 'Urbano Fashion Men\'s Slim Fit Black Stretch Jeans', 549, 2, 'images/img158226.jpg'),
	(6, '1565617476888', 'ananta.manu@gmail.com', 10, 'Louis Philippe Men\'s Printed Slim fit Formal Shirt', 1784, 2, 'images/img32219.jpg'),
	(7, '1565617476888', 'ananta.manu@gmail.com', 6, 'Peter England Men\'s Solid Slim Fit Formal Shirt', 799, 1, 'images/img66935.jpg'),
	(8, '1565617890864', 'ananta.manu@gmail.com', 2, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 699, 2, 'images/img57517.jpg'),
	(9, '1565617890864', 'ananta.manu@gmail.com', 12, 'Symbol Men\'s Skinny Fit Jeans', 803, 1, 'images/img95494.jpg');
/*!40000 ALTER TABLE `order_prod` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.order_trans
CREATE TABLE IF NOT EXISTS `order_trans` (
  `Sno` bigint(20) DEFAULT NULL,
  `Order_num` varchar(50) NOT NULL,
  `Cnum1` int(11) DEFAULT NULL,
  `Cnum4` int(11) DEFAULT NULL,
  `Owner_name` varchar(50) DEFAULT NULL,
  `Exp` datetime DEFAULT NULL,
  PRIMARY KEY (`Order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.order_trans: ~2 rows (approximately)
DELETE FROM `order_trans`;
/*!40000 ALTER TABLE `order_trans` DISABLE KEYS */;
INSERT INTO `order_trans` (`Sno`, `Order_num`, `Cnum1`, `Cnum4`, `Owner_name`, `Exp`) VALUES
	(NULL, '1565617476888', 1244, 4231, 'Ananta Gupta', NULL),
	(NULL, '1565617890864', 1244, 9877, 'Ananta Gupta', NULL);
/*!40000 ALTER TABLE `order_trans` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.products
CREATE TABLE IF NOT EXISTS `products` (
  `catid` int(11) DEFAULT NULL,
  `subcatid` int(11) DEFAULT NULL,
  `prod_code` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `mrpprice` int(11) DEFAULT NULL,
  `costprice` int(11) DEFAULT NULL,
  `gst` int(11) DEFAULT NULL,
  `discp` varchar(1000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `prod_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`prod_code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.products: ~16 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`catid`, `subcatid`, `prod_code`, `prod_name`, `brand`, `size`, `color`, `mrpprice`, `costprice`, `gst`, `discp`, `status`, `prod_path`) VALUES
	(1, 1, 1, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 'IndoPrimo', 'Medium-40', 'Grey', 1900, 699, 18, 'Stylish shirt for men, CASUAL SHIRT Party wear Design shirt SLIMFIT LOOKING Slim Fit Cotton Shirt with solid pattern Care Instructions : Wash Separately & Dry Clean Wash Latest Shirt from IndoPrimo, Its a perfect choice for your cart. We sell all genuine product with best quality and price to satisfy our valuable customer. This shirt offers a professional look for the true business man. It\'s the perfect day-to-night shirt. Wear it with some slacks to the office and throw on some jeans at night for drinks with the guys. Whatever the occasion this shirt will be your go-to. The style you want and the feel you need all rolled into this shirt', 'a', 'images/img239958.jpg'),
	(1, 1, 2, 'IndoPrimo Men\'s Cotton Casual Shirt for Men Full Sleeves', 'IndoPrimo', 'Small-38', 'White', 999, 699, 18, 'stylish shirt for men, CASUAL SHIRT Partywear Design shirt SLIMFIT LOOKING Slim Fit Cotton Shirt with solid pattern Care Instructions : Wash Separately & Dry Clean WashLatest Shirt from IndoPrimo, Its a perfect choice for your cart. We sell all genuine product with best quality and price to satisfy our valuable customer. This shirt offers a professional look for the true business man. It\'s the perfect day-to-night shirt. Wear it with some slacks to the office and throw on some jeans at night for drinks with the guys. Whatever the occasion this shirt will be your go-to. The style you want and the feel you need all rolled into this shirt', 'a', 'images/img57517.jpg'),
	(1, 1, 3, 'Diverse Men\'s Solid Slim Fit Cotton Formal Shirt', 'Diverses', 'Medium-40', 'White', 999, 429, 18, 'Diverse is a western wear value brand for men. Our range consists of basic and updated basic apparel across both formal and casual wear. We offer the right blend of quality, style and value aimed to delight our customers.', 'a', 'images/img139653.jpg'),
	(1, 1, 4, 'Campus Sutra Men\'s Checkered Casual Shirts', 'Campus Sutra', 'Medium-40', 'Black', 1499, 599, 18, 'Wear this Trendy button down plaid shirts from the House of Campus Sutra. This shirt features Full sleeves, Spread collar with a full buttoned. We suggest teaming it with a pair of jeans and casual shoes for a great look.', 'a', 'images/img235948.jpg'),
	(1, 1, 5, 'LionRoar Men\'s Polka Print Full Sleeves Formal Shirt', 'Lion', 'Medium-40', 'Blue', 999, 695, 18, 'Wear this Trendy button down plaid shirts from the House of Campus Sutra. This shirt features Full sleeves, Spread collar with a full buttoned. We suggest teaming it with a pair of jeans and casual shoes for a great look.', 'a', 'images/img42084.jpg'),
	(1, 1, 6, 'Peter England Men\'s Solid Slim Fit Formal Shirt', 'Peter England', 'Large-46', 'Creem', 1049, 799, 18, 'This smart slim fit shirt by Peter England, is perfect for work and all formal occasions. This pure cotton shirt features a chest pocket, full sleeves and a crisp cut-away collar.', 'a', 'images/img66935.jpg'),
	(1, 1, 7, 'Arihant Men\'s Cotton Linen Formal Shirt', 'Arihant', 'Medium-40', 'Grey', 1799, 649, 18, 'Decked with heathered woven design all over is this half sleeves formal shirt from Arihant. Tailored in regular fit using soft cotton linen fabric, this shirt is a wardrobe must-have. Team it best with black formal trousers and smart shoes.', 'a', 'images/img39274.jpg'),
	(1, 1, 8, 'The Mods Men\'s Formal Shirt', 'Mods', 'Small-38', 'Green', 945, 692, 18, 'The real original cotton feel Blended Sea Green Fancy shirt from the house of "The Mods".', 'a', 'images/img247713.jpg'),
	(1, 2, 9, 'Louis Philippe Men\'s Geometric Print Regular fit Formal Shirt', 'Louis Philippe', 'Medium-40', 'Blue', 1999, 1199, 18, 'Bring in an air of affluence and charisma during work hours with this shirt.', 'a', 'images/img62514.jpg'),
	(1, 1, 10, 'Louis Philippe Men\'s Printed Slim fit Formal Shirt', 'Louis Philippe', 'Small-38', 'Blue', 1999, 1784, 18, 'Add a touch of attitude to your wardrobe with this patterned formal shirt by Louis Philippe. Beautifully crafted from 100% cotton fabric, this full-sleeved, slim fit shirt is a must-own. Style tip: this shirt looks great when teamed with tailored trousers and lace-ups. Add a big dial watch and your good to go. Louis Philippe combines an on-trend design sensibility with extreme comfort making every piece from the brand a must-own item.', 'a', 'images/img32219.jpg'),
	(1, 3, 11, 'Newport University Men\'s Skinny Fit Jeans', 'Newport University', '32', 'Grey', 999, 499, 19, 'Medium washed grey 5 pocket jeans with tacking detail.', 'a', 'images/img20305.jpg'),
	(1, 3, 12, 'Symbol Men\'s Skinny Fit Jeans', 'Symbol ', '32', 'Black', 2099, 803, 19, 'Symbol men\'s jeans in a stylish skinny fit, created from a premium denim fabric. Apt for a casual outing.', 'a', 'images/img95494.jpg'),
	(1, 4, 13, 'Newport University Men\'s Slim Fit Jeans', 'Newport University', '34', 'Blue', 999, 499, 19, 'Classic 5 pocket jeans with dark wash.', 'a', 'images/img242263.jpg'),
	(1, 4, 14, 'Urbano Fashion Men\'s Slim Fit Black Stretch Jeans', 'Urbano Fashion', '34', 'Black', 749, 549, 19, 'Urbano Fashion men\'s black slim fit stretch jeans is the epitome of style with comfort. Made with high-quality material of cotton lycra and superior stitching for excellent fit, comfort and a trendy solid look. Pleasantly affordable considering a compelling price for best quality. The jeans are durable and resistant against wear and tear making it last long. Pair these cult fashion jeans with any Urbano Fashion shirt or t-shirt for the perfect casual or party wear look, and never go out of style!', 'a', 'images/img158226.jpg'),
	(1, 5, 15, 'AMERICAN CREW Men\'s Straight Fit Non Stretchable Jeans', 'AMERICAN CREW ', '32', 'Grey', 899, 759, 19, 'Get an edge on your style quotient with this uber cool Jeans from American Crew Clothing, featuring classic straight-leg styling updated with modern design details, these washed jeans from American Crew are a fashionable upgrade to your casual denim collection. Made from medium weight, Cotton Premium Denim, designed with a modern mid rise and Straight leg openings. These killer off-duty Jeans are Exclusively made from High Quality indigo denim, providing you unmatched style and Durability. This Jeans has been distressed at some places as a part of styling process - Please Check the Picture for Detailed distress effect, the distress might slightly differ from piece to piece.', 'a', 'images/img322593.jpg'),
	(1, 6, 16, 'Symbol Men\'s Relaxed Fit Jeans', 'Symbol ', '34', 'Black', 2699, 1209, 19, 'Symbol men\'s jeans in a stylish carrot, created from premium denim fabric. Apt for a casual outing.', 'a', 'images/img65569.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.sub_cat
CREATE TABLE IF NOT EXISTS `sub_cat` (
  `catid` int(11) DEFAULT NULL,
  `subcatid` int(11) NOT NULL AUTO_INCREMENT,
  `subcatname` varchar(50) DEFAULT NULL,
  `subcatdisp` varchar(50) DEFAULT NULL,
  `subcatstaus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subcatid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.sub_cat: ~6 rows (approximately)
DELETE FROM `sub_cat`;
/*!40000 ALTER TABLE `sub_cat` DISABLE KEYS */;
INSERT INTO `sub_cat` (`catid`, `subcatid`, `subcatname`, `subcatdisp`, `subcatstaus`) VALUES
	(0, 1, 'Full Sleeves Shirts', 'Full Sleeves Shirts', 'a'),
	(NULL, 2, 'Half Sleeves Shirts', 'Half Sleeves Shirts', 'a'),
	(NULL, 3, 'Skinny', 'Skinny Jeans', 'a'),
	(NULL, 4, 'Slim', 'Slim Jeans', 'a'),
	(NULL, 5, 'Regular', 'Regular Jeans', 'a'),
	(NULL, 6, 'Joggers', 'Joggers Jeans', 'a');
/*!40000 ALTER TABLE `sub_cat` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.users
CREATE TABLE IF NOT EXISTS `users` (
  `Sno` bigint(20) NOT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mob_no` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`Sno`, `Fname`, `Lname`, `email`, `mob_no`, `username`, `pass`) VALUES
	(1, 'Ananta', 'Gupta', 'ananta.manu@gmail.com', '9840363028', 'lord', 'ananta'),
	(2, 'sample', 'sample', 'sample@gmail.com', '123457899', 'user', 'user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table fashion_mart.user_add
CREATE TABLE IF NOT EXISTS `user_add` (
  `Sno` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `Mobno` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Add1` varchar(50) DEFAULT NULL,
  `Add2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Dist` varchar(50) DEFAULT NULL,
  `Pin` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table fashion_mart.user_add: ~0 rows (approximately)
DELETE FROM `user_add`;
/*!40000 ALTER TABLE `user_add` DISABLE KEYS */;
INSERT INTO `user_add` (`Sno`, `Fname`, `Lname`, `email`, `Company`, `Mobno`, `Country`, `Add1`, `Add2`, `City`, `Dist`, `Pin`) VALUES
	(1, 'Ananta', 'Gupta', 'ananta.manu@gmail.com', 'Student', '9840363028', 'India', 'Old Tehsil', 'Civil Hospital Road', 'Roorkee', 'Haridwar', 247667),
	(2, '', '', 'sample@gmail.com', '', '', '', '', '', '', '', 0);
/*!40000 ALTER TABLE `user_add` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
