-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2025 at 06:44 PM
-- Server version: 10.6.23-MariaDB-log
-- PHP Version: 8.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softcentsnet_acnnosms`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `descriptions` longtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `meta` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `slug`, `image`, `status`, `descriptions`, `tags`, `meta`, `created_at`, `updated_at`) VALUES
(1, 1, 'Best HR & Payroll Management Software in World (2024)', 'best-hr-payroll-management-software-in-world-2024', 'uploads/24/05/1716728353-59.png', 1, 'Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary', '[\"Consequuntur est eos\"]', '{\"title\":\"Debitis accusamus fu\",\"description\":\"Magna saepe dolorum\"}', '2024-03-05 19:01:52', '2024-05-27 00:59:13'),
(2, 1, 'Best HR & Payroll Software for Medium & Large Businesses', 'best-hr-payroll-software-for-medium-large-businesses', 'uploads/24/05/1716728333-145.jfif', 1, 'Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary', '[\"Pariatur Neque cons\"]', '{\"title\":\"Esse accusamus quia\",\"description\":\"Culpa ea omnis sed q\"}', '2024-03-05 19:02:27', '2024-05-27 00:58:53'),
(3, 1, 'Best HR & Payroll Management Software in World (2022)', 'best-hr-payroll-management-software-in-world-2022', 'uploads/24/05/1716728317-530.jfif', 1, 'Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary', '[\"hrm\"]', '{\"title\":\"Best HR & Payroll Management Software in World (2024)\",\"description\":\"Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary\"}', '2024-03-10 00:10:33', '2024-05-27 00:58:37'),
(4, 1, 'Best HR & Payroll Software for Medium & Large Businesses (2023)', 'best-hr-payroll-software-for-medium-large-businesses-2023', 'uploads/24/05/1716728298-489.jpg', 1, 'Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary', '[\"hrm\"]', '{\"title\":\"Best HR & Payroll Software for Medium & Large Businesses (2023)\",\"description\":\"Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary\"}', '2024-03-10 00:13:14', '2024-05-27 00:58:18'),
(5, 1, 'Best HR & Payroll Management Software in World (2021)', 'best-hr-payroll-management-software-in-world-2021', 'uploads/24/05/1716728286-230.jpg', 1, 'Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary', '[\"hrm\"]', '{\"title\":\"Best HR & Payroll Management Software in World (2021)\",\"description\":\"Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary\"}', '2024-03-10 00:15:04', '2024-05-27 00:58:06'),
(6, 1, 'Best HR & Payroll Software for Medium & Large Businesses(2020)', 'best-hr-payroll-software-for-medium-large-businesses2020', 'uploads/24/05/1716728270-89.jpg', 1, 'Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary', '[\"hrm\"]', '{\"title\":\"Best HR & Payroll Software for Medium & Large Businesses\",\"description\":\"Blessing welcomed ladyship she met humo ured sir breeding her. Six curiosity day assurance bed necessary\"}', '2024-03-10 00:17:11', '2024-05-27 00:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `total_numbers` int(11) NOT NULL DEFAULT 0,
  `numbers` longtext NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_sms`
--

CREATE TABLE `campaign_sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `senderid_id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `numbers` longtext NOT NULL,
  `charges` double NOT NULL DEFAULT 0,
  `total_sms` int(11) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `is_unicode` tinyint(1) NOT NULL DEFAULT 0,
  `contents` longtext NOT NULL,
  `schedule` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `comment` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `rate` double DEFAULT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `rate`, `symbol`, `position`, `status`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Bangladeshi Taka', 'BDT', 100, '৳', 'right', 1, 0, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'US Dollar', 'USD', 1, '$', 'left', 1, 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(3, 'Euro', 'EUR', 0.98, '€', 'left', 1, 0, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(4, 'Indian Rupee', 'INR', 79.37, '₹', 'left', 1, 0, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(5, 'Nigerian Naira', 'NGN', 417.57, '₦', 'left', 1, 0, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(6, 'Malaysian Ringgit', 'MYR', 4.46, 'RM', 'left', 1, 0, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(7, 'Omani rial', 'OMR', 0.39, 'ر.ع.', 'right', 1, 0, '2025-10-10 00:42:23', '2025-10-10 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
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
  `question` varchar(191) NOT NULL,
  `answer` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What is an SMS API? What is an SMS gateway API?', 'An SMS API (or SMS Gateway API) is a software interface                       that allows developers to build code that can send and                       receive SMS messages using an Application Programming  Interface (API).', 0, '2024-01-25 10:49:52', '2024-01-25 10:54:28'),
(2, 'Can I send SMS messages to any numbers?', 'An SMS API (or SMS Gateway API) is a software interface that allows developers to build code that can send and                       receive SMS messages using an Application Programming  Interface (API).', 1, '2024-01-25 10:50:22', '2024-01-25 12:19:50'),
(3, 'Is there a limit to the number of SMS I can send   and receive?', 'An SMS API (or SMS Gateway API) is a software interface that allows developers to build code that can send and                       receive SMS messages using an Application Programming  Interface (API).', 0, '2024-01-25 10:50:51', '2024-01-25 12:26:34'),
(4, 'How secure is SMS Gateways feature?', 'An SMS API (or SMS Gateway API) is a software interface that allows developers to build code that can send and                       receive SMS messages using an Application Programming  Interface (API).', 0, '2024-01-25 10:51:27', '2024-01-25 12:20:12'),
(5, 'Is there a limit to the number of SMS I can send  and receive?', 'An SMS API (or SMS Gateway API) is a software interface that allows developers to build code that can send and                       receive SMS messages using an Application Programming  Interface (API).', 1, '2024-01-25 10:52:01', '2024-01-25 12:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `mode` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `charge` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `manual_data` text DEFAULT NULL,
  `is_manual` tinyint(1) NOT NULL DEFAULT 0,
  `accept_img` tinyint(1) NOT NULL DEFAULT 0,
  `namespace` varchar(191) DEFAULT NULL,
  `phone_required` int(11) NOT NULL DEFAULT 0,
  `instructions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `name`, `currency_id`, `mode`, `status`, `charge`, `image`, `data`, `manual_data`, `is_manual`, `accept_img`, `namespace`, `phone_required`, `instructions`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 2, '1', '1', 2, NULL, '{\"stripe_key\":\"pk_test_6rhnZv1NmRtSp5DfziBO8YFb00X65CfFwq\",\"stripe_secret\":\"sk_test_YKyuAoMHjXaUADW4SuKuXeIn0079Pu1OSD\"}', NULL, 0, 0, 'App\\Library\\StripeGateway', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(2, 'mollie', 2, '1', '1', 2, NULL, '{\"api_key\":\"test_WqUGsP9qywy3eRVvWMRayxmVB5dx2r\"}', NULL, 0, 0, 'App\\Library\\Mollie', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(3, 'paypal', 2, '1', '1', 2, NULL, '{\"client_id\":\"ARKsbdD1qRpl3WEV6XCLuTUsvE1_5NnQuazG2Rvw1NkMG3owPjCeAaia0SXSvoKPYNTrh55jZieVW7xv\",\"client_secret\":\"EJed2cGACzB2SJFQwSannKAA1gyBjKkwlKh1o8G75zQHYzAgLQ3n7f9EfeNCZgtfPDMxyFzfp6oQWPia\"}', NULL, 0, 0, 'App\\Library\\Paypal', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(4, 'paystack', 5, '1', '1', 2, NULL, '{\"public_key\":\"pk_test_84d91b79433a648f2cd0cb69287527f1cb81b53d\",\"secret_key\":\"sk_test_cf3a234b923f32194fb5163c9d0ab706b864cc3e\"}', NULL, 0, 0, 'App\\Library\\Paystack', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(5, 'razorpay', 4, '1', '1', 2, NULL, '{\"key_id\":\"rzp_test_siWkeZjPLsYGSi\",\"key_secret\":\"jmIzYyrRVMLkC9BwqCJ0wbmt\"}', NULL, 0, 0, 'App\\Library\\Razorpay', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(6, 'instamojo', 4, '1', '1', 2, NULL, '{\"x_api_key\":\"test_0027bc9da0a955f6d33a33d4a5d\",\"x_auth_token\":\"test_211beaba149075c9268a47f26c6\"}', NULL, 0, 0, 'App\\Library\\Instamojo', 1, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(7, 'toyyibpay', 6, '1', '1', 2, NULL, '{\"user_secret_key\":\"v4nm8x50-bfb4-7f8y-evrs-85flcysx5b9p\",\"cateogry_code\":\"5cc45t69\"}', NULL, 0, 0, 'App\\Library\\Toyyibpay', 1, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(8, 'flutterwave', 5, '1', '1', 2, NULL, '{\"public_key\":\"FLWPUBK_TEST-f448f625c416f69a7c08fc6028ebebbf-X\",\"secret_key\":\"FLWSECK_TEST-561fa94f45fc758339b1e54b393f3178-X\",\"encryption_key\":\"FLWSECK_TEST498417c2cc01\",\"payment_options\":\"card\"}', NULL, 0, 0, 'App\\Library\\Flutterwave', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(9, 'thawani', 7, '1', '1', 2, NULL, '{\"secret_key\":\"rRQ26GcsZzoEhbrP2HZvLYDbn9C9et\",\"publishable_key\":\"HGvTMLDssJghr9tlN9gr4DVYt0qyBy\"}', NULL, 0, 0, 'App\\Library\\Thawani', 1, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(10, 'mercadopago', 2, '1', '1', 2, NULL, '{\"secret_key\":\"TEST-1884511374835248-071019-698f8465954d5983722e8b4d7a05f1ca-370993848\",\"public_key\":\"TEST-7d239fd1-3c41-4dc0-96eb-f759b7d2adab\"}', NULL, 0, 0, 'App\\Library\\Mercado', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(11, 'phonepe', 4, '1', '1', 2, NULL, '{\"key_id\":\"rzp_test_siWkeZjPLsYGSi\",\"key_secret\":\"jmIzYyrRVMLkC9BwqCJ0wbmt\"}', NULL, 0, 0, 'App\\Library\\PhonePe', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(12, 'paytm', 4, '1', '1', 2, NULL, '{\"merchant_id\":\"MhjqFc42556626519745\",\"merchant_key\":\"0dC_Dq!nif6e1Kie\",\"merchant_website\":\"WEBSTAGING\",\"channel\":\"WEB\",\"industry_type\":\"Retail\",\"environment\":\"local\"}', NULL, 0, 0, 'App\\Library\\Paytm', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:54:44'),
(13, 'Sslcommerz', 1, '1', '1', 1, NULL, '{\"store_id\":\"maant62a8633caf4a3\",\"store_password\":\"maant62a8633caf4a3@ssl\"}', NULL, 0, 0, 'App\\Library\\SslCommerz', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 17:45:52'),
(14, 'Manual', 2, '1', '1', 0, NULL, '', '{\"label\":[\"Bank Name\",\"Transaction ID\"],\"is_required\":[\"1\",\"1\"]}', 1, 1, 'App\\Library\\StripeGateway', 0, NULL, '2024-02-18 17:45:52', '2024-02-18 18:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_types`
--

CREATE TABLE `gateway_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `inputs` longtext NOT NULL,
  `namespace` varchar(191) DEFAULT NULL,
  `driver` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_types`
--

INSERT INTO `gateway_types` (`id`, `name`, `inputs`, `namespace`, `driver`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AWS SNS', '{\"names\":[\"key\",\"secret\",\"region\",\"from\",\"type\"],\"labels\":[\"Api Key\",\"Secret Key\",\"Region\",\"Sender ID\",\"Type\"]}', 'App\\SmsGateways\\TzskSms', 'sns', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'Textlocal', '{\"names\":[\"url\",\"username\",\"hash\",\"from\"],\"labels\":[\"Api URL\",\"User Name\",\"Hash\",\"Sender Name\"]}', 'App\\SmsGateways\\TzskSms', 'textlocal', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(3, 'Twilio', '{\"names\":[\"sid\",\"token\",\"from\"],\"labels\":[\"Api SID\",\"Api Token\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'twilio', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(4, 'Clockwork', '{\"names\":[\"key\"],\"labels\":[\"Api Key\"]}', 'App\\SmsGateways\\TzskSms', 'clockwork', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(5, 'LINK Mobility', '{\"names\":[\"url\",\"username\",\"password\",\"from\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Sender name\"]}', 'App\\SmsGateways\\TzskSms', 'linkmobility', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(6, 'Melipayamak', '{\"names\":[\"username\",\"password\",\"from\",\"flash\"],\"labels\":[\"User Name\",\"Password\",\"Default Number\",\"Flash\"]}', 'App\\SmsGateways\\TzskSms', 'melipayamak', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(7, 'Melipayamakpattern', '{\"names\":[\"username\",\"password\"],\"labels\":[\"User Name\",\"Password\"]}', 'App\\SmsGateways\\TzskSms', 'melipayamakpattern', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(8, 'Kavenegar', '{\"names\":[\"apiKey\",\"from\"],\"labels\":[\"Api Key\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'kavenegar', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(9, 'Smsir', '{\"names\":[\"url\",\"apiKey\",\"secretKey\",\"from\"],\"labels\":[\"Api URL\",\"Api Key\",\"Secret Key\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'smsir', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(10, 'Tsms', '{\"names\":[\"url\",\"username\",\"password\",\"from\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'tsms', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(11, 'Farazsms', '{\"names\":[\"url\",\"username\",\"password\",\"from\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'farazsms', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(12, 'Farazsmspattern', '{\"names\":[\"url\",\"username\",\"password\",\"from\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'farazsmspattern', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(13, 'SMS Gateway Me', '{\"names\":[\"apiToken\",\"from\"],\"labels\":[\"Api Token\",\"Default Device ID\"]}', 'App\\SmsGateways\\TzskSms', 'smsgatewayme', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(14, 'SmsGateWay24', '{\"names\":[\"url\",\"token\",\"deviceid\",\"from\"],\"labels\":[\"Api URL\",\"Api Token\",\"Device ID\",\"Device SIM Slot\"]}', 'App\\SmsGateways\\TzskSms', 'smsgateway24', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(15, 'Ghasedak', '{\"names\":[\"url\",\"apiKey\",\"from\"],\"labels\":[\"Api URL\",\"Api Key\",\"Default Number\"]}', 'App\\SmsGateways\\TzskSms', 'ghasedak', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(16, 'Sms77', '{\"names\":[\"apiKey\",\"flash\",\"from\"],\"labels\":[\"Api Key\",\"Flash\",\"Sender name\"]}', 'App\\SmsGateways\\TzskSms', 'sms77', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(17, 'SabaPayamak', '{\"names\":[\"url\",\"username\",\"password\",\"from\",\"token_valid_day\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\",\"Token Validity day\"]}', 'App\\SmsGateways\\TzskSms', 'sabapayamak', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(18, 'LSim', '{\"names\":[\"username\",\"password\",\"from\"],\"labels\":[\"User Name\",\"Password\",\"Sender ID\"]}', 'App\\SmsGateways\\TzskSms', 'lsim', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(19, 'Rahyabcp', '{\"names\":[\"url\",\"username\",\"password\",\"from\",\"flash\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\",\"Flash\"]}', 'App\\SmsGateways\\TzskSms', 'rahyabcp', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(20, 'Rahyabir', '{\"names\":[\"url\",\"username\",\"password\",\"company\",\"from\",\"token_valid_day\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Company Name\",\"Default Number\",\"Token Validity Day\"]}', 'App\\SmsGateways\\TzskSms', 'rahyabir', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(21, 'D7networks', '{\"names\":[\"url\",\"username\",\"password\",\"originator\",\"report_url\",\"token_valid_day\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Originator\",\"Report Url\",\"Token Validity Day\"]}', 'App\\SmsGateways\\TzskSms', 'd7networks', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(22, 'Hamyarsms', '{\"names\":[\"url\",\"username\",\"password\",\"from\",\"flash\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\",\"Flash\"]}', 'App\\SmsGateways\\TzskSms', 'hamyarsms', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(23, 'SMSApi', '{\"names\":[\"url\",\"username\",\"password\",\"from\",\"cc\"],\"labels\":[\"Api URL\",\"User Name\",\"Password\",\"Default Number\",\"Country Code\"]}', 'App\\SmsGateways\\TzskSms', 'smsapi', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(24, 'Route Mobile', '{\"names\":[\"api_url\",\"api_method\",\"username\",\"password\",\"type\",\"dlr\",\"number_key\",\"destination\",\"source\",\"message_key\"],\"labels\":[\"Api URL\",\"Api Method\",\"User Name\",\"Password\",\"Type\",\"DLR\",\"Number Key\",\"Destination\",\"Source\",\"Message Key\"]}', 'App\\SmsGateways\\RouteMobile', 'smsapi', 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `message` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000001_create_plans_table', 1),
(2, '2014_10_12_000001_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2023_05_20_040815_create_notifications_table', 1),
(8, '2023_07_10_095745_create_permission_tables', 1),
(9, '2023_07_10_104133_create_options_table', 1),
(10, '2023_11_09_150204_create_currencies_table', 1),
(11, '2023_11_09_150205_create_gateways_table', 1),
(12, '2023_11_09_150206_create_plan_subscribes_table', 1),
(13, '2023_11_12_151718_create_senderids_table', 1),
(14, '2023_11_28_112937_create_gateway_types_table', 1),
(15, '2023_11_28_112937_create_groups_table', 1),
(16, '2023_11_28_112938_create_campaigns_table', 1),
(17, '2023_11_28_112938_create_contacts_table', 1),
(18, '2023_11_28_112938_create_smsgateways_table', 1),
(19, '2023_11_28_112939_create_sms_table', 1),
(20, '2023_11_29_175552_create_templates_table', 1),
(21, '2023_11_30_170340_create_recharges_table', 1),
(22, '2023_12_12_135411_create_sender_ips_table', 1),
(23, '2024_01_23_165952_create_faqs_table', 1),
(24, '2024_01_24_100427_create_testimonials_table', 1),
(25, '2024_01_24_161657_create_campaign_sms_table', 1),
(26, '2024_02_06_124249_create_services_table', 1),
(27, '2024_02_15_114309_create_transactions_table', 1),
(28, '2024_03_02_103537_create_blogs_table', 1),
(29, '2024_03_02_161446_create_comments_table', 1),
(30, '2024_03_04_120352_create_messages_table', 1),
(31, '2024_03_09_112101_create_newsletters_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `key`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'general', '{\"title\":\"SMS Pro\",\"email\":\"support@acnoo.com\",\"phone\":\"01991-122669\",\"copyright\":\"\\u00a9 2024 Acnoo, all rights reserved.\",\"develop_by\":\"Acnoo\",\"footer_desc\":\"Acnoo is a software, theme, mobile, and android application, theme, and plugin development company.\",\"logo\":\"uploads\\/24\\/05\\/1716782042-733.svg\",\"favicon\":\"uploads\\/24\\/05\\/1716727826-454.svg\",\"front_logo\":\"uploads\\/24\\/05\\/1716727826-411.svg\"}', 1, '2024-05-27 00:39:43', '2024-05-27 15:54:02'),
(2, 'notice', '{\"title\":\"As per attached (BTRC) guideline for SMS broadcast please flow the below instruction from now onward.\",\"status\":\"1\",\"description\":\"Dear User\\/Client, Greetings! As per regulations, all kinds of promotional\\/greetings SMS have to be in Bangla (Unicode) for both Campaign and API. Except Only machine-generated SMS\\/notification (example: ATM card OTP etc.), all other SMS content must be in Bangla and all are requested to strictly follow this regulation. Otherwise, the SMS account will be blocked and the User\\/Client will bear the responsibility or any damage caused due to violation of this regulation. Thanks.\"}', 1, '2024-05-27 00:39:43', '2024-05-27 00:39:43'),
(3, 'sms-settings', '{\"text_char_per_sms\":\"160\",\"long_text_char_per_sms\":\"153\",\"unicode_char_per_sms\":\"70\",\"long_unicode_char_per_sms\":\"67\"}', 1, '2024-05-27 00:39:43', '2024-05-27 00:39:43'),
(4, 'manage-pages', '{\"headings\":{\"slider_title\":\"Bulk SMS Marketing Software For\",\"slider_btn1\":\"Buy Now\",\"slider_btn1_link\":\"#pricing\",\"slider_btn2\":\"Watch Video\",\"slider_btn2_link\":\"https:\\/\\/www.youtube.com\\/embed\\/XxPaZzXEcEM?si=vVmNUfevHU4H5sZw\\\" title=\\\"YouTube video player\",\"slider_description\":\"Make your global bulk message delivery faster & more reliable.\\r\\nWe will take care of all the complexities for you.\",\"sms_pro_text\":[\"Retailer\",\"Wholesaler\",\"API Saler\"],\"about_us_title\":\"About Us\",\"about_us_description\":\"Home - About us\",\"our_company_title\":\"About Our Company\",\"our_company_short_desc\":\"Empower your communication with the fastest, most reliable Bulk SMS service! At [Your Bulk SMS Company Name], we specialize in delivering seamless messaging solutions tailored to your needs. Whether it\'s marketing campaigns, event reminders, or customer notifications, we\'ve got the tools to elevate your outreach.\",\"our_company_long_desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since Lorem Ipsum\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.\",\"our_mission_title\":\"Our Mission\",\"our_mission_short_desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"our_mission_long_desc\":\"It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release.\",\"our_vision_title\":\"Our Vision\",\"our_vision_short_desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type Scrambled it to make a type specimen book.\",\"our_vision_long_desc\":\"It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently\",\"blog_title\":\"Blog List\",\"blog_desc\":\"Home - Blogs\",\"blog_details\":\"Blog Details\",\"feature_section_title\":[\"1100+\",\"24x7 Support\",\"Reliable Delivery\",\"API Access\"],\"feature_section_short_des\":[\"Happy Customers\",\"Customer can get help\",\"Confidently deliver your SMS\",\"We are giving free API\"],\"phone_number\":\"01712022529\",\"email_address\":\"support@acnoo.com\",\"active_hours\":\"10AM - 5PM\",\"contact_title\":\"Connect with your customers around the globe.\",\"contact_description\":\"SMS Pro is the smoothest and fastest solution to manage your phone support.\\r\\nAll you need is our App and an Internet Connection and you are good to go.\",\"contact_section_title\":[\"SMS Service\",\"Enhances Communication\",\"Time Efficient\"],\"contact_section_short_des\":[\"Send Instant Messages To Clients and Subordinates.\",\"Immediately inform and communicate to your clients or teammates.\",\"Personalize your daily communication and save time.\"],\"access-section_title\":\"Access Real-Time Delivery\",\"access-section_btn\":\"Let\\u2019s Give a Try\",\"access-section_btn_link\":\"#pricing\",\"access-section_short_des\":\"As of my last knowledge update in January 2022, \\\"Masking SMS\\\" typically refers to a practice in which the sender of a text message\",\"access-section_description\":\"In a standard SMS, the sender ID is usually a phone number, and it is displayed to the recipient. However, with masking SMS, the sender can replace the phone number with a customized alphanumeric string or another phone number, making it appear\",\"service_title\":\"Services We Provide\",\"faqs_title\":\"Frequently Asked Questions\",\"client_title\":\"What Our Client Say\",\"client_description\":\"Access the results from the latest Atradius Collections Customer Satisfaction\\r\\nSurvey as well as the reviews of Atradius customers in written testimonials.\",\"contact_us_main_title\":\"Contact Us\",\"contact_us_main_description\":\"Home - Contact us\",\"contact_us_branch_name\":\"SMS Pro\",\"contact_us_branch_address\":\"Farwaniya block :3 Habeeb Munawer street  Tisa alif complex floor no.8 office number 16\",\"contact_us_title\":\"Start New Project With Us\",\"contact_us_availability\":\"Monday - Friday From 9:00AM To 6:00PM\",\"contact_us_description\":\"We will help a client\'s problems to develop the products they have with high quality and change the appearance.\",\"contact_us_option_title\":\"Tel\",\"contact_us_option_contact\":\"+965 66384685\",\"contact_us_option_title2\":\"tel\",\"contact_us_option_contact2\":\"+965 60704486\",\"contact_us_option_title3\":\"Email\",\"contact_us_option_contact3\":\"support@acnoo.com\",\"map_location_embed\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3651.799560608808!2d90.38660807447124!3d23.754526088619624!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b9160ab6190f%3A0x95b5ef0294e3225f!2sAcnoo!5e0!3m2!1sen!2sbd!4v1698829116953!5m2!1sen!2sbd\\\" width=\\\"100%\\\" height=\\\"350\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\"><\\/iframe>\",\"pricing_title\":\"Our Pricing Plan\",\"term_of_service_title\":\"Non Masking SMS\",\"term_of_service_desc_one\":\"In our Company we offer many cleaning services such as cleaning indoor and outdoor building, commercial companies housed and offices through a well trained personnel using a very developed safety equipment\\u2019s.\",\"term_of_service_desc_two\":\"Cleaning services takes responsibility of removing all dirt through internationally approved detergents and colleting the garbage through our special machines and vehicles and empty the container in a very developed technique\",\"term_of_service_desc_three\":\"We, the Acnoo consider that cleaning glass and windows is a priority in our work. In fact it\\u2019s the mirror how reflects how expert we are. It\\u2019s the first impress that customer look forward to estimate us. This method of course is done by a specialized machines, tested detergents and tools and well trained worker.\",\"privacy_title\":\"Privacy Policy Rules And Regulation\",\"privacy_desc_one\":\"In our Company we offer many cleaning services such as cleaning indoor and outdoor building, commercial companies housed and offices through a well trained personnel using a very developed safety equipment\\u2019s.\",\"privacy_desc_two\":\"Cleaning services takes responsibility of removing all dirt through internationally approved detergents and colleting the garbage through our special machines and vehicles and empty the container in a very developed technique\",\"privacy_desc_three\":\"We, the Acnoo consider that cleaning glass and windows is a priority in our work. In fact it\\u2019s the mirror how reflects how expert we are. It\\u2019s the first impress that customer look forward to estimate us. This method of course is done by a specialized machines, tested detergents and tools and well trained worker.\",\"refund_title\":\"Refund Policy In Our Company\",\"refund_desc_one\":\"In our Company we offer many cleaning services such as cleaning indoor and outdoor building, commercial companies housed and offices through a well trained personnel using a very developed safety equipment\\u2019s.\",\"refund_desc_two\":\"Cleaning services takes responsibility of removing all dirt through internationally approved detergents and colleting the garbage through our special machines and vehicles and empty the container in a very developed technique\",\"refund_desc_three\":\"We, the Acnoo consider that cleaning glass and windows is a priority in our work. In fact it\\u2019s the mirror how reflects how expert we are. It\\u2019s the first impress that customer look forward to estimate us. This method of course is done by a specialized machines, tested detergents and tools and well trained worker.\",\"footer_socials_links\":[\"https:\\/\\/www.facebook.com\\/acnooteam\",\"https:\\/\\/www.facebook.com\\/acnooteam\",\"https:\\/\\/www.facebook.com\\/acnooteam\",\"https:\\/\\/www.facebook.com\\/acnooteam\",\"https:\\/\\/www.facebook.com\\/acnooteam\"],\"sidebar_socials_links\":[\"https:\\/\\/twitter.com\\/\",\"https:\\/\\/www.facebook.com\\/acnooteam\",\"https:\\/\\/www.instagram.com\\/acnooteam\\/\",\"https:\\/\\/www.youtube.com\\/\"]},\"contact_img\":null,\"contact_us_option_icon\":\"uploads\\/24\\/02\\/1709186288-279.png\",\"contact_us_option_icon2\":\"uploads\\/24\\/02\\/1709186288-644.png\",\"contact_us_option_icon3\":\"uploads\\/24\\/02\\/1709134530-92.png\",\"contact_us_image\":\"uploads\\/24\\/05\\/1716729000-927.png\",\"contact_us_branch_icon\":\"uploads\\/24\\/02\\/1709136030-411.png\",\"slider_image\":\"uploads\\/24\\/05\\/1716727714-677.png\",\"faq_image\":null,\"access_section_image\":\"uploads\\/24\\/05\\/1716728247-991.png\",\"about_icon_1\":null,\"about_icon_2\":null,\"about_icon_3\":null,\"contact_section_img\":null,\"about_section_img\":null,\"faqs_image\":\"uploads\\/24\\/05\\/1716728058-697.png\",\"our_company_image\":\"uploads\\/24\\/05\\/1716728058-293.png\",\"our_mission_image\":\"uploads\\/24\\/05\\/1716728058-556.png\",\"our_vision_image\":\"uploads\\/24\\/05\\/1716728058-205.png\",\"card_icons\":null,\"branch_icons\":null,\"contact_icons\":null,\"footer_socials_icons\":[\"uploads\\/24\\/03\\/1709993409_65ec6dc1201ae.png\",\"uploads\\/24\\/03\\/1709993409_65ec6dc1235a2.png\",\"uploads\\/24\\/03\\/1709993409_65ec6dc123bbb.png\",\"uploads\\/24\\/03\\/1709993409_65ec6dc124129.png\",\"uploads\\/24\\/03\\/1709993409_65ec6dc124709.png\"],\"sidebar_socials_icons\":[\"uploads\\/24\\/06\\/1717500376_665ef9d8918ad.svg\",\"uploads\\/24\\/06\\/1717500376_665ef9d89a329.svg\",\"uploads\\/24\\/06\\/1717500376_665ef9d89ad13.svg\",\"uploads\\/24\\/06\\/1717500376_665ef9d89b3c2.svg\"],\"feature_section_logo\":[\"uploads\\/24\\/01\\/1706160530_65b1f192d4607.png\",\"uploads\\/24\\/01\\/1706160530_65b1f192d8f41.png\",\"uploads\\/24\\/01\\/1706160530_65b1f192d9a4a.png\",\"uploads\\/24\\/01\\/1706160530_65b1f192d9ff6.png\"],\"contact_section_logo\":[\"uploads\\/24\\/05\\/1716729000_665334a8196c1.png\",\"uploads\\/24\\/05\\/1716729000_665334a819810.png\",\"uploads\\/24\\/05\\/1716729000_665334a819924.png\"],\"card_image\":null,\"body_image\":\"uploads\\/24\\/05\\/1716896938-294.png\"}', 1, '2024-05-27 00:39:43', '2024-06-04 17:26:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'orders-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(3, 'orders-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(4, 'recharges-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(5, 'recharges-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(6, 'plans-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(7, 'plans-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(8, 'plans-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(9, 'plans-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(10, 'users-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(11, 'users-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(12, 'users-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(13, 'users-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(14, 'pricings-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(15, 'pricings-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(16, 'pricings-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(17, 'pricings-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(18, 'customers-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(19, 'customers-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(20, 'customers-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(21, 'customers-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(22, 'senderids-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(23, 'senderids-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(24, 'senderids-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(25, 'senderids-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(26, 'campaigns-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(27, 'campaigns-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(28, 'campaigns-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(29, 'campaigns-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(30, 'campaigns_sms-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(31, 'campaigns_sms-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(32, 'campaigns_sms-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(33, 'roles-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(34, 'roles-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(35, 'roles-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(36, 'roles-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(37, 'permissions-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(38, 'permissions-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(39, 'cron-jobs-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(40, 'notice-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(41, 'notice-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(42, 'services-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(43, 'services-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(44, 'services-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(45, 'services-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(46, 'sms-settings-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(47, 'sms-settings-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(48, 'reports-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(49, 'reports-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(50, 'faqs-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(51, 'faqs-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(52, 'faqs-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(53, 'faqs-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(54, 'testimonials-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(55, 'testimonials-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(56, 'testimonials-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(57, 'testimonials-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(58, 'senderips-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(59, 'senderips-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(60, 'smsgateways-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(61, 'smsgateways-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(62, 'smsgateways-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(63, 'smsgateways-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(64, 'gateways-types-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(65, 'gateways-types-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(66, 'gateways-types-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(67, 'gateways-types-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(68, 'settings-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(69, 'settings-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(70, 'gateways-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(71, 'gateways-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(72, 'notifications-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(73, 'notifications-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(74, 'currencies-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(75, 'currencies-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(76, 'currencies-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(77, 'currencies-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(78, 'blogs-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(79, 'blogs-create', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(80, 'blogs-update', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(81, 'blogs-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(82, 'newsletters-read', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(83, 'newsletters-delete', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `allow_api` tinyint(1) NOT NULL DEFAULT 1,
  `masking_rate` double NOT NULL DEFAULT 0,
  `non_masking_rate` double NOT NULL DEFAULT 0,
  `total_sms` int(11) NOT NULL DEFAULT 0,
  `duration` varchar(191) NOT NULL,
  `features` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `title`, `price`, `allow_api`, `masking_rate`, `non_masking_rate`, `total_sms`, `duration`, `features`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Non - Masking', 10, 1, 0.5, 0.25, 200, 'weekly', '{\"features_features_features_0\":[\"MNP Charge\",\"1\"],\"features_features_features_1\":[\"Sender ID\",\"1\"],\"features_features_features_2\":[\"Inbox Facility\",\"1\"],\"features_features_features_3\":[\"HTTP API Access\",\"1\"],\"features_features_features_4\":[\"Auto Backup Gateway Routing\"],\"features_features_features_5\":[\"Can Send OTP SMS\",\"1\"],\"features_features_features_6\":[\"Fast Delivery Speed\"],\"features_features_features_7\":[\"Delivery Report\",\"1\"],\"features_features_features_8\":[\"Validity :1y to 5Years\"],\"features_features_features_9\":[\"File to SMS\"],\"features_features_features_10\":[\"Dynamic SMS\"],\"features_features_features_11\":[\"Group SMS\",\"1\"],\"features_features_features_12\":[\"Online Payment (Bkash Auto)\",\"1\"]}', 1, '2023-12-18 13:00:28', '2023-12-18 13:01:42'),
(2, 'Masking', 20, 1, 0.5, 0.25, 200, '15_days', '{\"features_features_0\":[\"MNP Charge\",\"1\"],\"features_features_1\":[\"Sender ID\",\"1\"],\"features_features_2\":[\"Inbox Facility\",\"1\"],\"features_features_3\":[\"HTTP API Access\",\"1\"],\"features_features_4\":[\"Auto Backup Gateway Routing\"],\"features_features_5\":[\"Can Send OTP SMS\",\"1\"],\"features_features_6\":[\"Fast Delivery Speed\",\"1\"],\"features_features_7\":[\"Delivery Report\",\"1\"],\"features_features_8\":[\"Validity :1y to 5Years\",\"1\"],\"features_features_9\":[\"File to SMS\"],\"features_features_10\":[\"Dynamic SMS\",\"1\"],\"features_features_11\":[\"Group SMS\",\"1\"],\"features_features_12\":[\"Online Payment (Bkash Auto)\",\"1\"]}', 1, '2023-12-18 13:00:28', '2023-12-18 13:05:27'),
(3, 'Masking & Non-masking', 200, 1, 0.5, 0.25, 2000, '15_days', '{\"features_0\":[\"MNP Charge\",\"1\"],\"features_1\":[\"Sender ID\",\"1\"],\"features_2\":[\"Inbox Facility\",\"1\"],\"features_3\":[\"HTTP API Access\",\"1\"],\"features_4\":[\"Auto Backup Gateway Routing\",\"1\"],\"features_5\":[\"Can Send OTP SMS\",\"1\"],\"features_6\":[\"Fast Delivery Speed\",\"1\"],\"features_7\":[\"Delivery Report\",\"1\"],\"features_8\":[\"Validity :1y to 5Years\",\"1\"],\"features_9\":[\"File to SMS\",\"1\"],\"features_10\":[\"Dynamic SMS\",\"1\"],\"features_11\":[\"Group SMS\",\"1\"],\"features_12\":[\"Online Payment (Bkash Auto)\",\"1\"]}', 1, '2023-12-18 13:00:28', '2023-12-18 13:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscribes`
--

CREATE TABLE `plan_subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `masking_rate` double NOT NULL DEFAULT 0,
  `non_masking_rate` double NOT NULL DEFAULT 0,
  `total_sms` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `manual_data` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `will_expire` date NOT NULL,
  `plan_data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recharges`
--

CREATE TABLE `recharges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invoice_no` varchar(191) NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `manual_data` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'admin', 'web', '2025-10-10 00:42:23', '2025-10-10 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1);

-- --------------------------------------------------------

--
-- Table structure for table `senderids`
--

CREATE TABLE `senderids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `senderids`
--

INSERT INTO `senderids` (`id`, `user_id`, `sender`, `type`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '12345', 'Non-Masking', 1, 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 3, '12345', 'Non-Masking', 0, 1, '2025-10-10 00:42:23', '2025-10-10 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `sender_ips`
--

CREATE TABLE `sender_ips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(191) NOT NULL,
  `browser` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `image`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'NON Masking SMS', 'uploads/24/05/1716728162-403.png', 1, 'Send and receive SMS from a specially- selected number or even port an existing one.', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'Masking SMS', 'uploads/24/05/1716728176-643.png', 1, 'Send and receive SMS from a specially- selected number or even port an existing one.', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(3, 'Api Service', 'uploads/24/05/1716728189-937.png', 1, 'Send and receive SMS from a specially- selected number or even port an existing one.', '2025-10-10 00:42:23', '2025-10-10 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `smsgateway_id` bigint(20) UNSIGNED NOT NULL,
  `senderid_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number` varchar(191) NOT NULL,
  `total_sms` int(11) DEFAULT NULL,
  `message_id` varchar(191) DEFAULT NULL,
  `charge` double NOT NULL DEFAULT 0,
  `ip_address` varchar(191) DEFAULT NULL,
  `is_unicode` tinyint(1) NOT NULL DEFAULT 0,
  `contents` longtext NOT NULL,
  `schedule` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smsgateways`
--

CREATE TABLE `smsgateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `driver` varchar(191) DEFAULT NULL,
  `namespace` varchar(191) DEFAULT NULL,
  `params` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smsgateways`
--

INSERT INTO `smsgateways` (`id`, `name`, `type_id`, `priority`, `status`, `driver`, `namespace`, `params`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', 3, '1', 0, 'twilio', 'App\\SmsGateways\\TzskSms', '{\"sid\":\"####\",\"token\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'AWS SNS', 1, '1', 0, NULL, 'App\\SmsGateways\\TzskSms', '{\"key\":\"####\",\"secret\":\"####\",\"region\":\"####\",\"from\":\"####\",\"type\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(3, 'Textlocal', 2, '1', 0, NULL, 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"hash\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(4, 'Clockwork', 4, '1', 0, 'clockwork', 'App\\SmsGateways\\TzskSms', '{\"key\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(5, 'LINK Mobility', 5, '2', 0, 'linkmobility', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(6, 'Melipayamak', 6, '3', 0, 'melipayamak', 'App\\SmsGateways\\TzskSms', '{\"username\":\"####\",\"password\":\"####\",\"from\":\"####\",\"flash\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(7, 'Melipayamakpattern', 7, '4', 0, 'melipayamakpattern', 'App\\SmsGateways\\TzskSms', '{\"username\":\"####\",\"password\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(8, 'Kavenegar', 8, '2', 0, 'kavenegar', 'App\\SmsGateways\\TzskSms', '{\"apiKey\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(9, 'Smsir', 9, '2', 0, 'smsir', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"apiKey\":\"####\",\"secretKey\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(10, 'Tsms', 10, '2', 0, 'tsms', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(11, 'Farazsms', 11, '12', 0, 'farazsms', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(12, 'Farazsmspattern', 12, '5', 0, 'farazsmspattern', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(13, 'SMS Gateway Me', 13, '49', 0, 'smsgatewayme', 'App\\SmsGateways\\TzskSms', '{\"apiToken\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(14, 'SmsGateWay24', 14, '85', 0, 'smsgateway24', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"token\":\"####\",\"deviceid\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(15, 'Ghasedak', 15, '5', 0, 'ghasedak', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"apiKey\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(16, 'Sms77', 16, '85', 0, 'sms77', 'App\\SmsGateways\\TzskSms', '{\"apiKey\":\"####\",\"flash\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(17, 'SabaPayamak', 17, '8', 0, 'sabapayamak', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\",\"token_valid_day\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(18, 'LSim', 18, '48', 0, 'lsim', 'App\\SmsGateways\\TzskSms', '{\"username\":\"####\",\"password\":\"####\",\"from\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(19, 'Rahyabcp', 19, '8', 0, 'rahyabcp', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\",\"flash\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(20, 'Rahyabir', 20, '59', 0, 'rahyabir', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"company\":\"####\",\"from\":\"####\",\"token_valid_day\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(21, 'D7networks', 21, '48', 0, 'd7networks', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"originator\":\"####\",\"report_url\":\"####\",\"token_valid_day\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(22, 'SMSApi', 23, '456', 0, 'smsapi', 'App\\SmsGateways\\TzskSms', '{\"url\":\"####\",\"username\":\"####\",\"password\":\"####\",\"from\":\"####\",\"cc\":\"####\"}', '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(23, 'Route Mobile', 24, '1', 1, 'smsapi', 'App\\SmsGateways\\RouteMobile', '{\"api_url\":\"http:\\/\\/api.rmlconnect.net\\/bulksms\\/bulksms\",\"api_method\":\"GET\",\"username\":\"\",\"password\":\"\",\"type\":\"0\",\"dlr\":\"1\",\"number_key\":\"destination\",\"source\":\"\",\"message_key\":\"message\"}', '2025-10-11 00:42:23', '2025-10-11 00:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `text` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `satisfy_about` varchar(191) NOT NULL,
  `text` text DEFAULT NULL,
  `star` int(11) NOT NULL,
  `client_name` varchar(191) NOT NULL,
  `client_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `satisfy_about`, `text`, `star`, `client_name`, `client_image`, `created_at`, `updated_at`) VALUES
(1, 'Customer Support', 'last 5 years I buy various software, mobile apps from codecanyon. So far more than 30 software, mobile apps have been purchased. I am impressed with the instant support Acnoo has given me and the efficiency...', 5, 'rummansaki99', 'uploads/24/01/1706155955-312.png', '2024-01-24 17:56:08', '2024-01-25 12:00:51'),
(2, 'Customer Support', 'Guys, I purchased this like a few days ago... and let me tell you... the code is clean and the customer support is awesome top notch... like all my concerns were addressed over whatsapp and I\'m good to go! Big ups to the authors', 5, 'Ebrahim_envato', 'uploads/24/01/1706157585-590.png', '2024-01-24 18:04:36', '2024-01-25 17:48:29'),
(3, 'Customer Support', 'Acnoo gives a great support. I am a newbie on Flutter and Firebase, I couldn\'t set up the app by myself. Acnoo did everything to me and I got a working app. Trust them, they are  a great team. Good luck for Acnoo.', 5, 'bestomall', 'uploads/24/01/1706157923-156.png', '2024-01-25 10:45:23', '2024-01-25 11:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'user',
  `email` varchar(191) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `masking_rate` double NOT NULL DEFAULT 0,
  `non_masking_rate` double NOT NULL DEFAULT 0,
  `allow_api` tinyint(1) NOT NULL DEFAULT 0,
  `low_blnc_alrt` double NOT NULL DEFAULT 0,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `will_expire` date DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `client_id` varchar(191) NOT NULL,
  `client_secret` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `balance`, `masking_rate`, `non_masking_rate`, `allow_api`, `low_blnc_alrt`, `plan_id`, `will_expire`, `phone`, `image`, `status`, `client_id`, `client_secret`, `password`, `country`, `address`, `notes`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin', 'superadmin@superadmin.com', 0, 0, 0, 0, 0, NULL, NULL, '01111111', NULL, 'pending', '000001', NULL, '$2y$10$vAX2GBFkDfyIGRF6g9qLxeiWwRoqFSvbIJASUSfxff6c4lij5CYVG', NULL, NULL, NULL, '2025-10-10 00:42:23', NULL, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(2, 'Admin', 'admin', 'admin@admin.com', 0, 0, 0, 0, 0, NULL, NULL, '01111111', NULL, 'pending', '000001', NULL, '$2y$10$Yu2cSLjNkk0j2cv8M3JOgOk3x6Y8MjA59FSYNyWrpJ6tbOmjEQOay', NULL, NULL, NULL, '2025-10-10 00:42:23', NULL, '2025-10-10 00:42:23', '2025-10-10 00:42:23'),
(3, 'Customer', 'user', 'customer@customer.com', 10, 0.5, 0.25, 0, 0, NULL, '2025-10-17', '05169541651', NULL, '1', '1', '41274e60-a864-46e9-9ef6-22d48e129610', '$2y$10$IYf3R/VwrB4nC/fxkPqtY.bV8eAHMgYUVpktCeyCMIWBToxWBFU1S', NULL, NULL, NULL, NULL, NULL, '2025-10-10 00:42:23', '2025-10-10 00:42:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_title_unique` (`title`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_sms`
--
ALTER TABLE `campaign_sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_sms_user_id_foreign` (`user_id`),
  ADD KEY `campaign_sms_senderid_id_foreign` (`senderid_id`),
  ADD KEY `campaign_sms_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_blog_id_foreign` (`blog_id`),
  ADD KEY `comments_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_user_id_foreign` (`user_id`),
  ADD KEY `contacts_group_id_foreign` (`group_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_name_unique` (`name`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

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
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateways_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `gateway_types`
--
ALTER TABLE `gateway_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_user_id_foreign` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_subscribes`
--
ALTER TABLE `plan_subscribes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_subscribes_plan_id_foreign` (`plan_id`),
  ADD KEY `plan_subscribes_gateway_id_foreign` (`gateway_id`),
  ADD KEY `plan_subscribes_user_id_foreign` (`user_id`);

--
-- Indexes for table `recharges`
--
ALTER TABLE `recharges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recharges_user_id_foreign` (`user_id`),
  ADD KEY `recharges_gateway_id_foreign` (`gateway_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `senderids`
--
ALTER TABLE `senderids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `senderids_user_id_foreign` (`user_id`);

--
-- Indexes for table `sender_ips`
--
ALTER TABLE `sender_ips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_ips_user_id_foreign` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_user_id_foreign` (`user_id`),
  ADD KEY `sms_smsgateway_id_foreign` (`smsgateway_id`),
  ADD KEY `sms_senderid_id_foreign` (`senderid_id`),
  ADD KEY `sms_group_id_foreign` (`group_id`),
  ADD KEY `sms_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `smsgateways`
--
ALTER TABLE `smsgateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `smsgateways_name_unique` (`name`),
  ADD KEY `smsgateways_type_id_foreign` (`type_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templates_user_id_foreign` (`user_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_gateway_id_foreign` (`gateway_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_plan_id_foreign` (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_sms`
--
ALTER TABLE `campaign_sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `gateway_types`
--
ALTER TABLE `gateway_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plan_subscribes`
--
ALTER TABLE `plan_subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recharges`
--
ALTER TABLE `recharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `senderids`
--
ALTER TABLE `senderids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sender_ips`
--
ALTER TABLE `sender_ips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smsgateways`
--
ALTER TABLE `smsgateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaign_sms`
--
ALTER TABLE `campaign_sms`
  ADD CONSTRAINT `campaign_sms_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_sms_senderid_id_foreign` FOREIGN KEY (`senderid_id`) REFERENCES `senderids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_sms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gateways`
--
ALTER TABLE `gateways`
  ADD CONSTRAINT `gateways_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_subscribes`
--
ALTER TABLE `plan_subscribes`
  ADD CONSTRAINT `plan_subscribes_gateway_id_foreign` FOREIGN KEY (`gateway_id`) REFERENCES `gateways` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plan_subscribes_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plan_subscribes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recharges`
--
ALTER TABLE `recharges`
  ADD CONSTRAINT `recharges_gateway_id_foreign` FOREIGN KEY (`gateway_id`) REFERENCES `gateways` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recharges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `senderids`
--
ALTER TABLE `senderids`
  ADD CONSTRAINT `senderids_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sender_ips`
--
ALTER TABLE `sender_ips`
  ADD CONSTRAINT `sender_ips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms`
--
ALTER TABLE `sms`
  ADD CONSTRAINT `sms_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_senderid_id_foreign` FOREIGN KEY (`senderid_id`) REFERENCES `senderids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_smsgateway_id_foreign` FOREIGN KEY (`smsgateway_id`) REFERENCES `smsgateways` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smsgateways`
--
ALTER TABLE `smsgateways`
  ADD CONSTRAINT `smsgateways_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `gateway_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `templates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_gateway_id_foreign` FOREIGN KEY (`gateway_id`) REFERENCES `gateways` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
