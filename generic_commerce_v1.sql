-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2023 at 01:41 PM
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
(1, 'uploads/about_us/Y7XUU1697616167.png', NULL, 'Why Choose us', 'We do not buy from the open market & traders.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit illo, est repellendus are quia voluptate neque reiciendis ea placeat labore maiores cum, hic ducimus ad a dolorem soluta consectetur adipisci. Perspiciatis quas ab quibusdam is.</p>\r\n\r\n<p>Itaque accusantium eveniet a laboriosam dolorem? Magni suscipit est corrupti explicabo non perspiciatis, excepturi ut asperiores assumenda rerum? Provident ab corrupti sequi, voluptates repudiandae eius odit aut.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Bruce Sutton</strong></p>\r\n\r\n<p>Spa Manager</p>', NULL, NULL, NULL, NULL, '2023-10-18 08:06:46');

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
(4, 9, 'Flat A2, House 4 Rd No. 10', '1000', NULL, 'Mymensingh', 'Bangladesh', '2023-07-18 08:54:41', '2023-10-22 09:17:45');

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
(1, 'Apple', 'brand_images/q9Fcn1689771547.png', 'brand_images/S41ev1689507708.jpg', 0, 0, 1, 'apple', '2023-06-05 04:20:25', '2023-10-18 08:45:03'),
(2, 'Samsung', 'brand_images/B2Vun1689503322.png', 'brand_images/oPYOC1689572452.jpg', 0, 0, 2, 'samsung', '2023-06-05 04:20:37', '2023-10-18 08:45:22'),
(3, 'Xiaomi', 'brand_images/r8uyu1687254365.png', 'brand_images/2E8fq1689509240.jpg', 0, 0, 3, 'xiaomi', '2023-06-05 04:20:45', '2023-10-18 08:45:39'),
(4, 'Infinix', 'brand_images/hZIRZ1687254231.png', 'brand_images/r6la71689509858.jpg', 0, 0, 5, 'infinix', '2023-06-07 14:59:58', '2023-10-18 08:46:53'),
(5, 'OPPO', 'brand_images/e3XNq1689771912.png', 'brand_images/3D2G01689511079.jpg', 0, 0, 4, 'oppo', '2023-06-07 15:48:28', '2023-10-18 08:46:29'),
(10, 'Realme', 'brand_images/zg8hn1689503104.png', 'brand_images/xo17Y1689511388.jpg', 0, 0, 6, 'realme', '2023-06-15 20:31:34', '2023-10-18 08:47:14'),
(11, 'Walton', 'brand_images/q4bmO1687343696.jpg', 'brand_images/2kNqP1687343696.jpg', 0, 0, 1, 'walton', '2023-06-21 20:34:56', '2023-10-18 08:44:32'),
(12, 'Google', 'brand_images/XoC4n1689503035.png', 'brand_images/1pjkC1689572468.jpg', 0, 0, 7, 'google', '2023-07-16 13:32:57', '2023-10-18 08:47:35'),
(13, 'Vivo', 'brand_images/2zMGI1689771903.png', NULL, 0, 0, 8, 'vivo', '2023-07-19 11:10:36', '2023-10-18 08:47:50'),
(14, 'Tecno', 'brand_images/SAx4d1689771898.png', NULL, 1, 1, 9, 'tecno', '2023-07-19 11:11:16', '2023-10-18 08:51:12'),
(15, 'OnePlus', 'brand_images/4jph81689771891.png', NULL, 1, 1, 10, 'oneplus', '2023-07-19 11:12:36', '2023-10-18 08:51:12'),
(16, 'Motorola', 'brand_images/ZJH5l1689771885.png', NULL, 0, 1, 11, 'motorola', '2023-07-19 11:13:02', '2023-10-18 08:51:12'),
(17, 'Nokia', 'brand_images/0MsOT1689771653.png', NULL, 1, 1, 12, 'nokia', '2023-07-19 11:14:06', '2023-10-18 08:51:12'),
(18, 'Jacket', NULL, NULL, 1, 1, 1, 'jacket', '2023-10-18 08:44:12', '2023-10-18 08:51:12'),
(19, 'Women', NULL, NULL, 0, 1, 2, 'women', '2023-10-18 08:48:06', '2023-10-18 08:51:12'),
(20, 'Oversize', NULL, NULL, 0, 1, 3, 'oversize', '2023-10-18 08:48:20', '2023-10-18 08:51:12'),
(21, 'Cottom', NULL, NULL, 0, 1, 4, 'cottom', '2023-10-18 08:48:39', '2023-10-18 08:51:12'),
(22, 'Shoulder', NULL, NULL, 0, 1, 5, 'shoulder', '2023-10-18 08:48:50', '2023-10-18 08:51:12'),
(23, 'Winter', NULL, NULL, 0, 1, 6, 'winter', '2023-10-18 08:49:14', '2023-10-18 08:51:12'),
(24, 'Accessories', NULL, NULL, 0, 1, 7, 'accessories', '2023-10-18 08:49:18', '2023-10-18 08:51:12'),
(25, 'Dress', NULL, NULL, 0, 1, 8, 'dress', '2023-10-18 08:49:28', '2023-10-18 08:51:12');

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
(1, 'Phone & Tablet', 'category_images/05LN21689766002.png', NULL, 'phone-tablet', 1, 1, 1, '2023-06-05 03:22:01', '2023-07-19 11:34:03'),
(10, 'Denim Jacket', 'category_images/sdhde1697625305.png', NULL, 'denim-jacket', 1, 0, 1, '2023-10-18 08:33:22', '2023-10-18 08:35:05'),
(11, 'Oversize Cotton', 'category_images/6yyC91697625373.png', NULL, 'oversize-cotton', 1, 0, 1, '2023-10-18 08:36:13', NULL),
(12, 'Dairy & chesse', 'category_images/kIkYT1697625398.png', NULL, 'dairy-chesse', 1, 0, 1, '2023-10-18 08:36:38', NULL),
(13, 'Shoulder Bag', 'category_images/W0jso1697625429.png', NULL, 'shoulder-bag', 1, 0, 1, '2023-10-18 08:37:09', NULL);

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

INSERT INTO `general_infos` (`id`, `logo`, `logo_dark`, `fav_icon`, `tab_title`, `company_name`, `short_description`, `contact`, `email`, `address`, `google_map_link`, `play_store_link`, `app_store_link`, `footer_copyright_text`, `payment_banner`, `primary_color`, `secondary_color`, `tertiary_color`, `title_color`, `paragraph_color`, `border_color`, `meta_title`, `meta_keywords`, `meta_description`, `custom_css`, `custom_js`, `facebook`, `instagram`, `twitter`, `linkedin`, `youtube`, `messenger`, `whatsapp`, `telegram`, `tiktok`, `pinterest`, `viber`, `google_analytic_status`, `google_analytic_tracking_id`, `fb_pixel_status`, `fb_pixel_app_id`, `tawk_chat_status`, `tawk_chat_link`, `crisp_chat_status`, `crisp_website_id`, `about_us`, `created_at`, `updated_at`) VALUES
(1, 'company_logo/tGAYZ1697968457.png', 'company_logo/1oSnf1697620395.png', 'company_logo/LpoYM1697970480.png', 'Fashionista', 'Fashionista', 'We are committed to digitalizing your business. We provide Integrated marketing company that delivers graphics, web, and marketing solutions.', '+01234-567890,+01234-5688765', 'demo@gmail.com,info@example.com', '123 Stree New York City , United States Of America NY 750065', 'https://www.google.com/maps/dir//U.S.+Embassy,+London+33+Nine+Elms+Ln+Nine+Elms,+London+SW11+7US+United+Kingdom/@51.4825655,-0.1322369,15z/data=!4m8!4m7!1m0!1m5!1m1!1s0x48760532743b90e1:0x790260718555a20c!2m2!1d-0.1322369!2d51.4825655?entry=ttu', 'https://play.google.com/store', 'https://www.apple.com/app-store/', '© 2022 FashionIsta', 'company_logo/iexIV1697970944.png', 'rgba(61, 133, 198, 0.813)', '#8e7cc3', '#c27ba0', '#ffd966', '#0b5394', '#5b5b5b', 'TechLand', 'tech,it,technical', 'Technical', '.custom{\r\n  width: 100%;\r\n  height: 100%;\r\n}', '<script>\r\n	var meDev = \"Code Sleep Eat\";\r\n	console.log(data);\r\n</script>', 'https://facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.youtube.com', 'https://web.facebook.com', 'https://web.whatsapp.com', 'https://telegram.com', 'https://www.tiktok.com/@reazuyhking68', 'https://www.pinterest.com/ideas/gr-recipes/92150330519/', 'https://www.viber.com/ru/blog/2023', 1, 'UA-842191520-669T', 1, 'wqwe', 0, 'https://embed.tawk.to/5a7c31ed7591465c7077c48/default', 1, NULL, NULL, NULL, '2023-10-22 11:33:58');

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
(1, '1689601753866', 23, '2023-07-17 19:49:13', '2023-07-24', NULL, '', 1, 1, '1689601753icKfT', 'Not Available (COD)', 0, 134500, NULL, 0, 100, 0, 0, 134600, '', NULL, 'y8IlF1689601753', 1, '2023-07-17 23:49:13', '2023-07-17 23:49:13'),
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
(13, '1690345802546', NULL, '2023-07-26 10:30:02', '2023-08-02', NULL, NULL, NULL, 0, '1690345802FMqFF', NULL, 2, 400, '1YUIFWW', 0, 0, 0, 0, 400, NULL, NULL, 'zUUxH1690345802', 0, '2023-07-26 04:30:02', '2023-10-22 08:14:45');

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
(26, 9, 21, 6, 6, 0, 0, 0, 8, 0, 2, 1, 100, 100, NULL, '2023-10-22 09:17:45');

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
(14, 13, 1, '2023-08-06 08:15:39', NULL),
(15, 13, 2, '2023-10-22 08:14:45', NULL);

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
(9, 'App\\Models\\User', 45, 'GenericCommerceV1', '8481956bea6bddc09dfff4f5ff49ef4657feed8ee5df0e2fa265710361328798', '[\"*\"]', NULL, '2023-10-22 06:22:40', '2023-10-22 06:22:40');

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
(2, 1, 7, NULL, 24, NULL, 'Samsung Galaxy A54 (Test Product)', '3001', 'productImages/Hrf7c1697970112.webp', '[]', 'Largely satisfied, however, I am not a fan of Samsung\'s mandatory OS updates. It was only optional before.', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', '<p>Largely satisfied, however, I am not a fan of Samsung&#39;s mandatory OS updates. It was only optional before. Now it is enforced. This means they can remove features without warning and without confirmation by the user.</p>', 20000, 19500, 119, 1, 'Samsung Galaxy A54,samsung galaxy a50,samsung glalaxy', NULL, 1, 'samsung-galaxy-a54-test-product-1697970112rXrLt', NULL, NULL, NULL, NULL, 1, 0, '2023-06-15 17:19:54', '2023-10-22 10:21:52'),
(21, 10, 29, NULL, 18, NULL, 'Boxy Denim Jacket', 'rg', 'productImages/3xl2q1697626862.png', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut numquam ullam is recusandae laborum explicabo id sequi quisquam, ab sunt deleniti quidem ea animi facilis quod nostrum odit! Repellendus voluptas suscipit cum harum dolor sciunt.', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>\r\n\r\n<p>More Details</p>\r\n\r\n<ul>\r\n	<li>&nbsp;Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam, dolorum?</li>\r\n	<li>&nbsp;Magnam enim modi, illo harum suscipit tempore aut dolore?</li>\r\n	<li>&nbsp;Numquam eaque mollitia fugiat laborum dolor tempora;</li>\r\n	<li>&nbsp;Sit amet consectetur adipisicing elit. Quo delectus repellat facere maiores.</li>\r\n	<li>&nbsp;Repellendus itaque sit quia consequuntur, unde veritatis. dolorum?</li>\r\n</ul>', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>', '<p>Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>', 110, 100, 0, 2, 'jacket', NULL, 8, 'boxy-denim-jacket-1697964487MRpRd', 6, NULL, NULL, NULL, 1, 1, '2023-10-18 09:01:02', '2023-10-22 08:48:07'),
(22, 11, 35, NULL, 25, NULL, 'Oversize Cotton Dress', NULL, 'productImages/6mNHL1697627208.png', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut numquam ullam is recusandae laborum explicabo id sequi quisquam, ab sunt deleniti quidem ea animi facilis quod nostrum odit! Repellendus voluptas suscipit cum harum dolor sciunt.', '<h2>Nam provident sequi</h2>\r\n\r\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>\r\n\r\n<p>More Details</p>\r\n\r\n<ul>\r\n	<li>&nbsp;Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam, dolorum?</li>\r\n	<li>&nbsp;Magnam enim modi, illo harum suscipit tempore aut dolore?</li>\r\n	<li>&nbsp;Numquam eaque mollitia fugiat laborum dolor tempora;</li>\r\n	<li>&nbsp;Sit amet consectetur adipisicing elit. Quo delectus repellat facere maiores.</li>\r\n	<li>&nbsp;Repellendus itaque sit quia consequuntur, unde veritatis. dolorum?</li>\r\n</ul>', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 'oversize-cotton-dress-1697627325QC9K4', NULL, NULL, NULL, NULL, 1, 1, '2023-10-18 09:06:48', '2023-10-18 09:08:45'),
(23, 13, 42, NULL, 25, NULL, 'Quilted Shoulder Bag', 'piiiu678', 'productImages/BKPcM1697627608.png', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut numquam ullam is recusandae laborum explicabo id sequi quisquam, ab sunt deleniti quidem ea animi facilis quod nostrum odit! Repellendus voluptas suscipit cum harum dolor sciunt.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 'quilted-shoulder-bag-1697627608XjfQH', NULL, NULL, NULL, NULL, 1, 1, '2023-10-18 09:13:28', '2023-10-18 09:13:28'),
(24, 12, 37, NULL, 24, NULL, 'Test Product', NULL, 'productImages/yyXga1697961494.webp', NULL, 'Test ProductTest ProductTest Product', '<p>Test ProductTest Product</p>', '<p>Test ProductTest Product</p>', '<p>Test ProductTest Product</p>', 100, 90, 0, 3, 'asd,sdffr', NULL, 1, 'test-product-16979627147su7t', 6, NULL, 'asdas,hgthhj', NULL, 0, 1, '2023-10-22 07:58:14', '2023-10-22 08:18:34');

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
(28, 22, '1697627286MeviK.jpg', 7, NULL, NULL, NULL, NULL, 10, 0, 0, NULL, NULL, '2023-10-18 09:08:06', '2023-10-18 09:08:45'),
(29, 23, '1697627608IoUkR.png', 7, NULL, 2, 2, 7, 99, 0, 0, NULL, NULL, '2023-10-18 09:13:28', NULL),
(30, 24, '1697961772eZG2G.webp', 2, 6, NULL, NULL, NULL, 100, 100, 90, 1, NULL, '2023-10-22 08:02:52', '2023-10-22 08:18:34'),
(31, 24, '1697961772MdE90.webp', 7, 5, NULL, NULL, NULL, 200, 120, 100, 1, NULL, '2023-10-22 08:02:52', '2023-10-22 08:18:34');

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
(4, 9, 'Reduan', '01850453322', 'admin@gmil.com', 'undefined', 'Flat A2, House 4 Rd No. 10', NULL, '1000', 'Mymensingh', 'Bangladesh', '2023-07-18 08:54:41', '2023-10-22 09:17:45');

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
(40, 12, 'MIni Dress', 'subcategory_images/SVGQr1697626575.png', NULL, 'mini-dress-1697626575-bbfS4', 1, 0, '2023-10-18 08:56:15', NULL),
(41, 13, 'Jacket,Women', 'subcategory_images/SHtV41697626616.png', NULL, 'jacketwomen-1697626616-Ix5uv', 1, 0, '2023-10-18 08:56:56', NULL),
(42, 13, 'Woolend Jacket', 'subcategory_images/KLFy81697626644.png', NULL, 'woolend-jacket-1697626644-CcGr9', 1, 0, '2023-10-18 08:57:24', NULL),
(43, 13, 'western denim', 'subcategory_images/fcH6R1697626663.png', NULL, 'western-denim-1697626663-vZmfB', 1, 0, '2023-10-18 08:57:43', NULL),
(44, 13, 'Mini Dress', 'subcategory_images/x2u9h1697626680.png', NULL, 'mini-dress-1697626680-tY34l', 1, 0, '2023-10-18 08:58:00', NULL);

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
(19, 'userProfileImages/bulWt1688356676.jpg', 'Md. Fahim Hossain 2', NULL, 'alifhossain175@gmaill.com', NULL, '655028', '$2y$10$MKFghgrOtoPRr50wFpIx1ubpahBuCI/xoDM2j2ZwysCOoOoHDBUXK', NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-12 03:55:36', '2023-07-03 13:57:56'),
(23, 'userProfileImages/WUsyU1688361290.jpeg', 'Reduan', '01850453322', 'test100@gmail.com', NULL, '154666', '$2y$10$BawJIqWONpVSNWFZ1xCQEe0R8Z4OEn8NiFHENZR6./MMHvM/DP4cS', NULL, 3, NULL, 0, 0, NULL, 1, '2023-06-18 21:08:55', '2023-07-13 03:35:27'),
(25, NULL, 'Bestu', NULL, 'admin@bestu.com.bd', NULL, NULL, '$2y$10$2QIdfvOWHR8qTvE5FcsGDOkKTc6VkFWkAVbVhu7qSd7x8Zq6..FTG', NULL, 1, 'Dhaka, Bangladesh', 0, 0, NULL, 1, '2023-06-27 16:54:07', '2023-07-18 08:42:03'),
(33, NULL, 'Rohan Hossain Siam', '01632563180', 'itssiam856@gmail.com', NULL, NULL, '$2y$10$eCh/uQ.fK7JxcNf1QSNOa./i9GUuOWEEktJQL52HvoWAWogg46/S2', NULL, 1, '64/62 no. Mahut-tuli, Armanitola, Dhaka, Bangladesh.', 0, 0, NULL, 1, '2023-07-15 19:53:27', '2023-07-18 08:42:00'),
(34, NULL, 'Istiak Ahamed Sifat', '01580331693', 'istiakahamed30@gmail.com', NULL, NULL, '$2y$10$/d3M1fFredISBGmlpDv4R.IXCGToxs/31ljKCg3wrE2q2gIk21WB2', NULL, 1, 'Ali nekir dewry, Nazimuddin Road, Dhaka.', 0, 0, NULL, 1, '2023-07-15 19:55:06', '2023-07-18 08:41:56'),
(35, 'userProfileImages/2eYoO1689479533.jpg', 'Ariful', '01643533365', 'ariful@gmail.com', NULL, '772114', '$2y$10$x5m3cQUgd.RHgHWAT7iCu.GMovOLWNBrT9lnB8orb54P5QeU0ls/6', NULL, 3, NULL, 0, 0, NULL, 1, '2023-07-16 13:51:25', '2023-07-19 04:38:59'),
(36, NULL, 'TestUser By Getup', '01969005039', 'test@gmail.com', NULL, NULL, '$2y$10$/9ZP9Bi/GH51I6kZyZTDVefcQI1dAJSOnv/SlPEIT2YPQgIkgiky2', NULL, 2, 'Dhaka, Bangladesh', 0, 0, NULL, 1, '2023-07-18 08:17:43', '2023-07-18 08:42:28'),
(45, NULL, 'Md Fahim Hossain', '01969005041', 'alifhossain174@gmail.com', '2023-10-22 05:47:07', '926152', '$2y$10$XlL/0J.FotoN/14AFx2Zt.xTesgTYBb5XCCG1aLarpIvIIbetp6CC', NULL, 3, 'Uttara, Dhaka-1229', 0, 0, NULL, 1, '2023-10-22 05:20:33', '2023-10-22 06:22:40'),
(47, NULL, 'Md Fahim Hossain', '01969005035', NULL, '2023-10-22 06:11:03', '269200', '$2y$10$ryL5dk9r0et950I4Ux6PXOF11a8L/R5xuGohH5u7yzT2ol3niUWyi', NULL, 3, 'Uttara, Dhaka-1229', 0, 0, NULL, 1, '2023-10-22 06:08:52', '2023-10-22 06:11:03');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_progress`
--
ALTER TABLE `order_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
