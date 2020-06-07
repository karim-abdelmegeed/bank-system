-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2020 at 02:12 PM
-- Server version: 5.7.19
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_system`
--

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `bank_id`, `currency_id`, `account_type_id`, `branch`, `account_number`, `balance`, `activated`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'gHQRKIWCGa', '30454878848', '200.00', 1, '2020-06-05 20:30:10', '2020-06-05 20:30:10'),
(27, 1, 3, 3, 3, 'NTu8THV1XQ', '8745212454545', '1126.00', 1, '2020-06-05 20:30:10', '2020-06-05 20:30:10'),
(28, 1, 2, 3, 1, 'E05efu095y', '219326574', '1584.00', 1, '2020-06-05 20:30:10', '2020-06-05 20:30:10'),
(29, 1, 3, 3, 4, 'Ra39200Dx1', '69208745212454545', '1008.00', 1, '2020-06-05 20:30:10', '2020-06-05 20:30:10'),
(30, 1, 3, 2, 1, 'Q1DWBSR5kK', '94415453', '956.00', 1, '2020-06-05 20:30:10', '2020-06-05 20:30:10'),
(31, 1, 2, 2, 1, 'oTNjXZ3zWP', '363664544', '50000.00', 1, '2020-06-05 20:30:11', '2020-06-07 11:41:42'),
(32, 1, 4, 1, 1, 'GRitWKswMD', '584848884515', '1119.20', 1, '2020-06-05 20:30:11', '2020-06-07 11:37:45'),
(33, 1, 2, 3, 4, 'sipT7FrFDR', '43346026', '4247.00', 1, '2020-06-05 20:30:11', '2020-06-07 11:51:36'),
(34, 1, 1, 2, 1, 'T85KobaScc', '30663', '13059.80', 1, '2020-06-05 20:30:11', '2020-06-07 11:41:42'),
(35, 1, 3, 2, 1, 'OkNlz36IrL', '17694545457777', '2838.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(36, 1, 3, 2, 4, 'FHZbUzFClJ', '24353', '1350.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(37, 1, 1, 1, 1, '6rmc5TcjIx', '28590', '3324.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(38, 1, 1, 3, 2, 'fsKhvCKJXq', '588532', '2093.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(39, 1, 4, 2, 2, 'yZn3837Kis', '3898745212454545', '2285.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(40, 1, 2, 1, 3, 'EMuLy7nEWu', '8745212454545', '3436.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(41, 1, 3, 2, 4, 'U8dPyL14eu', '899508745254', '1597.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(42, 1, 2, 2, 3, 'ABjWxQ5uzr', '76528745212454545', '2747.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(43, 1, 2, 3, 1, 'AWMm5OV4Sg', '87290051', '4340.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(44, 1, 1, 2, 2, 'zXkfwfVd0t', '8684310', '229.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(45, 1, 4, 2, 2, '15C2jc3nKK', '2184545452128', '1553.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(46, 1, 3, 1, 2, 'v7ehrx8v0L', '4400240', '2489.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(47, 1, 2, 3, 2, 'VdEbsxo10T', '544948986', '1299.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(48, 1, 4, 1, 4, '3X0ov5X1DC', '7245845405', '1020.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(49, 1, 1, 2, 1, 'ZqWDBewUsP', '28655527', '315.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(50, 1, 2, 1, 3, '18WDC5NqVx', '284405', '388.00', 1, '2020-06-05 20:30:11', '2020-06-05 20:30:11'),
(51, 1, 2, 2, 2, 'branch one', '487844444444445', '8816.00', 0, '2020-06-06 11:53:28', '2020-06-07 11:39:45'),
(52, 1, 2, 2, 1, 'alexandria', '9500545454545', '200.00', 0, '2020-06-07 11:52:02', '2020-06-07 11:52:14');

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Current Account', NULL, NULL),
(2, 'Saving Account', NULL, NULL),
(3, 'Credit Account', NULL, NULL),
(4, 'Joint Account', NULL, NULL);

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CIB', NULL, NULL),
(2, 'QNB', NULL, NULL),
(3, 'HSBC', NULL, NULL),
(4, 'NBD', NULL, NULL);

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'egp', NULL, NULL),
(2, 'euro', NULL, NULL),
(3, 'usd', NULL, NULL);

--
-- Dumping data for table `currency_conversions`
--

INSERT INTO `currency_conversions` (`id`, `bank_id`, `from_currency`, `to_currency`, `rate`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, '15.75', NULL, NULL),
(2, 1, 2, 1, '19.04', NULL, NULL),
(3, 1, 2, 3, '1.04', NULL, NULL),
(4, 2, 3, 1, '15.75', NULL, NULL),
(5, 2, 2, 1, '19.04', NULL, NULL),
(6, 2, 2, 3, '1.04', NULL, NULL),
(7, 3, 3, 1, '15.75', NULL, NULL),
(8, 3, 2, 1, '19.04', NULL, NULL),
(9, 3, 2, 3, '1.04', NULL, NULL),
(10, 4, 3, 1, '15.75', NULL, NULL),
(11, 4, 2, 1, '19.04', NULL, NULL),
(12, 4, 2, 3, '1.04', NULL, NULL);

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(20, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(21, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(22, '2016_06_01_000004_create_oauth_clients_table', 1),
(23, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2020_05_31_052235_create_banks_table', 1),
(26, '2020_05_31_052248_create_accounts_table', 1),
(27, '2020_05_31_052310_create_transactions_table', 1),
(28, '2020_05_31_061404_create_account_types_table', 1),
(29, '2020_05_31_061421_create_currencies_table', 1),
(30, '2020_05_31_061437_create_currency_conversions_table', 1),
(31, '2020_05_31_151548_create_operations_table', 1),
(32, '2020_06_05_193510_create_user_roles_table', 1);

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('548264c37df62601387e66ba37614615377da42b429ec37a9bd2733356b2018177ca5286c9fe3b39', 2, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', 'Personal Access Token', '[]', 1, '2020-06-05 21:01:41', '2020-06-05 21:01:41', '2021-06-05 23:01:41'),
('98544b9cac4f2e2ff57ec84b9a07aa58bc70728b5b6205f3e712b9daf751032bc27838d2df20def3', 1, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', 'Personal Access Token', '[]', 1, '2020-06-05 21:19:49', '2020-06-05 21:19:49', '2021-06-05 23:19:49'),
('a7179eeb9e3892163fd3f039d93a9440e9921be573dbaf1c90684a60a1cd2d503d083ffa423032b9', 2, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', 'Personal Access Token', '[]', 1, '2020-06-05 21:01:59', '2020-06-05 21:01:59', '2021-06-05 23:01:59'),
('abca080c0bb2ce5c404e30de52c7e70a60cb6d63f35d8c5bca3f8887bc888d8bc902677dd1414558', 1, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', 'Personal Access Token', '[]', 0, '2020-06-06 11:35:40', '2020-06-06 11:35:40', '2021-06-06 13:35:40'),
('c32a57f153c2c71f0d0fb79cec3d115f4c7eea04ef3f1d9e91b2d607585dcb923dc2ad250f74fa43', 2, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', 'Personal Access Token', '[]', 1, '2020-06-05 20:30:27', '2020-06-05 20:30:27', '2021-06-05 22:30:27'),
('d64bf085526b6ecc02528777a027b68f9821ff8b7b2c373258df79d0b3a4029c7745f42593a6fb39', 2, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', 'Personal Access Token', '[]', 1, '2020-06-06 11:28:48', '2020-06-06 11:28:48', '2021-06-06 13:28:48');

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('90bc9489-2d44-4873-9685-5e3fec4cb2bf', NULL, 'Laravel Personal Access Client', 'E9X0b61TK0rLemMKiSjLQHOvOfrVliSZLG6hFDuz', NULL, 'http://localhost', 1, 0, 0, '2020-06-05 20:30:02', '2020-06-05 20:30:02'),
('90bc9489-5b37-49b6-8d53-6fac61b0aa12', NULL, 'Laravel Password Grant Client', 'SUGH5QMIZDfi8GyaOMFq75ouqWvPsOVcDNkbilBP', 'users', 'http://localhost', 0, 1, 0, '2020-06-05 20:30:02', '2020-06-05 20:30:02');

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '90bc9489-2d44-4873-9685-5e3fec4cb2bf', '2020-06-05 20:30:02', '2020-06-05 20:30:02');

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `transaction_id`, `type`, `amount`, `currency_id`, `created_at`, `updated_at`) VALUES
(36, 23, 'deposit', '200.00', 1, '2020-06-07 11:39:45', '2020-06-07 11:39:45'),
(37, 23, 'deposit', '500.00', 2, '2020-06-07 11:39:45', '2020-06-07 11:39:45'),
(38, 24, 'withdraw', '300.00', 3, '2020-06-07 11:39:58', '2020-06-07 11:39:58'),
(39, 25, 'transfer', '520.00', 1, '2020-06-07 11:41:42', '2020-06-07 11:41:42'),
(40, 26, 'withdraw', '450.00', 2, '2020-06-07 11:51:36', '2020-06-07 11:51:36');

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `from_account_id`, `to_account_id`, `created_at`, `updated_at`) VALUES
(23, 51, NULL, '2020-06-07 11:39:45', '2020-06-07 11:39:45'),
(24, 31, NULL, '2020-06-07 11:39:58', '2020-06-07 11:39:58'),
(25, 31, 34, '2020-06-07 11:41:42', '2020-06-07 11:41:42'),
(26, 33, NULL, '2020-06-07 11:51:36', '2020-06-07 11:51:36');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'client', 'client@gmail.com', NULL, '$2y$10$NHPGsAZ006/Z8oMeHQMpeuYf1/oehCZuV6u1L7xiiQWVSIWUq8.tq', NULL, NULL, NULL),
(2, 2, 'super', 'super@gmail.com', NULL, '$2y$10$bYWbJYl6tuyGUByfz121Quv0.0soRuNDCbxn8VZG5HqemyStBvFIu', NULL, NULL, NULL),
(3, 1, 'Chance Rosenbaum', 'marion58@example.net', '2020-06-05 20:30:06', '$2y$10$pFl7U5lRY9GmDUGly7O/Ker9gz9cAB2LnZABpNEHaODioz1GdG59m', '9U6GVFThot', '2020-06-05 20:30:07', '2020-06-05 20:30:07'),
(4, 1, 'Mr. Terry Block', 'alayna.von@example.net', '2020-06-05 20:30:06', '$2y$10$VL.BM0nx7./Zfst5lWQUR.PJo1x38b.hxUJ.sd76po7caiWxlJGA6', 'J000e7JhhG', '2020-06-05 20:30:07', '2020-06-05 20:30:07'),
(5, 1, 'Filiberto Trantow', 'owalsh@example.com', '2020-06-05 20:30:06', '$2y$10$d77gad97YWQRG0RmOCSGUea84r0wxof2CGgalcNR511yqlqqECQWK', 'j8SwW6UiSc', '2020-06-05 20:30:07', '2020-06-05 20:30:07'),
(6, 1, 'Lucile Powlowski I', 'nabshire@example.org', '2020-06-05 20:30:06', '$2y$10$ajVajMyxzGtyFjLTKJMgGu7KXOvDG3wlpIjuxYrCtAPLXYVcRZtC.', 'Ry3rNq9aNW', '2020-06-05 20:30:07', '2020-06-05 20:30:07'),
(7, 1, 'Emmanuel Davis', 'haskell.denesik@example.org', '2020-06-05 20:30:06', '$2y$10$lvep7y1EBQLB9BTX0H1Wpex18lIyM9FGAUFJkGWO44X8IaT9HFJEO', 'og4dwFIumg', '2020-06-05 20:30:07', '2020-06-05 20:30:07'),
(8, 1, 'Rodrigo Volkman', 'flavio.doyle@example.net', '2020-06-05 20:30:06', '$2y$10$/VEXNtXL2.WurlptnWKcledVZTX0P/kInYsWEiCDHGxAlaGyI5CNO', 'EfPUNkS7Az', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(9, 1, 'Earline Kohler DDS', 'xfranecki@example.net', '2020-06-05 20:30:06', '$2y$10$y2mxFDDBqPWGyGoJeYOK5uodFfsxFHjWZh1.uKJ.KjOuR35JrFbru', 'ZDrC0bvxLd', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(10, 1, 'Dr. Emiliano Donnelly II', 'roslyn.legros@example.org', '2020-06-05 20:30:06', '$2y$10$7vrh2EU5.w04.N0pUG2vc.vumb2TGiSk/Bg1pKJuwXDnUmqFqo1Gy', '52kKOAA5bv', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(11, 1, 'Dakota Bosco', 'antonette.prosacco@example.org', '2020-06-05 20:30:06', '$2y$10$fY6QRcXxBF/HrVSRuRc3Ju15ps1bx1KSK3VYsCjq317i4Iz03VOHW', 'olAaImTGeh', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(12, 1, 'Juliana Schaefer', 'xbeier@example.net', '2020-06-05 20:30:06', '$2y$10$nuvqP6m5pY0BwRuI8RgXdO6oj1UT4LIVJyPSZd00bHkbsexEpTNWC', 'vwxOmlv5DV', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(13, 1, 'Dr. Kasandra Cummerata III', 'aric.mcglynn@example.net', '2020-06-05 20:30:07', '$2y$10$csw3arWpGfo.LV3tVTva5.jjaG4WvNrLMMOcBXN8LU3AqhnaYxMfK', 'MMM9b26x4b', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(14, 1, 'Mr. Jerald Kihn', 'clemens.baumbach@example.net', '2020-06-05 20:30:07', '$2y$10$HZeZ6f2laPHjpVKz7klDf.OymLTJSY2ij3r0DThBxzj04uQM/2FSa', 'GYK1RM9xhm', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(15, 1, 'Macy West', 'enrico35@example.net', '2020-06-05 20:30:07', '$2y$10$bdbgDzSPvQW6Ev8QnC7SzOksdaYcvuW/5VLareLQmf2hEIovVwHHG', 'FzQqfjVF8w', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(16, 1, 'Jannie Zulauf DDS', 'kasandra07@example.net', '2020-06-05 20:30:07', '$2y$10$OKStcePyVENLcWt0WxkHnONHMqLFEBKl6vVvMOofwN7/hgwTpk4gm', 'jLYhuhG048', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(17, 1, 'Turner Hayes', 'trystan81@example.org', '2020-06-05 20:30:07', '$2y$10$7b0sX1NCbMMjCjl15sHaDuHfSp7B.hFEMbPN5OYGa/7yllXYizrly', '4llaLfzQsO', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(18, 1, 'Ivory Wilderman', 'mprohaska@example.net', '2020-06-05 20:30:07', '$2y$10$pmGDaSATb7QpVKfLESHW7OAJpzu/ZA1U2/V8UEiUEzLnfbu.sdvrG', '5EQs3Ku59X', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(19, 1, 'Helmer Wuckert', 'kirsten32@example.org', '2020-06-05 20:30:07', '$2y$10$jd1T1Us4yJzbVhxXBJUOzOrhMCYW7BM8QM3qvpzKq/r3AXbzF0AyO', '5D2LRukoNh', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(20, 1, 'Linnie Connelly', 'elsa58@example.org', '2020-06-05 20:30:07', '$2y$10$YCCGxabuSpsLqf1BjuFn8.1Kjaw9RZsu6Td5hY1elBykLEhqQKK/S', 'Ll39HaEX24', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(21, 1, 'Laurel Tromp', 'omoore@example.com', '2020-06-05 20:30:07', '$2y$10$YHM7eSZp8o23DntP7DXAjO7VSq7Dfez9vM7DmSOOajRjK9E5pTxia', 'KSv6AdALSi', '2020-06-05 20:30:08', '2020-06-05 20:30:08'),
(22, 1, 'Dakota Wisoky', 'whayes@example.org', '2020-06-05 20:30:07', '$2y$10$uk9BcN2ECxwQzyV1ts/1BOmHq2D7XBODufKH6zjdGK0JtbqTnbif.', '7TdwahqpwA', '2020-06-05 20:30:08', '2020-06-05 20:30:08');

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'client', NULL, NULL),
(2, 'accountant', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
