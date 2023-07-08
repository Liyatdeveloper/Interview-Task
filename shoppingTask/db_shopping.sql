-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2023 at 01:52 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tbl_ admin', 7, 'add_tbl_admin'),
(26, 'Can change tbl_ admin', 7, 'change_tbl_admin'),
(27, 'Can delete tbl_ admin', 7, 'delete_tbl_admin'),
(28, 'Can view tbl_ admin', 7, 'view_tbl_admin'),
(29, 'Can add tbl_ user', 8, 'add_tbl_user'),
(30, 'Can change tbl_ user', 8, 'change_tbl_user'),
(31, 'Can delete tbl_ user', 8, 'delete_tbl_user'),
(32, 'Can view tbl_ user', 8, 'view_tbl_user'),
(33, 'Can add tbl_ product', 9, 'add_tbl_product'),
(34, 'Can change tbl_ product', 9, 'change_tbl_product'),
(35, 'Can delete tbl_ product', 9, 'delete_tbl_product'),
(36, 'Can view tbl_ product', 9, 'view_tbl_product'),
(37, 'Can add tbl_ cart', 10, 'add_tbl_cart'),
(38, 'Can change tbl_ cart', 10, 'change_tbl_cart'),
(39, 'Can delete tbl_ cart', 10, 'delete_tbl_cart'),
(40, 'Can view tbl_ cart', 10, 'view_tbl_cart'),
(41, 'Can add order_item_tb', 11, 'add_order_item_tb'),
(42, 'Can change order_item_tb', 11, 'change_order_item_tb'),
(43, 'Can delete order_item_tb', 11, 'delete_order_item_tb'),
(44, 'Can view order_item_tb', 11, 'view_order_item_tb');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(11, 'shoppingApp', 'order_item_tb'),
(7, 'shoppingApp', 'tbl_admin'),
(10, 'shoppingApp', 'tbl_cart'),
(9, 'shoppingApp', 'tbl_product'),
(8, 'shoppingApp', 'tbl_user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-07 17:11:39.407073'),
(2, 'auth', '0001_initial', '2023-07-07 17:11:45.563401'),
(3, 'admin', '0001_initial', '2023-07-07 17:11:47.094670'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-07 17:11:47.141548'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-07 17:11:47.188423'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-07 17:11:49.016569'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-07 17:11:49.500951'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-07 17:11:49.657202'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-07 17:11:49.672828'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-07 17:11:50.079084'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-07 17:11:50.094710'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-07 17:11:50.125960'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-07 17:11:50.297835'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-07 17:11:50.407212'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-07 17:11:50.532214'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-07 17:11:50.563464'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-07 17:11:50.735341'),
(18, 'sessions', '0001_initial', '2023-07-07 17:11:51.094720'),
(19, 'shoppingApp', '0001_initial', '2023-07-07 17:16:29.562202'),
(20, 'shoppingApp', '0002_alter_tbl_admin_email_alter_tbl_admin_pswd', '2023-07-07 17:17:59.645323'),
(21, 'shoppingApp', '0003_tbl_user', '2023-07-07 17:36:35.116400'),
(22, 'shoppingApp', '0004_tbl_product', '2023-07-07 18:57:48.337725'),
(23, 'shoppingApp', '0005_tbl_cart', '2023-07-08 08:22:18.862342'),
(24, 'shoppingApp', '0006_order_item_tb', '2023-07-08 09:25:32.777526');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zk3c60fqtsbw1xpkv0y5x5hytarjizry', 'eyJpZCI6MX0:1qI5Is:aH_GUuDVZ5Qi6vngGmT_S52qk6U6SHn-Gl3pDn7RBLE', '2023-07-22 10:36:38.850189');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingapp_order_item_tb`
--

CREATE TABLE `shoppingapp_order_item_tb` (
  `id` bigint(20) NOT NULL,
  `total` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `packing_status` varchar(30) NOT NULL,
  `cart_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingapp_order_item_tb`
--

INSERT INTO `shoppingapp_order_item_tb` (`id`, `total`, `date`, `time`, `payment_status`, `packing_status`, `cart_id_id`, `product_id_id`, `user_id_id`) VALUES
(1, '5050', '2023-07-08', '14:55:56', 'paid', 'pending', 1, 2, 1),
(2, '15050', '2023-07-08', '15:11:04', 'paid', 'processing', 4, 2, 1),
(3, '10050', '2023-07-08', '15:12:09', 'paid', 'delivered', 6, 2, 1),
(4, '5050', '2023-07-08', '15:39:42', 'paid', 'reject', 7, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingapp_tbl_admin`
--

CREATE TABLE `shoppingapp_tbl_admin` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingapp_tbl_admin`
--

INSERT INTO `shoppingapp_tbl_admin` (`id`, `username`, `email`, `pswd`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingapp_tbl_cart`
--

CREATE TABLE `shoppingapp_tbl_cart` (
  `id` bigint(20) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `total_price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `product_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingapp_tbl_cart`
--

INSERT INTO `shoppingapp_tbl_cart` (`id`, `qty`, `date`, `total_price`, `status`, `product_id_id`, `user_id_id`) VALUES
(1, '1', '2023-07-08', '5000', 'paid', 2, 1),
(2, '2', '2023-07-08', '10000', 'paid', 2, 1),
(4, '1', '2023-07-08', '5000', 'paid', 2, 1),
(5, '1', '2023-07-08', '5000', 'paid', 2, 1),
(6, '1', '2023-07-08', '5000', 'paid', 2, 1),
(7, '1', '2023-07-08', '5000', 'paid', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingapp_tbl_product`
--

CREATE TABLE `shoppingapp_tbl_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `qty` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `details` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingapp_tbl_product`
--

INSERT INTO `shoppingapp_tbl_product` (`id`, `name`, `img`, `qty`, `price`, `details`, `status`) VALUES
(2, 'toy cars', 'products/123_YJpnfbZ.jpg', '50', '5000', 'electric automatic cars ', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingapp_tbl_user`
--

CREATE TABLE `shoppingapp_tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingapp_tbl_user`
--

INSERT INTO `shoppingapp_tbl_user` (`id`, `name`, `email`, `pswd`, `phone`, `address`) VALUES
(1, 'Anu', 'anu@gmail.com', '12345678', '5454545455', 'kunnam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `shoppingapp_order_item_tb`
--
ALTER TABLE `shoppingapp_order_item_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shoppingApp_order_it_cart_id_id_51ab6dfe_fk_shoppingA` (`cart_id_id`),
  ADD KEY `shoppingApp_order_it_product_id_id_7b269842_fk_shoppingA` (`product_id_id`),
  ADD KEY `shoppingApp_order_it_user_id_id_d2237348_fk_shoppingA` (`user_id_id`);

--
-- Indexes for table `shoppingapp_tbl_admin`
--
ALTER TABLE `shoppingapp_tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoppingapp_tbl_cart`
--
ALTER TABLE `shoppingapp_tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shoppingApp_tbl_cart_product_id_id_2cc04bed_fk_shoppingA` (`product_id_id`),
  ADD KEY `shoppingApp_tbl_cart_user_id_id_1992d49a_fk_shoppingA` (`user_id_id`);

--
-- Indexes for table `shoppingapp_tbl_product`
--
ALTER TABLE `shoppingapp_tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoppingapp_tbl_user`
--
ALTER TABLE `shoppingapp_tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `shoppingapp_order_item_tb`
--
ALTER TABLE `shoppingapp_order_item_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shoppingapp_tbl_admin`
--
ALTER TABLE `shoppingapp_tbl_admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shoppingapp_tbl_cart`
--
ALTER TABLE `shoppingapp_tbl_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shoppingapp_tbl_product`
--
ALTER TABLE `shoppingapp_tbl_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shoppingapp_tbl_user`
--
ALTER TABLE `shoppingapp_tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `shoppingapp_order_item_tb`
--
ALTER TABLE `shoppingapp_order_item_tb`
  ADD CONSTRAINT `shoppingApp_order_it_cart_id_id_51ab6dfe_fk_shoppingA` FOREIGN KEY (`cart_id_id`) REFERENCES `shoppingapp_tbl_cart` (`id`),
  ADD CONSTRAINT `shoppingApp_order_it_product_id_id_7b269842_fk_shoppingA` FOREIGN KEY (`product_id_id`) REFERENCES `shoppingapp_tbl_product` (`id`),
  ADD CONSTRAINT `shoppingApp_order_it_user_id_id_d2237348_fk_shoppingA` FOREIGN KEY (`user_id_id`) REFERENCES `shoppingapp_tbl_user` (`id`);

--
-- Constraints for table `shoppingapp_tbl_cart`
--
ALTER TABLE `shoppingapp_tbl_cart`
  ADD CONSTRAINT `shoppingApp_tbl_cart_product_id_id_2cc04bed_fk_shoppingA` FOREIGN KEY (`product_id_id`) REFERENCES `shoppingapp_tbl_product` (`id`),
  ADD CONSTRAINT `shoppingApp_tbl_cart_user_id_id_1992d49a_fk_shoppingA` FOREIGN KEY (`user_id_id`) REFERENCES `shoppingapp_tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
