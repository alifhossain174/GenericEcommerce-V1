-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 05:53 AM
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
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner_bg` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `section_sub_title` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` longtext DEFAULT NULL,
  `btn_icon_class` varchar(255) DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `btn_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `banner_bg`, `image`, `section_sub_title`, `section_title`, `section_description`, `btn_icon_class`, `btn_text`, `btn_link`, `created_at`, `updated_at`) VALUES
(1, 'uploads/about_us/Y7XUU1697616167.png', 'uploads/about_us/0a1sz1698222202.png', 'Why Choose us', 'We do not buy from the open market & traders.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit illo, est repellendus are quia voluptate neque reiciendis ea placeat labore maiores cum, hic ducimus ad a dolorem soluta consectetur adipisci. Perspiciatis quas ab quibusdam is.</p>\r\n\r\n<p>Itaque accusantium eveniet a laboriosam dolorem? Magni suscipit est corrupti explicabo non perspiciatis, excepturi ut asperiores assumenda rerum? Provident ab corrupti sequi, voluptates repudiandae eius odit aut.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Bruce Sutton</strong></p>\r\n\r\n<p>Spa Manager</p>', NULL, NULL, NULL, NULL, '2023-10-25 06:23:22');

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
(3, 1, 'banner/kYDXn1697621164.png', '#', NULL, 1, 'New Collection', 'The Great Fashion Collection 2022', 'Up To 40% Off Final Sale Items. Caught in the Moment!', 'Show Collection', '#', 'left', 'E6alq1697621164', -1, '2023-10-18 07:26:04', NULL),
(4, 1, 'banner/ESgOn1697621260.png', '#', NULL, 1, 'New Collection', 'The Great Fashion Collection 2022', 'Up To 40% Off Final Sale Items. Caught in the Moment!', 'Show Collection', '#', 'left', 'wMPED1697621260', -2, '2023-10-18 07:27:40', NULL),
(5, 1, 'banner/WxMA31697621777.png', '#', NULL, 1, 'New Collection', 'The Great Fashion Collection 2022', 'Up To 40% Off Final Sale Items. Caught in the Moment!', 'Show Collection', '#', 'right', '7tY9g1697621777', -3, '2023-10-18 07:36:17', NULL),
(6, 2, 'banner/lha3M1697621952.png', '#', 'top', 1, NULL, 'Spring Collection Style To', '17% Discount', 'View Discounts', '#', 'left', 'XK7La1697621952', 1, '2023-10-18 07:39:12', '2023-10-19 01:32:09'),
(7, 2, 'banner/wOObk1697622146.png', '#', 'top', 1, NULL, 'Up to 70% Off & Free Shipping', 'Shop Women', 'View Discounts', '#', NULL, 'CaXvm1697622146', 2, '2023-10-18 07:42:26', '2023-10-19 01:32:09'),
(8, 2, 'banner/9SHx31697622189.png', '#', 'top', 1, NULL, 'Free Shipping Over Order $120', 'Shop Women', 'View Discounts', '#', 'left', 'RWgJO1697622189', 3, '2023-10-18 07:43:09', '2023-10-19 01:32:09'),
(9, 2, 'banner/MCMLZ1697622229.png', '#', 'top', 1, NULL, 'Leather Saddle Bag Style', 'Free Shipping Over Order $120', 'View Discount', '#', 'left', 'yBmKG1697622229', 4, '2023-10-18 07:43:49', '2023-10-19 01:32:09'),
(10, 2, 'banner/mTZIQ1697622413.png', '#', 'middle', 1, NULL, 'Up to 25% Off Order Now', 'Pick Your Items', 'Shop Now', '#', 'left', 'X01JQ1697622413', 6, '2023-10-18 07:46:53', '2023-10-19 01:32:09'),
(11, 2, 'banner/WQIxE1697622489.png', '#', 'middle', 1, NULL, 'Up to 35% Off Order Now', 'Special offer', 'Shop Now', '#', 'left', 'rlaNY1697622489', 7, '2023-10-18 07:48:09', '2023-10-19 01:32:09'),
(12, 2, 'banner/dzNRv1697623027.png', '#', 'bottom', 1, NULL, 'Need Winter Boots?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam, quis nostrud exercitation', 'Shop Now', '#', 'left', 'TrkZB1697623027', 5, '2023-10-18 07:57:07', '2023-10-19 01:32:09');

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
(4, 9, 'Flat A2, House 4 Rd No. 10', '1000', NULL, 'Mymensingh', 'Bangladesh', '2023-07-18 08:54:41', '2023-10-22 09:17:45'),
(9, 14, 'hh', NULL, 'Gopalganj Sadar', 'Gopalganj', NULL, '2023-10-25 06:33:57', NULL),
(10, 0, NULL, NULL, NULL, NULL, NULL, '2023-10-26 03:34:13', NULL);

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
(2, 3, 'blogImages/JRl7i1697623059.png', 'Fashion Trends In 2021 Styles, Colors, Accessories', NULL, NULL, NULL, 'fashion-trends-in-2021-styles-colors-accessories1697623059', 1, '2023-10-18 07:57:39', NULL),
(3, 2, 'blogImages/qje301697623144.png', 'Lauryn Hill Could Make Tulle Skirt and Cowboy', NULL, NULL, NULL, 'lauryn-hill-could-make-tulle-skirt-and-cowboy1697623144', 1, '2023-10-18 07:59:04', NULL),
(4, 4, 'blogImages/HIFbw1697623177.png', 'Fashion Trends In 2021 Styles, Colors, Accessories', NULL, NULL, NULL, 'fashion-trends-in-2021-styles-colors-accessories1697623177', 1, '2023-10-18 07:59:37', NULL);

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
(2, 'A', 'a1697622668', 1, 1, 1, '2023-10-18 07:51:08', '2023-10-18 07:51:36'),
(3, 'B', 'b1697622676', 1, 1, 1, '2023-10-18 07:51:16', '2023-10-18 07:51:47'),
(4, 'C', 'c1697622682', 1, 1, 1, '2023-10-18 07:51:22', '2023-10-18 07:52:12');

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
(18, 'Jacket', NULL, NULL, 1, 1, 1, 'jacket', '2023-10-18 08:44:12', '2023-10-18 08:51:12'),
(19, 'Women', NULL, NULL, 1, 1, 2, 'women', '2023-10-18 08:48:06', '2023-10-26 11:30:01'),
(20, 'Oversize', NULL, NULL, 1, 1, 3, 'oversize', '2023-10-18 08:48:20', '2023-10-26 11:30:03'),
(21, 'Cottom', NULL, NULL, 1, 1, 4, 'cottom', '2023-10-18 08:48:39', '2023-10-26 11:30:05'),
(22, 'Shoulder', NULL, NULL, 1, 1, 5, 'shoulder', '2023-10-18 08:48:50', '2023-10-26 11:34:56'),
(23, 'Winter', NULL, NULL, 1, 1, 6, 'winter', '2023-10-18 08:49:14', '2023-10-26 11:30:08'),
(25, 'Dress', NULL, NULL, 1, 1, 8, 'dress', '2023-10-18 08:49:28', '2023-10-26 11:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_unique_cart_no` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `size_id` int(11) DEFAULT NULL,
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

INSERT INTO `carts` (`id`, `user_unique_cart_no`, `product_id`, `color_id`, `size_id`, `region_id`, `sim_id`, `storage_id`, `warrenty_id`, `device_condition_id`, `unit_id`, `qty`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(52, '1681588608321', 1, 2, NULL, 2, 2, 2, 2, 2, 1, 2, 200, 400, '2023-08-02 04:09:38', NULL);

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
(10, 'Denim Jacket', 'category_images/sdhde1697625305.png', NULL, 'denim-jacket', 1, 0, 1, '2023-10-18 08:33:22', '2023-10-18 08:35:05'),
(11, 'Oversize Cotton', 'category_images/6yyC91697625373.png', NULL, 'oversize-cotton', 1, 0, 1, '2023-10-18 08:36:13', NULL),
(12, 'Dairy & chesse', 'category_images/kIkYT1697625398.png', NULL, 'dairy-chesse', 1, 0, 1, '2023-10-18 08:36:38', NULL),
(13, 'Shoulder Bag', 'category_images/W0jso1697625429.png', NULL, 'shoulder-bag', 1, 0, 1, '2023-10-18 08:37:09', NULL),
(14, 'Jeans', NULL, NULL, 'jeans', 1, 0, 1, '2023-10-25 05:58:39', NULL);

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
(6, 'smtp.gmail.com', 587, 'getupadgency@gmail.com', 'qrRFO6vSKj6Otuq3XBPp1do=', 'Getup', 'getupadgency@gmail.com', 1, '1697948605aqOMD', 1, '2023-10-22 04:23:25', '2023-10-22 04:33:50');

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
(6, NULL, 'Featured', 1, 1, 'featured-q05Xt-1697604619', '2023-10-18 04:50:19', '2023-10-18 08:41:25'),
(7, NULL, 'Trending', 1, 1, 'trending-oHJN2-1697604626', '2023-10-18 04:50:26', '2023-10-18 08:41:22'),
(8, NULL, 'New Arrival', 1, 1, 'new-arrival-2lpLH-1697604635', '2023-10-18 04:50:35', '2023-10-18 08:41:19');

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
  `google_map_link` longtext DEFAULT NULL,
  `play_store_link` varchar(255) DEFAULT NULL,
  `app_store_link` varchar(255) DEFAULT NULL,
  `footer_copyright_text` varchar(255) DEFAULT NULL,
  `payment_banner` varchar(255) DEFAULT NULL,
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
  `tiktok` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `viber` varchar(255) DEFAULT NULL,
  `google_analytic_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Active; 0=>Inactive',
  `google_analytic_tracking_id` varchar(255) DEFAULT NULL,
  `google_tag_manager_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Active; 0=>Inactive',
  `google_tag_manager_id` varchar(255) DEFAULT NULL,
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

INSERT INTO `general_infos` (`id`, `logo`, `logo_dark`, `fav_icon`, `tab_title`, `company_name`, `short_description`, `contact`, `email`, `address`, `google_map_link`, `play_store_link`, `app_store_link`, `footer_copyright_text`, `payment_banner`, `primary_color`, `secondary_color`, `tertiary_color`, `title_color`, `paragraph_color`, `border_color`, `meta_title`, `meta_keywords`, `meta_description`, `custom_css`, `custom_js`, `facebook`, `instagram`, `twitter`, `linkedin`, `youtube`, `messenger`, `whatsapp`, `telegram`, `tiktok`, `pinterest`, `viber`, `google_analytic_status`, `google_analytic_tracking_id`, `google_tag_manager_status`, `google_tag_manager_id`, `fb_pixel_status`, `fb_pixel_app_id`, `tawk_chat_status`, `tawk_chat_link`, `crisp_chat_status`, `crisp_website_id`, `about_us`, `created_at`, `updated_at`) VALUES
(1, 'company_logo/tGAYZ1697968457.png', 'company_logo/1oSnf1697620395.png', 'company_logo/LpoYM1697970480.png', 'Fashionista', 'Fashionista', 'We are committed to digitalizing your business. We provide Integrated marketing company that delivers graphics, web, and marketing solutions.', '+01234-567890,+01234-5688765', 'demo@gmail.com,info@example.com', '123 Stree New York City , United States Of America NY 750065', 'https://www.google.com/maps/dir//U.S.+Embassy,+London+33+Nine+Elms+Ln+Nine+Elms,+London+SW11+7US+United+Kingdom/@51.4825655,-0.1322369,15z/data=!4m8!4m7!1m0!1m5!1m1!1s0x48760532743b90e1:0x790260718555a20c!2m2!1d-0.1322369!2d51.4825655?entry=ttu', 'https://play.google.com/store', 'https://www.apple.com/app-store/', '© 2022 FashionIsta', 'company_logo/iexIV1697970944.png', '#6aa84f', '#8e7cc3', '#c27ba0', '#ffd966', '#0b5394', '#5b5b5b', 'TechLand', 'tech,it,technical', 'Technical', '.custom{\r\n  width: 100%;\r\n  height: 100%;\r\n}', '<script>\r\n	var meDev = \"Code Sleep Eat\";\r\n	console.log(data);\r\n</script>', 'https://facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.youtube.com', 'https://web.facebook.com', 'https://web.whatsapp.com', 'https://telegram.com', 'https://www.tiktok.com/@reazuyhking68', 'https://www.pinterest.com/ideas/gr-recipes/92150330519/', 'https://www.viber.com/ru/blog/2023', 1, 'UA-842191520-669T', 0, 'GTM-546FMKZS', 1, 'wqwe', 0, 'https://embed.tawk.to/5a7c31ed7591465c7077c48/default', 1, NULL, NULL, NULL, '2023-11-05 04:17:26');

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
(93, '2023_04_13_002226_create_banners_table', 44),
(94, '2023_10_18_135527_create_about_us_table', 45),
(95, '2023_10_22_122627_create_product_sizes_table', 46);

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
(1, '1689601753866', 23, '2023-07-17 19:49:13', '2023-07-24', NULL, '', 1, 1, '1689601753icKfT', 'Not Available (COD)', 0, 134500, NULL, 0, 100, 0, 0, 134600, '', NULL, 'y8IlF1689601753', 1, '2023-07-17 23:49:13', '2023-10-26 08:50:44'),
(2, '1689660747209', 23, '2023-07-18 12:12:27', '2023-07-25', NULL, '', NULL, 0, '1689660747nBBFs', NULL, 0, 115000, NULL, 0, 0, 0, 0, 115000, '', NULL, 'NHy8P1689660747', 0, '2023-07-18 06:12:27', '2023-07-18 06:12:27'),
(3, '1689661552576', 23, '2023-07-18 12:25:52', '2023-07-25', NULL, '', NULL, 0, '1689661552ybmES', NULL, 0, 115000, NULL, 0, 0, 0, 0, 115000, '', NULL, 'aClNv1689661552', 0, '2023-07-18 06:25:52', '2023-07-18 06:25:53'),
(4, '1689668976893', 35, '2023-07-18 14:29:36', '2023-07-25', NULL, '', NULL, 0, '1689668976rPEtA', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'XTFRa1689668976', 0, '2023-07-18 08:29:36', NULL),
(5, '1689669097583', 35, '2023-07-18 14:31:37', '2023-07-25', NULL, '', NULL, 0, '1689669097nA79o', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'gFjl71689669097', 0, '2023-07-18 08:31:37', NULL),
(6, '1689669262197', 23, '2023-07-18 14:34:22', '2023-07-25', NULL, '', 1, 1, '1689669262uB2Mp', 'Not Available (COD)', 0, 115000, NULL, 0, 100, 0, 0, 115100, '', NULL, 'NvdIM1689669262', 1, '2023-07-18 08:34:22', '2023-07-18 08:34:22'),
(7, '1689669807556', 35, '2023-07-18 14:43:27', '2023-07-25', NULL, '', NULL, 0, '1689669807utQrJ', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'uOcnS1689669807', 0, '2023-07-18 08:43:27', NULL),
(8, '1689670104700', 35, '2023-07-18 14:48:24', '2023-07-25', NULL, '', NULL, 0, '1689670104s5gtl', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, '3tcFc1689670104', 0, '2023-07-18 08:48:24', NULL),
(9, '1689670481629', NULL, '2023-07-18 14:54:41', '2023-07-25', NULL, '', 1, 1, '1689670481uRKui', 'Not Available (COD)', 0, 545100, NULL, 0, 100, 0, 0, 545200, '', NULL, 'wPRVx1689670481', 1, '2023-07-18 08:54:41', '2023-10-22 09:17:45'),
(10, '1689673103748', 35, '2023-07-18 15:38:23', '2023-07-25', NULL, '', NULL, 0, '1689673103rmIKt', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'DEQEA1689673103', 0, '2023-07-18 09:38:23', NULL),
(11, '1689673132520', 35, '2023-07-18 15:38:52', '2023-07-25', NULL, '', NULL, 0, '16896731327Tg9B', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, 'Jvwqy1689673132', 0, '2023-07-18 09:38:52', NULL),
(12, '1689673273174', 35, '2023-07-18 15:41:13', '2023-07-25', NULL, '', NULL, 0, '1689673273XAEC3', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '', NULL, '4xRod1689673273', 0, '2023-07-18 09:41:13', NULL),
(13, '1690345802546', NULL, '2023-07-26 10:30:02', '2023-08-02', NULL, NULL, NULL, 0, '1690345802FMqFF', NULL, 2, 400, '1YUIFWW', 0, 0, 0, 0, 400, NULL, NULL, 'zUUxH1690345802', 0, '2023-07-26 04:30:02', '2023-10-22 08:14:45'),
(14, '1698222836533', 55, '2023-10-25 14:33:56', '2023-11-01', NULL, '1', 1, 1, '1698222836tI1ff', 'Not Available (COD)', 0, 1290, 'hh', 0, 100, 0, 0, 1390, '', NULL, 'IB2tg1698222836', 1, '2023-10-25 06:33:56', '2023-10-25 06:33:57'),
(15, '1698300256594', 55, '2023-10-26 12:04:16', '2023-11-02', NULL, '1', NULL, 0, '1698300256G6UvV', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, 'CGnuK1698300256', 0, '2023-10-26 04:04:16', NULL),
(16, '1698300290472', 55, '2023-10-26 12:04:50', '2023-11-02', NULL, '1', NULL, 0, '1698300290FK8KD', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, 'toZq81698300290', 0, '2023-10-26 04:04:50', NULL),
(17, '1698300310280', 55, '2023-10-26 12:05:10', '2023-11-02', NULL, '1', NULL, 0, '1698300310YEspy', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, '0QOsU1698300310', 0, '2023-10-26 04:05:10', NULL),
(18, '1698300321234', 55, '2023-10-26 12:05:21', '2023-11-02', NULL, '1', NULL, 0, '1698300321iHzj6', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, 'YlUQB1698300321', 0, '2023-10-26 04:05:21', NULL),
(19, '1698300330621', 55, '2023-10-26 12:05:30', '2023-11-02', NULL, '1', NULL, 0, '1698300330ucYGU', NULL, 0, 1400, 'OFF20', 0, 0, 0, 0, 1400, '\"Quickly Need\"', NULL, 'YmLrn1698300330', 0, '2023-10-26 04:05:30', '2023-10-26 04:05:30'),
(20, '1698300996361', 55, '2023-10-26 12:16:36', '2023-11-02', NULL, '1', NULL, 0, '1698300996vZLbG', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, 'U9VvI1698300996', 0, '2023-10-26 04:16:36', NULL),
(21, '1698301013564', 55, '2023-10-26 12:16:53', '2023-11-02', NULL, '1', NULL, 0, '1698301013yHzSp', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, '0Tckc1698301013', 0, '2023-10-26 04:16:53', NULL),
(22, '1698301051252', 55, '2023-10-26 12:17:31', '2023-11-02', NULL, '1', NULL, 0, '1698301051Up5XO', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '\"Quickly Need\"', NULL, 'sEXiV1698301051', 0, '2023-10-26 04:17:31', NULL),
(23, '1698301075217', 55, '2023-10-26 12:17:55', '2023-11-02', NULL, '1', NULL, 0, '1698301075Fx9wC', NULL, 0, 1400, 'OFF20', 0, 0, 0, 0, 1400, '\"Quickly Need\"', NULL, 'aEV3E1698301075', 0, '2023-10-26 04:17:55', '2023-10-26 04:17:56'),
(24, '1698301083839', 55, '2023-10-26 12:18:03', '2023-11-02', NULL, '1', NULL, 0, '169830108305aE7', NULL, 0, 1400, 'OFF20', 0, 0, 0, 0, 1400, '\"Quickly Need\"', NULL, 'oENX21698301083', 0, '2023-10-26 04:18:03', '2023-10-26 04:18:03'),
(25, '1698302472705', 55, '2023-10-26 12:41:12', '2023-11-02', NULL, '1', NULL, 0, '1698302472JfmvW', NULL, 0, 700, 'OFF20', 0, 0, 0, 0, 700, '\"Quickly Need\"', NULL, 'nrnbC1698302472', 0, '2023-10-26 04:41:12', '2023-10-26 04:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL COMMENT 'Variant',
  `size_id` int(11) DEFAULT NULL COMMENT 'Variant',
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

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `color_id`, `size_id`, `region_id`, `sim_id`, `storage_id`, `warrenty_id`, `device_condition_id`, `unit_id`, `qty`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, NULL, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-17 23:49:13', NULL),
(2, 1, 2, 0, NULL, 0, 0, 0, 1, 0, 0, 1, 19500, 19500, '2023-07-17 23:49:13', NULL),
(3, 2, 1, 5, NULL, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-18 06:12:27', NULL),
(4, 3, 1, 5, NULL, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-18 06:25:52', NULL),
(5, 6, 1, 5, NULL, 226, 2, 2, 1, 1, 0, 1, 115000, 115000, '2023-07-18 08:34:22', NULL),
(8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 200, 200, '2023-07-26 04:30:02', NULL),
(24, 9, 1, 5, 0, 226, 2, 2, 1, 1, 0, 2, 115000, 230000, NULL, '2023-10-22 09:17:45'),
(25, 9, 1, 1, 0, 226, 4, 2, 1, 1, 0, 3, 105000, 315000, NULL, '2023-10-22 09:17:45'),
(26, 9, 21, 6, 6, 0, 0, 0, 8, 0, 2, 1, 100, 100, NULL, '2023-10-22 09:17:45'),
(27, 14, 28, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1290, 1290, '2023-10-25 06:33:56', NULL),
(28, 19, 24, 12, NULL, 0, 0, 0, 0, 0, 2, 2, 700, 1400, '2023-10-26 04:05:30', NULL),
(29, 20, 24, 12, NULL, 0, 0, 0, 0, 0, 2, 2, 700, 1400, '2023-10-26 04:16:36', NULL),
(30, 21, 24, 12, NULL, 0, 0, 0, 0, 0, 2, 2, 700, 1400, '2023-10-26 04:16:53', NULL),
(31, 23, 24, 12, NULL, 0, 0, 0, 0, 0, 2, 2, 700, 1400, '2023-10-26 04:17:55', NULL),
(32, 24, 24, 12, NULL, 0, 0, 0, 0, 0, 2, 2, 700, 1400, '2023-10-26 04:18:03', NULL),
(33, 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 700, 700, '2023-10-26 04:41:12', NULL);

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
(3, 9, 'COD', NULL, NULL, '545100', NULL, '545100', NULL, NULL, 'VALID', '2023-07-18 14:54:42', 'BDT', NULL, NULL, NULL, NULL, NULL, '2023-07-18 08:54:42', NULL),
(4, 14, 'COD', NULL, NULL, '1390', NULL, '1390', NULL, NULL, 'VALID', '2023-10-25 14:33:57', 'BDT', NULL, NULL, NULL, NULL, NULL, '2023-10-25 06:33:57', NULL);

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
(14, 13, 1, '2023-08-06 08:15:39', NULL),
(15, 13, 2, '2023-10-22 08:14:45', NULL),
(16, 14, 0, '2023-10-25 06:33:56', NULL),
(17, 15, 0, '2023-10-26 04:04:16', NULL),
(18, 16, 0, '2023-10-26 04:04:50', NULL),
(19, 17, 0, '2023-10-26 04:05:10', NULL),
(20, 18, 0, '2023-10-26 04:05:21', NULL),
(21, 19, 0, '2023-10-26 04:05:30', NULL),
(22, 20, 0, '2023-10-26 04:16:36', NULL),
(23, 21, 0, '2023-10-26 04:16:53', NULL),
(24, 22, 0, '2023-10-26 04:17:31', NULL),
(25, 23, 0, '2023-10-26 04:17:55', NULL),
(26, 24, 0, '2023-10-26 04:18:03', NULL),
(27, 25, 0, '2023-10-26 04:41:12', NULL);

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
(1, 'ssl_commerz', 'sodai644d7015e8eb1', 'sodai644d7015e8eb1@ssl', 'alifhossain174', '12345678', 1, 1, NULL, '2023-10-18 08:16:01'),
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
(1, 'App\\Models\\User', 45, 'GenericCommerceV1', '5f622f837408e3b7751d5294eba7e2501f361b861f1de040cb87acd546225d9a', '[\"*\"]', NULL, '2023-10-22 05:26:44', '2023-10-22 05:26:44'),
(2, 'App\\Models\\User', 45, 'GenericCommerceV1', '3a5417e30d83a07253267e1b0fd98f703eecdf6ae7335af04a0942fa69a9dc02', '[\"*\"]', NULL, '2023-10-22 05:36:17', '2023-10-22 05:36:17'),
(3, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a784342214375711e75696778877abba05335936f13e535f3d2cc884bcb1016d', '[\"*\"]', NULL, '2023-10-22 05:36:20', '2023-10-22 05:36:20'),
(4, 'App\\Models\\User', 45, 'GenericCommerceV1', '5fc644144334ee3969fc639e92d92dc40b541fa00a8ffd1551aeaaa34d4145a4', '[\"*\"]', NULL, '2023-10-22 05:36:21', '2023-10-22 05:36:21'),
(5, 'App\\Models\\User', 45, 'GenericCommerceV1', '705c5e3baea430b64b630b2e88166214217a77028e25cbe47525d85c711ebbfb', '[\"*\"]', NULL, '2023-10-22 05:47:07', '2023-10-22 05:47:07'),
(6, 'App\\Models\\User', 47, 'GenericCommerceV1', '2388a53dd887103a43a847b66b124c45023240b16ce638d5ed047ab2ff8da253', '[\"*\"]', NULL, '2023-10-22 06:11:03', '2023-10-22 06:11:03'),
(7, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e696aa4794f7c7d7d0eb368ff94a1fb40ead43ea4627d6eb0cc0169b0d8b2ace', '[\"*\"]', NULL, '2023-10-22 06:22:06', '2023-10-22 06:22:06'),
(8, 'App\\Models\\User', 45, 'GenericCommerceV1', '7f6f721a59c5cd621339967c1cf839ffeda8fd726433337e034b7b3cd58342b6', '[\"*\"]', NULL, '2023-10-22 06:22:25', '2023-10-22 06:22:25'),
(9, 'App\\Models\\User', 45, 'GenericCommerceV1', '8481956bea6bddc09dfff4f5ff49ef4657feed8ee5df0e2fa265710361328798', '[\"*\"]', NULL, '2023-10-22 06:22:40', '2023-10-22 06:22:40'),
(10, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e41b762ed9153d989b361911717c2f8f8edb8bfee6f293096ed444c7d1b55a5a', '[\"*\"]', NULL, '2023-10-23 04:20:05', '2023-10-23 04:20:05'),
(11, 'App\\Models\\User', 45, 'GenericCommerceV1', '6f0cd41da7378f3cfbaaefe73ad3cfcc8f9c49c9f3e208497e594f320eafe249', '[\"*\"]', NULL, '2023-10-23 04:35:56', '2023-10-23 04:35:56'),
(12, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd121c7e34e276d2e964b5fb7dd07870cbf5b16c142676e3474b6a2bd919086be', '[\"*\"]', NULL, '2023-10-23 04:47:34', '2023-10-23 04:47:34'),
(13, 'App\\Models\\User', 45, 'GenericCommerceV1', '95aa989c2e6d5b09e9642d2eef3a2a168f5f2733f8bdd7d4b3a67e9838804730', '[\"*\"]', NULL, '2023-10-23 06:38:35', '2023-10-23 06:38:35'),
(14, 'App\\Models\\User', 45, 'GenericCommerceV1', '68fe5ed63d3e66b6f75dcfbe8517c7e6390272dbf4308e0c40f06b9ee82fc33a', '[\"*\"]', NULL, '2023-10-23 06:38:54', '2023-10-23 06:38:54'),
(15, 'App\\Models\\User', 45, 'GenericCommerceV1', 'af231b972593f4ba67288e7b93fa01c77dcb6ee8365ac4e12e5e8b6a6211cccf', '[\"*\"]', NULL, '2023-10-23 06:40:09', '2023-10-23 06:40:09'),
(16, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd0071869a685c9f90ae548a091e240d3de8f3f26e72e4c926707b49c65ed73ce', '[\"*\"]', NULL, '2023-10-23 08:32:55', '2023-10-23 08:32:55'),
(17, 'App\\Models\\User', 45, 'GenericCommerceV1', 'c0cd27c6ea6ba817851700b51d518b811474bc860120c2d147b5e4057e10e873', '[\"*\"]', NULL, '2023-10-23 09:09:32', '2023-10-23 09:09:32'),
(18, 'App\\Models\\User', 45, 'GenericCommerceV1', 'c3047b96f3bc19739d050e2c6b4c13f09894edc0be070fa017c7045f0fc8fd0c', '[\"*\"]', NULL, '2023-10-23 09:25:31', '2023-10-23 09:25:31'),
(19, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a479acbec466649f17da51ad331b8f11b36e7ebd5ef80f4a26bb85c6f73aa137', '[\"*\"]', NULL, '2023-10-23 09:28:37', '2023-10-23 09:28:37'),
(20, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e4a3bcd422038984c618ccd6bd472fa98fadd37ac5c8cfc12a7542917c6b435f', '[\"*\"]', NULL, '2023-10-23 09:35:44', '2023-10-23 09:35:44'),
(21, 'App\\Models\\User', 45, 'GenericCommerceV1', 'b06b9853e4893af16eb9920fa341f5983951a95ca82266d530abef97815bb56c', '[\"*\"]', NULL, '2023-10-23 09:36:07', '2023-10-23 09:36:07'),
(22, 'App\\Models\\User', 45, 'GenericCommerceV1', 'bf45877044565542a1d4750292e5398dbc59f6e9ec4c8ad86f05805a8530fe85', '[\"*\"]', NULL, '2023-10-23 09:37:51', '2023-10-23 09:37:51'),
(23, 'App\\Models\\User', 45, 'GenericCommerceV1', 'fd0c83844dc98300ce8f0d6792c7f39ec766422e68cddd82dc69529e533cc9d6', '[\"*\"]', NULL, '2023-10-23 09:38:15', '2023-10-23 09:38:15'),
(24, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e6c86a6fcc9dc59acee1cc6d7f43dc953bc30668a7f4b98ef645b390f8c0ea9d', '[\"*\"]', NULL, '2023-10-23 09:38:35', '2023-10-23 09:38:35'),
(25, 'App\\Models\\User', 45, 'GenericCommerceV1', '2f92ae6b1ddc367fafdb6efeda07e5ff3b1de0ac137a47f99d5d6ea6302b7cb3', '[\"*\"]', NULL, '2023-10-23 09:43:42', '2023-10-23 09:43:42'),
(26, 'App\\Models\\User', 45, 'GenericCommerceV1', '0b6e109e3d9492a5c6ae9bf4cefe4c056cda23cad4077e047656b16325bb6733', '[\"*\"]', NULL, '2023-10-23 09:50:43', '2023-10-23 09:50:43'),
(27, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd5344ce88f8d6d7a9b2bc020c69777061682c776e3d15d88845731851355e076', '[\"*\"]', NULL, '2023-10-23 09:54:37', '2023-10-23 09:54:37'),
(28, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e21b1eda89d3a3d39fb483a3ea91ead6bf719d5721270c08b84d2c4b34aa921f', '[\"*\"]', NULL, '2023-10-23 09:57:39', '2023-10-23 09:57:39'),
(29, 'App\\Models\\User', 45, 'GenericCommerceV1', '22f9ab57329d754d4df61dfe023be3db9d21050726ee2976cf915d01294f3f31', '[\"*\"]', NULL, '2023-10-23 10:07:09', '2023-10-23 10:07:09'),
(30, 'App\\Models\\User', 45, 'GenericCommerceV1', '2adb7f360a7371351322b3fde7a8cdbdb6c7c304bb0e89b6c9a20c65a669f78f', '[\"*\"]', NULL, '2023-10-23 10:11:00', '2023-10-23 10:11:00'),
(31, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd511440574564dba5ebc81e46be3d0205c04b6f94537be1dca9c065d1f9d193c', '[\"*\"]', NULL, '2023-10-23 10:12:33', '2023-10-23 10:12:33'),
(32, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e50464b8536e832e7f2d95d9547d29aef59b4ecfe668bdb25a25c702e90ea9ae', '[\"*\"]', NULL, '2023-10-23 10:38:37', '2023-10-23 10:38:37'),
(33, 'App\\Models\\User', 55, 'GenericCommerceV1', '272548637ba2bb77556a7053a4b5dcefc4db2f47defd0be343fe90501b8e7bdd', '[\"*\"]', NULL, '2023-10-25 02:00:12', '2023-10-25 02:00:12'),
(34, 'App\\Models\\User', 55, 'GenericCommerceV1', 'cd8a8171cb4f47570e2e7dc9368373a38710722e0447a7e486445e5f6cdb3d8d', '[\"*\"]', NULL, '2023-10-25 02:16:50', '2023-10-25 02:16:50'),
(35, 'App\\Models\\User', 55, 'GenericCommerceV1', '48e2bd04a01d8217faf69b0d0033b47cb55d622ddfa4f6d637149d8dfe7c6587', '[\"*\"]', NULL, '2023-10-25 02:49:03', '2023-10-25 02:49:03'),
(36, 'App\\Models\\User', 55, 'GenericCommerceV1', '17e3532105c6a7e5d3b672f03cbb7ea2a1562bff53856b905018d443cf30a116', '[\"*\"]', '2023-10-25 04:09:51', '2023-10-25 03:03:23', '2023-10-25 04:09:51'),
(37, 'App\\Models\\User', 55, 'GenericCommerceV1', '8299d08d3ed071059fedc28f65e5318b6db08b3f6af7049dbe75138cf758c10a', '[\"*\"]', '2023-10-25 03:08:04', '2023-10-25 03:07:35', '2023-10-25 03:08:04'),
(38, 'App\\Models\\User', 55, 'GenericCommerceV1', 'ed9be3661b9874688dc66bd1c530392bc519b28620524e79c046973e57fd2e43', '[\"*\"]', '2023-10-25 04:21:21', '2023-10-25 04:10:16', '2023-10-25 04:21:21'),
(39, 'App\\Models\\User', 45, 'GenericCommerceV1', '3dbfce91ab523774683f5caa491c78b52840697dd22e91f56d7dc3d043383c1a', '[\"*\"]', NULL, '2023-10-25 04:21:09', '2023-10-25 04:21:09'),
(40, 'App\\Models\\User', 45, 'GenericCommerceV1', '4ec7d4c30481526a12dee61265e892b635a5af051441c27c2f0617e8ed7b88d1', '[\"*\"]', NULL, '2023-10-25 04:22:43', '2023-10-25 04:22:43'),
(41, 'App\\Models\\User', 45, 'GenericCommerceV1', '36aefc3f061a57cd2fd76bf88b8aad6a5fd7976057825b73f27e6d0a51e8be9a', '[\"*\"]', NULL, '2023-10-25 04:23:53', '2023-10-25 04:23:53'),
(42, 'App\\Models\\User', 45, 'GenericCommerceV1', '0b0baf35d5c1ec371c39a0299ba5a1a2ab31c4185ea229434b918c476935e169', '[\"*\"]', NULL, '2023-10-25 04:26:31', '2023-10-25 04:26:31'),
(43, 'App\\Models\\User', 45, 'GenericCommerceV1', '5cd9c60a889fbe01bd596f5bf590013c6fefa7adfcd37c849bea8ae5e22d56ee', '[\"*\"]', NULL, '2023-10-25 04:28:40', '2023-10-25 04:28:40'),
(44, 'App\\Models\\User', 45, 'GenericCommerceV1', '23c803e23fc08ad4d12348e7d9e4b63125742156989941a7f630f48b56d29f15', '[\"*\"]', NULL, '2023-10-25 04:29:17', '2023-10-25 04:29:17'),
(45, 'App\\Models\\User', 45, 'GenericCommerceV1', '70ac0543f32f1c4ed63210d95b4d61af2555049208b3b81d801a1ab1f31f713a', '[\"*\"]', NULL, '2023-10-25 04:32:48', '2023-10-25 04:32:48'),
(46, 'App\\Models\\User', 55, 'GenericCommerceV1', '4b3e83bb93fce480f9b1accaae652172c49a386b5a18eec71be4a7e3394c855c', '[\"*\"]', NULL, '2023-10-25 04:33:08', '2023-10-25 04:33:08'),
(47, 'App\\Models\\User', 45, 'GenericCommerceV1', '2ad59a41a9aed3dc35e0c30bba71da177c573bc6b0d3b85ebd6c4a785d32d7bf', '[\"*\"]', NULL, '2023-10-25 04:33:50', '2023-10-25 04:33:50'),
(48, 'App\\Models\\User', 45, 'GenericCommerceV1', 'ae11615775290b3f3c2b882f9972b3b35ef38bff6ba236b26c236d7502e976cc', '[\"*\"]', NULL, '2023-10-25 04:35:34', '2023-10-25 04:35:34'),
(49, 'App\\Models\\User', 55, 'GenericCommerceV1', '286e10cb80304d9d537f566a24061331bc6cab878c70ead75991e6a42b092894', '[\"*\"]', NULL, '2023-10-25 04:37:26', '2023-10-25 04:37:26'),
(50, 'App\\Models\\User', 55, 'GenericCommerceV1', 'aef60e51422dd7ab9e53bddefb755a429dcc0f7739edcc265bcb3696f6c51202', '[\"*\"]', NULL, '2023-10-25 04:41:01', '2023-10-25 04:41:01'),
(51, 'App\\Models\\User', 55, 'GenericCommerceV1', 'b912bc531f4f01dbbf660f851eecbde7f6456a4ea52ae91b127385d6799b087c', '[\"*\"]', NULL, '2023-10-25 04:43:54', '2023-10-25 04:43:54'),
(52, 'App\\Models\\User', 45, 'GenericCommerceV1', '912f35c8df3d0b85ed0d6e33bfbbfe404be0074d3a67b3bfd2b0b944179e5bf1', '[\"*\"]', NULL, '2023-10-25 04:45:08', '2023-10-25 04:45:08'),
(53, 'App\\Models\\User', 45, 'GenericCommerceV1', '876e48f670f83d57e3506f65473a32184c4176ab359cad2fc73ec002157dcbcd', '[\"*\"]', NULL, '2023-10-25 04:46:30', '2023-10-25 04:46:30'),
(54, 'App\\Models\\User', 55, 'GenericCommerceV1', '781403189c2f726e4e3d8e4d1afeafd6da5dff007f6b943151582ed30a13a93b', '[\"*\"]', '2023-10-25 06:37:50', '2023-10-25 04:47:23', '2023-10-25 06:37:50'),
(55, 'App\\Models\\User', 45, 'GenericCommerceV1', 'cea64887a3a44729638d9886edb283e6dcd77d4041aa7035b6035361f37f02b6', '[\"*\"]', NULL, '2023-10-25 04:55:10', '2023-10-25 04:55:10'),
(56, 'App\\Models\\User', 45, 'GenericCommerceV1', 'ecaae5d264a2c52f3a50a6771cb561f004d78e2852029576793de91151227287', '[\"*\"]', NULL, '2023-10-25 04:56:51', '2023-10-25 04:56:51'),
(57, 'App\\Models\\User', 45, 'GenericCommerceV1', '0d456d3354130d3db91e79ac027a3cb583dfe1d0a126631217967b408ebae349', '[\"*\"]', NULL, '2023-10-25 04:57:42', '2023-10-25 04:57:42'),
(58, 'App\\Models\\User', 45, 'GenericCommerceV1', '3cbdb577356b2c6952e55afe10ff1420c09ce91bcc6b2958673e9aeb12dec3ea', '[\"*\"]', NULL, '2023-10-25 04:59:00', '2023-10-25 04:59:00'),
(59, 'App\\Models\\User', 45, 'GenericCommerceV1', '586ec35334bf08cf910dda235363d86952a914b3acd31296eccc4fb59a14f048', '[\"*\"]', NULL, '2023-10-25 04:59:29', '2023-10-25 04:59:29'),
(60, 'App\\Models\\User', 45, 'GenericCommerceV1', '25edd058dd2b8a037c5842138bdf27576cb9127532ac4892b79a070a136017cc', '[\"*\"]', NULL, '2023-10-25 05:00:16', '2023-10-25 05:00:16'),
(61, 'App\\Models\\User', 45, 'GenericCommerceV1', '31fd4aa7aacec2de74746149b1cd696d9cc2ba8e815f5ab0f5c38f0941fa8e94', '[\"*\"]', NULL, '2023-10-25 05:01:35', '2023-10-25 05:01:35'),
(62, 'App\\Models\\User', 45, 'GenericCommerceV1', '62312372290ea24ea52c94ed9a327e3423c53c322bc669d776452bf7eb0c1af5', '[\"*\"]', NULL, '2023-10-25 05:03:02', '2023-10-25 05:03:02'),
(63, 'App\\Models\\User', 45, 'GenericCommerceV1', '2ea1cfdeed3fa6ba6cb38c15806cef720425b4e287a7fad60ebc0e045963f464', '[\"*\"]', NULL, '2023-10-25 05:04:56', '2023-10-25 05:04:56'),
(64, 'App\\Models\\User', 45, 'GenericCommerceV1', 'cf99b72b7974aa68ef04644c0304d59da4a7b772cff720e3709ed551e5f66a4d', '[\"*\"]', NULL, '2023-10-25 05:05:18', '2023-10-25 05:05:18'),
(65, 'App\\Models\\User', 45, 'GenericCommerceV1', '14189e48adc86bfa970d5668a55e6041b67c3a1ee1daaac31835856bd34cd5f3', '[\"*\"]', NULL, '2023-10-25 05:15:56', '2023-10-25 05:15:56'),
(66, 'App\\Models\\User', 45, 'GenericCommerceV1', 'c2f85546cd587d996521485a33bbca2d26bcba690b4459afdee3afffb0ad59b8', '[\"*\"]', NULL, '2023-10-25 05:26:43', '2023-10-25 05:26:43'),
(67, 'App\\Models\\User', 45, 'GenericCommerceV1', '0101b5e70e7e1e84afa36b7c3c00afe117bc9d77a0df4cc59752425d3b4dd1e0', '[\"*\"]', NULL, '2023-10-25 05:27:12', '2023-10-25 05:27:12'),
(68, 'App\\Models\\User', 45, 'GenericCommerceV1', '63df89bc70d1a41cca3e6486bcb4263b38b0f9631d709711a08c07f33d02bd5c', '[\"*\"]', NULL, '2023-10-25 05:29:26', '2023-10-25 05:29:26'),
(69, 'App\\Models\\User', 45, 'GenericCommerceV1', '8724faf90466374c124798566ae9d44640225144fcce7aae9ad30357d0dec7b4', '[\"*\"]', NULL, '2023-10-25 05:31:51', '2023-10-25 05:31:51'),
(70, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a81f43718b47234b651605e9479d893d6ace999355d92fad812c0b47cb07f95a', '[\"*\"]', '2023-10-26 04:38:30', '2023-10-25 05:46:28', '2023-10-26 04:38:30'),
(71, 'App\\Models\\User', 45, 'GenericCommerceV1', 'f1d8f44ab51199d9e1a697b00b7b9a3947b1a06f156632992c9f99b6712b4e79', '[\"*\"]', NULL, '2023-10-25 06:05:22', '2023-10-25 06:05:22'),
(72, 'App\\Models\\User', 55, 'GenericCommerceV1', '183562a6754689a6a1aa7c12f2c2c0e8e9db2098280d41762ddee663c96d869a', '[\"*\"]', '2023-10-26 04:41:12', '2023-10-25 06:39:48', '2023-10-26 04:41:12'),
(73, 'App\\Models\\User', 45, 'GenericCommerceV1', '7363d64b17d23840e1ce98865c29f86755278390b7e0ec585f56955355950bc7', '[\"*\"]', '2023-10-25 08:36:13', '2023-10-25 08:21:44', '2023-10-25 08:36:13'),
(74, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e614e6a3f893a857e93880034c7bf1d46f6872509be7238f921fdf933053a615', '[\"*\"]', '2023-10-25 09:12:06', '2023-10-25 08:42:24', '2023-10-25 09:12:06'),
(75, 'App\\Models\\User', 45, 'GenericCommerceV1', '28e537da1ceec6328c00a68f43a7ca574d52ef787983f964704e6e37fd605450', '[\"*\"]', '2023-10-25 09:12:47', '2023-10-25 09:12:27', '2023-10-25 09:12:47'),
(76, 'App\\Models\\User', 45, 'GenericCommerceV1', '67de33fac8224cef05e1e33551e54de9a3aa0b827a2cfc7310832ce3252f2e0a', '[\"*\"]', '2023-10-25 09:13:28', '2023-10-25 09:12:58', '2023-10-25 09:13:28'),
(77, 'App\\Models\\User', 45, 'GenericCommerceV1', '0b32faca29202be691f838ab939d42b090433cd25cec09ca6f83c891a2b510a6', '[\"*\"]', '2023-10-25 09:27:15', '2023-10-25 09:13:48', '2023-10-25 09:27:15'),
(78, 'App\\Models\\User', 45, 'GenericCommerceV1', '6c66b1b2209c4c125f20e2b2bf2fc7124507db661ddf5000caf7ce5a95d8eac1', '[\"*\"]', '2023-10-25 09:28:50', '2023-10-25 09:28:46', '2023-10-25 09:28:50'),
(79, 'App\\Models\\User', 45, 'GenericCommerceV1', '4d43e9c7eb7e02cd6557736ff11c2bd1d489547f77bfc619a87904d0138943a9', '[\"*\"]', '2023-10-25 09:30:17', '2023-10-25 09:30:07', '2023-10-25 09:30:17'),
(80, 'App\\Models\\User', 45, 'GenericCommerceV1', '358b3f8a24286ff800832e8e62cd0c575cc8273e06d2959b922a5cffed39f050', '[\"*\"]', '2023-10-25 09:31:21', '2023-10-25 09:31:14', '2023-10-25 09:31:21'),
(81, 'App\\Models\\User', 45, 'GenericCommerceV1', '28d6df44ca1961c115954523248a38f3316d95a57159bb3e3e4e8df86442024e', '[\"*\"]', '2023-10-25 09:33:03', '2023-10-25 09:32:53', '2023-10-25 09:33:03'),
(82, 'App\\Models\\User', 45, 'GenericCommerceV1', '46727d262692803bfcfd9fb749f1baae34e7d180ca902e01c8c74a29b1e80a5b', '[\"*\"]', '2023-10-25 09:37:53', '2023-10-25 09:36:08', '2023-10-25 09:37:53'),
(83, 'App\\Models\\User', 45, 'GenericCommerceV1', '8be31eff5f20c8ac497aa21e2a265dfd170473befa1c79d13b783f6fa681e5fb', '[\"*\"]', '2023-10-26 04:22:15', '2023-10-26 02:57:18', '2023-10-26 04:22:15'),
(84, 'App\\Models\\User', 45, 'GenericCommerceV1', '248b9102132eb03d89dc624665c9adb1610a3a94e5cf359f49ac947c90098525', '[\"*\"]', '2023-10-26 04:48:10', '2023-10-26 04:22:21', '2023-10-26 04:48:10'),
(85, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a35a62b357e110c90350a0f3070b090c457e32b0a165a450bf91f1a534b6f3d0', '[\"*\"]', NULL, '2023-10-26 04:22:22', '2023-10-26 04:22:22'),
(86, 'App\\Models\\User', 45, 'GenericCommerceV1', '994a1174ebe4e0a19a9072dba394402ab1aac54de4fe05500a72e8358ab2a68c', '[\"*\"]', NULL, '2023-10-26 11:23:52', '2023-10-26 11:23:52'),
(87, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e3bd135da1ee0c23ebf8530a82b52ca619ce32779225731a30dc58a3fb69ae2f', '[\"*\"]', NULL, '2023-10-26 11:23:56', '2023-10-26 11:23:56'),
(88, 'App\\Models\\User', 45, 'GenericCommerceV1', '9c2d54246cb99eae893c0ec92f99877c3cc1ab4389361143a9000a6547261e30', '[\"*\"]', NULL, '2023-10-26 11:24:10', '2023-10-26 11:24:10'),
(89, 'App\\Models\\User', 45, 'GenericCommerceV1', 'b36572bc34f9c3bf564000cff3a2724820ff0afdd3139f06f3b17eb52f94a96c', '[\"*\"]', NULL, '2023-10-26 11:24:11', '2023-10-26 11:24:11'),
(90, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd11d3080463d864ed0a4725646f20990f84702f1f13fa6d9915b2de6d8a27208', '[\"*\"]', NULL, '2023-10-26 11:24:11', '2023-10-26 11:24:11'),
(91, 'App\\Models\\User', 45, 'GenericCommerceV1', '88d6944accff99c0f1b0c32adc2ef8305c20bc43066dcb931aa3b8b78240bf41', '[\"*\"]', NULL, '2023-10-26 11:25:20', '2023-10-26 11:25:20'),
(92, 'App\\Models\\User', 45, 'GenericCommerceV1', 'b4ce8757cf1db2140c8791f32d1065b8aa805cb1eb2967048642010b128311a1', '[\"*\"]', NULL, '2023-10-26 11:25:21', '2023-10-26 11:25:21'),
(93, 'App\\Models\\User', 45, 'GenericCommerceV1', '253870807dd4f64d4c8bf48f889775d56b2f165cacf45eba262de7b297251936', '[\"*\"]', NULL, '2023-10-26 11:25:22', '2023-10-26 11:25:22'),
(94, 'App\\Models\\User', 45, 'GenericCommerceV1', '177e1000127c6ac1363a361d64d485ae4770c7c035b3550967bab9d052eb8dc7', '[\"*\"]', NULL, '2023-10-26 11:25:22', '2023-10-26 11:25:22'),
(95, 'App\\Models\\User', 45, 'GenericCommerceV1', '0d972a50bd53ab615235d3c67bf42001eef1e68e0c587aa38aef34d0b419c14f', '[\"*\"]', NULL, '2023-10-26 11:25:23', '2023-10-26 11:25:23'),
(96, 'App\\Models\\User', 45, 'GenericCommerceV1', '9d96a1c4d5481d1a18da50b7a4ee9ebbe043f6c0934ab6a783b71a5cf38f7487', '[\"*\"]', NULL, '2023-10-26 11:25:24', '2023-10-26 11:25:24'),
(97, 'App\\Models\\User', 45, 'GenericCommerceV1', '8a2c828f3047f160491c5bad10a8514f7c30b535783f46fa95d8352c8eeaef26', '[\"*\"]', NULL, '2023-10-26 11:25:25', '2023-10-26 11:25:25'),
(98, 'App\\Models\\User', 45, 'GenericCommerceV1', 'f4044fbbb8b50fed3e0ee3e85038f8b8d6d297afaaf2f989b6f25e08ba9a465a', '[\"*\"]', NULL, '2023-10-26 11:25:26', '2023-10-26 11:25:26'),
(99, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd4e8409f25184e006812982e22fa630054180a065bb87ba6df59df2f5affb17d', '[\"*\"]', NULL, '2023-10-26 11:25:26', '2023-10-26 11:25:26'),
(100, 'App\\Models\\User', 45, 'GenericCommerceV1', '50ac7494f898d7080ef2cc99db780a0812c55c662ffa6918aeedeea31227d279', '[\"*\"]', NULL, '2023-10-26 11:25:27', '2023-10-26 11:25:27'),
(101, 'App\\Models\\User', 45, 'GenericCommerceV1', 'fb019988ce6546f2d871dccaf6a1699584c2bfed3890d935abb4f4228c394ea3', '[\"*\"]', NULL, '2023-10-26 11:38:54', '2023-10-26 11:38:54');

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
(1, 12, 37, NULL, 24, NULL, 'Iphone 14 Pro Max (Test Product)', 'OFF60', 'productImages/UlNWW1689758736.jpeg', NULL, 'Iphone 14 Pro Max', '<p>Iphone 14 Pro Max</p>\r\n\r\n<p>&nbsp;</p>', '<p>Iphone 14 Pro Max</p>', '<h2>One stop for&nbsp;support</h2>\r\n\r\n<p>Minimize the amount of time without your iPhone with Express Replacement Service</p>\r\n\r\n<p>Because Apple designs iPhone, iOS, and many applications, iPhone is a truly integrated system. And only AppleCare+ products provide one-stop service and support from Apple experts, so most issues can be resolved in a single call. Should you need repair or replacement, there are convenient service options.<a href=\"https://www.apple.com/support/products/iphone/#footnote-7\">7</a></p>\r\n\r\n<ul>\r\n	<li>24/7 priority access to Apple experts via chat or phone</li>\r\n	<li>Same-day service in most major metropolitan areas world wide<a href=\"https://www.apple.com/support/products/iphone/#footnote-7\">7</a></li>\r\n	<li>Onsite service: Schedule a technician to perform a screen repair at your home or office</li>\r\n	<li><a href=\"https://support.apple.com/iphone/repair/service/express-replacement\">Express Replacement Service</a>: We&rsquo;ll ship you a replacement device so you don&rsquo;t have to wait for a repair<a href=\"https://www.apple.com/support/products/iphone/#footnote-4\">4</a></li>\r\n	<li>Mail-in repair: Mail in your iPhone using a prepaid shipping box provided by Apple</li>\r\n	<li>Carry-in repair: Take your iPhone to an Apple&nbsp;Store or other Apple Authorized Service Provider</li>\r\n</ul>', 0, 0, -1, 1, 'iphone,apple', 'https://www.youtube.com/watch?v=FT3ODSg1GFE&ab_channel=Apple', NULL, 'iphone-14-pro-max-test-product-1698217191T4RlT', NULL, NULL, NULL, NULL, 1, 1, '2023-06-14 21:07:24', '2023-10-26 04:41:12'),
(2, 12, NULL, NULL, 24, NULL, 'Samsung Galaxy A54 (Test Product)', '3001', 'productImages/Hrf7c1697970112.webp', '[]', 'Largely satisfied, however, I am not a fan of Samsung\'s mandatory OS updates. It was only optional before.', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', 20000, 19500, 119, 1, 'Samsung Galaxy A54,samsung galaxy a50,samsung glalaxy', NULL, 1, 'samsung-galaxy-a54-test-product-1698217172bNI9w', NULL, NULL, NULL, NULL, 1, 0, '2023-06-15 17:19:54', '2023-10-25 04:59:32'),
(21, 10, 29, NULL, 18, NULL, 'Boxy Denim Jacket', 'rg', 'productImages/3xl2q1697626862.png', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut numquam ullam is recusandae laborum explicabo id sequi quisquam, ab sunt deleniti quidem ea animi facilis quod nostrum odit! Repellendus voluptas suscipit cum harum dolor sciunt.', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>\r\n\r\n<p>More Details</p>\r\n\r\n<ul>\r\n	<li>&nbsp;Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam, dolorum?</li>\r\n	<li>&nbsp;Magnam enim modi, illo harum suscipit tempore aut dolore?</li>\r\n	<li>&nbsp;Numquam eaque mollitia fugiat laborum dolor tempora;</li>\r\n	<li>&nbsp;Sit amet consectetur adipisicing elit. Quo delectus repellat facere maiores.</li>\r\n	<li>&nbsp;Repellendus itaque sit quia consequuntur, unde veritatis. dolorum?</li>\r\n</ul>', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>', '<p>Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>', 110, 100, 0, 2, 'jacket', NULL, 8, 'boxy-denim-jacket-1697964487MRpRd', 6, NULL, NULL, NULL, 1, 1, '2023-10-18 09:01:02', '2023-10-22 08:48:07'),
(22, 11, 36, NULL, 19, NULL, 'Oversize Cotton Dress', NULL, 'productImages/Ecfe81698220172.png', '[\"1698220172hEGSk.png\"]', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut numquam ullam is recusandae laborum explicabo id sequi quisquam, ab sunt deleniti quidem ea animi facilis quod nostrum odit! Repellendus voluptas suscipit cum harum dolor sciunt.', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>\r\n\r\n<p>More Details</p>\r\n\r\n<ul>\r\n	<li>&nbsp;Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam, dolorum?</li>\r\n	<li>&nbsp;Magnam enim modi, illo harum suscipit tempore aut dolore?</li>\r\n	<li>&nbsp;Numquam eaque mollitia fugiat laborum dolor tempora;</li>\r\n	<li>&nbsp;Sit amet consectetur adipisicing elit. Quo delectus repellat facere maiores.</li>\r\n	<li>&nbsp;Repellendus itaque sit quia consequuntur, unde veritatis. dolorum?</li>\r\n</ul>', '<p>avd</p>', '<p>dcwef</p>', 0, 0, 0, NULL, NULL, NULL, NULL, 'oversize-cotton-dress-1698220172ENAOK', 7, NULL, NULL, NULL, 1, 0, '2023-10-18 09:06:48', '2023-10-25 05:49:32'),
(23, 13, 42, NULL, 25, NULL, 'Quilted Shoulder Bag', 'piiiu678', 'productImages/BKPcM1697627608.png', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut numquam ullam is recusandae laborum explicabo id sequi quisquam, ab sunt deleniti quidem ea animi facilis quod nostrum odit! Repellendus voluptas suscipit cum harum dolor sciunt.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 'quilted-shoulder-bag-1698040211WSrQ3', 8, NULL, NULL, NULL, 1, 1, '2023-10-18 09:13:28', '2023-10-23 03:50:11'),
(24, 12, 37, NULL, 24, NULL, 'Test Product', NULL, 'productImages/yyXga1697961494.webp', NULL, 'Test ProductTest ProductTest Product', '<p>Test ProductTest Product</p>', '<p>Test ProductTest Product</p>', '<p>Test ProductTest Product</p>', 100, 90, -10, 3, 'asd,sdffr', NULL, 1, 'test-product-16980401983I6aM', 6, NULL, 'asdas,hgthhj', NULL, 1, 1, '2023-10-22 07:58:14', '2023-10-26 04:18:03'),
(25, 13, 41, NULL, 19, NULL, 'Quilted Shoulder Bag', 'etwed124', 'productImages/petoC1698218036.png', '[\"1698218036kzgay.png\"]', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>\r\n\r\n<p>More Details</p>\r\n\r\n<ul>\r\n	<li>&nbsp;</li>\r\n</ul>', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>', '<p>Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>', 3000, 2300, 398, 1, 'bag', NULL, 7, 'quilted-shoulder-bag-16982180368MQtS', 7, NULL, NULL, NULL, 1, 0, '2023-10-25 05:13:56', '2023-10-25 05:13:56'),
(26, 10, 31, NULL, 18, NULL, 'Western denim shirt', 'tgf2531', 'productImages/yTtWp1698220071.png', NULL, 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam,', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>\r\n\r\n<p>More Details</p>\r\n\r\n<ul>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam, dolorum?</li>\r\n	<li>&nbsp;</li>\r\n	<li>Magnam enim modi, illo harum suscipit tempore aut dolore?</li>\r\n	<li>&nbsp;</li>\r\n	<li>Numquam eaque mollitia fugiat laborum dolor tempora;</li>\r\n	<li>&nbsp;</li>\r\n	<li>Sit amet consectetur adipisicing elit. Quo delectus repellat facere maiores.</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Repellendus itaque sit quia consequuntur, unde veritatis. dolorum?</li>\r\n</ul>\r\n\r\n<h2>&nbsp;</h2>', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus do</p>', '<p>estibulum a tortor diam. Vestibulum ac felis sem. Sed scelerisque nulla quam, vehicula porttitor diam fringilla vitae. Aenean quis velit id quam placerat facilisis nec non nisl. Morbi purus odio, vestibulum pellentesque velit eget, viverra consectetur lorem. Proin nec sem egestas leo interdum efficitur nec eleifend velit. Vestibulum ultrices consectetur semper. Duis nibh elit, volutpat nec sapien ac, luctus auctor felis. Vestibulum placerat, velit vel bibendum cursus, dolor urna iaculis dui, non ultricies ante nisi vitae leo. Aenean id egestas sem.</p>', 3000, 2850, 0, 1, 'Western', NULL, 7, 'western-denim-shirt-1698220071p9SX3', 8, NULL, NULL, NULL, 1, 1, '2023-10-25 05:47:51', '2023-10-25 05:47:51'),
(27, 11, 36, NULL, 21, NULL, 'Aware organic cotton', 'ehg5ry4', 'productImages/MK64v1698220649.png', NULL, 'Praesent purus massa, placerat nec maximus non, hendrerit ac turpis. Fusce semper pellentesque semper. Nunc in turpis at nulla fringilla accumsan non fermentum lectus. Nullam iaculis mi sit amet faucibus ullamcorper.', '<p>Praesent purus massa, placerat nec maximus non, hendrerit ac turpis. Fusce semper pellentesque semper. Nunc in turpis at nulla fringilla accumsan non fermentum lectus. Nullam iaculis mi sit amet faucibus ullamcorper. Maecenas volutpat erat vitae lacus porttitor rutrum. Aliquam imperdiet quam sed felis finibus blandit.</p>\r\n\r\n<p>Praesent sodales lacinia blandit. Nullam luctus nunc elit, nec tempor tortor feugiat sollicitudin. Cras iaculis cursus odio, id venenatis dolor scelerisque eget. Mauris vitae fringilla dolor, id pulvinar odio. Proin aliquam rhoncus laoreet. Vestibulum ullamcorper sem sit amet fringilla maximus. Proin felis arcu, bibendum cursus molestie consequat, porta et enim. Ut sagittis bibendum tellus, in cursus lorem scelerisque quis.</p>\r\n\r\n<p>Maecenas scelerisque cursus tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas vel varius arcu, id posuere sapien. Vestibulum dictum mauris a ex accumsan, sed semper tortor gravida. Integer gravida velit a enim eleifend tempus. Aliquam tincidunt, dui eget venenatis vehicula, nunc lectus aliquet nunc, at luctus eros ipsum quis libero. Fusce a purus faucibus, rhoncus diam a, hendrerit nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</p>\r\n\r\n<p>Nam pulvinar arcu non tortor auctor bibendum. Nullam eu consectetur velit, at tempor ante. Nunc vulputate cursus lorem, vitae fermentum mi rhoncus et. Nullam convallis massa imperdiet vestibulum tincidunt. Morbi ex mi, euismod vel imperdiet non, blandit nec urna. Nullam posuere quam elit, vel suscipit nisl tempor id. Aenean a blandit felis. Quisque sit amet consectetur tortor, eget egestas lorem. Maecenas ut tortor pellentesque, elementum ante non, ullamcorper urna. Pellentesque iaculis sapien tortor.</p>\r\n\r\n<p>Vestibulum a tortor diam. Vestibulum ac felis sem. Sed scelerisque nulla quam, vehicula porttitor diam fringilla vitae. Aenean quis velit id quam placerat facilisis nec non nisl. Morbi purus odio, vestibulum pellentesque velit eget, viverra consectetur lorem. Proin nec sem egestas leo interdum efficitur nec eleifend velit. Vestibulum ultrices consectetur semper. Duis nibh elit, volutpat nec sapien ac, luctus auctor felis. Vestibulum placerat, velit vel bibendum cursus, dolor urna iaculis dui, non ultricies ante nisi vitae leo. Aenean id egestas sem.</p>', '<p>&nbsp;</p>\r\n\r\n<p>Maecenas scelerisque cursus tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas vel varius arcu, id posuere sapien. Vestibulum dictum mauris a ex accumsan, sed semper tortor gravida. Integer gravida velit a enim eleifend tempus. Aliquam tincidunt, dui eget venenatis vehicula, nunc lectus aliquet nunc, at luctus eros ipsum quis libero. Fusce a purus faucibus, rhoncus diam a, hendrerit nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</p>\r\n\r\n<p>Nam pulvinar arcu non tortor auctor bibendum. Nullam eu consectetur velit, at tempor ante. Nunc vulputate cursus lorem, vitae fermentum mi rhoncus et. Nullam convallis massa imperdiet vestibulum tincidunt. Morbi ex mi, euismod vel imperdiet non, blandit nec urna. Nullam posuere quam elit, vel suscipit nisl tempor id. Aenean a blandit felis. Quisque sit amet consectetur tortor, eget egestas lorem. Maecenas ut tortor pellentesque, elementum ante non, ullamcorper urna. Pellentesque iaculis sapien tortor.</p>\r\n\r\n<p>Vestibulum a tortor diam. Vestibulum ac felis sem. Sed scelerisque nulla quam, vehicula porttitor</p>', '<p>Nam pulvinar arcu non tortor auctor bibendum. Nullam eu consectetur velit, at tempor ante. Nunc vulputate cursus lorem, vitae fermentum mi rhoncus et. Nullam convallis massa imperdiet vestibulum tincidunt. Morbi ex mi, euismod vel imperdiet non, blandit nec urna. Nullam posuere quam elit, vel suscipit nisl tempor id. Aenean a blandit felis. Quisque sit amet consectetur tortor, eget egestas lorem. Maecenas ut tortor pellentesque, elementum ante non, ullamcorper urna. Pellentesque iaculis sapien tortor.</p>', 800, 700, 0, 1, 'cotton', 'hfh', 7, 'aware-organic-cotton-1698220649jm79G', 6, NULL, NULL, NULL, 1, 1, '2023-10-25 05:57:29', '2023-10-25 05:57:29'),
(28, 14, 45, NULL, 25, NULL, 'High Ankle Jeans', '2dr34', 'productImages/fvzi31698220928.png', '[\"1698220928tQu8C.png\"]', 'ed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae</p>', '<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;</p>', 1500, 1290, 257, 1, 'high ,jeans', NULL, 1, 'high-ankle-jeans-1698221001ta2Gv', 8, NULL, NULL, NULL, 1, 0, '2023-10-25 06:02:08', '2023-10-25 06:03:21');

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
(38, 25, '1698218036kzgay.png', '2023-10-25 05:13:56', NULL),
(39, 22, '1698220172hEGSk.png', '2023-10-25 05:49:32', NULL),
(40, 28, '1698220928tQu8C.png', '2023-10-25 06:02:08', NULL);

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
(3, 1, 13, 5, 'dasdassad', 'asdasdsassad', '16891634796LEKY', 1, '2023-07-12 22:04:39', '2023-07-12 22:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `slug` varchar(255) NOT NULL,
  `serial` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `name`, `status`, `slug`, `serial`, `created_at`, `updated_at`) VALUES
(3, 'XL', 1, '1697959830XHryF', 3, '2023-10-22 07:30:30', '2023-10-22 07:30:47'),
(4, 'XXL', 1, '16979598348ybGu', 4, '2023-10-22 07:30:34', '2023-10-22 07:30:47'),
(5, 'M', 1, '16979598389yaga', 2, '2023-10-22 07:30:38', '2023-10-22 07:30:47'),
(6, 'S', 1, '1697959841kF3bo', 1, '2023-10-22 07:30:41', '2023-10-22 07:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
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

INSERT INTO `product_variants` (`id`, `product_id`, `image`, `color_id`, `size_id`, `region_id`, `sim_id`, `storage_type_id`, `stock`, `price`, `discounted_price`, `warrenty_id`, `device_condition_id`, `created_at`, `updated_at`) VALUES
(25, 21, '1697626862OsQ7F.png', 6, 6, NULL, NULL, NULL, 100, 110, 100, 8, NULL, '2023-10-18 09:01:02', '2023-10-22 08:48:07'),
(26, 21, '1697626862sy3aK.png', 2, 5, NULL, NULL, NULL, 320, 115, 80, 7, NULL, '2023-10-18 09:01:02', '2023-10-22 08:48:07'),
(27, 21, '1697626862bMCYk.png', 3, 3, NULL, NULL, NULL, 200, 90, 85, 7, NULL, '2023-10-18 09:01:02', '2023-10-22 08:48:07'),
(29, 23, '1697627608IoUkR.png', 7, NULL, NULL, NULL, NULL, 99, 0, 0, NULL, NULL, '2023-10-18 09:13:28', '2023-10-23 03:50:11'),
(30, 24, '1697961772eZG2G.webp', 2, 6, NULL, NULL, NULL, 100, 100, 90, 1, NULL, '2023-10-22 08:02:52', '2023-10-23 03:49:58'),
(31, 24, '1697961772MdE90.webp', 7, 5, NULL, NULL, NULL, 200, 120, 100, 1, NULL, '2023-10-22 08:02:52', '2023-10-23 03:49:58'),
(32, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '2023-10-25 04:59:51', NULL),
(33, 26, '1698220071KJHUh.png', 2, 4, NULL, NULL, NULL, 100, 3000, 2850, 7, NULL, '2023-10-25 05:47:51', NULL),
(34, 26, '1698220071D5DHw.png', 6, 5, NULL, NULL, NULL, 300, 3400, 3200, 8, NULL, '2023-10-25 05:47:51', NULL),
(35, 26, '16982200714Piub.png', 3, 6, NULL, NULL, NULL, 200, 4000, 3790, 2, NULL, '2023-10-25 05:47:51', NULL),
(36, 26, '1698220071p1CPR.png', 10, 4, NULL, NULL, NULL, 400, 3900, 3000, 7, NULL, '2023-10-25 05:47:51', NULL),
(37, 27, '1698220649T4kIh.png', 1, 4, NULL, NULL, NULL, 100, 800, 700, 7, NULL, '2023-10-25 05:57:29', NULL),
(38, 27, '1698220649mYEaQ.png', 1, 3, NULL, NULL, NULL, 140, 750, 600, 8, NULL, '2023-10-25 05:57:29', NULL),
(39, 27, '1698220649T2jK0.png', 1, 5, NULL, NULL, NULL, 200, 750, 690, 8, NULL, '2023-10-25 05:57:29', NULL),
(40, 27, '1698220649CwkcU.png', 2, 5, NULL, NULL, NULL, 500, 900, 800, 8, NULL, '2023-10-25 05:57:29', NULL),
(41, 27, '1698220649S40Zf.png', 2, 3, NULL, NULL, NULL, 90, 900, 780, 7, NULL, '2023-10-25 05:57:29', NULL);

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
  `description` varchar(255) DEFAULT NULL,
  `description_color` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `btn_text_color` varchar(255) DEFAULT NULL,
  `btn_bg_color` varchar(255) DEFAULT NULL,
  `background_color` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `time_bg_color` varchar(255) DEFAULT NULL,
  `time_font_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotional_banners`
--

INSERT INTO `promotional_banners` (`id`, `icon`, `heading`, `heading_color`, `title`, `title_color`, `description`, `description_color`, `url`, `btn_text`, `btn_text_color`, `btn_bg_color`, `background_color`, `product_image`, `background_image`, `video_url`, `started_at`, `end_at`, `time_bg_color`, `time_font_color`, `created_at`, `updated_at`) VALUES
(1, 'banner/t7HK11697610309.png', 'Hurry up and Get 25% Discount', '#ee2761', 'Deals Of The Day', '#000000', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore', '#606060', '#', 'Show Collection', '#ffffff', '#ee2761', '#ffffff', 'banner/c4raa1697614018.webp', 'banner/m7GlQ1697623318.png', 'http://127.0.0.1:8000/view/promotional/banner', '2023-10-19 11:00:41', '2024-11-07 21:00:00', '#efeff1', '#000000', '2023-06-13 10:08:55', '2023-10-19 02:57:21');

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
(1, '25% off', 'happy shoping', 'Off25', '2023-07-03', '2023-11-30', 2, 25, 'J0vnY1688367426', 1, '2023-07-03 16:57:06', '2023-10-25 08:18:17'),
(2, 'OFF 100', '100 taka off', 'OFF100', '2023-07-09', '2023-11-30', 1, 100, '2EtEa1688804325', 1, '2023-07-08 18:18:45', '2023-10-25 08:18:05');

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
(4, 9, 'Reduan', '01850453322', 'admin@gmil.com', 'undefined', 'Flat A2, House 4 Rd No. 10', NULL, '1000', 'Mymensingh', 'Bangladesh', '2023-07-18 08:54:41', '2023-10-22 09:17:45'),
(9, 14, 'bh', 'hh', 'bb', NULL, 'hh', 'Gopalganj Sadar', NULL, 'Gopalganj', NULL, '2023-10-25 06:33:57', NULL),
(10, 0, 'Arif', '98666776778', 'dcsuperstar22@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 03:34:13', NULL);

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
(1, NULL, 'ElitBuzz', 'https://880sms.com/smsapi', 'C20095786bf436075.858353215', NULL, 'GenericCommerceV1', 0, '2023-06-13 03:43:26', '2023-10-22 06:01:53'),
(2, NULL, 'Reve', 'https://smpp.ajuratech.com:7790/sendtext', '69cff06995a4a85', '20cdf1d28', 'GenericCommerceV1', 1, '2023-06-13 03:43:26', '2023-10-22 06:01:53');

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
(1, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-10-05 06:00:25', '2023-10-23 05:44:31');

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
(29, 10, 'Jacket Women', 'subcategory_images/I1xtn1697625309.png', NULL, 'jacket-women-1697625309-htSgh', 1, 0, '2023-10-18 08:35:09', NULL),
(30, 10, 'Woolend Jacket', 'subcategory_images/TEK8p1697625355.png', NULL, 'woolend-jacket-1697625355-yTkGF', 1, 0, '2023-10-18 08:35:55', NULL),
(31, 10, 'Western Denim', 'subcategory_images/XpWqz1697625392.png', NULL, 'western-denim-1697625392-U9UiN', 1, 0, '2023-10-18 08:36:32', NULL),
(32, 10, 'Mini Dress', 'subcategory_images/ZWPSe1697625410.png', NULL, 'mini-dress-1697625410-Cq46l', 1, 0, '2023-10-18 08:36:50', NULL),
(33, 11, 'Jacket Women', 'subcategory_images/5vuJH1697626398.png', NULL, 'jacket-women-1697626398-nnQaU', 1, 0, '2023-10-18 08:53:18', NULL),
(34, 11, 'Woolend Jacket', 'subcategory_images/4L0371697626426.png', NULL, 'woolend-jacket-1697626426-ACkq6', 1, 0, '2023-10-18 08:53:46', NULL),
(35, 11, 'Western Denim', 'subcategory_images/eE6ty1697626449.png', NULL, 'western-denim-1697626449-hBG8o', 1, 0, '2023-10-18 08:54:09', NULL),
(36, 11, 'MIni Dress', 'subcategory_images/m4hVy1697626469.png', NULL, 'mini-dress-1697626469-h099b', 1, 0, '2023-10-18 08:54:29', NULL),
(37, 12, 'Woolend Jacket', 'subcategory_images/pUe0P1697626497.png', NULL, 'woolend-jacket-1697626497-OgFmm', 1, 0, '2023-10-18 08:54:57', NULL),
(38, 12, 'Jacket, Women', 'subcategory_images/hposg1697626524.png', NULL, 'jacket-women-1697626524-2FV8y', 1, 0, '2023-10-18 08:55:24', NULL),
(39, 12, 'Western Denim', 'subcategory_images/9C5UK1697626550.png', NULL, 'western-denim-1697626550-xvTqp', 1, 0, '2023-10-18 08:55:50', NULL),
(41, 13, 'Jacket,Women', 'subcategory_images/SHtV41697626616.png', NULL, 'jacketwomen-1697626616-Ix5uv', 1, 0, '2023-10-18 08:56:56', NULL),
(42, 13, 'Woolend Jacket', 'subcategory_images/KLFy81697626644.png', NULL, 'woolend-jacket-1697626644-CcGr9', 1, 0, '2023-10-18 08:57:24', NULL),
(43, 13, 'western denim', 'subcategory_images/fcH6R1697626663.png', NULL, 'western-denim-1697626663-vZmfB', 1, 0, '2023-10-18 08:57:43', NULL),
(44, 13, 'Mini Dress', 'subcategory_images/x2u9h1697626680.png', NULL, 'mini-dress-1697626680-tY34l', 1, 0, '2023-10-18 08:58:00', NULL),
(45, 14, 'Women', NULL, NULL, 'women-1698220736-Ul0Jl', 1, 0, '2023-10-25 05:58:56', NULL),
(46, 14, 'Man', NULL, NULL, 'man-1698220744-lhEyi', 1, 0, '2023-10-25 05:59:04', NULL);

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
(1, '<h2>Who we are</h2>\r\n\r\n<p>Our website address is:&nbsp;<a href=\"mailto:info@example.com\">info@example.com</a></p>\r\n\r\n<h2>What personal data we collect and why we collect it</h2>\r\n\r\n<h3>Comments</h3>\r\n\r\n<p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&rsquo;s IP address and browser user agent string to help spam detection.</p>\r\n\r\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\r\n\r\n<h3>Media</h3>\r\n\r\n<p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\r\n\r\n<h3>Cookies</h3>\r\n\r\n<p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\r\n\r\n<p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\r\n\r\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &ldquo;Remember Me&rdquo;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\r\n\r\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\r\n\r\n<h3>Embedded content from other websites</h3>\r\n\r\n<p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\r\n\r\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\r\n\r\n<h2>How long we retain your data</h2>\r\n\r\n<p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\r\n\r\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\r\n\r\n<h2>What rights you have over your data</h2>\r\n\r\n<p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\r\n\r\n<h2>Where we send your data</h2>\r\n\r\n<p>Visitor comments may be checked through an automated spam detection service.</p>', '<h2>Who we are</h2>\r\n\r\n<p>Our website address is:&nbsp;<a href=\"mailto:info@example.com\">info@example.com</a></p>\r\n\r\n<h2>What personal data we collect and why we collect it</h2>\r\n\r\n<h3>Comments</h3>\r\n\r\n<p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&rsquo;s IP address and browser user agent string to help spam detection.</p>\r\n\r\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\r\n\r\n<h3>Media</h3>\r\n\r\n<p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\r\n\r\n<h3>Cookies</h3>\r\n\r\n<p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\r\n\r\n<p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\r\n\r\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &ldquo;Remember Me&rdquo;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\r\n\r\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\r\n\r\n<h3>Embedded content from other websites</h3>\r\n\r\n<p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\r\n\r\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\r\n\r\n<h2>How long we retain your data</h2>\r\n\r\n<p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\r\n\r\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\r\n\r\n<h2>What rights you have over your data</h2>\r\n\r\n<p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\r\n\r\n<h2>Where we send your data</h2>\r\n\r\n<p>Visitor comments may be checked through an automated spam detection service.</p>', '<h2>Who we are</h2>\r\n\r\n<p>Our website address is:&nbsp;<a href=\"mailto:info@example.com\">info@example.com</a></p>\r\n\r\n<h2>What personal data we collect and why we collect it</h2>\r\n\r\n<h3>Comments</h3>\r\n\r\n<p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&rsquo;s IP address and browser user agent string to help spam detection.</p>\r\n\r\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\r\n\r\n<h3>Media</h3>\r\n\r\n<p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\r\n\r\n<h3>Cookies</h3>\r\n\r\n<p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\r\n\r\n<p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\r\n\r\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &ldquo;Remember Me&rdquo;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\r\n\r\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\r\n\r\n<h3>Embedded content from other websites</h3>\r\n\r\n<p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\r\n\r\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\r\n\r\n<h2>How long we retain your data</h2>\r\n\r\n<p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\r\n\r\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\r\n\r\n<h2>What rights you have over your data</h2>\r\n\r\n<p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\r\n\r\n<h2>Where we send your data</h2>\r\n\r\n<p>Visitor comments may be checked through an automated spam detection service.</p>', '<h2>Who we are</h2>\r\n\r\n<p>Our website address is:&nbsp;<a href=\"mailto:info@example.com\">info@example.com</a></p>\r\n\r\n<h2>What personal data we collect and why we collect it</h2>\r\n\r\n<h3>Comments</h3>\r\n\r\n<p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&rsquo;s IP address and browser user agent string to help spam detection.</p>\r\n\r\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\r\n\r\n<h3>Media</h3>\r\n\r\n<p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\r\n\r\n<h3>Cookies</h3>\r\n\r\n<p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\r\n\r\n<p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\r\n\r\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &ldquo;Remember Me&rdquo;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\r\n\r\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\r\n\r\n<h3>Embedded content from other websites</h3>\r\n\r\n<p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\r\n\r\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\r\n\r\n<h2>How long we retain your data</h2>\r\n\r\n<p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\r\n\r\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\r\n\r\n<h2>What rights you have over your data</h2>\r\n\r\n<p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\r\n\r\n<h2>Where we send your data</h2>\r\n\r\n<p>Visitor comments may be checked through an automated spam detection service.</p>', '2023-04-11 13:41:20', '2023-10-18 08:05:34');

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

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `description`, `rating`, `customer_name`, `customer_image`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita in recusandae sit officia ipsa, natus ad voluptatem doloribus dolorum placeat, rem deleniti est accusamus ipsum corporis voluptates soluta totam maiores nostrum reprehenderit quasi? Laboriosam itaque ab odit harum sed aut voluptates, illum unde. Saepe enim ad ut pariatur doloremque quas harum sequi, excepturi tempore exercitationem suscipit quam recusandae corrupti quibusdam. Laboriosam sapiente provident repellat blanditiis ratione nostrum illum asperiores quo cumque in quisquam, non iste aut illo vel, alias debitis!', 5, 'Hialry Duff', 'testimonial/myyTv1697621055.png', 'ld8fi1697621055', '2023-10-18 07:24:15', NULL),
(3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita in recusandae sit officia ipsa, natus ad voluptatem doloribus dolorum placeat, rem deleniti est accusamus ipsum corporis voluptates soluta totam maiores nostrum reprehenderit quasi? Laboriosam itaque ab odit harum sed aut voluptates, illum unde. Saepe enim ad ut pariatur doloremque quas harum sequi, excepturi tempore exercitationem suscipit quam recusandae corrupti quibusdam. Laboriosam sapiente provident repellat blanditiis ratione nostrum illum asperiores quo cumque in quisquam, non iste aut illo vel, alias debitis!', 5, 'Selina Gomez', 'testimonial/K1r3U1697621099.png', 'cMTul1697621099', '2023-10-18 07:24:59', NULL),
(4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita in recusandae sit officia ipsa, natus ad voluptatem doloribus dolorum placeat, rem deleniti est accusamus ipsum corporis voluptates soluta totam maiores nostrum reprehenderit quasi? Laboriosam itaque ab odit harum sed aut voluptates, illum unde. Saepe enim ad ut pariatur doloremque quas harum sequi, excepturi tempore exercitationem suscipit quam recusandae corrupti quibusdam. Laboriosam sapiente provident repellat blanditiis ratione nostrum illum asperiores quo cumque in quisquam, non iste aut illo vel, alias debitis!', 5, 'Nike Mardson', 'testimonial/eJ2bC1697621239.png', 'PmDVG1697621239', '2023-10-18 07:27:19', NULL);

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
  `password` varchar(255) DEFAULT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `image`, `name`, `phone`, `email`, `email_verified_at`, `verification_code`, `password`, `provider_name`, `provider_id`, `remember_token`, `user_type`, `address`, `balance`, `delete_request_submitted`, `delete_request_submitted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', '01969005036', 'admin@gmail.com', NULL, '33200', '$2y$10$JtmbfwKyLz4moqNiYTHnNudFYY5sSxhozz.jyo4gwdbGOpfjlW5tq', NULL, NULL, NULL, 1, NULL, 0, 0, NULL, 1, '2023-03-28 10:20:00', '2023-10-02 08:23:57'),
(19, 'userProfileImages/bulWt1688356676.jpg', 'Md. Fahim Hossain 2', NULL, 'alifhossain175@gmaill.com', NULL, '655028', '$2y$10$MKFghgrOtoPRr50wFpIx1ubpahBuCI/xoDM2j2ZwysCOoOoHDBUXK', NULL, NULL, NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-12 03:55:36', '2023-07-03 13:57:56'),
(23, 'userProfileImages/WUsyU1688361290.jpeg', 'Reduan', '01850453322', 'test100@gmail.com', NULL, '154666', '$2y$10$BawJIqWONpVSNWFZ1xCQEe0R8Z4OEn8NiFHENZR6./MMHvM/DP4cS', NULL, NULL, NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-18 21:08:55', '2023-07-13 03:35:27'),
(25, NULL, 'Bestu', NULL, 'admin@bestu.com.bd', NULL, NULL, '$2y$10$2QIdfvOWHR8qTvE5FcsGDOkKTc6VkFWkAVbVhu7qSd7x8Zq6..FTG', NULL, NULL, NULL, 1, 'Dhaka, Bangladesh', 0, 0, NULL, 1, '2023-06-27 16:54:07', '2023-07-18 08:42:03'),
(33, NULL, 'Rohan Hossain Siam', '01632563180', 'itssiam856@gmail.com', NULL, NULL, '$2y$10$eCh/uQ.fK7JxcNf1QSNOa./i9GUuOWEEktJQL52HvoWAWogg46/S2', NULL, NULL, NULL, 1, '64/62 no. Mahut-tuli, Armanitola, Dhaka, Bangladesh.', 0, 0, NULL, 1, '2023-07-15 19:53:27', '2023-07-18 08:42:00'),
(34, NULL, 'Istiak Ahamed Sifat', '01580331693', 'istiakahamed30@gmail.com', NULL, NULL, '$2y$10$/d3M1fFredISBGmlpDv4R.IXCGToxs/31ljKCg3wrE2q2gIk21WB2', NULL, NULL, NULL, 1, 'Ali nekir dewry, Nazimuddin Road, Dhaka.', 0, 0, NULL, 1, '2023-07-15 19:55:06', '2023-07-18 08:41:56'),
(35, 'userProfileImages/2eYoO1689479533.jpg', 'Ariful', '01643533365', 'ariful@gmail.com', NULL, '772114', '$2y$10$x5m3cQUgd.RHgHWAT7iCu.GMovOLWNBrT9lnB8orb54P5QeU0ls/6', NULL, NULL, NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-16 13:51:25', '2023-07-19 04:38:59'),
(36, NULL, 'TestUser By Getup', '01969005039', 'test@gmail.com', NULL, NULL, '$2y$10$/9ZP9Bi/GH51I6kZyZTDVefcQI1dAJSOnv/SlPEIT2YPQgIkgiky2', NULL, NULL, NULL, 2, 'Dhaka, Bangladesh', 0, 0, NULL, 1, '2023-07-18 08:17:43', '2023-07-18 08:42:28'),
(45, NULL, 'Md Fahim Hossain', '01969005041', 'alifhossain174@gmail.com', '2023-10-22 05:47:07', '926152', '$2y$10$XlL/0J.FotoN/14AFx2Zt.xTesgTYBb5XCCG1aLarpIvIIbetp6CC', NULL, NULL, NULL, 3, 'Uttara, Dhaka-1229', 0, 0, NULL, 1, '2023-10-22 05:20:33', '2023-10-26 11:38:54'),
(47, NULL, 'Md Fahim Hossain', '01969005035', NULL, '2023-10-22 06:11:03', '269200', '$2y$10$ryL5dk9r0et950I4Ux6PXOF11a8L/R5xuGohH5u7yzT2ol3niUWyi', NULL, NULL, NULL, 3, 'Uttara, Dhaka-1229', 0, 0, NULL, 1, '2023-10-22 06:08:52', '2023-10-22 06:11:03'),
(49, NULL, 'gyuvvyvt', NULL, 'gugug@gmail.com', NULL, '905201', '$2y$10$PtjpDvvP1tpv7o5XI.ZLH.Ga9I5.7ri14aGQIammYShOCtqfL4TNy', NULL, NULL, NULL, 3, 'vhvhv', 0, 0, NULL, 0, '2023-10-23 09:25:59', NULL),
(50, NULL, 'ub', 'bubbu&t.gik', NULL, NULL, '473080', '$2y$10$X.P55zHGNauDZ73s9rM1W.1x2b472wYgpPD968p0tGqV3xltRcRCa', NULL, NULL, NULL, 3, 'uvu', 0, 0, NULL, 0, '2023-10-23 09:28:29', NULL),
(55, 'userProfileImages/zs2911698216503.jpg', 'Arif', '98666776778', 'dcsuperstar22@gmail.com', '2023-10-25 02:00:12', '973071', '$2y$10$hiI/K.pthRSg4U85.dMCW.0jZ5OFmsGqHadIv0uPP0zr0aySd32zC', NULL, NULL, NULL, 3, NULL, 0, 0, NULL, 1, '2023-10-25 01:55:10', '2023-10-25 06:39:48');

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
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
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
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_progress`
--
ALTER TABLE `order_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_models`
--
ALTER TABLE `product_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
