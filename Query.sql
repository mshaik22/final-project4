-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bikeshowroom
CREATE DATABASE IF NOT EXISTS `bikeshowroom` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bikeshowroom`;

-- Dumping structure for table bikeshowroom.bike_model
CREATE TABLE IF NOT EXISTS `bike_model` (
  `model_id` varchar(100) NOT NULL,
  `bike_name` varchar(100) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `sales_id` varchar(100) NOT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bikeshowroom.bike_model: ~4 rows (approximately)
/*!40000 ALTER TABLE `bike_model` DISABLE KEYS */;
INSERT INTO `bike_model` (`model_id`, `bike_name`, `model_name`, `sales_id`) VALUES
	('m1', 'honda', 'RTR', 's1'),
	('m2', 'KTM', 'duke', 's2'),
	('m3', 'hero', 'motocrop', 's3'),
	('m4', 'apache', 'RTR', 's4');
/*!40000 ALTER TABLE `bike_model` ENABLE KEYS */;

-- Dumping structure for table bikeshowroom.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `bike_name` varchar(100) NOT NULL,
  `sales_id` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bikeshowroom.customer: ~3 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`, `customer_name`, `bike_name`, `sales_id`) VALUES
	(1, 'rik', 'Apache', 's1'),
	(2, 'john', 'KTM', 's2'),
	(3, 'john', 'hero', 's3');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table bikeshowroom.sales_details
CREATE TABLE IF NOT EXISTS `sales_details` (
  `sales_id` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `bike_name` varchar(100) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `pay_method` varchar(100) NOT NULL,
  `model_id` varchar(100) NOT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `sales_details_bike_model` (`model_id`),
  CONSTRAINT `sales_details_bike_model` FOREIGN KEY (`model_id`) REFERENCES `bike_model` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bikeshowroom.sales_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `sales_details` DISABLE KEYS */;
INSERT INTO `sales_details` (`sales_id`, `customer_name`, `bike_name`, `total_pay`, `pay_method`, `model_id`) VALUES
	('s1', 'riki', 'apache', 100000, 'offline', 'm1'),
	('s2', 'john', 'ktm', 200000, 'online', 'm2'),
	('s3', 'tom', 'hero', 50000, 'offline', 'm3');
/*!40000 ALTER TABLE `sales_details` ENABLE KEYS */;

-- Dumping structure for table bikeshowroom.store_details
CREATE TABLE IF NOT EXISTS `store_details` (
  `store_id` varchar(100) NOT NULL,
  `no_of_sales` int(11) NOT NULL,
  `available_bike` int(11) NOT NULL,
  `model_id` varchar(100) NOT NULL,
  `sales_id` varchar(100) NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `store_details_bike_model` (`model_id`),
  KEY `store_details_sales_details` (`sales_id`),
  CONSTRAINT `store_details_bike_model` FOREIGN KEY (`model_id`) REFERENCES `bike_model` (`model_id`),
  CONSTRAINT `store_details_sales_details` FOREIGN KEY (`sales_id`) REFERENCES `sales_details` (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bikeshowroom.store_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `store_details` DISABLE KEYS */;
INSERT INTO `store_details` (`store_id`, `no_of_sales`, `available_bike`, `model_id`, `sales_id`) VALUES
	('store1', 3, 2, 'm1', 's1'),
	('store2', 4, 1, 'm2', 's1'),
	('store3', 5, 2, 'm3', 's1');
/*!40000 ALTER TABLE `store_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
