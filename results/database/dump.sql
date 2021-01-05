-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2021 at 10:35 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iteration3`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'cat 1', 'Une magnifique première catégorie'),
(2, 'cat 2', '2ème catégorie'),
(3, 'cat 3', '3ème catégorie');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(90) NOT NULL,
  `last_name` varchar(90) NOT NULL,
  `adress` varchar(256) NOT NULL,
  `city` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `adress`, `city`) VALUES
(1, 'Chuck', 'Norris', 'Quelque part', 'Marseille'),
(2, 'Charlize', 'Theron', 'Quelque part ailleurs', 'Grenoble'),
(3, 'Ryan', 'Gosling', 'Je sais pas', 'Lyon');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `total` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `number`, `date`, `total`, `customer_id`) VALUES
(1, 1, '2021-01-05 12:00:00', NULL, 1),
(5, 2, '2021-01-05 09:00:00', NULL, 1),
(6, 3, '2021-01-05 12:00:00', NULL, 2),
(7, 4, '2021-01-05 11:00:00', NULL, 2),
(8, 5, '2021-01-05 15:00:00', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`product_id`, `order_id`, `quantity`) VALUES
(1, 4, 1),
(3, 4, 2),
(11, 5, 1),
(10, 5, 2),
(1, 6, 1),
(9, 6, 1),
(3, 7, 2),
(13, 7, 1),
(2, 8, 1),
(12, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `description` text NOT NULL,
  `price` smallint(5) UNSIGNED NOT NULL,
  `weight` mediumint(8) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL,
  `image` varchar(90) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `weight`, `quantity`, `image`, `availability`, `categorie_id`) VALUES
(1, 'Nain A1', 'un beau nain A1', 100, 1000, 10, 'nainA1.jpg', 1, 1),
(2, 'Nain A2', 'Un beau nain A2', 100, 1000, 10, 'nainA2.jpg', 1, 1),
(3, 'Nain B1', 'un beau nain B1', 10, 500, 1, 'nainB1.jpg', 1, 1),
(4, 'Nain B2', 'un beau nain B2', 10, 500, 1, 'nainB2.jpg', 1, 1),
(5, 'Nain C1', 'un beau nain C1', 10, 500, 1, 'nainC1.jpg', 0, 1),
(6, 'Nain C2', 'un beau nain C2', 10, 500, 1, 'nainC2.jpg', 0, 1),
(7, 'Nain D1', 'un beau nain D1', 13, 500, 0, 'nainD1.jpg', 1, 2),
(8, 'Nain D2', 'un beau nain D2', 13, 500, 0, 'nainD2.jpg', 1, 2),
(9, 'Nain E1', 'un beau nain E1', 50, 1200, 2, 'nainE1.jpg', 1, 2),
(10, 'Nain E2', 'un beau nain E2', 50, 1200, 2, 'nainE2.jpg', 1, 2),
(11, 'Nain F1', 'une beau nain F1', 500, 1200, 5, 'nainF1.jpg', 1, 3),
(12, 'Nain F2', 'une beau nain F2', 500, 1200, 5, 'nainF2.jpg', 1, 3),
(13, 'Nain F3', 'un beau nain F3', 500, 1200, 5, 'nainF3.jpg', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
