-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2023 at 08:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `generic_commerce_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Sliders; 2=>Banners',
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `sub_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `btn_link` varchar(255) DEFAULT NULL,
  `text_position` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `serial` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `type`, `image`, `link`, `position`, `status`, `sub_title`, `title`, `description`, `btn_text`, `btn_link`, `text_position`, `slug`, `serial`, `created_at`, `updated_at`) VALUES
(1, 1, 'banner/19IFB1697004301.png', NULL, NULL, 1, 'New Collectio', 'The Great Fashion Collection 2022', 'Up To 40% Off Final Sale Items. Caught in the Moment!', 'New Collection', 'https://fashionista-demo.getcommerce.xyz', 'left', 'PoK3F1697003496', 1, '2023-10-11 05:51:36', '2023-10-11 06:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `thana` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_addresses`
--

INSERT INTO `billing_addresses` (`id`, `order_id`, `address`, `post_code`, `thana`, `city`, `country`, `created_at`, `updated_at`) VALUES
(2, 1, 'Flat A2, House 4 Rd No. 10', '1000', NULL, 'Dhaka', 'Bangladesh', '2023-07-17 23:49:13', NULL),
(3, 6, 'Flat A2, House 4 Rd No. 10', '1000', NULL, 'Dhaka', 'Bangladesh', '2023-07-18 08:34:22', NULL),
(4, 9, 'Flat A2, House 4 Rd No. 10', '1000', NULL, 'Mymensingh', 'Bangladesh', '2023-07-18 08:54:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` mediumtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Inactive; 1=>Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `image`, `title`, `short_description`, `description`, `tags`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'blogImages/KgOav1692591442.jpg', 'Test Title', 'Test Description', '<p>Test Full Description Test Full Description Test Full Description Test Full Description Test Full Description</p>', 'samsung, mobile', 'test-title1692591442', 1, '2023-08-21 04:17:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Not Featured; 1=>Featured',
  `serial` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `featured`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test1692591412', 1, 0, 1, '2023-08-21 04:16:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=> Not Featured; 1=> Featured',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=> Inactive; 1=> Active',
  `serial` tinyint(4) NOT NULL DEFAULT 1,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `banner`, `featured`, `status`, `serial`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'brand_images/q9Fcn1689771547.png', 'brand_images/S41ev1689507708.jpg', 1, 1, 1, 'apple', '2023-06-05 04:20:25', '2023-07-23 05:57:32'),
(2, 'Samsung', 'brand_images/B2Vun1689503322.png', 'brand_images/oPYOC1689572452.jpg', 1, 1, 2, 'samsung', '2023-06-05 04:20:37', '2023-07-23 05:57:32'),
(3, 'Xiaomi', 'brand_images/r8uyu1687254365.png', 'brand_images/2E8fq1689509240.jpg', 1, 1, 3, 'xiaomi', '2023-06-05 04:20:45', '2023-07-23 05:57:32'),
(4, 'Infinix', 'brand_images/hZIRZ1687254231.png', 'brand_images/r6la71689509858.jpg', 1, 1, 5, 'infinix', '2023-06-07 14:59:58', '2023-07-23 05:57:32'),
(5, 'OPPO', 'brand_images/e3XNq1689771912.png', 'brand_images/3D2G01689511079.jpg', 1, 1, 4, 'oppo', '2023-06-07 15:48:28', '2023-07-23 05:57:32'),
(10, 'Realme', 'brand_images/zg8hn1689503104.png', 'brand_images/xo17Y1689511388.jpg', 1, 1, 6, 'realme', '2023-06-15 20:31:34', '2023-07-23 05:57:32'),
(11, 'Walton', 'brand_images/q4bmO1687343696.jpg', 'brand_images/2kNqP1687343696.jpg', 1, 0, 1, 'walton', '2023-06-21 20:34:56', '2023-07-19 13:04:01'),
(12, 'Google', 'brand_images/XoC4n1689503035.png', 'brand_images/1pjkC1689572468.jpg', 1, 1, 7, 'google', '2023-07-16 13:32:57', '2023-07-23 05:57:32'),
(13, 'Vivo', 'brand_images/2zMGI1689771903.png', NULL, 1, 1, 8, 'vivo', '2023-07-19 11:10:36', '2023-07-23 05:57:32'),
(14, 'Tecno', 'brand_images/SAx4d1689771898.png', NULL, 1, 1, 9, 'tecno', '2023-07-19 11:11:16', '2023-07-23 05:57:32'),
(15, 'OnePlus', 'brand_images/4jph81689771891.png', NULL, 1, 1, 10, 'oneplus', '2023-07-19 11:12:36', '2023-07-23 05:57:32'),
(16, 'Motorola', 'brand_images/ZJH5l1689771885.png', NULL, 0, 1, 11, 'motorola', '2023-07-19 11:13:02', '2023-10-09 08:06:21'),
(17, 'Nokia', 'brand_images/0MsOT1689771653.png', NULL, 1, 1, 12, 'nokia', '2023-07-19 11:14:06', '2023-07-23 05:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_unique_cart_no` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `region_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `sim_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `storage_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `warrenty_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `device_condition_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` double NOT NULL,
  `unit_price` double NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_unique_cart_no`, `product_id`, `color_id`, `region_id`, `sim_id`, `storage_id`, `warrenty_id`, `device_condition_id`, `unit_id`, `qty`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(52, '1681588608321', 1, 2, 2, 2, 2, 2, 2, 1, 2, 200, 400, '2023-08-02 04:09:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Not Featured; 1=>Featured',
  `serial` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `banner_image`, `slug`, `status`, `featured`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'Phone & Tablet', 'category_images/05LN21689766002.png', NULL, 'phone-tablet', 1, 1, 1, '2023-06-05 03:22:01', '2023-07-19 11:34:03'),
(2, 'Laptop & Desktop', 'category_images/qG2W91689766235.jpg', NULL, 'laptop-desktop', 0, 1, 4, '2023-06-05 03:22:09', '2023-07-19 12:18:11'),
(3, 'Sound Equipments', 'category_images/wVxHd1689766347.jpg', NULL, 'sound-equipments', 0, 1, 7, '2023-06-05 03:22:17', '2023-07-19 12:18:17'),
(4, 'Accessories', 'category_images/HAtOO1689766271.jpg', NULL, 'accessories', 0, 1, 5, '2023-06-05 03:22:23', '2023-07-19 12:20:47'),
(5, 'Fitness & Wearable', 'category_images/UnRud1689766299.jpg', NULL, 'fitness-wearable', 0, 1, 6, '2023-06-05 03:22:36', '2023-07-19 12:21:02'),
(6, 'Cover & Protector', 'category_images/HmrwN1689766390.png', NULL, 'cover-protector', 0, 1, 8, '2023-06-05 03:22:41', '2023-07-19 12:20:55'),
(8, 'TV', 'category_images/32dE81689766081.jpg', 'category_images/7DFTU1687342915.jpg', 'tv', 0, 1, 2, '2023-06-21 20:21:55', '2023-07-19 12:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `child_categories`
--

CREATE TABLE `child_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_categories`
--

INSERT INTO `child_categories` (`id`, `category_id`, `subcategory_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Iphone 14 Series', 'iphone-14-series', 1, '2023-06-05 04:02:17', NULL),
(2, 1, 2, 'Iphone 13 Series', 'iphone-13-series', 1, '2023-06-05 04:03:01', NULL),
(3, 1, 3, 'Galaxy Z Series', 'galaxy-z-series', 1, '2023-06-05 04:03:16', NULL),
(146, 1, 7, 'iPhone', 'iphone', 1, '2023-07-19 13:09:54', NULL),
(147, 1, 7, 'Airpods', 'airpods', 1, '2023-07-19 13:10:05', NULL),
(148, 1, 7, 'Apple Watch', 'apple-watch', 1, '2023-07-19 13:10:21', NULL),
(149, 1, 7, 'iPad', 'ipad', 1, '2023-07-19 13:10:46', NULL),
(150, 1, 16, 'Mobile Phones', 'mobile-phones', 1, '2023-07-20 08:35:45', '2023-07-20 08:37:33'),
(151, 1, 16, 'Voice assistant', 'voice-assistant', 1, '2023-07-20 08:37:16', NULL),
(152, 1, 16, 'Charger', 'charger', 1, '2023-07-20 08:39:47', NULL),
(153, 1, 22, 'Galaxy Phones', 'galaxy-phones', 1, '2023-07-20 08:42:12', NULL),
(154, 1, 22, 'Galaxy Tabs', 'galaxy-tabs', 1, '2023-07-20 08:42:19', NULL),
(155, 1, 22, 'Charger', 'charger-1689844735-dzty9', 1, '2023-07-20 09:18:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Pure White', '#ffffff', '2023-06-05 04:21:56', NULL),
(2, 'Dark Black', '#000000', '2023-06-05 04:22:10', NULL),
(3, 'Navy Blue', '#000080', '2023-06-05 04:22:33', NULL),
(4, 'Silver', '#c0c0c0', '2023-06-05 04:22:53', NULL),
(5, 'Yellow', '#ffff00', '2023-06-05 04:23:03', NULL),
(6, 'Red', '#ff0000', '2023-06-05 04:23:11', NULL),
(7, 'Deep Green', '#008040', '2023-06-05 04:23:39', NULL),
(8, 'Sky Blue', '#00ffff', '2023-06-05 04:24:01', NULL),
(9, 'Orange', '#ff8040', '2023-06-07 15:00:45', NULL),
(10, 'off-white', '#fdfdfd', '2023-06-14 14:02:56', NULL),
(11, 'Rock blue', '#9bb5ce', '2023-06-14 14:05:13', NULL),
(12, 'GOLD', '#f9e5c9', '2023-06-14 14:07:01', NULL),
(13, 'Dusty Pink', '#c27ba0', '2023-07-09 18:26:57', NULL),
(14, 'LightGreen', '#b6d7a8', '2023-07-25 10:05:10', '2023-07-25 10:16:12'),
(15, 'Light Purple', '#cbc3e3', '2023-07-25 10:08:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE `contact_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Not Served; 1=>Served',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UAE', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `device_conditions`
--

CREATE TABLE `device_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_conditions`
--

INSERT INTO `device_conditions` (`id`, `name`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'Brand New (Official)', 1, '2023-06-05 04:34:14', '2023-07-16 21:50:27'),
(3, 'Used (Fresh Condition)', 2, '2023-06-05 04:34:27', '2023-07-16 21:50:15'),
(4, 'Refurbished', 4, '2023-06-05 04:34:33', '2023-07-10 22:22:55'),
(6, 'Brand New (Unofficial)', 1, '2023-07-16 21:50:39', NULL),
(7, 'Used (Few Scratches)', 1, '2023-07-16 21:52:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_configures`
--

CREATE TABLE `email_configures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail_from_name` varchar(255) DEFAULT NULL,
  `mail_from_email` varchar(255) DEFAULT NULL,
  `encryption` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>None; 1=>TLS; 2=>SSL',
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Inactive; 1=>Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_configures`
--

INSERT INTO `email_configures` (`id`, `host`, `port`, `email`, `password`, `mail_from_name`, `mail_from_email`, `encryption`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'asdasd', 213, 'asdasd', 'hOZkIn9x', 'asdasd', NULL, 2, '16865404242KaxD', 0, '2023-06-12 03:27:04', '2023-06-12 03:42:01'),
(5, 'smtp.gmail.com', 587, 'alifhossain174@gmail.com', 'xL42dz8hrPa30NFf+Dhr/g==', 'Bestu', 'bestu@gmail.com', 1, '168654136346TAW', 1, '2023-06-12 03:42:43', '2023-06-12 03:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'How can I place an order on Bestu?', 'To place an order, simply browse through our product listings, select the items you wish to purchase, and add them to your cart. Proceed to the checkout page, enter your shipping and payment information, and confirm your order. you can buy directly single product also.', 1, 'YNNLM1689485446', '2023-07-16 15:30:46', '2023-07-16 15:30:46'),
(2, 'What payment methods do you accept?', 'We accept various payment methods, including credit cards, debit cards, and online payment services such as SSLCommerez. The available payment options will be displayed during the checkout process.', 1, 'wj67c1689485485', '2023-07-16 15:31:25', '2023-07-16 15:31:25'),
(3, 'How long does it take to process and ship an order?', 'We typically process and ship orders within 1-2 business days. However, processing times may vary during peak seasons or promotional periods. Once your order is shipped, you will receive a shipping confirmation email with tracking information.', 1, '8QsEn1689486367', '2023-07-16 15:46:07', '2023-07-16 15:46:07'),
(4, 'What are your shipping options and delivery times?', 'We offer a range of shipping options, including standard and expedited shipping. The delivery time will depend on your location, the selected shipping method, and other factors beyond our control. During the checkout process, you will be provided with estimated delivery times for each shipping option.', 1, 'q9BXl1689486385', '2023-07-16 15:46:25', '2023-07-16 15:46:25'),
(5, 'Can I track the status of my order?', 'Yes, once your order is shipped, you will receive a shipping confirmation email containing a tracking number. You can use this tracking number to monitor the progress of your shipment on the respective courier\'s website.', 1, '4nWcO1689486403', '2023-07-16 15:46:43', '2023-07-16 15:46:43'),
(6, 'What is your return policy?', 'We have a flexible return policy. If you are not satisfied with your purchase, you may be eligible for a return within the specified return period. Please refer to our Return Policy for detailed information on the return process, eligibility criteria, and other important details.', 1, 'lihMH1689486418', '2023-07-16 15:46:58', '2023-07-16 15:46:58'),
(7, 'How do I contact customer support?', 'You can contact our customer support team by [insert contact information]. Our dedicated team is available to assist you with any questions, concerns, or inquiries you may have. We strive to provide prompt and helpful assistance to ensure your satisfaction.', 1, 'GQAPS1689486430', '2023-07-16 15:47:10', '2023-07-16 15:47:10'),
(8, 'Are the products on Bestu covered by warranties?', 'Yes, many products on Bestu come with manufacturer warranties. The specific warranty details can be found on the product page or in the product documentation. If you have any questions about warranties, feel free to reach out to our customer support team.', 1, 'GckHp1689486448', '2023-07-16 15:47:28', '2023-07-16 15:47:28'),
(9, 'Do you offer discounts or promotions?', 'Yes, we regularly offer discounts and promotions on selected products. Stay updated by subscribing to our newsletter or following our social media channels to be notified of the latest deals and promotions.\r\n\r\nQ: Is my personal information', 1, 'JitG01689486465', '2023-07-16 15:47:45', '2023-07-16 15:47:45'),
(10, 'Is my personal information secure?', 'We take the security and privacy of your personal information seriously. We implement industry-standard security measures to protect your data and use it only in accordance with our Privacy Policy. For more information on how we handle your personal information, please refer to our Privacy Policy.', 1, 'BC3RU1689486487', '2023-07-16 15:48:07', '2023-07-16 15:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Not Featured; 1=>Featured',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flags`
--

INSERT INTO `flags` (`id`, `icon`, `name`, `status`, `featured`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 'New Arrival', 1, 1, 'bVasD1685938162', '2023-06-05 04:09:22', '2023-06-05 04:19:57'),
(2, NULL, 'Recommended', 1, 1, 'OyhOC1685938177', '2023-06-05 04:09:37', '2023-06-05 04:19:55'),
(3, NULL, 'Best Selling', 1, 1, 'Hskfp1685938185', '2023-06-05 04:09:45', '2023-07-15 19:10:27'),
(4, NULL, 'Discount items', 1, 1, 'h7HPr1685938212', '2023-06-05 04:10:12', '2023-07-15 19:10:31'),
(5, 'flag_icons/AYPPb1686740561.png', 'Gadget items', 1, 0, 'gadget-items-n8pHc-1686740561', '2023-06-05 04:10:23', '2023-10-11 05:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `general_infos`
--

CREATE TABLE `general_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_dark` varchar(255) DEFAULT NULL,
  `fav_icon` varchar(255) DEFAULT NULL,
  `tab_title` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `google_map_link` varchar(255) DEFAULT NULL,
  `footer_copyright_text` varchar(255) DEFAULT NULL,
  `primary_color` varchar(255) DEFAULT NULL,
  `secondary_color` varchar(255) DEFAULT NULL,
  `tertiary_color` varchar(255) DEFAULT NULL,
  `title_color` varchar(255) DEFAULT NULL,
  `paragraph_color` varchar(255) DEFAULT NULL,
  `border_color` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `custom_js` longtext DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `messenger` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `google_analytic_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Active; 0=>Inactive',
  `google_analytic_tracking_id` varchar(255) DEFAULT NULL,
  `fb_pixel_status` tinyint(4) NOT NULL DEFAULT 0,
  `fb_pixel_app_id` varchar(255) DEFAULT NULL,
  `tawk_chat_status` tinyint(4) NOT NULL DEFAULT 0,
  `tawk_chat_link` varchar(255) DEFAULT NULL,
  `crisp_chat_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Active; 0=>Inactive',
  `crisp_website_id` varchar(255) DEFAULT NULL,
  `about_us` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_infos`
--

INSERT INTO `general_infos` (`id`, `logo`, `logo_dark`, `fav_icon`, `tab_title`, `company_name`, `short_description`, `contact`, `email`, `address`, `google_map_link`, `footer_copyright_text`, `primary_color`, `secondary_color`, `tertiary_color`, `title_color`, `paragraph_color`, `border_color`, `meta_title`, `meta_keywords`, `meta_description`, `custom_css`, `custom_js`, `facebook`, `instagram`, `twitter`, `linkedin`, `youtube`, `messenger`, `whatsapp`, `telegram`, `google_analytic_status`, `google_analytic_tracking_id`, `fb_pixel_status`, `fb_pixel_app_id`, `tawk_chat_status`, `tawk_chat_link`, `crisp_chat_status`, `crisp_website_id`, `about_us`, `created_at`, `updated_at`) VALUES
(1, 'company_logo/W5wDp1696503884.svg', 'company_logo/hmuY01696236480.png', 'company_logo/vJ4jW1696243530.png', 'TechShop', 'TechShop', 'We are committed to digitalizing your business. We provide Integrated marketing company that delivers graphics, web, and marketing solutions.', '01969005035', 'admin@gmail.com', 'Flat #B4, House No: 71, Road: 27, Dhaka 1212', 'https://goo.gl/maps/9AmJHeTmbu2JKrzeA', '<p>2023 &copy; TechShop</p>', 'rgba(61, 133, 198, 0.813)', '#8e7cc3', '#c27ba0', '#ffd966', '#0b5394', '#5b5b5b', 'TechLand', 'tech,it,technical', 'Technical', '.custom{\r\n  width: 100%;\r\n  height: 100%;\r\n}', '<script>\r\n	var meDev = \"Code Sleep Eat\";\r\n	console.log(myAsset);\r\n</script>', 'https://facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.youtube.com', 'https://web.facebook.com', 'https://web.whatsapp.com', 'https://telegram.com', 1, 'UA-842191520-669T', 1, 'wqwe', 0, 'https://embed.tawk.to/5a7c31ed7591465c7077c48/default', 1, NULL, '<p><strong>About Us</strong></p>\r\n\r\n<p>Welcome to Bestu, your go-to destination for the latest mobile devices and accessories. We are passionate about providing our customers with the best products and exceptional shopping experiences. With a wide range of high-quality smartphones, tablets, wearables, and accessories, we aim to meet all your tech needs in one convenient place.</p>\r\n\r\n<p>At Bestu, we believe that technology should enhance your lifestyle and simplify your daily routines. That&#39;s why we carefully curate our product selection, ensuring that we offer the latest innovations from top brands that you know and trust. Whether you&#39;re looking for a sleek smartphone with cutting-edge features or a durable case to protect your device, we&#39;ve got you covered.</p>\r\n\r\n<p>Our commitment goes beyond just offering great products. We strive to provide outstanding customer service and support. Our knowledgeable team is always ready to assist you with any questions or concerns you may have, ensuring that you have a seamless shopping experience from start to finish. We value your satisfaction and aim to exceed your expectations at every step of the way.</p>\r\n\r\n<p>At Bestu, we understand the importance of privacy and security. We have implemented robust measures to protect your personal information, ensuring that your data is handled with the utmost care and confidentiality. You can trust that your privacy is our priority.</p>\r\n\r\n<p>We are continuously evolving to meet the ever-changing needs of our customers and the tech industry. We keep a close eye on the latest trends and advancements, ensuring that we stay ahead of the curve and offer you the most up-to-date products and solutions.</p>\r\n\r\n<p>Thank you for choosing Bestu as your preferred destination for mobile devices and accessories. We appreciate your trust in us and look forward to serving you with excellence. If you have any questions, feedback, or suggestions, please don&#39;t hesitate to contact us. We are here to assist you and make your shopping experience truly exceptional.</p>\r\n\r\n<p>Happy shopping!</p>\r\n\r\n<p>The Bestu Team</p>', NULL, '2023-10-05 11:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `google_recaptchas`
--

CREATE TABLE `google_recaptchas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `captcha_site_key` varchar(255) DEFAULT NULL,
  `captcha_secret_key` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `google_recaptchas`
--

INSERT INTO `google_recaptchas` (`id`, `captcha_site_key`, `captcha_secret_key`, `status`, `created_at`, `updated_at`) VALUES
(1, '6LcVO6cbAAAAOzIEwPlU66nL1rxD4VAS38tjp45', '6LcVO6cbAAAALVNrpZfNRfd0Gy_9a_fJRLiMV', 0, NULL, '2023-10-05 05:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2023_03_29_160138_create_categories_table', 2),
(19, '2023_04_05_180729_create_child_categories_table', 4),
(21, '2023_04_06_174647_create_product_images_table', 6),
(22, '2023_04_07_060940_create_units_table', 7),
(26, '2023_04_08_190018_create_flags_table', 9),
(27, '2023_04_11_193941_create_terms_and_policies_table', 10),
(29, '2023_04_12_213408_create_faqs_table', 12),
(30, '2023_04_12_205032_create_general_infos_table', 13),
(33, '2023_04_13_014055_create_contact_requests_table', 15),
(39, '2023_04_15_042355_create_shipping_infos_table', 17),
(40, '2023_04_15_042838_create_billing_addresses_table', 18),
(41, '2023_04_15_042952_create_order_progress_table', 19),
(43, '2023_04_14_220155_create_orders_table', 20),
(44, '2023_04_15_041941_create_order_details_table', 20),
(45, '2023_04_24_104941_create_carts_table', 21),
(48, '2023_04_25_023105_create_user_cards_table', 22),
(49, '2023_04_25_112208_create_user_addresses_table', 23),
(50, '2023_04_25_164433_create_wish_lists_table', 24),
(54, '2023_04_26_124004_create_promo_codes_table', 25),
(55, '2023_05_01_230425_create_order_payments_table', 12),
(56, '2023_05_04_235947_create_support_tickets_table', 12),
(57, '2023_05_06_121329_create_support_messages_table', 13),
(58, '2023_05_14_224344_create_product_reviews_table', 26),
(59, '2023_05_19_103848_create_testimonials_table', 27),
(63, '2023_05_30_130611_create_brands_table', 28),
(64, '2023_05_31_152752_create_models_table', 29),
(65, '2023_05_31_161724_create_product_models_table', 30),
(67, '2023_06_01_085646_create_colors_table', 31),
(68, '2023_06_01_102605_create_storage_types_table', 32),
(69, '2023_06_01_143737_create_sims_table', 33),
(70, '2023_06_01_152249_create_device_conditions_table', 34),
(71, '2023_04_06_173024_create_products_table', 35),
(72, '2023_06_04_091502_create_subscribed_users_table', 0),
(73, '2023_06_04_123251_create_product_variants_table', 36),
(74, '2023_04_01_232755_create_subcategories_table', 37),
(75, '2023_06_05_153507_create_product_warrenties_table', 38),
(76, '2023_06_11_115427_create_product_question_answers_table', 12),
(77, '2023_06_11_162544_create_email_configures_table', 39),
(78, '2023_06_12_142348_create_sms_gateways_table', 1),
(79, '2023_06_13_160256_create_promotional_banners_table', 1),
(80, '2023_06_18_163118_create_payment_gateways_table', 1),
(81, '2023_06_20_111106_create_notifications_table', 1),
(82, '2023_06_22_130744_create_sms_templates_table', 1),
(83, '2023_06_25_104544_create_sms_histories_table', 1),
(84, '2023_07_03_093759_create_blog_categories_table', 40),
(85, '2023_07_03_113558_create_blogs_table', 41),
(86, '2023_07_17_212431_create_permission_routes_table', 1),
(87, '2023_07_17_222638_create_user_roles_table', 1),
(88, '2023_07_18_010659_create_role_permissions_table', 1),
(89, '2023_07_18_014657_create_user_role_permissions_table', 1),
(90, '2023_10_05_111305_create_google_recaptchas_table', 42),
(92, '2023_10_05_114505_create_social_logins_table', 43),
(93, '2023_04_13_002226_create_banners_table', 44);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `server_key` varchar(255) NOT NULL,
  `fcm_url` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `estimated_dd` date DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_method` varchar(255) DEFAULT NULL COMMENT '1=>Home Delivery; 2=>Store Pickup',
  `payment_method` tinyint(4) DEFAULT NULL COMMENT '1=>cash_on_delivery; 2=>bkash; 3=>nagad; 4=>Card',
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Unpaid; 1=>Payment Success; 2=>Payment Failed',
  `trx_id` varchar(255) DEFAULT NULL COMMENT 'Created By SodaiNagar',
  `bank_tran_id` varchar(255) DEFAULT NULL COMMENT 'KEEP THIS bank_tran_id FOR REFUNDING ISSUE',
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending/processing; 1=>confirmed; 2=>intransit; 3=>delivered; 4=>cancel',
  `sub_total` double NOT NULL DEFAULT 0,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_fee` double NOT NULL DEFAULT 0,
  `vat` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `order_note` longtext DEFAULT NULL COMMENT 'Order Note By Customer',
  `order_remarks` longtext DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `complete_order` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Incomplete Order (Address Missing); 1=>Complete Order (Address Given)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `user_id`, `order_date`, `estimated_dd`, `delivery_date`, `delivery_method`, `payment_method`, `payment_status`, `trx_id`, `bank_tran_id`, `order_status`, `sub_total`, `coupon_code`, `discount`, `delivery_fee`, `vat`, `tax`, `total`, `order_note`, `order_remarks`, `slug`, `complete_order`, `created_at`, `updated_at`) VALUES
(1, '1689601753866', 23, '2023-07-17 19:49:13', '2023-07-24', NULL, '', 1, 1, '1689601753icKfT', 'Not Available (COD)', 0, 134500, NULL, 0, 100, 0, 0, 134600, '', NULL, 'y8IlF1689601753', 1, '2023-07-17 23:49:13', '2023-07-17 23:49:13'),
(2, '1689660747209', 23, '2023-07-18 12:12:27', '2023-07-25', NULL, '', NULL, 0, '1689660747nBBFs', NULL, 0, 115000, NULL, 0, 0, 0, 0, 115000, '', NULL, 'NHy8P1689660747', 0, '2023-07-18 06:12:27', '2023-07-18 06:12:27'),
(3, '1689661552576', 23, '2023-07-18 12:25:52', '2023-07-25', NULL, '', NULL, 0, '1689661552ybmES', NULL, 0, 115000, NULL, 0, 0, 0, 0, 115000, '', NULL, 'aClNv1689661552', 0, '2023-07-18 06:25:52', '2023-07-18 06:25:53'),
(4, '1689668976893', 35, '2023-07-18 14:29:36', '2023-07-25', NULL, '', NULL, 0, '1689668976rPEtA', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'XTFRa1689668976', 0, '2023-07-18 08:29:36', NULL),
(5, '1689669097583', 35, '2023-07-18 14:31:37', '2023-07-25', NULL, '', NULL, 0, '1689669097nA79o', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'gFjl71689669097', 0, '2023-07-18 08:31:37', NULL),
(6, '1689669262197', 23, '2023-07-18 14:34:22', '2023-07-25', NULL, '', 1, 1, '1689669262uB2Mp', 'Not Available (COD)', 0, 115000, NULL, 0, 100, 0, 0, 115100, '', NULL, 'NvdIM1689669262', 1, '2023-07-18 08:34:22', '2023-07-18 08:34:22'),
(7, '1689669807556', 35, '2023-07-18 14:43:27', '2023-07-25', NULL, '', NULL, 0, '1689669807utQrJ', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'uOcnS1689669807', 0, '2023-07-18 08:43:27', NULL),
(8, '1689670104700', 35, '2023-07-18 14:48:24', '2023-07-25', NULL, '', NULL, 0, '1689670104s5gtl', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, '3tcFc1689670104', 0, '2023-07-18 08:48:24', NULL),
(9, '1689670481629', NULL, '2023-07-18 14:54:41', '2023-07-25', NULL, '', 1, 1, '1689670481uRKui', 'Not Available (COD)', 0, 545000, NULL, 0, 100, 0, 0, 545100, '', NULL, 'wPRVx1689670481', 1, '2023-07-18 08:54:41', '2023-07-18 08:54:42'),
(10, '1689673103748', 35, '2023-07-18 15:38:23', '2023-07-25', NULL, '', NULL, 0, '1689673103rmIKt', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'DEQEA1689673103', 0, '2023-07-18 09:38:23', NULL),
(11, '1689673132520', 35, '2023-07-18 15:38:52', '2023-07-25', NULL, '', NULL, 0, '16896731327Tg9B', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'Jvwqy1689673132', 0, '2023-07-18 09:38:52', NULL),
(12, '1689673273174', 35, '2023-07-18 15:41:13', '2023-07-25', NULL, '', NULL, 0, '1689673273XAEC3', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, '4xRod1689673273', 0, '2023-07-18 09:41:13', NULL),
(13, '1690345802546', NULL, '2023-07-26 10:30:02', '2023-08-02', NULL, NULL, NULL, 0, '1690345802FMqFF', NULL, 1, 400, '1YUIFWW', 0, 0, 0, 0, 400, NULL, NULL, 'zUUxH1690345802', 0, '2023-07-26 04:30:02', '2023-08-06 08:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `region_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `sim_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `storage_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `warrenty_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `device_condition_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` double NOT NULL,
  `unit_price` double NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `color_id`, `region_id`, `sim_id`, `storage_id`, `warrenty_id`, `device_condition_id`, `unit_id`, `qty`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-17 23:49:13', NULL),
(2, 1, 2, 0, 0, 0, 0, 1, 0, 0, 1, 19500, 19500, '2023-07-17 23:49:13', NULL),
(3, 2, 1, 5, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-18 06:12:27', NULL),
(4, 3, 1, 5, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-18 06:25:52', NULL),
(5, 6, 1, 5, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-18 08:34:22', NULL),
(6, 9, 1, 5, 226, 2, 2, 1, 1, 0, 2, 115000, 230000, '2023-07-18 08:54:41', NULL),
(7, 9, 1, 1, 226, 4, 2, 1, 1, 0, 3, 105000, 315000, '2023-07-18 08:54:41', NULL),
(8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 200, 200, '2023-07-26 04:30:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_through` varchar(255) NOT NULL DEFAULT 'SSL COMMERZ',
  `tran_id` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `val_id` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `amount` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `card_type` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `store_amount` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `card_no` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `bank_tran_id` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `status` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `tran_date` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `currency` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `card_issuer` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `card_brand` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `card_sub_brand` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `card_issuer_country` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `store_id` varchar(255) DEFAULT NULL COMMENT 'Response From Payment Gateway',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_payments`
--

INSERT INTO `order_payments` (`id`, `order_id`, `payment_through`, `tran_id`, `val_id`, `amount`, `card_type`, `store_amount`, `card_no`, `bank_tran_id`, `status`, `tran_date`, `currency`, `card_issuer`, `card_brand`, `card_sub_brand`, `card_issuer_country`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'COD', NULL, NULL, '134600', NULL, '134600', NULL, NULL, 'VALID', '2023-07-17 19:49:13', 'BDT', NULL, NULL, NULL, NULL, NULL, '2023-07-17 23:49:13', NULL),
(2, 6, 'COD', NULL, NULL, '115100', NULL, '115100', NULL, NULL, 'VALID', '2023-07-18 14:34:22', 'BDT', NULL, NULL, NULL, NULL, NULL, '2023-07-18 08:34:22', NULL),
(3, 9, 'COD', NULL, NULL, '545100', NULL, '545100', NULL, NULL, 'VALID', '2023-07-18 14:54:42', 'BDT', NULL, NULL, NULL, NULL, NULL, '2023-07-18 08:54:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_progress`
--

CREATE TABLE `order_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending/processing; 1=>confirmed; 2=>intransit; 3=>delivered; 4=>cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_progress`
--

INSERT INTO `order_progress` (`id`, `order_id`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2023-07-17 23:49:13', NULL),
(2, 2, 0, '2023-07-18 06:12:27', NULL),
(3, 3, 0, '2023-07-18 06:25:52', NULL),
(4, 4, 0, '2023-07-18 08:29:36', NULL),
(5, 5, 0, '2023-07-18 08:31:37', NULL),
(6, 6, 0, '2023-07-18 08:34:22', NULL),
(7, 7, 0, '2023-07-18 08:43:27', NULL),
(8, 8, 0, '2023-07-18 08:48:24', NULL),
(9, 9, 0, '2023-07-18 08:54:41', NULL),
(10, 10, 0, '2023-07-18 09:38:23', NULL),
(11, 11, 0, '2023-07-18 09:38:52', NULL),
(12, 12, 0, '2023-07-18 09:41:13', NULL),
(13, 13, 0, '2023-07-26 04:30:02', NULL),
(14, 13, 1, '2023-08-06 08:15:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `api_key` varchar(255) DEFAULT NULL COMMENT 'StoreID/ApiKey',
  `secret_key` varchar(255) DEFAULT NULL COMMENT 'StorePassword/SecretKey',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `live` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Test/Sandbox; 1=>Product/Live',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Inactive; 1=>Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `provider_name`, `api_key`, `secret_key`, `username`, `password`, `live`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ssl_commerz', 'sodai644d7015e8eb1', 'sodai644d7015e8eb1@ssl', 'alifhossain174', '12345678', 1, 0, NULL, '2023-07-19 06:08:50'),
(2, 'stripe', '98798796546', 'ASDFGHJKLERTYUI', 'test_username', 'test_password', 1, 0, NULL, '2023-06-19 05:19:05'),
(3, 'bkash', '654654654', 'ZWvNGXXPHOYhR', 'bkash_test_user', '85747bkash', 1, 0, NULL, '2023-10-11 05:00:38'),
(4, 'amar_pay', '654654654', 'ZWvNGXXPHOYhR', 'amar_pay_test_user', '85747amar_pay', 1, 1, NULL, '2023-10-11 04:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `permission_routes`
--

CREATE TABLE `permission_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_routes`
--

INSERT INTO `permission_routes` (`id`, `route`, `name`, `method`, `created_at`, `updated_at`) VALUES
(1, 'filemanager', 'unisharp.lfm.show', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(2, 'filemanager/errors', 'unisharp.lfm.getErrors', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(3, 'filemanager/upload', 'unisharp.lfm.upload', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(4, 'filemanager/jsonitems', 'unisharp.lfm.getItems', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(5, 'filemanager/move', 'unisharp.lfm.move', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(6, 'filemanager/domove', 'unisharp.lfm.domove', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(7, 'filemanager/newfolder', 'unisharp.lfm.getAddfolder', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(8, 'filemanager/folders', 'unisharp.lfm.getFolders', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(9, 'filemanager/crop', 'unisharp.lfm.getCrop', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(10, 'filemanager/cropimage', 'unisharp.lfm.getCropimage', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(11, 'filemanager/cropnewimage', 'unisharp.lfm.getCropnewimage', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(12, 'filemanager/rename', 'unisharp.lfm.getRename', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(13, 'filemanager/resize', 'unisharp.lfm.getResize', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(14, 'filemanager/doresize', 'unisharp.lfm.performResize', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(15, 'filemanager/download', 'unisharp.lfm.getDownload', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(16, 'filemanager/delete', 'unisharp.lfm.getDelete', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(17, 'filemanager/demo', 'unisharp.lfm.', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(18, '/', NULL, 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(19, 'clear', NULL, 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(20, 'login', NULL, 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(21, 'logout', 'logout', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(22, 'password/confirm', NULL, 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(23, 'home', 'home', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(24, 'change/password/page', 'changePasswordPage', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(25, 'change/password', 'changePassword', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(26, 'ckeditor', NULL, 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(27, 'ckeditor/upload', 'ckeditor.upload', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(28, 'sslcommerz/order/payment', 'order.payment', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(29, 'sslcommerz/success', 'payment.success', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(30, 'sslcommerz/failure', 'failure', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(31, 'sslcommerz/cancel', 'cancel', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(32, 'sslcommerz/ipn', 'payment.ipn', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(33, 'file-manager', NULL, 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(34, 'laravel-filemanager', 'unisharp.lfm.show', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(35, 'laravel-filemanager/errors', 'unisharp.lfm.getErrors', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(36, 'laravel-filemanager/upload', 'unisharp.lfm.upload', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(37, 'laravel-filemanager/jsonitems', 'unisharp.lfm.getItems', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(38, 'laravel-filemanager/move', 'unisharp.lfm.move', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(39, 'laravel-filemanager/domove', 'unisharp.lfm.domove', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(40, 'laravel-filemanager/newfolder', 'unisharp.lfm.getAddfolder', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(41, 'laravel-filemanager/folders', 'unisharp.lfm.getFolders', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(42, 'laravel-filemanager/crop', 'unisharp.lfm.getCrop', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(43, 'laravel-filemanager/cropimage', 'unisharp.lfm.getCropimage', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(44, 'laravel-filemanager/cropnewimage', 'unisharp.lfm.getCropnewimage', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(45, 'laravel-filemanager/rename', 'unisharp.lfm.getRename', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(46, 'laravel-filemanager/resize', 'unisharp.lfm.getResize', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(47, 'laravel-filemanager/doresize', 'unisharp.lfm.performResize', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(48, 'laravel-filemanager/download', 'unisharp.lfm.getDownload', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(49, 'laravel-filemanager/delete', 'unisharp.lfm.getDelete', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(50, 'laravel-filemanager/demo', 'unisharp.lfm.', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(51, 'view/all/flags', 'ViewAllFlags', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(52, 'delete/flag/{slug}', 'DeleteFlag', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(53, 'feature/flag/{id}', 'FeatureFlag', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(54, 'get/flag/info/{slug}', 'GetFlagInfo', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(55, 'update/flag', 'UpdateFlagInfo', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(56, 'create/new/flag', 'SendSupportMessage', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(57, 'view/all/units', 'ViewAllUnits', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(58, 'delete/unit/{id}', 'DeleteUnit', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(59, 'get/unit/info/{id}', 'GetUnitInfo', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(60, 'update/unit', 'UpdateUnitInfo', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(61, 'create/new/unit', 'CreateNewUnit', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(62, 'view/all/sims', 'ViewAllSims', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(63, 'delete/sim/{id}', 'DeleteSim', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(64, 'get/sim/info/{id}', 'GetSimInfo', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(65, 'update/sim', 'UpdateSimInfo', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(66, 'create/new/sim', 'CreateNewSim', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(67, 'create/new/device/condition', 'AddNewDeviceCondition', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(68, 'view/all/device/conditions', 'ViewAllDeviceConditions', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(69, 'delete/device/condition/{id}', 'DeleteDeviceCondition', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(70, 'get/device/condition/info/{id}', 'GetDeviceConditionInfo', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(71, 'update/device/condition', 'UpdateDeviceCondition', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(72, 'rearrange/device/condition', 'RearrangeDeviceCondition', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(73, 'save/rearranged/device/condition', 'SaveRearrangeDeviceCondition', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(74, 'create/new/warrenty', 'AddNewProductWarrenty', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(75, 'view/all/warrenties', 'ViewAllProductWarrenties', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(76, 'delete/warrenty/{id}', 'DeleteProductWarrenty', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(77, 'get/warrenty/info/{id}', 'GetProductWarrentyInfo', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(78, 'update/warrenty', 'UpdateProductWarrenty', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(79, 'rearrange/warrenty', 'RearrangeWarrenty', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(80, 'save/rearranged/warrenty', 'SaveRearrangeWarrenties', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(81, 'add/new/brand', 'AddNewBrand', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(82, 'save/new/brand', 'SaveNewBrand', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(83, 'view/all/brands', 'ViewAllBrands', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(84, 'feature/brand/{id}', 'FeatureBrand', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(85, 'edit/brand/{slug}', 'EditBrand', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(86, 'update/brand', 'UpdateBrand', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(87, 'add/new/model', 'AddNewModel', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(88, 'save/new/model', 'SaveNewModel', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(89, 'view/all/models', 'ViewAllModels', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(90, 'delete/model/{id}', 'DeleteModel', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(91, 'edit/model/{slug}', 'EditModel', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(92, 'update/model', 'UpdateModel', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(93, 'brand/wise/model', 'BrandWiseModel', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(94, 'create/new/color', 'AddNewColor', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(95, 'view/all/colors', 'ViewAllColors', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(96, 'delete/color/{id}', 'DeleteColor', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(97, 'get/color/info/{id}', 'GetColorInfo', 'GET', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(98, 'update/color', 'UpdateColor', 'POST', '2023-07-17 18:05:22', '2023-08-06 08:52:51'),
(99, 'create/new/storage', 'AddNewStorage', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(100, 'view/all/storages', 'ViewAllStorages', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(101, 'delete/storage/{id}', 'DeleteStorage', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(102, 'get/storage/info/{id}', 'GetStorageInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(103, 'update/storage', 'UpdateStorage', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(104, 'rearrange/storage/types', 'RearrangeStorage', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(105, 'save/rearranged/storages', 'SaveRearrangeStorage', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(106, 'view/email/credential', 'ViewEmailCredentials', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(107, 'save/new/email/configure', 'SaveEmailCredential', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(108, 'delete/email/config/{slug}', 'DeleteEmailCredential', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(109, 'get/email/config/info/{slug}', 'GetEmailCredentialInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(110, 'update/email/config', 'UpdateEmailCredentialInfo', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(111, 'setup/sms/gateways', 'ViewSmsGateways', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(112, 'update/sms/gateway/info', 'UpdateSmsGatewayInfo', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(113, 'change/gateway/status/{provider}', 'ChangeGatewayStatus', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(114, 'setup/payment/gateways', 'ViewPaymentGateways', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(115, 'update/payment/gateway/info', 'UpdatePaymentGatewayInfo', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(116, 'change/payment/gateway/status/{provider}', 'ChangePaymentGatewayStatus', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(117, 'add/new/category', 'AddNewCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(118, 'save/new/category', 'SaveNewCategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(119, 'view/all/category', 'ViewAllCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(120, 'delete/category/{slug}', 'DeleteCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(121, 'feature/category/{slug}', 'FeatureCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(122, 'edit/category/{slug}', 'EditCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(123, 'update/category', 'UpdateCategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(124, 'rearrange/category', 'RearrangeCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(125, 'save/rearranged/order', 'SaveRearrangeCategoryOrder', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(126, 'add/new/subcategory', 'AddNewSubcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(127, 'save/new/subcategory', 'SaveNewSubcategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(128, 'view/all/subcategory', 'ViewAllSubcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(129, 'delete/subcategory/{slug}', 'DeleteSubcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(130, 'feature/subcategory/{id}', 'FeatureSubcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(131, 'edit/subcategory/{slug}', 'EditSubcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(132, 'update/subcategory', 'UpdateSubcategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(133, 'add/new/childcategory', 'AddNewChildcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(134, 'category/wise/subcategory', 'SubcategoryCategoryWise', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(135, 'save/new/childcategory', 'SaveNewChildcategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(136, 'view/all/childcategory', 'ViewAllChildcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(137, 'delete/childcategory/{slug}', 'DeleteChildcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(138, 'edit/childcategory/{slug}', 'EditChildcategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(139, 'update/childcategory', 'UpdateChildcategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(140, 'add/new/product', 'AddNewProduct', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(141, 'subcategory/wise/childcategory', 'ChildcategorySubcategoryWise', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(142, 'save/new/product', 'SaveNewProduct', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(143, 'view/all/product', 'ViewAllProducts', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(144, 'delete/product/{slug}', 'DeleteProduct', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(145, 'edit/product/{slug}', 'EditProduct', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(146, 'update/product', 'UpdateProduct', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(147, 'add/another/variant', 'AddAnotherVariant', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(148, 'delete/product/variant/{id}', 'DeleteProductVariant', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(149, 'view/product/reviews', 'ViewAllProductReviews', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(150, 'approve/product/review/{slug}', 'ApproveProductReview', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(151, 'delete/product/review/{slug}', 'DeleteProductReview', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(152, 'get/product/review/info/{id}', 'GetProductReviewInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(153, 'submit/reply/product/review', 'SubmitReplyOfProductReview', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(154, 'view/product/question/answer', 'ViewAllQuestionAnswer', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(155, 'delete/question/answer/{id}', 'DeleteQuestionAnswer', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(156, 'get/question/answer/info/{id}', 'GetQuestionAnswerInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(157, 'submit/question/answer', 'SubmitAnswerOfQuestion', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(158, 'terms/and/condition', 'ViewTermsAndCondition', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(159, 'update/terms', 'UpdateTermsAndCondition', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(160, 'view/privacy/policy', 'ViewPrivacyPolicy', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(161, 'update/privacy/policy', 'UpdatePrivacyPolicy', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(162, 'view/shipping/policy', 'ViewShippingPolicy', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(163, 'update/shipping/policy', 'UpdateShippingPolicy', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(164, 'view/return/policy', 'ViewReturnPolicy', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(165, 'update/return/policy', 'UpdateReturnPolicy', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(166, 'view/all/customers', 'ViewAllCustomers', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(167, 'view/system/users', 'ViewAllSystemUsers', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(168, 'add/new/system/user', 'AddNewSystemUsers', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(169, 'create/system/user', 'CreateSystemUsers', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(170, 'edit/system/user/{id}', 'EditSystemUser', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(171, 'delete/system/user/{id}', 'DeleteSystemUser', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(172, 'update/system/user', 'UpdateSystemUser', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(173, 'change/user/status/{id}', 'ChangeUserStatus', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(174, 'delete/customer/{id}', 'DeleteCustomer', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(175, 'download/customer/excel', 'DownloadCustomerExcel', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(176, 'about/us/page', 'AboutUsPage', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(177, 'update/about/us', 'UpdateAboutUsPage', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(178, 'general/info', 'GeneralInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(179, 'update/general/info', 'UpdateGeneralInfo', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(180, 'view/all/faqs', 'ViewAllFaqs', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(181, 'add/new/faq', 'AddNewFaq', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(182, 'save/faq', 'SaveFaq', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(183, 'delete/faq/{slug}', 'DeleteFaq', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(184, 'edit/faq/{slug}', 'EditFaq', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(185, 'update/faq', 'UpdateFaq', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(186, 'view/all/sliders', 'ViewAllSliders', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(187, 'add/new/slider', 'AddNewSlider', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(188, 'save/new/slider', 'SaveNewSlider', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(189, 'edit/slider/{slug}', 'EditSlider', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(190, 'update/slider', 'UpdateSlider', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(191, 'delete/data/{slug}', 'DeleteSliderBanner', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(192, 'view/all/banners', 'ViewAllBanners', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(193, 'add/new/banner', 'AddNewBanner', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(194, 'save/new/banner', 'SaveNewBanner', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(195, 'edit/banner/{slug}', 'EditBanner', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(196, 'update/banner', 'UpdateBanner', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(197, 'view/promotional/banner', 'ViewPromotionalBanner', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(198, 'update/promotional/banner', 'UpdatePromotionalBanner', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(199, 'view/all/contact/requests', 'ViewAllContactRequests', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(200, 'delete/contact/request/{id}', 'DeleteContactRequests', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(201, 'change/request/status/{id}', 'ChangeRequestStatus', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(202, 'view/orders', 'ViewAllOrders', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(203, 'view/pending/orders', 'ViewPendigOrders', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(204, 'view/approved/orders', 'ViewApprovedOrders', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(205, 'view/delivered/orders', 'ViewDeliveredOrders', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(206, 'view/cancelled/orders', 'ViewCancelledOrders', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(207, 'order/details/{slug}', 'OrderDetails', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(208, 'cancel/order/{slug}', 'CancelOrder', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(209, 'approve/order/{slug}', 'ApproveOrder', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(210, 'intransit/order/{slug}', 'IntransitOrder', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(211, 'deliver/order/{slug}', 'DeliverOrder', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(212, 'order/info/update', 'OrderInfoUpdate', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(213, 'order/edit/{slug}', 'OrderEdit', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(214, 'order/update', 'OrderUpdate', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(215, 'add/more/product', 'AddMoreProduct', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(216, 'get/product/variants', 'GetProductVariants', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(217, 'add/new/code', 'AddPromoCode', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(218, 'save/promo/code', 'SavePromoCode', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(219, 'view/all/promo/codes', 'ViewAllPromoCodes', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(220, 'edit/promo/code/{slug}', 'EditPromoCode', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(221, 'update/promo/code', 'UpdatePromoCode', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(222, 'view/customers/wishlist', 'CustomersWishlist', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(223, 'pending/support/tickets', 'PendingSupportTickets', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(224, 'solved/support/tickets', 'SolvedSupportTickets', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(225, 'on/hold/support/tickets', 'OnHoldSupportTickets', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(226, 'rejected/support/tickets', 'RejectedSupportTickets', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(227, 'delete/support/ticket/{slug}', 'DeleteSupportTicket', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(228, 'support/status/change/{slug}', 'ChangeStatusSupport', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(229, 'support/status/on/hold/{slug}', 'ChangeStatusSupportOnHold', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(230, 'support/status/in/progress/{slug}', 'ChangeStatusSupportInProgress', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(231, 'support/status/rejected/{slug}', 'ChangeStatusSupportRejected', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(232, 'view/support/messages/{slug}', 'ViewSupportMessage', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(233, 'send/support/message', 'SendSupportMessage', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(234, 'view/testimonials', 'ViewTestimonials', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(235, 'add/testimonial', 'AddTestimonial', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(236, 'save/testimonial', 'SaveTestimonial', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(237, 'delete/testimonial/{slug}', 'DeleteTestimonial', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(238, 'edit/testimonial/{slug}', 'EditTestimonial', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(239, 'update/testimonial', 'UpdateTestimonial', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(240, 'view/all/subscribed/users', 'ViewAllSubscribedUsers', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(241, 'delete/subcribed/users/{id}', 'DeleteSubscribedUsers', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(242, 'download/subscribed/users/excel', 'DownloadSubscribedUsersExcel', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(243, 'download/database/backup', 'DownloadDBBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(244, 'download/product/files/backup', 'DownloadProductFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(245, 'download/user/files/backup', 'DownloadUserFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(246, 'download/banner/files/backup', 'DownloadBannerFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(247, 'download/category/files/backup', 'DownloadCategoryFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(248, 'download/subcategory/files/backup', 'DownloadSubcategoryFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(249, 'download/flag/files/backup', 'DownloadFlagFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(250, 'download/ticket/files/backup', 'DownloadTicketFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(251, 'download/blog/files/backup', 'DownloadBlogFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(252, 'download/other/files/backup', 'DownloadOtherFilesBackup', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(253, 'send/notification/page', 'SendNotificationPage', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(254, 'view/all/notifications', 'ViewAllNotifications', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(255, 'delete/notification/{id}', 'DeleteNotification', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(256, 'delete/notification/with/range', 'DeleteNotificationRangeWise', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(257, 'send/push/notification', 'SendPushNotification', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(258, 'view/sms/templates', 'ViewSmsTemplates', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(259, 'create/sms/template', 'CreateSmsTemplate', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(260, 'save/sms/template', 'SaveSmsTemplate', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(261, 'get/sms/template/info/{id}', 'GetSmsTemplateInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(262, 'delete/sms/template/{id}', 'DeleteSmsTemplate', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(263, 'send/sms/page', 'SendSmsPage', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(264, 'get/template/description', 'GetTemplateDescription', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(265, 'update/sms/template', 'UpdateSmsTemplate', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(266, 'send/sms', 'SendSms', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(267, 'view/sms/history', 'ViewSmsHistory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(268, 'delete/sms/with/range', 'DeleteSmsHistoryRange', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(269, 'delete/sms/{id}', 'DeleteSmsHistory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(270, 'blog/categories', 'BlogCategories', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(271, 'save/blog/category', 'SaveBlogCategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(272, 'delete/blog/category/{slug}', 'DeleteBlogCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(273, 'feature/blog/category/{slug}', 'FeatureBlogCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(274, 'get/blog/category/info/{slug}', 'GetBlogCategoryInfo', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(275, 'update/blog/category', 'UpdateBlogCategoryInfo', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(276, 'rearrange/blog/category', 'RearrangeBlogCategory', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(277, 'save/rearranged/blog/categories', 'SaveRearrangeCategory', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(278, 'add/new/blog', 'AddNewBlog', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(279, 'save/new/blog', 'SaveNewBlog', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(280, 'view/all/blogs', 'ViewAllBlogs', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(281, 'delete/blog/{slug}', 'DeleteBlog', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(282, 'edit/blog/{slug}', 'EditBlog', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(283, 'update/blog', 'UpdateBlog', 'POST', '2023-07-17 18:05:23', '2023-08-06 08:52:51'),
(284, 'view/permission/routes', 'ViewAllPermissionRoutes', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:52'),
(285, 'regenerate/permission/routes', 'RegeneratePermissionRoutes', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:52'),
(286, 'view/user/roles', 'ViewAllUserRoles', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:52'),
(287, 'new/user/role', 'NewUserRole', 'GET', '2023-07-17 18:05:23', '2023-08-06 08:52:52'),
(288, 'make/user/superadmin/{id}', 'MakeSuperAdmin', 'GET', '2023-07-17 18:52:16', '2023-08-06 08:52:51'),
(289, 'revoke/user/superadmin/{id}', 'RevokeSuperAdmin', 'GET', '2023-07-17 18:52:16', '2023-08-06 08:52:51'),
(290, 'save/user/role', 'SaveUserRole', 'POST', '2023-07-17 19:01:45', '2023-08-06 08:52:52'),
(291, 'delete/user/role/{id}', 'DeleteUserRole', 'GET', '2023-07-17 19:23:13', '2023-08-06 08:52:52'),
(292, 'edit/user/role/{id}', 'EditUserRole', 'GET', '2023-07-17 20:17:08', '2023-08-06 08:52:52'),
(293, 'update/user/role', 'UpdateUserRole', 'POST', '2023-07-17 20:17:08', '2023-08-06 08:52:52'),
(294, 'view/user/role/permission', 'ViewUserRolePermission', 'GET', '2023-07-17 20:17:08', '2023-08-06 08:52:52'),
(295, 'assign/role/permission/{id}', 'AssignRolePermission', 'GET', '2023-07-17 20:17:08', '2023-08-06 08:52:52'),
(296, 'save/assigned/role/permission', 'SaveAssignedRolePermission', 'POST', '2023-07-18 03:05:15', '2023-08-06 08:52:52'),
(297, 'rearrange/brands', 'RearrangeBrands', 'GET', '2023-07-23 05:52:12', '2023-08-06 08:52:51'),
(298, 'save/rearranged/brands', 'saveRearrangeBrands', 'POST', '2023-07-23 05:55:04', '2023-08-06 08:52:51'),
(299, 'clear/cache', 'ClearCache', 'GET', '2023-08-03 08:23:00', '2023-08-06 08:52:51'),
(300, 'sales/report', 'SalesReport', 'GET', '2023-08-06 08:52:51', NULL),
(301, 'generate/sales/report', 'GenerateSalesReport', 'POST', '2023-08-06 08:52:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 18, 'Bestu', '182541c1140128b7dac6e630c5fcd2c822314bf98c8e23d99d268e9506bc3f47', '[\"*\"]', NULL, '2023-06-08 16:15:36', '2023-06-08 16:15:36'),
(2, 'App\\Models\\User', 18, 'Bestu', '9957edbf4cafff78f7bf840378ea94e02afbe816a32132ea2378204e38a0b9c1', '[\"*\"]', NULL, '2023-06-08 16:45:46', '2023-06-08 16:45:46'),
(3, 'App\\Models\\User', 18, 'Bestu', '8277b71c99e5de541d66dfff0f33d402f4cd8e933b48d00e8494ee25b0012d89', '[\"*\"]', NULL, '2023-06-08 17:31:47', '2023-06-08 17:31:47'),
(4, 'App\\Models\\User', 18, 'Bestu', 'c0c0dfc965fdfd6ed1fad312491d189ed56b3d412b4c6529ab67998f463acc11', '[\"*\"]', NULL, '2023-06-08 17:33:05', '2023-06-08 17:33:05'),
(5, 'App\\Models\\User', 18, 'Bestu', '5c232e4d071afa57c8bb230f359c0240cfc87766aaca6d7cfab96bad00f50957', '[\"*\"]', NULL, '2023-06-08 17:33:34', '2023-06-08 17:33:34'),
(6, 'App\\Models\\User', 18, 'Bestu', 'ac148be70c58ab38e363d264aeec42ad0fa159e998cd61239d3b0104a36bfcaa', '[\"*\"]', NULL, '2023-06-08 18:35:37', '2023-06-08 18:35:37'),
(7, 'App\\Models\\User', 18, 'Bestu', '0fdee69105a68eb4b263288a8bb446c1de325ff4e4d8d48c8433abb4927b70e8', '[\"*\"]', NULL, '2023-06-08 18:35:47', '2023-06-08 18:35:47'),
(8, 'App\\Models\\User', 18, 'Bestu', '5c71e0f00dab6fc4151c3b05f6f405e5be9783946970edfe1f8ace9843f7fe27', '[\"*\"]', NULL, '2023-06-08 18:44:29', '2023-06-08 18:44:29'),
(9, 'App\\Models\\User', 18, 'Bestu', 'ad3d5a1a2c74cd841b1b47da5ec45aaec5cb99a24fcdba9517a36d6db4a6581b', '[\"*\"]', NULL, '2023-06-08 18:44:35', '2023-06-08 18:44:35'),
(10, 'App\\Models\\User', 18, 'Bestu', '43141211b33accd9f6bc7a1fd38c519a3651661c701e65ecb24e62c12e482ace', '[\"*\"]', NULL, '2023-06-08 19:52:50', '2023-06-08 19:52:50'),
(11, 'App\\Models\\User', 18, 'Bestu', '185bb3598afe862bca13351fa74a8b49e386ed6119825861600aed759c919f06', '[\"*\"]', NULL, '2023-06-08 19:53:43', '2023-06-08 19:53:43'),
(12, 'App\\Models\\User', 18, 'Bestu', '2063572878373821302723bb766708a14b3a0d89afe8c7746f5ab01179506235', '[\"*\"]', NULL, '2023-06-08 19:54:48', '2023-06-08 19:54:48'),
(13, 'App\\Models\\User', 18, 'Bestu', 'a8561af158c4d0c2d602f6ddbf306a6cc9946550d8170746e020af7b2923a4c1', '[\"*\"]', NULL, '2023-06-08 19:54:51', '2023-06-08 19:54:51'),
(14, 'App\\Models\\User', 18, 'Bestu', 'ff76df410e65614bff616f846fbea311475b4bce5744ee5b5a5f22b671e24713', '[\"*\"]', NULL, '2023-06-08 19:55:14', '2023-06-08 19:55:14'),
(15, 'App\\Models\\User', 18, 'Bestu', '43f2d65baf95cc9d82fa36f4651699dc6de126dad2f23fbca419347e7b90edef', '[\"*\"]', NULL, '2023-06-08 19:55:51', '2023-06-08 19:55:51'),
(16, 'App\\Models\\User', 18, 'Bestu', '19f06fd122b4dba71760a9541680c8e7e7561792b186b77b8cadb78814a4a5f1', '[\"*\"]', NULL, '2023-06-08 19:57:54', '2023-06-08 19:57:54'),
(17, 'App\\Models\\User', 18, 'Bestu', 'bd5531bdb43bf064b30a167c6722ebc85bbb3e88cb21ce07e3b5bc1cb17a368c', '[\"*\"]', NULL, '2023-06-08 19:58:47', '2023-06-08 19:58:47'),
(18, 'App\\Models\\User', 18, 'Bestu', '33d67873c7a7b0eda8d7c0a591a97b94b98dcbfde559b776f35ee3d027166d0f', '[\"*\"]', NULL, '2023-06-08 20:05:47', '2023-06-08 20:05:47'),
(19, 'App\\Models\\User', 18, 'Bestu', '7c57d2b3bfeff7d7a4d13d583d64854c9cdcaddaec0861d3d65927d8eaa3b520', '[\"*\"]', NULL, '2023-06-08 20:06:57', '2023-06-08 20:06:57'),
(20, 'App\\Models\\User', 18, 'Bestu', '7e1790eec8d2a87ff271924d797663e834cfa38b3e52771c4ff7a4a46c9d0bdd', '[\"*\"]', NULL, '2023-06-08 20:13:42', '2023-06-08 20:13:42'),
(21, 'App\\Models\\User', 18, 'Bestu', 'ea4214713acb5843782baaf05a3c890f027721fd7b256dcd82357039380a7d91', '[\"*\"]', NULL, '2023-06-08 20:23:47', '2023-06-08 20:23:47'),
(22, 'App\\Models\\User', 18, 'Bestu', '8ea4f8dfe4225a92baddbad9547a23c52e62dff35f20777369e23a4ddfed5c2a', '[\"*\"]', NULL, '2023-06-08 20:24:47', '2023-06-08 20:24:47'),
(23, 'App\\Models\\User', 23, 'Bestu', 'f4209be11c0c01efbf207488e56997d225a6d7b385c929c8f077206bb4dc5d3b', '[\"*\"]', NULL, '2023-06-18 21:29:25', '2023-06-18 21:29:25'),
(24, 'App\\Models\\User', 23, 'Bestu', '8253db1f284d762b783bb7e57158414f4c31164222a638edc9babeb560012a04', '[\"*\"]', NULL, '2023-06-18 21:29:33', '2023-06-18 21:29:33'),
(25, 'App\\Models\\User', 23, 'Bestu', '2fd8a0cc0ee16d42bc20270ccc6b9349035319db33454d2f53967e24351df873', '[\"*\"]', NULL, '2023-06-18 21:29:44', '2023-06-18 21:29:44'),
(26, 'App\\Models\\User', 23, 'Bestu', 'e386668f4ca6e9cdd0a3cc0b1c43b91f7dfaae8437f4de13242b4dbdd0881648', '[\"*\"]', NULL, '2023-06-18 21:30:23', '2023-06-18 21:30:23'),
(27, 'App\\Models\\User', 23, 'Bestu', 'e10cedd71b39ce22e490e03e1613977f8a99f2535d1901b0252c7a6ea4b98bc1', '[\"*\"]', NULL, '2023-06-18 21:31:17', '2023-06-18 21:31:17'),
(28, 'App\\Models\\User', 23, 'Bestu', '4419104d916b9024df511fab62355ed6cb029bd1528a2433466d9a1ed5df27e8', '[\"*\"]', NULL, '2023-06-18 21:31:54', '2023-06-18 21:31:54'),
(29, 'App\\Models\\User', 23, 'Bestu', 'e62b9ac2ba6e3ce9c5663139297e5282a1fba824bd22ef9f276e66db4b267594', '[\"*\"]', NULL, '2023-06-18 21:32:44', '2023-06-18 21:32:44'),
(30, 'App\\Models\\User', 23, 'Bestu', 'f56b5d5fb3d726ca1356b17bef049b5d68bf728c6d6631795a390c4045f0c629', '[\"*\"]', NULL, '2023-06-18 21:32:54', '2023-06-18 21:32:54'),
(31, 'App\\Models\\User', 23, 'Bestu', '4301777fae120764ae56bc83bf88bbb7770e093f73c11402866cb7af81a02a7f', '[\"*\"]', NULL, '2023-06-18 21:33:50', '2023-06-18 21:33:50'),
(32, 'App\\Models\\User', 23, 'Bestu', '92284818c41150bd2ff7952efc7bc170c720ec7edfce4ebeb8a95048f67e0118', '[\"*\"]', NULL, '2023-06-18 21:34:39', '2023-06-18 21:34:39'),
(33, 'App\\Models\\User', 23, 'Bestu', 'df4e210b421bb2d09a9b66e89cef2585cd4c5620496ff6ffe5aa2a9b5075c8df', '[\"*\"]', NULL, '2023-06-18 21:35:43', '2023-06-18 21:35:43'),
(34, 'App\\Models\\User', 24, 'Bestu', '7add3db393d246be2c107be08d4881aee3bc0c0bf5c1ce0bd62a0317570ddb6f', '[\"*\"]', NULL, '2023-06-18 21:54:35', '2023-06-18 21:54:35'),
(35, 'App\\Models\\User', 23, 'Bestu', 'aaa25710b743b4d4c7f1bde51616ec07e8269e5c04216e5cdc6b90d3f87c6e14', '[\"*\"]', NULL, '2023-06-18 22:04:32', '2023-06-18 22:04:32'),
(36, 'App\\Models\\User', 23, 'Bestu', 'c7ffb4340671759c337afcf49fcb1db44b69f7e09bdb8ba9f0f0c3c4b796d484', '[\"*\"]', NULL, '2023-06-18 22:06:01', '2023-06-18 22:06:01'),
(37, 'App\\Models\\User', 23, 'Bestu', '2640381431d1c92d620c3996ff686005a0e18b1224b553a345ffaf95b07348a0', '[\"*\"]', NULL, '2023-06-18 22:08:21', '2023-06-18 22:08:21'),
(38, 'App\\Models\\User', 23, 'Bestu', 'c432f5eba42713bc3652965f655bbd62e59976c6ec5768df79fb937a57015330', '[\"*\"]', NULL, '2023-06-18 22:10:08', '2023-06-18 22:10:08'),
(39, 'App\\Models\\User', 23, 'Bestu', '1277f240ee1401a5b11b077556b88391a52949dd239541e50d0cd2d603ddffef', '[\"*\"]', NULL, '2023-06-18 22:14:38', '2023-06-18 22:14:38'),
(40, 'App\\Models\\User', 23, 'Bestu', '0c957ded83f4667833cd67ce76b7f9c5b072d6174eae9b8793b0b23287719dc3', '[\"*\"]', NULL, '2023-06-18 22:16:18', '2023-06-18 22:16:18'),
(41, 'App\\Models\\User', 23, 'Bestu', '8520fd3967b15d7e1f2253848359907f2a7a0a2e9344190a0774f1c13254e7e7', '[\"*\"]', NULL, '2023-06-18 22:17:50', '2023-06-18 22:17:50'),
(42, 'App\\Models\\User', 23, 'Bestu', 'f865b089e1927e9bef8c05a3f59853c3ce8bc7c9acfe80a73e5699f2e30cccd1', '[\"*\"]', NULL, '2023-06-19 13:59:07', '2023-06-19 13:59:07'),
(43, 'App\\Models\\User', 23, 'Bestu', 'da10e56b1c3cf796a84b76d1c9c062e4e54cfd6aad49fc2f1b56d9bf080fa4ee', '[\"*\"]', NULL, '2023-06-19 14:02:08', '2023-06-19 14:02:08'),
(44, 'App\\Models\\User', 23, 'Bestu', 'cc7384c68643c474ff7703d97ca3e618c3764850f28593735aec3479a6fc7445', '[\"*\"]', NULL, '2023-06-19 14:03:48', '2023-06-19 14:03:48'),
(45, 'App\\Models\\User', 23, 'Bestu', '846ea5ce65dbd32b7aa867342aed5156f1eb16c2ccdc058351ada130f28983ac', '[\"*\"]', NULL, '2023-06-19 14:07:10', '2023-06-19 14:07:10'),
(46, 'App\\Models\\User', 23, 'Bestu', 'fa7bb0520854216b1938b286c70741532f58cb4e716b1ebb81b0ca6c75436404', '[\"*\"]', NULL, '2023-06-19 14:08:05', '2023-06-19 14:08:05'),
(47, 'App\\Models\\User', 23, 'Bestu', '054d45cfa6fd42d84bb7993eefa893f820b954bf754076fe72d92e7f5faf5eb9', '[\"*\"]', NULL, '2023-06-19 14:11:28', '2023-06-19 14:11:28'),
(48, 'App\\Models\\User', 23, 'Bestu', '217ad8f7a4f73bc87b37b8d88a023af64c8a32f3ca8d9d4c09e072582113b957', '[\"*\"]', NULL, '2023-06-19 14:33:17', '2023-06-19 14:33:17'),
(49, 'App\\Models\\User', 23, 'Bestu', 'dac6803300a6b79e3a19f98bd5755c4bc1483f377e6fc1a0568f56d1a5d26e1e', '[\"*\"]', NULL, '2023-06-19 14:54:57', '2023-06-19 14:54:57'),
(50, 'App\\Models\\User', 24, 'Bestu', 'd90608d89be0abff09b4c1c389938097e43f359c1a461f0032709a131806c10a', '[\"*\"]', NULL, '2023-06-19 15:06:27', '2023-06-19 15:06:27'),
(51, 'App\\Models\\User', 24, 'Bestu', 'e9a4e96e3610a198f15ef7777202103c888609bd8409df143483484c3ece25cb', '[\"*\"]', NULL, '2023-06-19 15:08:52', '2023-06-19 15:08:52'),
(52, 'App\\Models\\User', 23, 'Bestu', '1a92f6c240786a3b3cc1559f9720adeecd7b8c6441899c887dc5b9d4d04c5655', '[\"*\"]', NULL, '2023-06-19 15:16:29', '2023-06-19 15:16:29'),
(53, 'App\\Models\\User', 23, 'Bestu', '8095783253c2ee3a07bb2c91926889f6a759042747df463b408473b00f53fbb6', '[\"*\"]', NULL, '2023-06-19 15:19:04', '2023-06-19 15:19:04'),
(54, 'App\\Models\\User', 23, 'Bestu', '09c43bb300faf9abda040c6da21c037b93b45bf2f158a194e4f9bb9917896c19', '[\"*\"]', NULL, '2023-06-19 15:21:10', '2023-06-19 15:21:10'),
(55, 'App\\Models\\User', 23, 'Bestu', 'b23c35db3dfaad4710f7a07a2fc9a41dcdc302ebad7c7762b6b9e097a5c14829', '[\"*\"]', NULL, '2023-06-19 15:22:36', '2023-06-19 15:22:36'),
(56, 'App\\Models\\User', 23, 'Bestu', '1581ea3055d18bbc5976d8016afdc4e83a83c36d4178b0340ae8adea54a0db4b', '[\"*\"]', NULL, '2023-06-19 15:24:10', '2023-06-19 15:24:10'),
(57, 'App\\Models\\User', 23, 'Bestu', 'ba270deef5c218be745a40e98b6d0cc5887a2a4ab74bf603ab45de6c83d57b16', '[\"*\"]', NULL, '2023-06-19 15:32:54', '2023-06-19 15:32:54'),
(58, 'App\\Models\\User', 23, 'Bestu', '22eccc731f70bbb7682386cefa9eaae09ed3eafe65e760113fc1e3c994d692b9', '[\"*\"]', NULL, '2023-06-19 15:35:18', '2023-06-19 15:35:18'),
(59, 'App\\Models\\User', 23, 'Bestu', 'bbcd720a3913aaa6e99f23573d02b4300ae40a72cd9623f3d3c2cf81a6185a74', '[\"*\"]', NULL, '2023-06-19 15:39:07', '2023-06-19 15:39:07'),
(60, 'App\\Models\\User', 23, 'Bestu', '8aeac8410c45b707d13c42f71e5e47a740a9a8409c7901400d1533148ded03a0', '[\"*\"]', NULL, '2023-06-19 15:40:55', '2023-06-19 15:40:55'),
(61, 'App\\Models\\User', 23, 'Bestu', 'e8b6675ad91c8d53818066ed16e9e0a7dbc6c62cd9fef38dbfeb19d717bdb910', '[\"*\"]', NULL, '2023-06-19 15:50:38', '2023-06-19 15:50:38'),
(62, 'App\\Models\\User', 23, 'Bestu', '6430288c9f2a49bb38161102969a6a04e0cb2e87a3aa6fd71a43448b9f1c56b4', '[\"*\"]', NULL, '2023-06-19 15:50:51', '2023-06-19 15:50:51'),
(63, 'App\\Models\\User', 23, 'Bestu', 'e3f08b86b5d620388b675aa5da820ddb82042a7577d993a78e7d53eaf00d1f52', '[\"*\"]', NULL, '2023-06-19 15:51:22', '2023-06-19 15:51:22'),
(64, 'App\\Models\\User', 23, 'Bestu', '8e351426baf596a532e645d0b1ab85966a6619aca4abc1a2b7262f704824a6bd', '[\"*\"]', NULL, '2023-06-19 15:52:18', '2023-06-19 15:52:18'),
(65, 'App\\Models\\User', 23, 'Bestu', '8d6e308c028331c1f74480ae3a995fe8277b30e491b878ac327c97a47a4d0488', '[\"*\"]', NULL, '2023-06-19 15:52:37', '2023-06-19 15:52:37'),
(66, 'App\\Models\\User', 23, 'Bestu', 'e58af50c73af1eb3ad5cbebbb3b6fe27cb01103950fe3f490e7618b9cb5f91f4', '[\"*\"]', NULL, '2023-06-19 15:52:39', '2023-06-19 15:52:39'),
(67, 'App\\Models\\User', 23, 'Bestu', '67611ea4fa5eda4764a5e11d3768a526cef225a987fe2acca4e0abba6a2c9ea3', '[\"*\"]', NULL, '2023-06-19 15:52:41', '2023-06-19 15:52:41'),
(68, 'App\\Models\\User', 23, 'Bestu', '61f7616ae4c4e750310c741ae30f65c63f75f48885e0894bcdcf295d78d2ff45', '[\"*\"]', NULL, '2023-06-19 15:53:29', '2023-06-19 15:53:29'),
(69, 'App\\Models\\User', 23, 'Bestu', '7cd8ccdbbca90be96064bd09cc87252dc6622495e6e934b2811ab27d91814d21', '[\"*\"]', NULL, '2023-06-19 15:53:53', '2023-06-19 15:53:53'),
(70, 'App\\Models\\User', 23, 'Bestu', '845ac559f657c3012a1d2a9d83cec1bcedb9388dae5b0bc4dfdb0b2a82bad73c', '[\"*\"]', NULL, '2023-06-19 15:53:56', '2023-06-19 15:53:56'),
(71, 'App\\Models\\User', 23, 'Bestu', '67c7ceb45e63430aa970e719470f253d99d861104460a0ec4b59e5176b2c4cdd', '[\"*\"]', NULL, '2023-06-19 15:53:56', '2023-06-19 15:53:56'),
(72, 'App\\Models\\User', 23, 'Bestu', 'c8cd92bf76455c5c34c4ca759557723bf9c29380fc39eb0ab3142cbd785a77b0', '[\"*\"]', NULL, '2023-06-19 15:53:56', '2023-06-19 15:53:56'),
(73, 'App\\Models\\User', 23, 'Bestu', '4173abc1dcb9557a40fd4972236441f1f3dd8e53328a5e17ec351e752971f27e', '[\"*\"]', NULL, '2023-06-19 15:53:57', '2023-06-19 15:53:57'),
(74, 'App\\Models\\User', 23, 'Bestu', '374e3c64b052c2e814fbf0abcfde8cdfbf9c02061df118240da2a2307b53fb70', '[\"*\"]', NULL, '2023-06-19 15:53:57', '2023-06-19 15:53:57'),
(75, 'App\\Models\\User', 23, 'Bestu', 'cd5d9218fc22216c2ced007ec15e95e1e8d22e09241e7bfa6d91b4c4fc60291f', '[\"*\"]', NULL, '2023-06-19 15:53:57', '2023-06-19 15:53:57'),
(76, 'App\\Models\\User', 23, 'Bestu', '7036204adf51a489fdfd330a41f079e10535351e738a0f0a6aeb6635e733366b', '[\"*\"]', NULL, '2023-06-19 15:53:57', '2023-06-19 15:53:57'),
(77, 'App\\Models\\User', 23, 'Bestu', 'bccb7636c5b6c8d96423f4bf4350ce040e4209d8c91611fa89cfa3bc3f8f05f9', '[\"*\"]', NULL, '2023-06-19 15:53:57', '2023-06-19 15:53:57'),
(78, 'App\\Models\\User', 23, 'Bestu', 'b3392363a1c1d13434fa4be49031017d82a8a046a4510130f7eeddaff104a3fc', '[\"*\"]', NULL, '2023-06-19 15:53:57', '2023-06-19 15:53:57'),
(79, 'App\\Models\\User', 23, 'Bestu', 'e491a801af51b0ed2627464a52305c19f748a34ed55af88aac347761c7e751a3', '[\"*\"]', NULL, '2023-06-19 15:56:13', '2023-06-19 15:56:13'),
(80, 'App\\Models\\User', 23, 'Bestu', 'dd89e3c4194e4c55997e959ef768af2ea25206c3b806d0c0a7bf39b90cbb0027', '[\"*\"]', NULL, '2023-06-19 16:04:52', '2023-06-19 16:04:52'),
(81, 'App\\Models\\User', 23, 'Bestu', '6082a226bcf746020f6e3d0e8205de890fc998831fb45f5b9b6809a4f1f2a338', '[\"*\"]', NULL, '2023-06-19 16:18:40', '2023-06-19 16:18:40'),
(82, 'App\\Models\\User', 24, 'Bestu', 'bbb0db2cc7263f90020ff1a85a7b4711090a41a7b4a03b926fd3c11514adf3d1', '[\"*\"]', NULL, '2023-06-19 16:22:05', '2023-06-19 16:22:05'),
(83, 'App\\Models\\User', 24, 'Bestu', '69b12a5d836cbc92ea4b104b731b0729f780a3cbb266b6913fa8a9e3322522bd', '[\"*\"]', NULL, '2023-06-19 16:32:05', '2023-06-19 16:32:05'),
(84, 'App\\Models\\User', 23, 'Bestu', '2b50e4dcd6e6cc0d4c74d603e5d1e6235b4950c45769f6fe4ab86a03f99a0b1d', '[\"*\"]', NULL, '2023-06-19 16:40:32', '2023-06-19 16:40:32'),
(85, 'App\\Models\\User', 23, 'Bestu', '893f3d69d80b475b7f3a72ed35d568e47b8bb4a9f1e20bd93f36e3f06d3fa2d5', '[\"*\"]', NULL, '2023-06-19 16:47:42', '2023-06-19 16:47:42'),
(86, 'App\\Models\\User', 23, 'Bestu', 'cb3443b3fd69f036c927da52a45f62fae97494e55df338736c9ac5ca92bbd0c5', '[\"*\"]', NULL, '2023-06-19 16:58:40', '2023-06-19 16:58:40'),
(87, 'App\\Models\\User', 23, 'Bestu', '7244e134e9df592d586d94b1c31baf7bb9c4695565774a2d2b8d26bc4326cb82', '[\"*\"]', NULL, '2023-06-19 17:00:19', '2023-06-19 17:00:19'),
(88, 'App\\Models\\User', 24, 'Bestu', '306b3220a2196c768d332d50b83d525eaddc38f7a6d3d32d4d50bc4bcc0da3e6', '[\"*\"]', '2023-07-03 13:35:01', '2023-06-19 17:24:51', '2023-07-03 13:35:01'),
(89, 'App\\Models\\User', 23, 'Bestu', 'ded53eafd243aa8f9d570d849d8b8e4289f554eeb3d8686b804e2d495e692f93', '[\"*\"]', NULL, '2023-06-26 06:17:07', '2023-06-26 06:17:07'),
(90, 'App\\Models\\User', 23, 'Bestu', 'c6cf53800170f3f41b912485a4ed1fe2909da825db0ad179854325ce5dbf7fbc', '[\"*\"]', NULL, '2023-06-26 14:00:13', '2023-06-26 14:00:13'),
(91, 'App\\Models\\User', 23, 'Bestu', 'aa0e8b7d36e1fc0248856091bef017ff4df6a684338c9bf8675a5bcecabd686a', '[\"*\"]', NULL, '2023-06-26 14:24:27', '2023-06-26 14:24:27'),
(92, 'App\\Models\\User', 23, 'Bestu', '16b4e4855c53c4074af1ed4f7f975bdc8b71f323407296e41ed00d8194a4d6b7', '[\"*\"]', NULL, '2023-06-26 14:25:27', '2023-06-26 14:25:27'),
(93, 'App\\Models\\User', 23, 'Bestu', 'dbe4d751a4e5e0a3d0dacd9dabec8b12b8134979009f9e10f63cf20888db0b1b', '[\"*\"]', NULL, '2023-06-26 14:27:37', '2023-06-26 14:27:37'),
(94, 'App\\Models\\User', 23, 'Bestu', 'a128c168cfee8d7f24df9744d403006294ca72863e639122d0a0ab0ff01e2993', '[\"*\"]', NULL, '2023-06-26 14:53:31', '2023-06-26 14:53:31'),
(95, 'App\\Models\\User', 23, 'Bestu', 'c22d0a205b64c622e0e0f46ac091595a64c322862fe7b519bff16cf0be5b9fe9', '[\"*\"]', '2023-07-18 08:34:35', '2023-06-26 18:19:57', '2023-07-18 08:34:35'),
(96, 'App\\Models\\User', 23, 'Bestu', '6ee0d3f6c2fae94dae900266e382ee9935e767858bf9bf49a2cf5e63ff7d559f', '[\"*\"]', NULL, '2023-06-27 03:14:32', '2023-06-27 03:14:32'),
(97, 'App\\Models\\User', 18, 'Bestu', 'e8173e2813b159fb8bf6eb1ebcdecf20c8c278e5dc8c1fecb01fc1cfb2f459a4', '[\"*\"]', NULL, '2023-06-27 13:53:58', '2023-06-27 13:53:58'),
(98, 'App\\Models\\User', 18, 'Bestu', '61c7d7ee8f0ced8e4d20229ead419e30d7ef380d99103ecbcf558ddfb7d6ed8f', '[\"*\"]', NULL, '2023-06-27 14:04:36', '2023-06-27 14:04:36'),
(99, 'App\\Models\\User', 18, 'Bestu', 'bd9520aee3088ac9ab113bc44ca352e8fc686f891a0051c918013f32a6a1b99d', '[\"*\"]', NULL, '2023-06-27 15:24:15', '2023-06-27 15:24:15'),
(100, 'App\\Models\\User', 18, 'Bestu', 'a4f4572b85354d5d187949377a9914389e564b6705be6a191767c75cec41c342', '[\"*\"]', NULL, '2023-06-27 15:26:53', '2023-06-27 15:26:53'),
(101, 'App\\Models\\User', 19, 'Bestu', 'ae63ee8f39e12bc29bfd63f6dc7e0bacc7276d00caa2c86ad79741402368bc26', '[\"*\"]', '2023-06-27 15:34:43', '2023-06-27 15:34:18', '2023-06-27 15:34:43'),
(102, 'App\\Models\\User', 23, 'Bestu', 'ffd5e5f2b82ef12e7ff631d57b9c3c8ddb4dde78da03d5096e29e09f384e5d21', '[\"*\"]', '2023-07-11 20:52:18', '2023-07-03 13:36:41', '2023-07-11 20:52:18'),
(103, 'App\\Models\\User', 19, 'Bestu', 'be648158cca3c9f26fb6369bda0e642df65c6988726adf86c351773039558e38', '[\"*\"]', '2023-07-03 13:58:01', '2023-07-03 13:52:27', '2023-07-03 13:58:01'),
(104, 'App\\Models\\User', 20, 'Bestu', '7f19aec0c1d6ece4020982e2b62866474fbd6317a590047e1514f8e9256c95d4', '[\"*\"]', NULL, '2023-07-04 16:47:24', '2023-07-04 16:47:24'),
(105, 'App\\Models\\User', 20, 'Bestu', '7da78006daa63719d65b0417d0e1ef0891fec050f4a04a89dcebd12453ec4b50', '[\"*\"]', NULL, '2023-07-04 16:48:56', '2023-07-04 16:48:56'),
(106, 'App\\Models\\User', 20, 'Bestu', 'f13b7d89ceddc40881f6789571eb0c49b6c1d6e87f5f6c023f4db78357594dae', '[\"*\"]', NULL, '2023-07-04 21:12:19', '2023-07-04 21:12:19'),
(107, 'App\\Models\\User', 20, 'Bestu', 'de1a6cc46e62fb511fc7e393c6f7a7cfcdbadb02a0ffdba55b41b2edf2be8d1f', '[\"*\"]', NULL, '2023-07-04 22:07:23', '2023-07-04 22:07:23'),
(108, 'App\\Models\\User', 20, 'Bestu', '0c16a01034a3e24582bf44291740bfbb97f809e385dcdbcc8aeeb3b414e92c29', '[\"*\"]', NULL, '2023-07-04 22:10:25', '2023-07-04 22:10:25'),
(109, 'App\\Models\\User', 20, 'Bestu', 'b15cdde9e150b0ebe2b90442c73bd42ff5c1b07c43419f018980030f85873e7b', '[\"*\"]', NULL, '2023-07-05 15:48:56', '2023-07-05 15:48:56'),
(110, 'App\\Models\\User', 18, 'Bestu', 'fc3d9b2beac4a8e2f4270bc0a8e7c13c2cab6e853eaf7ca86dbca7f120e4a9ba', '[\"*\"]', NULL, '2023-07-05 20:35:42', '2023-07-05 20:35:42'),
(111, 'App\\Models\\User', 20, 'Bestu', 'd34de2e8c62574c060319bb2df9e944b348dc7ca34be7d13cc5d660db7897ac9', '[\"*\"]', NULL, '2023-07-05 20:58:38', '2023-07-05 20:58:38'),
(112, 'App\\Models\\User', 20, 'Bestu', '2bf52f6706fdf92420b0cecac72b3b9eee7c19f75d8478d7fe957b31da09003a', '[\"*\"]', NULL, '2023-07-05 21:05:30', '2023-07-05 21:05:30'),
(113, 'App\\Models\\User', 20, 'Bestu', 'e547ffe7e0108d0b0b73a2bb1358447c6d1fb7cc204da9713261ae9a024042b0', '[\"*\"]', NULL, '2023-07-05 21:33:34', '2023-07-05 21:33:34'),
(114, 'App\\Models\\User', 20, 'Bestu', '4eaa7edb9c23c2738bffd009ae14a4103d3ed9c63819670baf8e48dae7d339c2', '[\"*\"]', NULL, '2023-07-05 21:37:56', '2023-07-05 21:37:56'),
(115, 'App\\Models\\User', 20, 'Bestu', '52d8bbea5c2907b4f62ca83d42277105fe474994936574e555c87ee9545dfa54', '[\"*\"]', NULL, '2023-07-05 21:42:34', '2023-07-05 21:42:34'),
(116, 'App\\Models\\User', 20, 'Bestu', '0fbb704bdeee0ce27cb845c80d0d71d26b917669b046ab0dd9d647e5c39d8abf', '[\"*\"]', NULL, '2023-07-05 21:42:41', '2023-07-05 21:42:41'),
(117, 'App\\Models\\User', 20, 'Bestu', '81d5df906138c0da274bfa087265cdc1e8655e6cd4c7cade0f0b2ec73168be7c', '[\"*\"]', NULL, '2023-07-05 21:45:19', '2023-07-05 21:45:19'),
(118, 'App\\Models\\User', 20, 'Bestu', 'e4840f9cc260050c4258aa6437f2e2d73bae3e27808e3e3cef4869d342e50026', '[\"*\"]', NULL, '2023-07-05 21:46:17', '2023-07-05 21:46:17'),
(119, 'App\\Models\\User', 18, 'Bestu', 'daf519ff5744b56a2ffaaa232f6a88e5d052f22c1c0d59da806d2ae88f21db84', '[\"*\"]', '2023-07-05 21:49:39', '2023-07-05 21:48:05', '2023-07-05 21:49:39'),
(120, 'App\\Models\\User', 18, 'Bestu', 'e384154cc88cf15fcec9d91df1a7353cc4ea0a75e9f81034cc4900bddcbfc465', '[\"*\"]', NULL, '2023-07-06 16:02:02', '2023-07-06 16:02:02'),
(121, 'App\\Models\\User', 18, 'Bestu', 'd81220aebb7b6fd9b1152b977a2af29e1699bf5ec40dd1409a303995925048f5', '[\"*\"]', NULL, '2023-07-06 16:04:40', '2023-07-06 16:04:40'),
(122, 'App\\Models\\User', 18, 'Bestu', 'af7662e6a7566ad694edf5058cfeee20139d05abdab441fe20015933ad9a2a75', '[\"*\"]', '2023-07-06 16:44:22', '2023-07-06 16:39:15', '2023-07-06 16:44:22'),
(123, 'App\\Models\\User', 18, 'Bestu', '26a6ba37732e36f949810d0fad0a4f735343359011ee101125749ee37d4d6dc5', '[\"*\"]', NULL, '2023-07-06 16:53:24', '2023-07-06 16:53:24'),
(124, 'App\\Models\\User', 20, 'Bestu', 'f90891a336f78ba4b3cd3bad19555e5e88f988aa10ca1c2c2febb6c6f2df4e90', '[\"*\"]', NULL, '2023-07-06 16:58:53', '2023-07-06 16:58:53'),
(125, 'App\\Models\\User', 20, 'Bestu', 'd1819292d05a3fb4393a2db5a7d5c59b17e1d130fbea227ec9c28ba92ba34cf1', '[\"*\"]', NULL, '2023-07-06 16:59:36', '2023-07-06 16:59:36'),
(126, 'App\\Models\\User', 20, 'Bestu', '5c994199fa0e30854c0477d3e1b543cec1f8341f53094d046f34b34a884d0c45', '[\"*\"]', NULL, '2023-07-06 17:09:16', '2023-07-06 17:09:16'),
(127, 'App\\Models\\User', 23, 'Bestu', '9eabaecd8a49203371d6a02a169b2ebf87273fefa7f7730165ef794738b831f5', '[\"*\"]', '2023-07-08 16:00:28', '2023-07-06 17:11:51', '2023-07-08 16:00:28'),
(128, 'App\\Models\\User', 20, 'Bestu', '8d0443c335bc7184cd73a366634066f108324599d6a9a1f4e7c980c9005e0f73', '[\"*\"]', NULL, '2023-07-06 17:34:11', '2023-07-06 17:34:11'),
(129, 'App\\Models\\User', 20, 'Bestu', '6ba9e7c9d3be5ff95233778b935f77013529cb0c5d5aaf07833671af1900eee7', '[\"*\"]', NULL, '2023-07-06 18:22:06', '2023-07-06 18:22:06'),
(130, 'App\\Models\\User', 18, 'Bestu', '9ef754c133dce1f1f879781f6db967e084ddef57f36869ba53e36bc1e8b1d61b', '[\"*\"]', NULL, '2023-07-06 18:25:57', '2023-07-06 18:25:57'),
(131, 'App\\Models\\User', 20, 'Bestu', '39efde513cda96c6ac5d50dea186e0fbfad1a0e0f4c67a8f1cead7dcb4809dcb', '[\"*\"]', NULL, '2023-07-06 19:09:14', '2023-07-06 19:09:14'),
(132, 'App\\Models\\User', 18, 'Bestu', 'a7f748fda443795f635ff131ced30f40c0a4195427a97e87eafbe98a39b486ea', '[\"*\"]', '2023-07-06 20:23:45', '2023-07-06 19:09:57', '2023-07-06 20:23:45'),
(133, 'App\\Models\\User', 27, 'Bestu', 'e58a7992b36800d7198d8431d616f836cd51aea35c9adc7942eb05df1144a2ce', '[\"*\"]', '2023-07-06 19:25:48', '2023-07-06 19:24:19', '2023-07-06 19:25:48'),
(134, 'App\\Models\\User', 20, 'Bestu', '28722a1876f573cef709fcf78e2585024d21ab3efd55eb0410f01e11541914d9', '[\"*\"]', '2023-07-06 20:25:57', '2023-07-06 20:21:35', '2023-07-06 20:25:57'),
(135, 'App\\Models\\User', 20, 'Bestu', '69630e14ec9ce14e5b65a6b2dca005e370eabb5df1be4ef088b03e4515849b45', '[\"*\"]', '2023-07-06 21:43:15', '2023-07-06 20:27:42', '2023-07-06 21:43:15'),
(136, 'App\\Models\\User', 20, 'Bestu', '13abfbc791de70807eef30e5299652c29b70e733751960d8a105a32a25bdb6c3', '[\"*\"]', '2023-07-08 00:50:11', '2023-07-06 21:26:30', '2023-07-08 00:50:11'),
(137, 'App\\Models\\User', 20, 'Bestu', '5db7ae45d6f09446f765631444d1949a30d99fd7c61d29c08cdf0112d02523e7', '[\"*\"]', '2023-07-08 16:11:38', '2023-07-08 00:50:40', '2023-07-08 16:11:38'),
(138, 'App\\Models\\User', 20, 'Bestu', 'e2b35d0b85208878b882c7a40407b6ecb4555ee9e1976e6c85ed60e2e9a1f546', '[\"*\"]', NULL, '2023-07-08 16:30:13', '2023-07-08 16:30:13'),
(139, 'App\\Models\\User', 30, 'Bestu', 'c95028780b2d76c0e9a97de5e9f885d64dd9684dc7d8e1289079b1063dc2f84a', '[\"*\"]', '2023-07-08 17:04:14', '2023-07-08 17:02:56', '2023-07-08 17:04:14'),
(140, 'App\\Models\\User', 20, 'Bestu', '6debd1aafab60b2bc5702bc59d1259ecfe4f8bc2dcce6c4520ab3a615f33d707', '[\"*\"]', '2023-07-09 17:55:38', '2023-07-08 17:07:27', '2023-07-09 17:55:38'),
(141, 'App\\Models\\User', 13, 'Bestu', 'a78cd66096091470e218f38ae26866c61182a8796d05d210d0157a41974d2b51', '[\"*\"]', '2023-07-08 17:35:44', '2023-07-08 17:35:42', '2023-07-08 17:35:44'),
(142, 'App\\Models\\User', 18, 'Bestu', '7142a614e188af9e2d4c914bc59697458cc234db15d31f9cbd8f56f4a462a37a', '[\"*\"]', '2023-07-08 18:16:08', '2023-07-08 17:46:10', '2023-07-08 18:16:08'),
(143, 'App\\Models\\User', 20, 'Bestu', '120a70d46bd3074fd92a789cf72d8d95b021dcfe1665056f97f2eceed71c3f86', '[\"*\"]', '2023-07-08 20:51:34', '2023-07-08 18:17:27', '2023-07-08 20:51:34'),
(144, 'App\\Models\\User', 13, 'Bestu', '82393f38f3c4d8ad757b333d8bcb4b876a3900d1d0b4a8b2befa16f67d90abb0', '[\"*\"]', '2023-07-08 18:26:15', '2023-07-08 18:26:15', '2023-07-08 18:26:15'),
(145, 'App\\Models\\User', 13, 'Bestu', '35d09afa7c2fd0a815021040f3bc8eb54721d6487309113892e8235528d02dfe', '[\"*\"]', '2023-07-08 18:26:27', '2023-07-08 18:26:27', '2023-07-08 18:26:27'),
(146, 'App\\Models\\User', 13, 'Bestu', 'dfa40d76467846b69380c9cf7d442ad425ef3d587e7c00502f954966d59d5ccc', '[\"*\"]', '2023-07-08 18:27:18', '2023-07-08 18:27:18', '2023-07-08 18:27:18'),
(147, 'App\\Models\\User', 13, 'Bestu', 'cd832c675ef6cbea003af39aa13fe3ec7fbffa5ee1ecf02da4f54d459a570388', '[\"*\"]', '2023-07-08 18:27:19', '2023-07-08 18:27:18', '2023-07-08 18:27:19'),
(148, 'App\\Models\\User', 13, 'Bestu', '34746301496a476087df2e58f4090cfa7436befa34a49bb0bd8852961f56730b', '[\"*\"]', NULL, '2023-07-08 18:27:19', '2023-07-08 18:27:19'),
(149, 'App\\Models\\User', 13, 'Bestu', '3b5942ff297d8aa0bd378cd88b0ab47487ebe79b1fa9eb0263635564df2d198a', '[\"*\"]', '2023-07-08 18:27:19', '2023-07-08 18:27:19', '2023-07-08 18:27:19'),
(150, 'App\\Models\\User', 13, 'Bestu', 'f13fb3e95b89a25f35850d16d0c3757c44e187cdef1daf170943752d8b1c1133', '[\"*\"]', '2023-07-09 15:13:55', '2023-07-08 18:27:19', '2023-07-09 15:13:55'),
(151, 'App\\Models\\User', 20, 'Bestu', '213ff504cea7bbc22d21b986ba49a61db025f1501db42e41137f2111bd03a34b', '[\"*\"]', '2023-07-09 16:53:26', '2023-07-08 20:52:39', '2023-07-09 16:53:26'),
(152, 'App\\Models\\User', 27, 'Bestu', '14af12a7794d04bae82e13a99e9bfcfc341ba564bc04063a2f50aa584cabaa72', '[\"*\"]', '2023-07-08 21:28:32', '2023-07-08 21:27:58', '2023-07-08 21:28:32'),
(153, 'App\\Models\\User', 20, 'Bestu', 'f3d18e69322f17256ae509ed839eba0c83bb10b8276f2027f97a5f1ffff85c36', '[\"*\"]', '2023-07-11 01:56:33', '2023-07-09 17:31:29', '2023-07-11 01:56:33'),
(154, 'App\\Models\\User', 20, 'Bestu', '0592c0fb83cca9aaebb2397b534a383b4db740ff13a3e5770f092420e4adeb00', '[\"*\"]', '2023-07-11 01:58:12', '2023-07-11 01:56:58', '2023-07-11 01:58:12'),
(155, 'App\\Models\\User', 20, 'Bestu', '0ebb67b848d26081f8a6e6bd0204824d20902e44672030cb66798c3ab2f7ad4a', '[\"*\"]', '2023-07-11 01:59:13', '2023-07-11 01:58:45', '2023-07-11 01:59:13'),
(156, 'App\\Models\\User', 18, 'Bestu', '568a40f6577638c0bb9170ef5b0e5f8cdc7c2dcf269438f5df351ed17be1e122', '[\"*\"]', '2023-07-11 05:48:47', '2023-07-11 01:59:54', '2023-07-11 05:48:47'),
(157, 'App\\Models\\User', 20, 'Bestu', '9ae20371871acd14df1a72853c0fd8d92d4e1b7716b417ea1303c4bf23231703', '[\"*\"]', '2023-07-11 07:49:01', '2023-07-11 07:48:59', '2023-07-11 07:49:01'),
(158, 'App\\Models\\User', 20, 'Bestu', '9a034aff7102a84f1339771ff82a56e4d84a31fb1ddeeb235119237b411c1676', '[\"*\"]', '2023-07-13 03:38:20', '2023-07-11 19:22:12', '2023-07-13 03:38:20'),
(159, 'App\\Models\\User', 23, 'Bestu', '6d7c4b1a4aa003a8a7a45b4244c7c017d194f0beafd9ecc205490167371b9386', '[\"*\"]', '2023-07-12 00:10:29', '2023-07-12 00:10:29', '2023-07-12 00:10:29'),
(160, 'App\\Models\\User', 23, 'Bestu', 'a1093c195e0e5e9b8db46d32148afa5b77bacd3e1a47cd3ad80b6c83cfefa2e7', '[\"*\"]', '2023-07-12 00:12:51', '2023-07-12 00:12:51', '2023-07-12 00:12:51'),
(161, 'App\\Models\\User', 23, 'Bestu', '4213f7784d24de793364d1f3777382fda492cdcc0779c8df1e484b3cfd8f913c', '[\"*\"]', '2023-07-12 01:47:21', '2023-07-12 00:19:08', '2023-07-12 01:47:21'),
(162, 'App\\Models\\User', 32, 'Bestu', '2c70d4fdf3363ecdde7af1baa97a24e853ab6f861e6c81d4a1cdd7bc854a2e6f', '[\"*\"]', '2023-07-13 01:26:12', '2023-07-12 01:51:52', '2023-07-13 01:26:12'),
(163, 'App\\Models\\User', 20, 'Bestu', '7b7d9cd58bdfdb4a6d9a8280bbd8cab9d47dec0cc8b8ae2c3b5303b68655950a', '[\"*\"]', '2023-07-13 01:56:25', '2023-07-12 21:22:41', '2023-07-13 01:56:25'),
(164, 'App\\Models\\User', 13, 'Bestu', '3f44be61d79d8c9014ae202e4812835628018758562aaa572185e3645333f0b1', '[\"*\"]', '2023-07-13 02:41:29', '2023-07-12 21:26:03', '2023-07-13 02:41:29'),
(165, 'App\\Models\\User', 23, 'Bestu', '5777e44ffc98e071473e4252836d9f50468bcdc7a60d0ab304be36269c0980b6', '[\"*\"]', '2023-07-16 20:59:29', '2023-07-13 03:35:27', '2023-07-16 20:59:29'),
(166, 'App\\Models\\User', 20, 'Bestu', '164bde813687cee29b0136de76f9df262a46f0235b34e7e6750bce8871ba4a60', '[\"*\"]', '2023-07-13 03:49:09', '2023-07-13 03:38:44', '2023-07-13 03:49:09'),
(167, 'App\\Models\\User', 35, 'Bestu', 'bc003a77732d40b45ddd4a0b6c4759e3fc70e60b3fedad05a0718fb1895f4c61', '[\"*\"]', '2023-07-16 14:19:17', '2023-07-16 13:51:34', '2023-07-16 14:19:17'),
(168, 'App\\Models\\User', 35, 'Bestu', 'e3fd19916fc858c10954762cd22c3eded196f0f4c375e81758574c3ba6212ffb', '[\"*\"]', '2023-07-16 21:50:57', '2023-07-16 14:20:10', '2023-07-16 21:50:57'),
(169, 'App\\Models\\User', 35, 'Bestu', '1ee62e9e5607e4cf541cf1db9d91ccc15ead999ef3cdaba327fa67da180bc5c1', '[\"*\"]', '2023-07-20 05:57:29', '2023-07-17 16:45:35', '2023-07-20 05:57:29'),
(170, 'App\\Models\\User', 35, 'Bestu', '1b1a7ca2622a824fb01e37e2eb78dcc6f5228aad61f2872bf10455ba5c196076', '[\"*\"]', '2023-07-17 21:02:25', '2023-07-17 19:12:38', '2023-07-17 21:02:25'),
(171, 'App\\Models\\User', 27, 'Bestu', '5be9b5f3d61e1c6e69ebce6eef17bb598ea0a1f021d48a565f8168c6366a8c7d', '[\"*\"]', '2023-07-18 03:43:25', '2023-07-17 20:50:35', '2023-07-18 03:43:25'),
(172, 'App\\Models\\User', 35, 'Bestu', 'e188ecafaeda3f62647e89ca7c0a7f1b12a88b4d1f4cc5d3aa82285ec6a6b932', '[\"*\"]', '2023-07-17 23:29:01', '2023-07-17 23:28:50', '2023-07-17 23:29:01'),
(173, 'App\\Models\\User', 37, 'Bestu', '8699e9cda8225658ba4f0dad4473274e3fc79ad68918a8bbc626e9eacc696f4b', '[\"*\"]', '2023-07-18 10:53:48', '2023-07-18 10:52:32', '2023-07-18 10:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `childcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `multiple_images` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `specification` longtext DEFAULT NULL,
  `warrenty_policy` longtext DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `discount_price` double NOT NULL DEFAULT 0,
  `stock` double NOT NULL DEFAULT 0,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `warrenty_id` tinyint(4) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `flag_id` tinyint(4) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `has_variant` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>No Variant; 1=>Product Has variant based on Colors, Region etc.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `model_id`, `name`, `code`, `image`, `multiple_images`, `short_description`, `description`, `specification`, `warrenty_policy`, `price`, `discount_price`, `stock`, `unit_id`, `tags`, `video_url`, `warrenty_id`, `slug`, `flag_id`, `meta_title`, `meta_keywords`, `meta_description`, `status`, `has_variant`, `created_at`, `updated_at`) VALUES
(1, 1, 7, NULL, 1, NULL, 'Iphone 14 Pro Max (Test Product)', 'OFF60', 'productImages/UlNWW1689758736.jpeg', NULL, 'Iphone 14 Pro Max', '<p>Iphone 14 Pro Max</p>\r\n\r\n<p>&nbsp;</p>', '<p>Iphone 14 Pro Max</p>', '<h2>One stop for&nbsp;support</h2>\r\n\r\n<p>Minimize the amount of time without your iPhone with Express Replacement Service</p>\r\n\r\n<p>Because Apple designs iPhone, iOS, and many applications, iPhone is a truly integrated system. And only AppleCare+ products provide one-stop service and support from Apple experts, so most issues can be resolved in a single call. Should you need repair or replacement, there are convenient service options.<a href=\"https://www.apple.com/support/products/iphone/#footnote-7\">7</a></p>\r\n\r\n<ul>\r\n	<li>24/7 priority access to Apple experts via chat or phone</li>\r\n	<li>Same-day service in most major metropolitan areas world wide<a href=\"https://www.apple.com/support/products/iphone/#footnote-7\">7</a></li>\r\n	<li>Onsite service: Schedule a technician to perform a screen repair at your home or office</li>\r\n	<li><a href=\"https://support.apple.com/iphone/repair/service/express-replacement\">Express Replacement Service</a>: We&rsquo;ll ship you a replacement device so you don&rsquo;t have to wait for a repair<a href=\"https://www.apple.com/support/products/iphone/#footnote-4\">4</a></li>\r\n	<li>Mail-in repair: Mail in your iPhone using a prepaid shipping box provided by Apple</li>\r\n	<li>Carry-in repair: Take your iPhone to an Apple&nbsp;Store or other Apple Authorized Service Provider</li>\r\n</ul>', 120000, 115000, 0, 1, 'iphone,apple', 'https://www.youtube.com/watch?v=FT3ODSg1GFE&ab_channel=Apple', 1, 'iphone-14-pro-max-test-product-1689759041rLTdM', 3, NULL, NULL, NULL, 1, 1, '2023-06-14 21:07:24', '2023-07-19 09:30:41'),
(2, 1, 7, NULL, 2, 6, 'Samsung Galaxy A54 (Test Product)', '3001', 'productImages/6o22L1686813594.jpg', '[\"1686813594L1Yno.jpg\",\"16868135942SXdj.jpg\",\"16877602702SYQu.jpg\"]', 'Largely satisfied, however, I am not a fan of Samsung\'s mandatory OS updates. It was only optional before.', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', 20000, 19500, 119, 1, 'Samsung Galaxy A54,samsung galaxy a50,samsung glalaxy', NULL, 1, 'samsung-galaxy-a54-test-product-1689249650eNuS7', 3, NULL, NULL, NULL, 1, 0, '2023-06-15 17:19:54', '2023-07-17 23:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(2, 2, '1686813594L1Yno.jpg', '2023-06-15 17:19:54', NULL),
(3, 2, '16868135942SXdj.jpg', '2023-06-15 17:19:54', NULL),
(14, 2, '16877602702SYQu.jpg', '2023-06-26 16:17:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_models`
--

CREATE TABLE `product_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Inactive; 1=>Active',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_models`
--

INSERT INTO `product_models` (`id`, `brand_id`, `name`, `code`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 4, 'Z Series', 'Z-S', 1, 'HI7eR1686114027', '2023-06-07 15:00:27', NULL),
(2, 5, 'Oppo Enco Air 2 Pro Bluetooth', '1234567', 1, 'VamcF1686116991', '2023-06-07 15:49:51', NULL),
(3, 7, 'C300', '300', 1, '70cSN1686119233', '2023-06-07 16:27:13', NULL),
(4, 6, 'Motorola g82', 'MOT-G082', 1, 'hsAND1686120060', '2023-06-07 16:41:00', NULL),
(5, 6, 'Motorola g22', 'MOT-G022', 1, 'RrJk01686124675', '2023-06-07 17:57:55', NULL),
(6, 2, 'Galaxy A54', '3001', 1, 'sy1iC1686813191', '2023-06-15 17:13:11', NULL),
(7, 2, 'Bluetooth Headphone', '213213', 1, '5Xrjr1686820226', '2023-06-15 19:10:26', NULL),
(8, 2, 'bluetooth headphones', '12342', 1, 'nYk621686820313', '2023-06-15 19:11:53', NULL),
(9, 8, 'iPhone 13', 'IPO- 100513', 1, 'JpWHH1686821995', '2023-06-15 19:39:55', NULL),
(10, 10, 'Realme Air Buds 3', 'RXM-00103', 1, 'realme-air-buds-3-1689771200', '2023-06-15 20:32:42', '2023-07-19 12:53:20'),
(11, 11, 'W65S3BG', '12', 1, 'Qfa6y1687343816', '2023-06-21 20:36:56', NULL),
(12, 1, 'iphone 14 Pro Max', '14-Por-Max', 1, 'iphone-14-pro-max-1689758995', '2023-07-09 16:55:11', '2023-07-19 09:29:55'),
(13, 1, 'Calista Clay', 'Ann Walter', 1, 'IN56X1688885738', '2023-07-09 16:55:38', NULL),
(14, 12, 'Pixel', NULL, 1, 'pixel-1689478510', '2023-07-16 13:35:10', NULL),
(15, 1, 'iPhone 14', NULL, 1, 'iphone-14-1689758896', '2023-07-19 09:28:16', NULL),
(16, 1, 'iPhone 14 Pro', NULL, 1, 'iphone-14-pro-1689758908', '2023-07-19 09:28:28', NULL),
(17, 1, 'iPhone 13 Pro Max', NULL, 1, 'iphone-13-pro-max-1689758922', '2023-07-19 09:28:42', NULL),
(18, 1, 'iPhone 13 Pro', NULL, 1, 'iphone-13-pro-1689758934', '2023-07-19 09:28:54', NULL),
(19, 1, 'iPhone 13', NULL, 1, 'iphone-13-1689758944', '2023-07-19 09:29:04', NULL),
(20, 1, 'AirPods Pro', NULL, 1, 'airpods-pro-1689759070', '2023-07-19 09:31:10', NULL),
(21, 1, 'AirPods (2nd Gen)', NULL, 1, 'airpods-2nd-gen-1689759091', '2023-07-19 09:31:31', NULL),
(22, 1, 'iPhone XS Max', NULL, 1, 'iphone-xs-max-1689759119', '2023-07-19 09:31:59', NULL),
(23, 1, 'iPhone XR', NULL, 1, 'iphone-xr-1689759140', '2023-07-19 09:32:20', NULL),
(24, 1, 'iPhone 12', NULL, 1, 'iphone-12-1689762622', '2023-07-19 10:30:22', NULL),
(25, 1, 'iPhone 12 Pro', NULL, 1, 'iphone-12-pro-1689762631', '2023-07-19 10:30:31', NULL),
(26, 1, 'iPhone 12 Pro Max', NULL, 1, 'iphone-12-pro-max-1689762643', '2023-07-19 10:30:43', NULL),
(27, 12, 'Pixel 4a', NULL, 1, 'pixel-4a-1689762651', '2023-07-19 10:30:51', NULL),
(28, 12, 'Pixel 4a 5G', NULL, 1, 'pixel-4a-5g-1689762666', '2023-07-19 10:31:06', NULL),
(29, 12, 'Pixel 5a', NULL, 1, 'pixel-5a-1689762679', '2023-07-19 10:31:19', NULL),
(30, 12, 'Pixel 5', NULL, 1, 'pixel-5-1689762686', '2023-07-19 10:31:26', NULL),
(31, 12, 'Pixel 6a', NULL, 1, 'pixel-6a-1689762699', '2023-07-19 10:31:39', NULL),
(32, 12, 'Pixel 6', NULL, 1, 'pixel-6-1689762706', '2023-07-19 10:31:46', NULL),
(33, 12, 'Pixel 6 Pro', NULL, 1, 'pixel-6-pro-1689762714', '2023-07-19 10:31:54', NULL),
(34, 12, 'Pixel 6 Pro', NULL, 1, 'pixel-6-pro-1689762721', '2023-07-19 10:32:01', NULL),
(35, 12, 'Pixel 7', NULL, 1, 'pixel-7-1689762731', '2023-07-19 10:32:11', NULL),
(36, 12, 'Pixel 7 Pro', NULL, 1, 'pixel-7-pro-1689762738', '2023-07-19 10:32:18', NULL),
(37, 4, 'Infinix Note 30 Pro', NULL, 1, 'infinix-note-30-pro-1689762793', '2023-07-19 10:33:13', NULL),
(38, 4, 'Infinix Note 30', NULL, 1, 'infinix-note-30-1689762808', '2023-07-19 10:33:28', NULL),
(39, 4, 'Infinix Hot 30', NULL, 1, 'infinix-hot-30-1689762822', '2023-07-19 10:33:42', NULL),
(40, 4, 'Infinix Hot 30i', NULL, 1, 'infinix-hot-30i-1689762833', '2023-07-19 10:33:53', NULL),
(41, 4, 'Infinix Smart 7', NULL, 1, 'infinix-smart-7-1689762846', '2023-07-19 10:34:06', NULL),
(42, 4, 'Inifinix Hot 20S', NULL, 1, 'inifinix-hot-20s-1689762866', '2023-07-19 10:34:26', NULL),
(43, 4, 'Infinix Hot 20', NULL, 1, 'infinix-hot-20-1689762883', '2023-07-19 10:34:43', NULL),
(44, 4, 'Infinix Hot 20i', NULL, 1, 'infinix-hot-20i-1689762893', '2023-07-19 10:34:53', NULL),
(45, 4, 'Infinix Note 12 (2023)', NULL, 1, 'infinix-note-12-2023-1689763118', '2023-07-19 10:38:38', NULL),
(46, 4, 'Infinix Smart 6 HD', NULL, 1, 'infinix-smart-6-hd-1689763149', '2023-07-19 10:39:09', NULL),
(47, 12, 'Infinix Hot 12 Play', NULL, 1, 'infinix-hot-12-play-1689763161', '2023-07-19 10:39:21', NULL),
(48, 4, 'Infinix Note 12 (G96)', NULL, 1, 'infinix-note-12-g96-1689763181', '2023-07-19 10:39:41', NULL),
(49, 1, 'iPad Pro 12.9 (2022)', NULL, 1, 'ipad-pro-129-2022-1689763213', '2023-07-19 10:40:13', NULL),
(50, 1, 'iPad Pro 11 (2022)', NULL, 1, 'ipad-pro-11-2022-1689763226', '2023-07-19 10:40:26', NULL),
(51, 1, 'Apple Watch Ultra', NULL, 1, 'apple-watch-ultra-1689763235', '2023-07-19 10:40:35', NULL),
(52, 1, 'iPhone 14 Plus', NULL, 1, 'iphone-14-plus-1689763251', '2023-07-19 10:40:51', NULL),
(53, 1, 'iPhone SE (2022)', NULL, 1, 'iphone-se-2022-1689763270', '2023-07-19 10:41:10', NULL),
(54, 1, 'iPhone 13 Mini', NULL, 1, 'iphone-13-mini-1689763279', '2023-07-19 10:41:19', NULL),
(55, 2, 'Samsung Galaxy Z Fold 5', NULL, 1, 'samsung-galaxy-z-fold-5-1689763316', '2023-07-19 10:41:56', NULL),
(56, 2, 'Samsung Galaxy Z Flip5', NULL, 1, 'samsung-galaxy-z-flip5-1689763332', '2023-07-19 10:42:12', NULL),
(57, 2, 'Samsung Galaxy A14 5G', NULL, 1, 'samsung-galaxy-a14-5g-1689763350', '2023-07-19 10:42:30', NULL),
(58, 2, 'Samsung Galaxy A34 5G', NULL, 1, 'samsung-galaxy-a34-5g-1689763361', '2023-07-19 10:42:41', NULL),
(59, 2, 'Samsung Galaxy A54 5G', NULL, 1, 'samsung-galaxy-a54-5g-1689763375', '2023-07-19 10:42:55', NULL),
(60, 2, 'Samsung Galaxy A04 e', NULL, 1, 'samsung-galaxy-a04-e-1689763393', '2023-07-19 10:43:13', NULL),
(61, 2, 'Samsung Galaxy S23 Ultra', NULL, 1, 'samsung-galaxy-s23-ultra-1689763410', '2023-07-19 10:43:30', NULL),
(62, 2, 'Samsung Galaxy S23', NULL, 1, 'samsung-galaxy-s23-1689763416', '2023-07-19 10:43:36', NULL),
(63, 2, 'Samsung Galaxy S22 Ultra', NULL, 1, 'samsung-galaxy-s22-ultra-1689763423', '2023-07-19 10:43:43', NULL),
(64, 2, 'Samsung Galaxy S22', NULL, 1, 'samsung-galaxy-s22-1689770351', '2023-07-19 10:43:53', '2023-07-19 12:39:11'),
(65, 2, 'Samsung Galaxy A04', NULL, 1, 'samsung-galaxy-a04-1689763447', '2023-07-19 10:44:07', NULL),
(66, 2, 'Samsung Galaxy A04s', NULL, 1, 'samsung-galaxy-a04s-1689763462', '2023-07-19 10:44:22', NULL),
(67, 2, 'Samsung Galaxy Watch 5', NULL, 1, 'samsung-galaxy-watch-5-1689763475', '2023-07-19 10:44:35', NULL),
(68, 2, 'Samsung Galaxy Z Fold4', NULL, 1, 'samsung-galaxy-z-fold4-1689763489', '2023-07-19 10:44:49', NULL),
(69, 2, 'Samsung Galaxy F13', NULL, 1, 'samsung-galaxy-f13-1689763509', '2023-07-19 10:45:09', NULL),
(70, 2, 'Samsung Galaxy Z Flip4', NULL, 1, 'samsung-galaxy-z-flip4-1689771177', '2023-07-19 10:45:22', '2023-07-19 12:52:57'),
(71, 2, 'Samsung Galaxy M53 5G', NULL, 1, 'samsung-galaxy-m53-5g-1689763545', '2023-07-19 10:45:45', NULL),
(72, 2, 'Samsung Galaxy A33 5G', NULL, 1, 'samsung-galaxy-a33-5g-1689763562', '2023-07-19 10:46:02', NULL),
(73, 2, 'Samsung Galaxy A 73  5G', NULL, 1, 'samsung-galaxy-a-73-5g-1689763582', '2023-07-19 10:46:22', NULL),
(74, 2, 'Samsung Galaxy F23 5G', NULL, 1, 'samsung-galaxy-f23-5g-1689763599', '2023-07-19 10:46:39', NULL),
(75, 2, 'Samsung Galaxy A13', NULL, 1, 'samsung-galaxy-a13-1689763610', '2023-07-19 10:46:50', NULL),
(76, 2, 'Samsung Galaxy A53 5G', NULL, 1, 'samsung-galaxy-a53-5g-1689763686', '2023-07-19 10:48:06', NULL),
(77, 2, 'Samsung Galaxy A33 5G', NULL, 1, 'samsung-galaxy-a33-5g-1689771173', '2023-07-19 10:48:15', '2023-07-19 12:52:53'),
(78, 2, 'Samsung Galaxy A03', NULL, 1, 'samsung-galaxy-a03-1689763705', '2023-07-19 10:48:25', NULL),
(79, 2, 'Samsung Galaxy S22+', NULL, 1, 'samsung-galaxy-s22-1689771169', '2023-07-19 10:48:33', '2023-07-19 12:52:49'),
(80, 2, 'Samsung Galaxy A03 Core', NULL, 1, 'samsung-galaxy-a03-core-1689763721', '2023-07-19 10:48:41', NULL),
(81, 2, 'Samsung Galaxy S21 FE 5G', NULL, 1, 'samsung-galaxy-s21-fe-5g-1689763730', '2023-07-19 10:48:50', NULL),
(82, 2, 'Samsung Galaxy A03s', NULL, 1, 'samsung-galaxy-a03s-1689763740', '2023-07-19 10:49:00', NULL),
(83, 2, 'Samsung Galaxy A52s 5G', NULL, 1, 'samsung-galaxy-a52s-5g-1689763746', '2023-07-19 10:49:06', NULL),
(84, 2, 'Samsung Galaxy F22', NULL, 1, 'samsung-galaxy-f22-1689771162', '2023-07-19 10:49:12', '2023-07-19 12:52:42'),
(85, 2, 'Samsung Galaxy A72', NULL, 1, 'samsung-galaxy-a72-1689763758', '2023-07-19 10:49:18', NULL),
(86, 2, 'Samsung Galaxy A52', NULL, 1, 'samsung-galaxy-a52-1689763767', '2023-07-19 10:49:27', NULL),
(87, 2, 'Samsung Galaxy M12', NULL, 1, 'samsung-galaxy-m12-1689763774', '2023-07-19 10:49:34', NULL),
(88, 2, 'Samsung Galaxy Z Fold3 5G', NULL, 1, 'samsung-galaxy-z-fold3-5g-1689763784', '2023-07-19 10:49:44', NULL),
(89, 2, 'Samsung Galaxy Z Flip3 5G', NULL, 1, 'samsung-galaxy-z-flip3-5g-1689763789', '2023-07-19 10:49:49', NULL),
(90, 2, 'Samsung Galaxy M32', NULL, 1, 'samsung-galaxy-m32-1689763795', '2023-07-19 10:49:55', NULL),
(91, 2, 'Samsung Galaxy A22', NULL, 1, 'samsung-galaxy-a22-1689770072', '2023-07-19 10:50:00', '2023-07-19 12:34:32'),
(92, 2, 'Samsung Galaxy A12', NULL, 1, 'samsung-galaxy-a12-1689763808', '2023-07-19 10:50:08', NULL),
(93, 2, 'Samsung Galaxy S21 Ultra', NULL, 1, 'samsung-galaxy-s21-ultra-1689763814', '2023-07-19 10:50:14', NULL),
(94, 2, 'Samsung Galaxy A32', NULL, 1, 'samsung-galaxy-a32-1689770082', '2023-07-19 10:50:20', '2023-07-19 12:34:42'),
(95, 1, 'Apple iPhone 12 Mini', NULL, 1, 'apple-iphone-12-mini-1689763855', '2023-07-19 10:50:55', NULL),
(96, 1, 'Apple iPhone SE 2020', NULL, 1, 'apple-iphone-se-2020-1689763861', '2023-07-19 10:51:01', NULL),
(97, 1, 'Apple iPhone 11', NULL, 1, 'apple-iphone-11-1689763867', '2023-07-19 10:51:07', NULL),
(98, 1, 'Apple iPhone 11 Pro', NULL, 1, 'apple-iphone-11-pro-1689763872', '2023-07-19 10:51:12', NULL),
(99, 1, 'Apple iPhone XS', NULL, 1, 'apple-iphone-xs-1689763883', '2023-07-19 10:51:23', NULL),
(100, 1, 'Apple iPhone X', NULL, 1, 'apple-iphone-x-1689763889', '2023-07-19 10:51:29', NULL),
(101, 5, 'Oppo Reno8 T', NULL, 1, 'oppo-reno8-t-1689763914', '2023-07-19 10:51:54', NULL),
(102, 5, 'Oppo A77', NULL, 1, 'oppo-a77-1689763922', '2023-07-19 10:52:02', NULL),
(103, 5, 'Oppo A77s', NULL, 1, 'oppo-a77s-1689763928', '2023-07-19 10:52:08', NULL),
(104, 5, 'Oppo A17K', NULL, 1, 'oppo-a17k-1689763939', '2023-07-19 10:52:19', NULL),
(105, 5, 'Oppo A17', NULL, 1, 'oppo-a17-1689763945', '2023-07-19 10:52:25', NULL),
(106, 5, 'Oppo F21s Pro', NULL, 1, 'oppo-f21s-pro-1689763952', '2023-07-19 10:52:32', NULL),
(107, 5, 'Oppo A57 4G', NULL, 1, 'oppo-a57-4g-1689763958', '2023-07-19 10:52:38', NULL),
(108, 5, 'Oppo F21 Pro 5G', NULL, 1, 'oppo-f21-pro-5g-1689763964', '2023-07-19 10:52:44', NULL),
(109, 5, 'Oppo A16e', NULL, 1, 'oppo-a16e-1689763971', '2023-07-19 10:52:51', NULL),
(110, 5, 'Oppo F21 Pro', NULL, 1, 'oppo-f21-pro-1689763976', '2023-07-19 10:52:56', NULL),
(111, 5, 'Oppo A76', NULL, 1, 'oppo-a76-1689763982', '2023-07-19 10:53:02', NULL),
(112, 5, 'Oppo A95', NULL, 1, 'oppo-a95-1689763997', '2023-07-19 10:53:17', NULL),
(113, 5, 'Oppo Reno6', NULL, 1, 'oppo-reno6-1689764003', '2023-07-19 10:53:23', NULL),
(114, 5, 'Oppo A54', NULL, 1, 'oppo-a54-1689764010', '2023-07-19 10:53:30', NULL),
(115, 4, 'Oppo A16', NULL, 1, 'oppo-a16-1689764015', '2023-07-19 10:53:35', NULL),
(116, 5, 'Oppo F19', NULL, 1, 'oppo-f19-1689764021', '2023-07-19 10:53:41', NULL),
(117, 5, 'Oppo F19 Pro', NULL, 1, 'oppo-f19-pro-1689764026', '2023-07-19 10:53:46', NULL),
(118, 5, 'Oppo A15s', NULL, 1, 'oppo-a15s-1689764032', '2023-07-19 10:53:52', NULL),
(119, 5, 'Oppo Reno5', NULL, 1, 'oppo-reno5-1689764037', '2023-07-19 10:53:57', NULL),
(120, 5, 'Oppo A53', NULL, 1, 'oppo-a53-1689764042', '2023-07-19 10:54:02', NULL),
(121, 5, 'Oppo A15', NULL, 1, 'oppo-a15-1689764047', '2023-07-19 10:54:07', NULL),
(122, 10, 'Realme C30s', NULL, 1, 'realme-c30s-1689764094', '2023-07-19 10:54:54', NULL),
(123, 10, 'Realme C55', NULL, 1, 'realme-c55-1689764101', '2023-07-19 10:55:01', NULL),
(124, 10, 'Realme C33', NULL, 1, 'realme-c33-1689764110', '2023-07-19 10:55:10', NULL),
(125, 10, 'Realme C30', NULL, 1, 'realme-c30-1689770604', '2023-07-19 10:55:16', '2023-07-19 12:43:24'),
(126, 10, 'Realme 9 Pro+', NULL, 1, 'realme-9-pro-1689764130', '2023-07-19 10:55:30', NULL),
(127, 10, 'Realme 9 Pro', NULL, 1, 'realme-9-pro-1689764137', '2023-07-19 10:55:37', NULL),
(128, 10, 'Realme Narzo 50A Prime', NULL, 1, 'realme-narzo-50a-prime-1689764146', '2023-07-19 10:55:46', NULL),
(129, 10, 'Realme 9', NULL, 1, 'realme-9-1689764157', '2023-07-19 10:55:57', NULL),
(130, 10, 'Realme C35', NULL, 1, 'realme-c35-1689764163', '2023-07-19 10:56:03', NULL),
(131, 10, 'Realme C31', NULL, 1, 'realme-c31-1689764168', '2023-07-19 10:56:08', NULL),
(132, 10, 'Realme Narzo 50', NULL, 1, 'realme-narzo-50-1689764175', '2023-07-19 10:56:15', NULL),
(133, 10, 'Realme 9i', NULL, 1, 'realme-9i-1689764180', '2023-07-19 10:56:20', NULL),
(134, 10, 'Realme GT Neo2', NULL, 1, 'realme-gt-neo2-1689764188', '2023-07-19 10:56:28', NULL),
(135, 10, 'Realme Narzo 50i', NULL, 1, 'realme-narzo-50i-1689764196', '2023-07-19 10:56:36', NULL),
(136, 10, 'Realme C25Y', NULL, 1, 'realme-c25y-1689764204', '2023-07-19 10:56:44', NULL),
(137, 10, 'Realme C21Y', NULL, 1, 'realme-c21y-1689764210', '2023-07-19 10:56:50', NULL),
(138, 10, 'Realme C11 2021', NULL, 1, 'realme-c11-2021-1689764216', '2023-07-19 10:56:56', NULL),
(139, 10, 'Realme GT Master Edition', NULL, 1, 'realme-gt-master-edition-1689764223', '2023-07-19 10:57:03', NULL),
(140, 3, 'Xiaomi Redmi 12C', NULL, 1, 'xiaomi-redmi-12c-1689764625', '2023-07-19 11:03:45', NULL),
(141, 3, 'Xiaomi Redmi Note 12', NULL, 1, 'xiaomi-redmi-note-12-1689764670', '2023-07-19 11:04:30', NULL),
(142, 11, 'Xiaomi Redmi A1+', NULL, 1, 'xiaomi-redmi-a1-1689764679', '2023-07-19 11:04:39', NULL),
(143, 3, 'Xiaomi Redmi A1', NULL, 1, 'xiaomi-redmi-a1-1689764682', '2023-07-19 11:04:42', NULL),
(144, 3, 'Xiaomi 12 Pro', NULL, 1, 'xiaomi-12-pro-1689764691', '2023-07-19 11:04:51', NULL),
(145, 11, 'Xiaomi Redmi 10A', NULL, 1, 'xiaomi-redmi-10a-1689764700', '2023-07-19 11:05:00', NULL),
(146, 11, 'Xiaomi Redmi 10C', NULL, 1, 'xiaomi-redmi-10c-1689764704', '2023-07-19 11:05:04', NULL),
(147, 3, 'Xiaomi Redmi Note 11S', NULL, 1, 'xiaomi-redmi-note-11s-1689764714', '2023-07-19 11:05:14', NULL),
(148, 3, 'Xiaomi 11i Hypercharge 5G', NULL, 1, 'xiaomi-11i-hypercharge-5g-1689764726', '2023-07-19 11:05:26', NULL),
(149, 3, 'Xiaomi Redmi Note 11', NULL, 1, 'xiaomi-redmi-note-11-1689764733', '2023-07-19 11:05:33', NULL),
(150, 3, 'Xiaomi Redmi 10 2022', NULL, 1, 'xiaomi-redmi-10-2022-1689764738', '2023-07-19 11:05:38', NULL),
(151, 3, 'Xiaomi Poco C31', NULL, 1, 'xiaomi-poco-c31-1689764747', '2023-07-19 11:05:47', NULL),
(152, 11, 'Xiaomi 11T', NULL, 1, 'xiaomi-11t-1689764753', '2023-07-19 11:05:53', NULL),
(153, 3, 'Xiaomi Redmi 9A', NULL, 1, 'xiaomi-redmi-9a-1689764759', '2023-07-19 11:05:59', NULL),
(154, 3, 'Xiaomi Redmi Note 10 Pro', NULL, 1, 'xiaomi-redmi-note-10-pro-1689764767', '2023-07-19 11:06:07', NULL),
(155, 3, 'Xiaomi Poco M3 Pro 5G', NULL, 1, 'xiaomi-poco-m3-pro-5g-1689764775', '2023-07-19 11:06:15', NULL),
(156, 3, 'Xiaomi Redmi 9 Active', NULL, 1, 'xiaomi-redmi-9-active-1689764786', '2023-07-19 11:06:26', NULL),
(157, 11, 'Xiaomi 11T Pro', NULL, 1, 'xiaomi-11t-pro-1689764792', '2023-07-19 11:06:32', NULL),
(158, 3, 'Xiaomi Redmi 10 Prime', NULL, 1, 'xiaomi-redmi-10-prime-1689764798', '2023-07-19 11:06:38', NULL),
(159, 3, 'Xiaomi 11 Lite 5G NE', NULL, 1, 'xiaomi-11-lite-5g-ne-1689764818', '2023-07-19 11:06:58', NULL),
(160, 11, 'Xiaomi Redmi 10', NULL, 1, 'xiaomi-redmi-10-1689764825', '2023-07-19 11:07:05', NULL),
(161, 3, 'Xiaomi Redmi Note 10 Pro Max', NULL, 1, 'xiaomi-redmi-note-10-pro-max-1689764890', '2023-07-19 11:08:10', NULL),
(162, 11, 'Xiaomi Redmi Note 10S', NULL, 1, 'xiaomi-redmi-note-10s-1689764896', '2023-07-19 11:08:16', NULL),
(163, 11, 'Xiaomi Poco X3 Pro', NULL, 1, 'xiaomi-poco-x3-pro-1689764902', '2023-07-19 11:08:22', NULL),
(164, 3, 'Xiaomi Poco M3', NULL, 1, 'xiaomi-poco-m3-1689764928', '2023-07-19 11:08:48', NULL),
(165, 11, 'Xiaomi Poco M2 Reloaded', NULL, 1, 'xiaomi-poco-m2-reloaded-1689764935', '2023-07-19 11:08:55', NULL),
(166, 3, 'Xiaomi Mi 11X 5G', NULL, 1, 'xiaomi-mi-11x-5g-1689764942', '2023-07-19 11:09:02', NULL),
(167, 3, 'Xiaomi Redmi 9 Dual Camera', NULL, 1, 'xiaomi-redmi-9-dual-camera-1689764948', '2023-07-19 11:09:08', NULL),
(168, 3, 'Xiaomi Redmi 9C', NULL, 1, 'xiaomi-redmi-9c-1689764953', '2023-07-19 11:09:13', NULL),
(169, 3, 'Xiaomi Redmi Note 8 2021', NULL, 1, 'xiaomi-redmi-note-8-2021-1689764959', '2023-07-19 11:09:19', NULL),
(170, 3, 'Xiaomi Redmi 9 Power', NULL, 1, 'xiaomi-redmi-9-power-1689764966', '2023-07-19 11:09:26', NULL),
(171, 3, 'Xiaomi Mi 11 Lite', NULL, 1, 'xiaomi-mi-11-lite-1689764971', '2023-07-19 11:09:31', NULL),
(172, 11, 'Xiaomi Redmi Note 10', NULL, 1, 'xiaomi-redmi-note-10-1689764979', '2023-07-19 11:09:39', NULL),
(173, 3, 'Xiaomi Redmi 9T', NULL, 1, 'xiaomi-redmi-9t-1689764984', '2023-07-19 11:09:44', NULL),
(174, 13, 'Vivo Y36', NULL, 1, 'vivo-y36-1689765286', '2023-07-19 11:14:46', NULL),
(175, 13, 'Vivo V27e', NULL, 1, 'vivo-v27e-1689765297', '2023-07-19 11:14:57', NULL),
(176, 13, 'Vivo V27 5G', NULL, 1, 'vivo-v27-5g-1689765395', '2023-07-19 11:16:35', NULL),
(177, 13, 'Vivo Y22', NULL, 1, 'vivo-y22-1689765404', '2023-07-19 11:16:44', NULL),
(178, 13, 'Vivo Y02a', NULL, 1, 'vivo-y02a-1689765417', '2023-07-19 11:16:57', NULL),
(179, 13, 'Vivo Y16', NULL, 1, 'vivo-y16-1689765423', '2023-07-19 11:17:03', NULL),
(180, 13, 'Vivo Y02', NULL, 1, 'vivo-y02-1689765430', '2023-07-19 11:17:10', NULL),
(181, 13, 'Vivo Y02s', NULL, 1, 'vivo-y02s-1689765440', '2023-07-19 11:17:20', NULL),
(182, 13, 'Vivo Y22s', NULL, 1, 'vivo-y22s-1689765446', '2023-07-19 11:17:26', NULL),
(183, 13, 'Vivo V25 5G', NULL, 1, 'vivo-v25-5g-1689765453', '2023-07-19 11:17:33', NULL),
(184, 13, 'Vivo V25e', NULL, 1, 'vivo-v25e-1689765458', '2023-07-19 11:17:38', NULL),
(185, 13, 'Vivo X80 5G', NULL, 1, 'vivo-x80-5g-1689765464', '2023-07-19 11:17:44', NULL),
(186, 13, 'Vivo Y01', NULL, 1, 'vivo-y01-1689765470', '2023-07-19 11:17:50', NULL),
(187, 13, 'Vivo Y33s', NULL, 1, 'vivo-y33s-1689765476', '2023-07-19 11:17:56', NULL),
(188, 13, 'Vivo Y21T', NULL, 1, 'vivo-y21t-1689765482', '2023-07-19 11:18:02', NULL),
(189, 13, 'Vivo V23e', NULL, 1, 'vivo-v23e-1689765490', '2023-07-19 11:18:10', NULL),
(190, 13, 'Vivo V23 5G', NULL, 1, 'vivo-v23-5g-1689765496', '2023-07-19 11:18:16', NULL),
(191, 14, 'Tecno Camon 20 Pro', NULL, 1, 'tecno-camon-20-pro-1689765512', '2023-07-19 11:18:32', NULL),
(192, 14, 'Tecno Spark 10C', NULL, 1, 'tecno-spark-10c-1689765524', '2023-07-19 11:18:44', NULL),
(193, 14, 'Tecno Pop 7', NULL, 1, 'tecno-pop-7-1689765533', '2023-07-19 11:18:53', NULL),
(194, 14, 'Tecno Spark 10 Pro', NULL, 1, 'tecno-spark-10-pro-1689765539', '2023-07-19 11:18:59', NULL),
(195, 14, 'Tecno Spark Go 2023', NULL, 1, 'tecno-spark-go-2023-1689765546', '2023-07-19 11:19:06', NULL),
(196, 14, 'Tecno Pova 4 Pro', NULL, 1, 'tecno-pova-4-pro-1689765554', '2023-07-19 11:19:14', NULL),
(197, 14, 'Tecno Pova 4', NULL, 1, 'tecno-pova-4-1689765560', '2023-07-19 11:19:20', NULL),
(198, 14, 'Tecno Pova Neo 2', NULL, 1, 'tecno-pova-neo-2-1689765566', '2023-07-19 11:19:26', NULL),
(199, 14, 'Tecno Pop 6 Pro', NULL, 1, 'tecno-pop-6-pro-1689765573', '2023-07-19 11:19:33', NULL),
(200, 14, 'Tecno Spark 9T', NULL, 1, 'tecno-spark-9t-1689765579', '2023-07-19 11:19:39', NULL),
(201, 14, 'Tecno Camon 19 Neo', NULL, 1, 'tecno-camon-19-neo-1689770061', '2023-07-19 11:19:44', '2023-07-19 12:34:21'),
(202, 15, 'OnePlus Nord CE 3 Lite 5G', NULL, 1, 'oneplus-nord-ce-3-lite-5g-1689765608', '2023-07-19 11:20:08', NULL),
(203, 15, 'OnePlus 11 5G', NULL, 1, 'oneplus-11-5g-1689765619', '2023-07-19 11:20:19', NULL),
(204, 15, 'OnePlus Nord 2T 5G', NULL, 1, 'oneplus-nord-2t-5g-1689765627', '2023-07-19 11:20:27', NULL),
(205, 15, 'OnePlus Nord N20 SE', NULL, 1, 'oneplus-nord-n20-se-1689765633', '2023-07-19 11:20:33', NULL),
(206, 15, 'OnePlus Nord CE 2 Lite 5G', NULL, 1, 'oneplus-nord-ce-2-lite-5g-1689765640', '2023-07-19 11:20:40', NULL),
(207, 15, 'OnePlus 10 Pro 5G', NULL, 1, 'oneplus-10-pro-5g-1689765668', '2023-07-19 11:20:45', '2023-07-19 11:21:08'),
(208, 15, 'OnePlus Nord CE 2 5G', NULL, 1, 'oneplus-nord-ce-2-5g-1689770815', '2023-07-19 11:21:17', '2023-07-19 12:46:55'),
(209, 15, 'OnePlus Nord 2 5G', NULL, 1, 'oneplus-nord-2-5g-1689765683', '2023-07-19 11:21:23', NULL),
(210, 15, 'OnePlus Nord CE 5G', NULL, 1, 'oneplus-nord-ce-5g-1689765689', '2023-07-19 11:21:29', NULL),
(211, 15, 'OnePlus Nord N100', NULL, 1, 'oneplus-nord-n100-1689765693', '2023-07-19 11:21:33', NULL),
(212, 15, 'OnePlus Nord N10 5G', NULL, 1, 'oneplus-nord-n10-5g-1689765700', '2023-07-19 11:21:40', NULL),
(213, 15, 'OnePlus Nord', NULL, 1, 'oneplus-nord-1689765705', '2023-07-19 11:21:45', NULL),
(214, 15, 'OnePlus 8T', NULL, 1, 'oneplus-8t-1689765716', '2023-07-19 11:21:56', NULL),
(215, 15, 'OnePlus 8T', NULL, 0, 'oneplus-8t-1689770895', '2023-07-19 11:22:01', '2023-07-19 12:48:15'),
(216, 15, 'OnePlus 8T', NULL, 0, 'oneplus-8t-1689770890', '2023-07-19 11:22:10', '2023-07-19 12:48:10'),
(217, 17, 'OnePlus 8T', NULL, 0, 'oneplus-8t-1689770868', '2023-07-19 11:22:15', '2023-07-19 12:47:48'),
(218, 16, 'Motorola Moto E32', NULL, 1, 'motorola-moto-e32-1689765752', '2023-07-19 11:22:32', NULL),
(219, 16, 'Motorola Moto E32', NULL, 1, 'motorola-moto-e32-1689765758', '2023-07-19 11:22:38', NULL),
(220, 16, 'Motorola Moto E32', NULL, 1, 'motorola-moto-e32-1689765771', '2023-07-19 11:22:51', NULL),
(221, 16, 'Motorola Moto E32', NULL, 1, 'motorola-moto-e32-1689765778', '2023-07-19 11:22:58', NULL),
(222, 16, 'Motorola Edge 20 Fusion', NULL, 1, 'motorola-edge-20-fusion-1689765786', '2023-07-19 11:23:06', NULL),
(223, 16, 'Motorola Moto G31', NULL, 1, 'motorola-moto-g31-1689765794', '2023-07-19 11:23:14', NULL),
(224, 16, 'Motorola Moto E40', NULL, 1, 'motorola-moto-e40-1689765806', '2023-07-19 11:23:26', NULL),
(225, 16, 'Motorola Moto E7 Power', NULL, 1, 'motorola-moto-e7-power-1689765815', '2023-07-19 11:23:35', NULL),
(226, 16, 'Motorola Moto G60', NULL, 1, 'motorola-moto-g60-1689765821', '2023-07-19 11:23:41', NULL),
(227, 16, 'Motorola Moto G40 Fusion', NULL, 1, 'motorola-moto-g40-fusion-1689765830', '2023-07-19 11:23:50', NULL),
(228, 16, 'Motorola Moto G10 Power', NULL, 1, 'motorola-moto-g10-power-1689765836', '2023-07-19 11:23:56', NULL),
(229, 16, 'Motorola Moto G30', NULL, 1, 'motorola-moto-g30-1689765844', '2023-07-19 11:24:04', NULL),
(230, 1, 'iPhone 11', NULL, 1, 'iphone-11-1689769433', '2023-07-19 12:23:53', NULL),
(231, 1, 'iPhone 11 Pro', NULL, 1, 'iphone-11-pro-1689769451', '2023-07-19 12:24:11', NULL),
(232, 1, 'iPhone 11 Pro Max', NULL, 1, 'iphone-11-pro-max-1689769459', '2023-07-19 12:24:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_question_answers`
--

CREATE TABLE `product_question_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_question_answers`
--

INSERT INTO `product_question_answers` (`id`, `product_id`, `full_name`, `email`, `question`, `answer`, `slug`, `created_at`, `updated_at`) VALUES
(10, 1, 'Fahim', 'alif@gmail.com', 'What is the specs ?', '4/64', '21321213QWQRRSDS', '2023-07-16 21:09:49', NULL),
(11, 1, 'Fahim', 'alif@gmail.com', 'What is the specs ?', '4/64', '21321213QWQRRSDS', '2023-07-16 21:09:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `review` longtext DEFAULT NULL,
  `reply` longtext DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Pending; 1=>Approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `rating`, `review`, `reply`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 'A review is an evaluation of a publication, product, service, or company or a critical take on current affairs in literature, politics or culture. In addition to a critical evaluation, the review\'s author may assign the work a rating to indicate its relative meri', 'Thank You so much vaia', '123213UYTUYT', 1, '2023-06-07 13:39:11', '2023-07-04 21:56:10'),
(2, 1, 1, 4, 'A review is an evaluation of a publication, product, service, or company or a critical take on current affairs in literature, politics or culture. In addition to a critical evaluation, the review\'s author may assign the work a rating to indicate its relative meri', 'Testing...', '123213UYTUYT', 1, '2023-06-07 13:39:11', '2023-06-11 06:29:12'),
(3, 1, 13, 5, 'dasdassad', 'asdasdsassad', '16891634796LEKY', 1, '2023-07-12 22:04:39', '2023-07-12 22:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sim_id` bigint(20) UNSIGNED DEFAULT NULL,
  `storage_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `discounted_price` double NOT NULL DEFAULT 0,
  `warrenty_id` tinyint(4) DEFAULT NULL,
  `device_condition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `image`, `color_id`, `region_id`, `sim_id`, `storage_type_id`, `stock`, `price`, `discounted_price`, `warrenty_id`, `device_condition_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1686740844EwewL.jpg', 5, 226, 2, 2, 100, 120000, 115000, 1, 1, '2023-06-14 21:07:24', '2023-07-19 09:30:41'),
(2, 1, '1686740844HXKdN.jpg', 1, 226, 4, 2, 50, 110000, 105000, 1, 1, '2023-06-14 21:07:24', '2023-07-19 09:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_warrenties`
--

CREATE TABLE `product_warrenties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warrenties`
--

INSERT INTO `product_warrenties` (`id`, `name`, `serial`, `created_at`, `updated_at`) VALUES
(1, '1 Year Replacement Warrenty', 3, '2023-06-05 09:51:41', '2023-07-10 22:44:53'),
(2, '2 Years Service Warrenty', 5, '2023-06-05 09:52:00', '2023-07-10 22:44:53'),
(3, '1 Yr Replacement & 2 Yr Service Warrenty', 4, '2023-06-05 09:52:26', '2023-07-10 22:44:53'),
(7, '10 Days Replacement Guarentee', 1, '2023-06-07 17:16:37', '2023-07-16 21:53:37'),
(8, '10 Days Cashback Guarantee', 1, '2023-07-16 21:53:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotional_banners`
--

CREATE TABLE `promotional_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `heading_color` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_color` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `btn_text_color` varchar(255) DEFAULT NULL,
  `btn_bg_color` varchar(255) DEFAULT NULL,
  `background_color` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `time_bg_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotional_banners`
--

INSERT INTO `promotional_banners` (`id`, `icon`, `heading`, `heading_color`, `title`, `title_color`, `url`, `btn_text`, `btn_text_color`, `btn_bg_color`, `background_color`, `product_image`, `started_at`, `end_at`, `time_bg_color`, `created_at`, `updated_at`) VALUES
(1, 'banner/ETxhI1689412954.png', 'Don’t Miss!!', '#c7c7dc', 'Enhance Your Music Experience', '#ffffff', 'https://bestu-beta.vercel.app/', 'Check it out', '#ffffff', '#828282', '#2a00c2', 'banner/6e9rk1689412967.png', '2023-07-15 15:24:46', '2023-07-22 18:00:00', '#ffffff', '2023-06-13 10:08:55', '2023-07-15 19:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `effective_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1=>Amount; 2=>Percentage',
  `value` double NOT NULL DEFAULT 0,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `title`, `description`, `code`, `effective_date`, `expire_date`, `type`, `value`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '25% off', 'happy shoping', 'Off25', '2023-07-03', '2023-07-10', 2, 25, 'J0vnY1688367426', 0, '2023-07-03 16:57:06', '2023-07-13 03:32:46'),
(2, 'OFF 100', '100 taka off', 'OFF100', '2023-07-09', '2023-07-15', 1, 100, '2EtEa1688804325', 2, '2023-07-08 18:18:45', '2023-07-13 04:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(255) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `role_name`, `permission_id`, `route`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Category Management', 125, 'save/rearranged/order', 'SaveRearrangeCategoryOrder', '2023-07-18 16:22:38', NULL),
(2, 1, 'Category Management', 124, 'rearrange/category', 'RearrangeCategory', '2023-07-18 16:22:38', NULL),
(3, 1, 'Category Management', 123, 'update/category', 'UpdateCategory', '2023-07-18 16:22:38', NULL),
(4, 1, 'Category Management', 122, 'edit/category/{slug}', 'EditCategory', '2023-07-18 16:22:38', NULL),
(5, 1, 'Category Management', 121, 'feature/category/{slug}', 'FeatureCategory', '2023-07-18 16:22:38', NULL),
(6, 1, 'Category Management', 120, 'delete/category/{slug}', 'DeleteCategory', '2023-07-18 16:22:38', NULL),
(7, 1, 'Category Management', 119, 'view/all/category', 'ViewAllCategory', '2023-07-18 16:22:38', NULL),
(8, 1, 'Category Management', 118, 'save/new/category', 'SaveNewCategory', '2023-07-18 16:22:38', NULL),
(9, 1, 'Category Management', 117, 'add/new/category', 'AddNewCategory', '2023-07-18 16:22:38', NULL),
(10, 2, 'Subcategory Management', 134, 'category/wise/subcategory', 'SubcategoryCategoryWise', '2023-07-18 16:24:12', NULL),
(11, 2, 'Subcategory Management', 132, 'update/subcategory', 'UpdateSubcategory', '2023-07-18 16:24:12', NULL),
(12, 2, 'Subcategory Management', 131, 'edit/subcategory/{slug}', 'EditSubcategory', '2023-07-18 16:24:12', NULL),
(13, 2, 'Subcategory Management', 130, 'feature/subcategory/{id}', 'FeatureSubcategory', '2023-07-18 16:24:12', NULL),
(14, 2, 'Subcategory Management', 129, 'delete/subcategory/{slug}', 'DeleteSubcategory', '2023-07-18 16:24:12', NULL),
(15, 2, 'Subcategory Management', 128, 'view/all/subcategory', 'ViewAllSubcategory', '2023-07-18 16:24:12', NULL),
(16, 2, 'Subcategory Management', 127, 'save/new/subcategory', 'SaveNewSubcategory', '2023-07-18 16:24:12', NULL),
(17, 2, 'Subcategory Management', 126, 'add/new/subcategory', 'AddNewSubcategory', '2023-07-18 16:24:12', NULL),
(18, 3, 'Dashboard', 23, 'home', 'home', '2023-07-20 04:31:05', NULL),
(19, 4, 'ChildCategory Management', 141, 'subcategory/wise/childcategory', 'ChildcategorySubcategoryWise', '2023-07-20 04:36:56', NULL),
(20, 4, 'ChildCategory Management', 139, 'update/childcategory', 'UpdateChildcategory', '2023-07-20 04:36:56', NULL),
(21, 4, 'ChildCategory Management', 138, 'edit/childcategory/{slug}', 'EditChildcategory', '2023-07-20 04:36:56', NULL),
(22, 4, 'ChildCategory Management', 137, 'delete/childcategory/{slug}', 'DeleteChildcategory', '2023-07-20 04:36:56', NULL),
(23, 4, 'ChildCategory Management', 136, 'view/all/childcategory', 'ViewAllChildcategory', '2023-07-20 04:36:56', NULL),
(24, 4, 'ChildCategory Management', 135, 'save/new/childcategory', 'SaveNewChildcategory', '2023-07-20 04:36:56', NULL),
(25, 4, 'ChildCategory Management', 134, 'category/wise/subcategory', 'SubcategoryCategoryWise', '2023-07-20 04:36:56', NULL),
(26, 4, 'ChildCategory Management', 133, 'add/new/childcategory', 'AddNewChildcategory', '2023-07-20 04:36:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_infos`
--

CREATE TABLE `shipping_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `thana` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_infos`
--

INSERT INTO `shipping_infos` (`id`, `order_id`, `full_name`, `phone`, `email`, `gender`, `address`, `thana`, `post_code`, `city`, `country`, `created_at`, `updated_at`) VALUES
(2, 1, 'Reduan', '01850453321', 'reduan@getup.com.bd', 'undefined', 'kapasgola', NULL, '12334', 'Chattogram', 'Bangladesh', '2023-07-17 23:49:13', NULL),
(3, 6, 'Reduan', '01850453321', 'admin@gmil.com', 'undefined', 'kapasgola', NULL, '12334', 'Chattogram', 'Bangladesh', '2023-07-18 08:34:22', NULL),
(4, 9, 'Reduan', '01850453322', 'admin@gmil.com', 'undefined', 'Flat A2, House 4 Rd No. 10', NULL, '1000', 'Mymensingh', 'Bangladesh', '2023-07-18 08:54:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sims`
--

CREATE TABLE `sims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sims`
--

INSERT INTO `sims` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Single SIM', '2023-06-05 04:25:24', NULL),
(2, 'Single e-SIM', '2023-06-05 04:25:30', NULL),
(3, 'Dual SIM', '2023-06-05 04:25:36', '2023-06-07 16:30:32'),
(4, 'Dual e-SIM', '2023-06-05 04:25:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `provider_name` varchar(255) NOT NULL,
  `api_endpoint` varchar(255) NOT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Inactive; 1=>Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `image`, `provider_name`, `api_endpoint`, `api_key`, `secret_key`, `sender_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ElitBuzz', 'https://880sms.com/smsapi', 'C20095786bf436075.85835321', NULL, 'BESTU', 0, '2023-06-13 03:43:26', '2023-07-08 16:42:39'),
(2, NULL, 'Reve', 'https://smpp.ajuratech.com:7790/sendtext', '69cff06995a4a373', '20cdf1d2', 'BESTU', 1, '2023-06-13 03:43:26', '2023-07-08 16:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `sms_histories`
--

CREATE TABLE `sms_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) UNSIGNED DEFAULT NULL,
  `template_title` varchar(255) DEFAULT NULL,
  `template_description` longtext DEFAULT NULL,
  `sending_type` tinyint(4) DEFAULT NULL COMMENT '1=>Individual; 2=>Everyone',
  `individual_contact` varchar(255) DEFAULT NULL,
  `sms_receivers` tinyint(4) DEFAULT NULL COMMENT '1=>Having No Order; 2=>Having Orders',
  `min_order` double DEFAULT NULL,
  `max_order` double DEFAULT NULL,
  `min_order_value` double DEFAULT NULL,
  `max_order_value` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fb_login_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Inactive; 1=>Active',
  `fb_app_id` varchar(255) DEFAULT NULL,
  `fb_app_secret` varchar(255) DEFAULT NULL,
  `fb_redirect_url` varchar(255) DEFAULT NULL,
  `gmail_login_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Inactive; 1=>Active',
  `gmail_client_id` varchar(255) DEFAULT NULL,
  `gmail_secret_id` varchar(255) DEFAULT NULL,
  `gmail_redirect_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_logins`
--

INSERT INTO `social_logins` (`id`, `fb_login_status`, `fb_app_id`, `fb_app_secret`, `fb_redirect_url`, `gmail_login_status`, `gmail_client_id`, `gmail_secret_id`, `gmail_redirect_url`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-10-05 06:00:25', '2023-10-05 06:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `storage_types`
--

CREATE TABLE `storage_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1' COMMENT '0=>Inactive; 1=>Active',
  `slug` varchar(255) NOT NULL,
  `serial` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storage_types`
--

INSERT INTO `storage_types` (`id`, `ram`, `rom`, `status`, `slug`, `serial`, `created_at`, `updated_at`) VALUES
(1, '4', '64 GB', '1', 'MjG8L1685939055', 2, '2023-06-05 04:24:15', '2023-07-10 21:56:55'),
(2, '6', '64 GB', '1', 'EFTdp1685939066', 6, '2023-06-05 04:24:26', '2023-07-10 21:56:55'),
(3, '4', '128 GB', '1', 'XcLTt1685939084', 3, '2023-06-05 04:24:44', '2023-07-10 21:56:55'),
(4, '6', '128 GB', '1', 'jiKP61685939094', 7, '2023-06-05 04:24:54', '2023-07-10 21:56:55'),
(5, '8', '128 GB', '1', 'VDL441685939104', 8, '2023-06-05 04:25:04', '2023-07-10 21:56:55'),
(6, '8', '256 GB', '1', 'HddfS1685939113', 9, '2023-06-05 04:25:13', '2023-07-10 21:56:55'),
(7, '2', '64 GB', '1', 'LAyCw1686119343', 1, '2023-06-07 16:29:03', '2023-07-10 21:56:55'),
(8, '2', '32 GB', '0', 'D0lJZ1686119390', 1, '2023-06-07 16:29:50', '2023-06-21 14:31:15'),
(9, '4', '256 GB', '1', 'D8g4L1686823094', 4, '2023-06-15 19:58:14', '2023-07-10 21:56:55'),
(10, '4', '512 GB', '1', 'KdCb71686823101', 5, '2023-06-15 19:58:21', '2023-07-10 21:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Not Featured; 1=>Featured',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `icon`, `image`, `slug`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(7, 1, 'Apple', 'subcategory_images/RWEgG1689766831.jpg', 'subcategory_images/4Dwni1689768095.jpg', 'apple-1689768095-7dqt5', 1, 1, '2023-06-13 21:08:42', '2023-07-19 12:01:35'),
(16, 1, 'Google', 'subcategory_images/GlUYg1689766712.png', 'subcategory_images/3iI901689767872.jpg', 'google-1689767872-jpy4N', 1, 1, '2023-07-16 13:32:34', '2023-07-19 11:57:52'),
(22, 1, 'Samsung', 'subcategory_images/rmA3f1689767680.jpg', 'subcategory_images/bBgov1689768104.jpg', 'samsung-1689768104-rqw0W', 1, 1, '2023-07-19 11:43:35', '2023-07-19 12:01:44'),
(23, 1, 'Oneplus', 'subcategory_images/3PdOB1689767738.jpg', 'subcategory_images/KuPbB1689767738.jpg', 'oneplus-1689767738-5STLs', 1, 1, '2023-07-19 11:44:38', '2023-07-19 11:56:36'),
(24, 1, 'Realme', 'subcategory_images/92VA51689767777.jpg', 'subcategory_images/aAWS01689767344.jpg', 'realme-1689767777-IABLe', 1, 1, '2023-07-19 11:49:04', '2023-07-19 11:56:37'),
(25, 1, 'Xiaomi', 'subcategory_images/jrOrI1689767433.png', 'subcategory_images/1EFKS1689768121.jpg', 'xiaomi-1689768121-aAhRK', 1, 1, '2023-07-19 11:50:33', '2023-07-19 12:02:01'),
(26, 1, 'Oppo', 'subcategory_images/fPQhW1689768608.jpg', 'subcategory_images/MFPbx1689768608.jpg', 'oppo-1689768608-1ajzt', 1, 0, '2023-07-19 12:10:08', NULL),
(27, 1, 'Tecno', 'subcategory_images/2xRGZ1689768705.png', 'subcategory_images/qcktf1689768705.png', 'tecno-1689768705-cKF5U', 1, 0, '2023-07-19 12:11:45', NULL),
(28, 1, 'Vivo', 'subcategory_images/OiMnf1689768873.jpg', 'subcategory_images/kQBKR1689768873.jpg', 'vivo-1689768873-HQhBo', 1, 0, '2023-07-19 12:14:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_users`
--

CREATE TABLE `subscribed_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `sender_type` tinyint(4) NOT NULL COMMENT '1=>Support Agent; 2=>Customer',
  `message` longtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `sender_id`, `sender_type`, `message`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'hello there', NULL, '2023-07-17 20:04:12', NULL),
(2, 1, 35, 2, 'Quis eget risus in egestas. Quis etiam risus eget cras risus. Suspendisse diam, volutpat, sem tellus ridiculus ante. Eu augue sapien, vitae nunc lacus, tellus mi quis ipsum. Pulvinar quam faucibus sit senectus nunc tempor, velit. Pellentesque mi magna elit aliquet faucibus congue pellentesque phasellus. Fermentum odio amet, sed at pulvinar.', NULL, '2023-07-17 20:04:54', NULL),
(3, 1, 1, 1, 'check it out.', 'support_ticket_attachments/I8ARl1689675518.png', '2023-07-18 10:18:38', NULL),
(4, 1, 35, 2, 'Joss', NULL, '2023-07-18 10:54:46', NULL),
(5, 1, 35, 2, 'Ok', NULL, '2023-07-18 10:55:37', NULL),
(6, 1, 35, 2, 'Wow', NULL, '2023-07-18 10:57:46', NULL),
(7, 1, 35, 2, 'Wow 2', NULL, '2023-07-18 10:58:30', NULL),
(8, 1, 1, 1, 'Hi Hello', NULL, '2023-07-18 10:59:15', NULL),
(9, 1, 35, 2, 'Wow', NULL, '2023-07-18 10:59:27', NULL),
(10, 1, 1, 1, 'hi..', NULL, '2023-07-18 10:59:32', NULL),
(11, 1, 35, 2, 'Watch this', 'support_ticket_attachments/iiHwz1689678035.jpg', '2023-07-18 11:00:35', NULL),
(12, 1, 35, 2, 'Yo', NULL, '2023-07-18 11:08:02', NULL),
(13, 1, 35, 2, 'Hey', NULL, '2023-07-18 11:11:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `support_taken_by` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `subject` varchar(255) NOT NULL,
  `message` longtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Pending;1=>In Progress;2=>Solved;3=>Rejected;4=>On Hold',
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `ticket_no`, `support_taken_by`, `subject`, `message`, `attachment`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, '16895854913Vj676', 35, 'Problem in Order Placement', 'Quis eget risus in egestas. Quis etiam risus eget cras risus. Suspendisse diam, volutpat, sem tellus ridiculus ante. Eu augue sapien, vitae nunc lacus, tellus mi quis ipsum. Pulvinar quam faucibus sit senectus nunc tempor, velit. Pellentesque mi magna elit aliquet faucibus congue pellentesque phasellus. Fermentum odio amet, sed at pulvinar.', 'support_ticket_attachments/C8dls1689585491.png', 1, '16895854919zdQS', '2023-07-17 19:18:11', '2023-07-17 20:03:31');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_policies`
--

CREATE TABLE `terms_and_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms` longtext DEFAULT NULL,
  `privacy_policy` longtext DEFAULT NULL,
  `shipping_policy` longtext DEFAULT NULL,
  `return_policy` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_policies`
--

INSERT INTO `terms_and_policies` (`id`, `terms`, `privacy_policy`, `shipping_policy`, `return_policy`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Terms and Conditions</strong></p>\r\n\r\n<p>Please read these Terms and Conditions (&quot;Terms&quot;) carefully before using the Bestu ecommerce app and website (&quot;Platform&quot;) operated by Bestu. These Terms govern your use of the Platform and any services or products offered through the Platform. By accessing or using the Platform, you agree to be bound by these Terms. If you do not agree with any part of these Terms, you may not use the Platform.</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Account Creation:</p>\r\n\r\n	<ul>\r\n		<li>To access certain features of the Platform, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information and are solely responsible for all activities that occur under your account.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Intellectual Property:</p>\r\n\r\n	<ul>\r\n		<li>The Platform and its original content, features, and functionality are owned by Bestu and are protected by intellectual property laws. You may not modify, reproduce, distribute, or create derivative works based on the Platform or any content without prior written permission from Bestu.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Product Information and Pricing:</p>\r\n\r\n	<ul>\r\n		<li>We strive to provide accurate product information, descriptions, and pricing on the Platform. However, we do not warrant that the information is complete, current, or error-free. In the event of an error, we reserve the right to correct it and modify or cancel any orders placed for products listed with incorrect information or pricing.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Product Availability:</p>\r\n\r\n	<ul>\r\n		<li>Product availability on the Platform is subject to change without prior notice. We make efforts to ensure accurate stock information, but there may be occasions when a product becomes unavailable after an order has been placed. In such cases, we will notify you and provide options, including a refund or alternative product.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>User Conduct:</p>\r\n\r\n	<ul>\r\n		<li>You agree to use the Platform for lawful purposes and in compliance with these Terms.</li>\r\n		<li>You are responsible for any content you post, transmit, or share on the Platform. You must not post or transmit any content that is illegal, offensive, defamatory, or infringes upon the rights of others.</li>\r\n		<li>You must not engage in any activity that may disrupt or interfere with the operation or security of the Platform.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Third-Party Links:</p>\r\n\r\n	<ul>\r\n		<li>The Platform may contain links to third-party websites or services that are not owned or controlled by Bestu. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party websites or services. You access and use such third-party websites or services at your own risk.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Limitation of Liability:</p>\r\n\r\n	<ul>\r\n		<li>To the maximum extent permitted by applicable law, Bestu and its affiliates, directors, employees, agents, and suppliers shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including but not limited to loss of profits, data, or use, arising out of or in any way connected with the use of the Platform.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Indemnification:</p>\r\n\r\n	<ul>\r\n		<li>You agree to indemnify and hold harmless Bestu and its affiliates, directors, employees, agents, and suppliers from any claims, damages, liabilities, costs, or expenses (including reasonable attorneys&#39; fees) arising out of or related to your use of the Platform, violation of these Terms, or infringement of any rights of third parties.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Governing Law:</p>\r\n\r\n	<ul>\r\n		<li>These Terms shall be governed by and construed in accordance with the laws of [insert applicable jurisdiction]. Any disputes arising under or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts located in [insert applicable jurisdiction].</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Changes to the Terms:</p>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>We reserve the right to modify or replace these Terms at any time without prior notice. By continuing to access or use the Platform after any revisions become effective, you agree to be bound by the updated Terms.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Contact Us:</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>If you have any questions or concerns about these Terms, please contact us at [insert contact information].</li>\r\n</ul>\r\n\r\n<p>By using the Bestu ecommerce app and website, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.</p>', '<p><strong>Privacy Policy for Bestu Ecommerce App and Website</strong></p>\r\n\r\n<p><em>Effective Date: [ 16 July 2023]</em></p>\r\n\r\n<p>At Bestu, we value the privacy and security of our users. This Privacy Policy outlines the types of personal information we collect, how we use and protect that information, and your rights and choices regarding your personal information. By using the Bestu ecommerce app and website (collectively referred to as the &quot;Platform&quot;), you consent to the practices described in this Privacy Policy.</p>\r\n\r\n<ol>\r\n	<li>Information We Collect: 1.1 Personal Information:\r\n	<ul>\r\n		<li>When you create an account, we may collect your name, email address, phone number, and other contact information.</li>\r\n		<li>When you make a purchase, we collect your payment details, shipping address, and order history.</li>\r\n		<li>If you choose to participate in surveys, contests, or promotions, we may collect additional personal information.</li>\r\n		<li>We may collect information you provide when you contact our customer support team or interact with us through social media platforms.</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p>1.2 Non-Personal Information:</p>\r\n\r\n<ul>\r\n	<li>We collect certain non-personal information automatically when you use our Platform, such as device information, IP address, browser type, and usage statistics.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Use of Information:</p>\r\n\r\n	<ul>\r\n		<li>We use the collected personal information to provide and improve our services, process orders, handle customer inquiries, and personalize your shopping experience.</li>\r\n		<li>Non-personal information is used for statistical analysis, troubleshooting, and improving our Platform&#39;s performance and functionality.</li>\r\n		<li>We may also use your information to send you marketing communications if you have opted-in to receive them. You can opt-out of these communications at any time.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Sharing of Information:</p>\r\n\r\n	<ul>\r\n		<li>We may share your personal information with trusted third parties, such as payment processors, shipping partners, and service providers, to fulfill your orders and provide our services.</li>\r\n		<li>We may share non-personal information with third parties for analytical or marketing purposes.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Cookies and Similar Technologies:</p>\r\n\r\n	<ul>\r\n		<li>We use cookies and similar technologies to enhance your browsing experience, analyze trends, and gather demographic information.</li>\r\n		<li>You can manage your cookie preferences through your browser settings. However, disabling cookies may limit certain features and functionality of our Platform.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Data Security:</p>\r\n\r\n	<ul>\r\n		<li>We employ industry-standard security measures to protect your personal information from unauthorized access, disclosure, or alteration.</li>\r\n		<li>While we strive to protect your information, no method of transmission over the internet or electronic storage is 100% secure. Therefore, we cannot guarantee absolute security.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Third-Party Links:</p>\r\n\r\n	<ul>\r\n		<li>Our Platform may contain links to third-party websites or services that are not under our control. We are not responsible for the privacy practices or content of these third-party sites.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Children&#39;s Privacy:</p>\r\n\r\n	<ul>\r\n		<li>Our Platform is not intended for use by individuals under the age of 18. We do not knowingly collect personal information from children. If you believe we have inadvertently collected such information, please contact us to have it removed.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Your Rights and Choices:</p>\r\n\r\n	<ul>\r\n		<li>You have the right to access, update, or delete your personal information. You can do so by logging into your account or contacting us directly.</li>\r\n		<li>You may also have the right to restrict or object to the processing of your personal information, as well as the right to data portability.</li>\r\n		<li>If you no longer wish to receive marketing communications, you can opt-out by following the instructions provided in those communications.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Changes to the Privacy Policy:</p>\r\n\r\n	<ul>\r\n		<li>We reserve the right to modify this Privacy Policy at any time. If we make material changes, we will notify you by posting an updated version on our Platform or via other communication channels.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Contact Us:</p>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>If you have any questions, concerns, or requests regarding this Privacy Policy or our privacy practices, please contact us at [insert contact information].</li>\r\n</ul>\r\n\r\n<p>By using the Bestu ecommerce app and website, you acknowledge that you have read and understood this Privacy Policy and agree to the collection, use, and disclosure of your personal information as described herein.</p>', '<p><strong>Shipping Policy</strong></p>\r\n\r\n<p>Thank you for choosing Bestu for your mobile devices and accessories. We want to ensure that your order is delivered to you in a timely and efficient manner. This Shipping Policy outlines important information regarding our shipping processes, including delivery options, timelines, and other relevant details.</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Order Processing:</p>\r\n\r\n	<ul>\r\n		<li>Once you place an order with us, our team will carefully process and prepare it for shipment.</li>\r\n		<li>We aim to process and ship orders as quickly as possible, typically within 1-2 business days. However, please note that processing times may vary during peak seasons or promotional periods.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Shipping Methods and Delivery Options:</p>\r\n\r\n	<ul>\r\n		<li>We offer a variety of shipping methods to cater to your needs. The available options will be presented to you during the checkout process.</li>\r\n		<li>Our shipping partners may include reputable courier services to ensure reliable and secure delivery.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Shipping Destinations:</p>\r\n\r\n	<ul>\r\n		<li>We currently offer shipping within [insert applicable countries or regions].</li>\r\n		<li>Please note that certain products or brands may have shipping restrictions due to legal or logistical reasons. Any such restrictions will be communicated during the checkout process.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Shipping Fees:</p>\r\n\r\n	<ul>\r\n		<li>Shipping fees are calculated based on various factors, including the shipping method selected, the weight and dimensions of the package, and the destination.</li>\r\n		<li>The shipping fee will be displayed to you during the checkout process before you finalize your order.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Estimated Delivery Time:</p>\r\n\r\n	<ul>\r\n		<li>The estimated delivery time will depend on your location, the selected shipping method, and other factors beyond our control.</li>\r\n		<li>We strive to provide accurate delivery estimates, but please note that these are estimates only and actual delivery times may vary.</li>\r\n		<li>Once your order has been shipped, you will receive a shipping confirmation email with tracking information, allowing you to track the progress of your package.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Customs and Duties:</p>\r\n\r\n	<ul>\r\n		<li>For international orders, please note that customs fees, import duties, and taxes may be applicable according to your country&#39;s regulations.</li>\r\n		<li>Any additional charges related to customs clearance are the responsibility of the recipient and may need to be paid upon delivery.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Order Tracking:</p>\r\n\r\n	<ul>\r\n		<li>Once your order has been shipped, you will receive a tracking number and instructions on how to track your package.</li>\r\n		<li>You can use the provided tracking information to monitor the progress of your shipment on the respective courier&#39;s website.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Delivery Issues:</p>\r\n\r\n	<ul>\r\n		<li>In the rare event that your package is delayed, lost, or damaged during transit, please contact our customer support team as soon as possible. We will work diligently to resolve the issue and ensure your satisfaction.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Change of Shipping Address:</p>\r\n\r\n	<ul>\r\n		<li>If you need to change the shipping address after placing an order, please contact our customer support team immediately. We will do our best to accommodate your request if the order has not yet been shipped.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Shipping Policy Updates:</p>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>We reserve the right to update or modify this Shipping Policy at any time without prior notice. Any changes will be effective immediately upon posting on our website.</li>\r\n</ul>\r\n\r\n<p>If you have any questions or need further assistance regarding our shipping policy, please don&#39;t hesitate to contact our customer support team. We are here to provide you with the best possible shopping experience.</p>\r\n\r\n<p>Thank you for choosing Bestu. We appreciate your business!</p>', '<p><strong>Return Policy</strong></p>\r\n\r\n<p>At Bestu, we want you to be completely satisfied with your purchase. If for any reason you are not satisfied with your order, we offer a flexible return policy to ensure your peace of mind. Please read our Return Policy carefully to understand the return process, eligibility criteria, and other important details.</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Eligibility for Returns:</p>\r\n\r\n	<ul>\r\n		<li>You may be eligible for a return if you have purchased the product directly from Bestu, within the specified return period.</li>\r\n		<li>The return period starts from the date of delivery and varies depending on the type of product. Please refer to the specific product listing or contact our customer support team for the applicable return period.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Return Process:</p>\r\n\r\n	<ul>\r\n		<li>To initiate a return, please contact our customer support team within the eligible return period. They will guide you through the return process and provide you with the necessary instructions and documentation.</li>\r\n		<li>In some cases, we may require you to provide proof of purchase, such as the order number or receipt, to facilitate the return process.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Return Conditions:</p>\r\n\r\n	<ul>\r\n		<li>The returned product must be in its original condition, unused, undamaged, and in its original packaging (including all accessories, manuals, and warranty cards).</li>\r\n		<li>Please ensure that the product is securely packaged to avoid damage during transit. We recommend using the original packaging whenever possible.</li>\r\n		<li>Products that are damaged due to improper use, negligence, or unauthorized modifications may not be eligible for return.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Return Shipping:</p>\r\n\r\n	<ul>\r\n		<li>Unless the return is due to our error or a defective product, the customer is responsible for the return shipping costs.</li>\r\n		<li>We recommend using a reputable shipping service with tracking and insurance, as we cannot be held responsible for lost or damaged return shipments.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Refund Process:</p>\r\n\r\n	<ul>\r\n		<li>Once the returned product is received and inspected, we will process the refund based on the original payment method used for the purchase.</li>\r\n		<li>Refunds will typically be issued within [insert timeframe] after the product is received and verified. Please note that the refund processing time may vary depending on your financial institution.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Non-Returnable Items:</p>\r\n\r\n	<ul>\r\n		<li>Certain items are non-returnable for hygiene or safety reasons, such as earphones, personal care products, or software with a downloadable component. Please check the product listing or contact our customer support team for specific details.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Exchanges:</p>\r\n\r\n	<ul>\r\n		<li>We currently do not offer direct exchanges. If you wish to exchange a product, you will need to return the original item following our return process and place a new order for the desired item.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Damaged or Defective Products:</p>\r\n\r\n	<ul>\r\n		<li>In the unlikely event that you receive a damaged or defective product, please contact our customer support team immediately. We will assist you in resolving the issue and provide instructions for returning the product, if necessary.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Cancellation Policy:</p>\r\n\r\n	<ul>\r\n		<li>If you need to cancel your order before it has been shipped, please contact our customer support team as soon as possible. We will make every effort to accommodate your request. However, once the order has been shipped, it cannot be canceled and will be subject to the return policy.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Updates to the Return Policy:</p>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>We reserve the right to update or modify this Return Policy at any time without prior notice. Any changes will be effective immediately upon posting on our website.</li>\r\n</ul>\r\n\r\n<p>If you have any questions or require further assistance regarding our return policy, please contact our customer support team. We are here to assist you and ensure your satisfaction.</p>\r\n\r\n<p>Thank you for shopping at Bestu!</p>', '2023-04-11 13:41:20', '2023-07-16 15:24:32');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `rating` double NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_image` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 1, '2023-04-11 13:17:38', '2023-05-14 13:31:29'),
(2, 'KG', 1, '2023-04-11 13:18:02', '2023-05-14 13:31:15'),
(3, 'Gram', 1, '2023-04-11 13:18:02', '2023-05-14 13:30:11'),
(4, 'Litre', 1, '2023-04-11 13:18:02', '2023-05-14 13:30:54'),
(7, 'Ton', 1, '2023-05-14 13:32:39', NULL),
(8, 'Meter', 1, '2023-05-14 13:36:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL COMMENT 'Used for Forget Password Verification',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 3 COMMENT '1=>Admin; 2=>User/Shop; 3=>Customer',
  `address` longtext DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0 COMMENT 'In BDT',
  `delete_request_submitted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>No; 1=>Yes',
  `delete_request_submitted_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `name`, `phone`, `email`, `email_verified_at`, `verification_code`, `password`, `remember_token`, `user_type`, `address`, `balance`, `delete_request_submitted`, `delete_request_submitted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', '01969005036', 'admin@gmail.com', NULL, '33200', '$2y$10$JtmbfwKyLz4moqNiYTHnNudFYY5sSxhozz.jyo4gwdbGOpfjlW5tq', NULL, 1, NULL, 0, 0, NULL, 1, '2023-03-28 10:20:00', '2023-10-02 08:23:57'),
(19, 'userProfileImages/bulWt1688356676.jpg', 'Md. Fahim Hossain 2', NULL, 'alifhossain174@gmaill.com', NULL, '655028', '$2y$10$MKFghgrOtoPRr50wFpIx1ubpahBuCI/xoDM2j2ZwysCOoOoHDBUXK', NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-12 03:55:36', '2023-07-03 13:57:56'),
(23, 'userProfileImages/WUsyU1688361290.jpeg', 'Reduan', '01850453322', 'test100@gmail.com', NULL, '154666', '$2y$10$BawJIqWONpVSNWFZ1xCQEe0R8Z4OEn8NiFHENZR6./MMHvM/DP4cS', NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-18 21:08:55', '2023-07-13 03:35:27'),
(24, NULL, '', NULL, 'ridwanali3322@gmail.com', NULL, '484401', '$2y$10$e7eMM8oMfAstGxrvUb7Eu.lckdUpHGak.6ECGeHJBKVNQAmgRLURa', NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-18 21:51:55', '2023-06-19 17:24:37'),
(25, NULL, 'Bestu', NULL, 'admin@bestu.com.bd', NULL, NULL, '$2y$10$2QIdfvOWHR8qTvE5FcsGDOkKTc6VkFWkAVbVhu7qSd7x8Zq6..FTG', NULL, 1, 'Dhaka, Bangladesh', 0, 0, NULL, 1, '2023-06-27 16:54:07', '2023-07-18 08:42:03'),
(26, NULL, '', '016433533365', NULL, NULL, '913673', '$2y$10$vXYSU3UM.B3LEyE9WvF2Re/Sv.GeLEqUono.1OcIM4NBAcvpS0bZC', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-06 15:45:32', NULL),
(27, NULL, 'Fahim Hossain', NULL, 'alifhossain174@gmail.com', NULL, '214804', '$2y$10$uiY1ZX1IGwzsUkBzKI//EeubYxq6/8oWX0vLa/hhOKT9DgiCdDeYm', NULL, 3, 'Seroil Rajshahi, Bangladesh', 0, 0, NULL, 1, '2023-07-06 19:23:55', '2023-07-17 20:50:35'),
(28, NULL, '', '01643533368', NULL, NULL, '910611', '$2y$10$z3mRME527FC0z4hi1zP3sOM7oir.GpDP9eBEWbP/qxKiEjvheq4A2', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-06 20:27:05', NULL),
(29, NULL, '', '01643533366', NULL, NULL, '675968', '$2y$10$Gl1h9ismCfKXye7mq1wVlub11ln6WqWnpQS0QXBT9aHG0/WzyVBqi', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-06 20:37:02', NULL),
(30, NULL, '', NULL, 'mostaiminfo@gmail.com', NULL, '260757', '$2y$10$QJWbPTH8/UwdxdrQlsX0YuLjqDLkocxF32clWIIO8BRqXeUSeFvyW', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-08 17:01:47', '2023-07-08 17:02:56'),
(32, NULL, '', '01704666256', NULL, NULL, '840182', '$2y$10$5eRP84u8BNrkRIlLbfkHB.D3BBoFNTPSrHeUqhE1RNvj5eIBzkACy', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-12 01:51:27', '2023-07-12 01:51:52'),
(33, NULL, 'Rohan Hossain Siam', '01632563180', 'itssiam856@gmail.com', NULL, NULL, '$2y$10$eCh/uQ.fK7JxcNf1QSNOa./i9GUuOWEEktJQL52HvoWAWogg46/S2', NULL, 1, '64/62 no. Mahut-tuli, Armanitola, Dhaka, Bangladesh.', 0, 0, NULL, 1, '2023-07-15 19:53:27', '2023-07-18 08:42:00'),
(34, NULL, 'Istiak Ahamed Sifat', '01580331693', 'istiakahamed30@gmail.com', NULL, NULL, '$2y$10$/d3M1fFredISBGmlpDv4R.IXCGToxs/31ljKCg3wrE2q2gIk21WB2', NULL, 1, 'Ali nekir dewry, Nazimuddin Road, Dhaka.', 0, 0, NULL, 1, '2023-07-15 19:55:06', '2023-07-18 08:41:56'),
(35, 'userProfileImages/2eYoO1689479533.jpg', 'Ariful', '01643533365', 'ariful@gmail.com', NULL, '772114', '$2y$10$x5m3cQUgd.RHgHWAT7iCu.GMovOLWNBrT9lnB8orb54P5QeU0ls/6', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-16 13:51:25', '2023-07-19 04:38:59'),
(36, NULL, 'TestUser By Getup', '01969005035', 'test@gmail.com', NULL, NULL, '$2y$10$/9ZP9Bi/GH51I6kZyZTDVefcQI1dAJSOnv/SlPEIT2YPQgIkgiky2', NULL, 2, 'Dhaka, Bangladesh', 0, 0, NULL, 1, '2023-07-18 08:17:43', '2023-07-18 08:42:28'),
(37, NULL, '', '+8801829367024', NULL, NULL, '627007', '$2y$10$09X8Y/jlEmWqIUqJmuDbbuBSBLh9oCGn7jQo/fCYR6j/4WBbLX91K', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-18 10:48:40', '2023-07-18 10:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `address_type`, `name`, `address`, `country`, `city`, `state`, `post_code`, `phone`, `slug`, `created_at`, `updated_at`) VALUES
(9, 19, 'Home', 'Md. Fahim Hossain 2', NULL, NULL, NULL, NULL, NULL, NULL, 'K3Xcv1688356410', '2023-07-03 13:53:30', NULL),
(10, 19, 'Home', 'Md. Fahim Hossain 2', NULL, NULL, NULL, NULL, NULL, NULL, 'QojGG1688356412', '2023-07-03 13:53:32', NULL),
(11, 19, 'Home', 'Md. Fahim Hossain 2', NULL, NULL, NULL, NULL, NULL, NULL, 'guAXk1688356540', '2023-07-03 13:55:40', NULL),
(12, 19, 'Home', 'Md. Fahim Hossain 2', NULL, NULL, NULL, NULL, NULL, NULL, 'DdqQm1688356676', '2023-07-03 13:57:56', NULL),
(18, 23, 'Billing Address', 'Reduan', 'Flat A2, House 4 Rd No. 10', 'Bangladesh', 'Dhaka', 'Dhamrai', '1000', '01850453322', 'JilM41688364719', '2023-07-03 16:11:59', NULL),
(19, 23, 'Shipping Address', 'Reduan', 'kapasgola', 'Bangladesh', 'Chattogram', 'Boalkhali', '12334', '01850453321', 'WL6zW1688365063', '2023-07-03 16:17:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '1=>Visa; 2=>Master',
  `card_name` varchar(255) NOT NULL,
  `card_no` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Default; 0=>Not',
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Category Management', 'Manage All Category Related Operations', '2023-07-18 16:22:38', NULL),
(2, 'Subcategory Management', 'Manage All Subcategory Related Operations', '2023-07-18 16:24:12', NULL),
(3, 'Dashboard', 'Can Access Dashboard', '2023-07-20 04:31:05', NULL),
(4, 'ChildCategory Management', 'Can Manage ChildCategory Related Operation', '2023-07-20 04:36:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role_permissions`
--

CREATE TABLE `user_role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(255) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role_permissions`
--

INSERT INTO `user_role_permissions` (`id`, `user_id`, `role_id`, `role_name`, `permission_id`, `route`, `route_name`, `created_at`, `updated_at`) VALUES
(21, 36, 3, 'Dashboard', 23, 'home', 'home', '2023-07-20 04:31:34', NULL),
(22, 36, 2, 'Subcategory Management', 134, 'category/wise/subcategory', 'SubcategoryCategoryWise', '2023-07-20 04:31:34', NULL),
(23, 36, 2, 'Subcategory Management', 132, 'update/subcategory', 'UpdateSubcategory', '2023-07-20 04:31:34', NULL),
(24, 36, 2, 'Subcategory Management', 131, 'edit/subcategory/{slug}', 'EditSubcategory', '2023-07-20 04:31:34', NULL),
(25, 36, 2, 'Subcategory Management', 130, 'feature/subcategory/{id}', 'FeatureSubcategory', '2023-07-20 04:31:34', NULL),
(26, 36, 2, 'Subcategory Management', 129, 'delete/subcategory/{slug}', 'DeleteSubcategory', '2023-07-20 04:31:34', NULL),
(27, 36, 2, 'Subcategory Management', 128, 'view/all/subcategory', 'ViewAllSubcategory', '2023-07-20 04:31:34', NULL),
(28, 36, 2, 'Subcategory Management', 127, 'save/new/subcategory', 'SaveNewSubcategory', '2023-07-20 04:31:34', NULL),
(29, 36, 2, 'Subcategory Management', 126, 'add/new/subcategory', 'AddNewSubcategory', '2023-07-20 04:31:34', NULL),
(30, 36, 1, 'Category Management', 125, 'save/rearranged/order', 'SaveRearrangeCategoryOrder', '2023-07-20 04:31:34', NULL),
(31, 36, 1, 'Category Management', 124, 'rearrange/category', 'RearrangeCategory', '2023-07-20 04:31:34', NULL),
(32, 36, 1, 'Category Management', 123, 'update/category', 'UpdateCategory', '2023-07-20 04:31:34', NULL),
(33, 36, 1, 'Category Management', 122, 'edit/category/{slug}', 'EditCategory', '2023-07-20 04:31:34', NULL),
(34, 36, 1, 'Category Management', 121, 'feature/category/{slug}', 'FeatureCategory', '2023-07-20 04:31:34', NULL),
(35, 36, 1, 'Category Management', 120, 'delete/category/{slug}', 'DeleteCategory', '2023-07-20 04:31:34', NULL),
(36, 36, 1, 'Category Management', 119, 'view/all/category', 'ViewAllCategory', '2023-07-20 04:31:34', NULL),
(37, 36, 1, 'Category Management', 118, 'save/new/category', 'SaveNewCategory', '2023-07-20 04:31:34', NULL),
(38, 36, 1, 'Category Management', 117, 'add/new/category', 'AddNewCategory', '2023-07-20 04:31:34', NULL),
(39, 36, NULL, NULL, 134, 'category/wise/subcategory', 'SubcategoryCategoryWise', '2023-07-20 04:31:34', NULL),
(40, 36, NULL, NULL, 132, 'update/subcategory', 'UpdateSubcategory', '2023-07-20 04:31:34', NULL),
(41, 36, NULL, NULL, 131, 'edit/subcategory/{slug}', 'EditSubcategory', '2023-07-20 04:31:34', NULL),
(42, 36, NULL, NULL, 130, 'feature/subcategory/{id}', 'FeatureSubcategory', '2023-07-20 04:31:34', NULL),
(43, 36, NULL, NULL, 129, 'delete/subcategory/{slug}', 'DeleteSubcategory', '2023-07-20 04:31:34', NULL),
(44, 36, NULL, NULL, 128, 'view/all/subcategory', 'ViewAllSubcategory', '2023-07-20 04:31:34', NULL),
(45, 36, NULL, NULL, 127, 'save/new/subcategory', 'SaveNewSubcategory', '2023-07-20 04:31:34', NULL),
(46, 36, NULL, NULL, 126, 'add/new/subcategory', 'AddNewSubcategory', '2023-07-20 04:31:34', NULL),
(47, 36, NULL, NULL, 125, 'save/rearranged/order', 'SaveRearrangeCategoryOrder', '2023-07-20 04:31:34', NULL),
(48, 36, NULL, NULL, 124, 'rearrange/category', 'RearrangeCategory', '2023-07-20 04:31:34', NULL),
(49, 36, NULL, NULL, 123, 'update/category', 'UpdateCategory', '2023-07-20 04:31:34', NULL),
(50, 36, NULL, NULL, 122, 'edit/category/{slug}', 'EditCategory', '2023-07-20 04:31:34', NULL),
(51, 36, NULL, NULL, 121, 'feature/category/{slug}', 'FeatureCategory', '2023-07-20 04:31:34', NULL),
(52, 36, NULL, NULL, 120, 'delete/category/{slug}', 'DeleteCategory', '2023-07-20 04:31:34', NULL),
(53, 36, NULL, NULL, 119, 'view/all/category', 'ViewAllCategory', '2023-07-20 04:31:34', NULL),
(54, 36, NULL, NULL, 118, 'save/new/category', 'SaveNewCategory', '2023-07-20 04:31:34', NULL),
(55, 36, NULL, NULL, 117, 'add/new/category', 'AddNewCategory', '2023-07-20 04:31:34', NULL),
(56, 36, NULL, NULL, 23, 'home', 'home', '2023-07-20 04:31:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `user_id`, `product_id`, `slug`, `created_at`, `updated_at`) VALUES
(1, 35, 1, '2m3mj1689739577', '2023-07-19 04:06:17', NULL),
(2, 35, 2, 'vbvol1689747837', '2023-07-19 06:23:57', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `child_categories`
--
ALTER TABLE `child_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_name_unique` (`name`),
  ADD UNIQUE KEY `colors_code_unique` (`code`);

--
-- Indexes for table `contact_requests`
--
ALTER TABLE `contact_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_conditions`
--
ALTER TABLE `device_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_configures`
--
ALTER TABLE `email_configures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_infos`
--
ALTER TABLE `general_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_recaptchas`
--
ALTER TABLE `google_recaptchas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_no_unique` (`order_no`),
  ADD UNIQUE KEY `orders_slug_unique` (`slug`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_progress`
--
ALTER TABLE `order_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_routes`
--
ALTER TABLE `permission_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_models`
--
ALTER TABLE `product_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_question_answers`
--
ALTER TABLE `product_question_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warrenties`
--
ALTER TABLE `product_warrenties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotional_banners`
--
ALTER TABLE `promotional_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_infos`
--
ALTER TABLE `shipping_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sims`
--
ALTER TABLE `sims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_histories`
--
ALTER TABLE `sms_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage_types`
--
ALTER TABLE `storage_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_policies`
--
ALTER TABLE `terms_and_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `child_categories`
--
ALTER TABLE `child_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_requests`
--
ALTER TABLE `contact_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `device_conditions`
--
ALTER TABLE `device_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_configures`
--
ALTER TABLE `email_configures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `general_infos`
--
ALTER TABLE `general_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `google_recaptchas`
--
ALTER TABLE `google_recaptchas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_progress`
--
ALTER TABLE `order_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission_routes`
--
ALTER TABLE `permission_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_models`
--
ALTER TABLE `product_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `product_question_answers`
--
ALTER TABLE `product_question_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_warrenties`
--
ALTER TABLE `product_warrenties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `promotional_banners`
--
ALTER TABLE `promotional_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `shipping_infos`
--
ALTER TABLE `shipping_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sims`
--
ALTER TABLE `sims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_histories`
--
ALTER TABLE `sms_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `storage_types`
--
ALTER TABLE `storage_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms_and_policies`
--
ALTER TABLE `terms_and_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
