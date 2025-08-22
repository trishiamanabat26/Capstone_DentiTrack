-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2025 at 04:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dentitrack_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password_hash`) VALUES
(1, 'mayitot', '$2y$10$AqXyNsqPu7DwBBHGu8HZTelpNCHKrt.XI0arMlmVuGWZJpj6S.BLC'),
(2, 'ayii', '$2y$10$ro2q6hJTmcOsamPM0WY2ou.kj5ZSONLnqWAaKlupwXZir1jCPyHv.'),
(3, 'sleepnako', '$2y$10$IGFu2WdO8bKy177euBuHGOGkDHhae7XsuhQXAtZpTi6gnrwMDNSJe'),
(4, 'admin', '$2y$10$isqJeHNoN94OHpYoOj4.4ujMHeW0r7ppCF.QQ.PswzovFRAefqG6u'),
(5, 'admin12', '$2y$10$Uo1HcS9QFaqFQk9m.hgqKO/lIOqEbuMAVeC8CJdT7ZdV2CIeJGCXu'),
(6, 'super123', '$2y$10$GTN2ZBQxhyNbiBMziRuJV.UN3bJmJHbj.GfAqxN4zIr1riBbLvCqi'),
(7, 'mayi', '$2y$10$ibni91RqHHPyu6zWdMWxJ.CD3HlZ3YKMZh2x7pdzsoDEESJPpEXlS');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `posted_by` varchar(100) DEFAULT NULL,
  `posted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_id`, `title`, `content`, `posted_by`, `posted_at`, `image`) VALUES
(1, 'CLOSE FOR TODAY MAY 23,2025', 'due to heavy rain', 'yap', '2025-05-23 10:19:07', 'ann_68304b9bb3711.jpg'),
(2, 'DENTAL DISCOUNTS', '50% if u avail now open weekdays 9:00-5:00', 'ayi', '2025-05-28 01:25:06', 'ann_683665f25d307.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dental_records`
--

CREATE TABLE `dental_records` (
  `record_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `record_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `prescription` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dental_supplies`
--

CREATE TABLE `dental_supplies` (
  `supply_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(50) DEFAULT 'pcs',
  `expiration_date` date DEFAULT NULL,
  `low_stock_threshold` int(11) NOT NULL DEFAULT 5,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dental_supplies`
--

INSERT INTO `dental_supplies` (`supply_id`, `name`, `description`, `quantity`, `unit`, `expiration_date`, `low_stock_threshold`, `last_updated`) VALUES
(1, 'Rubber', 'Need for braces', 9, '2 box', NULL, 10, '2025-05-26 16:13:33'),
(3, 'Mask', 'for surgical haha', 18, 'boxes', '2026-05-29', 20, '2025-05-26 17:28:29'),
(5, 'Tools', 'asfsfg', 35, 'boxes', '2025-05-25', 30, '2025-05-28 01:26:39');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `contact_info` varchar(255) NOT NULL,
  `medical_history` text DEFAULT NULL,
  `treatment_records` text DEFAULT NULL,
  `prescriptions` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `user_id`, `full_name`, `dob`, `contact_info`, `medical_history`, `treatment_records`, `prescriptions`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cristan Etan', '2003-06-01', '09097541389', 'may sakit sa utak', 'wala p', 'uminom tubig', '2025-05-25 20:47:03', '2025-05-27 18:24:24'),
(4, 12, 'aaki', '2004-04-04', '090987899871', 'blabsfs', 'dsdgdgd', 'gdgdg', '2025-05-28 01:40:40', '2025-05-28 01:40:40'),
(6, 15, 'patient002', '2004-05-27', '09893236462', 'sfsfsfs', 'aaaaa', 'eeee', '2025-05-28 09:23:33', '2025-05-28 09:23:33'),
(7, 17, 'waldo', '2025-08-13', '09913637693', 'fdfdf', 'fvvdd', 'ddd', '2025-08-13 11:17:59', '2025-08-13 11:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `patient_archive`
--

CREATE TABLE `patient_archive` (
  `archive_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_archive`
--

INSERT INTO `patient_archive` (`archive_id`, `patient_id`, `full_name`, `dob`, `contact_info`, `address`, `archived_at`) VALUES
(2, 3, 'Princess Shakira', '2011-02-14', '09212345675', NULL, '2025-05-26 14:29:03'),
(3, 5, 'Patients001', '2005-05-30', '09856321236', NULL, '2025-05-28 01:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `patient_results`
--

CREATE TABLE `patient_results` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('patient','secretary','doctor','admin') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`, `created_at`, `updated_at`) VALUES
(1, 'cristan123', '$2y$10$/dN0sPCkVdzj83FUgsUZA.yjXL8zo6lRzaJfR6AwlDkjnCCsFf0la', 'patient', '2025-05-25 20:47:03', '2025-05-27 18:24:54'),
(2, 'ayi', '$2y$10$yET10QaEz5Uc5g/MpWy2FejBWvgAR6W9fhynttzpbslAsWyRh7KH6', 'secretary', '2025-05-25 21:12:17', '2025-05-25 21:12:17'),
(3, 'margaux', '$2y$10$91ws1.peI9i5v4TuRXQz3OCx11eimfOfuwQxPijx.PS4JT0unvMVS', 'patient', '2025-05-26 21:45:37', '2025-05-26 21:45:37'),
(4, 'shakira', '$2y$10$0QUtX1CpfTu7w6eoRmrmEOxB/9yCyGsuvGXvDxFm/J77OLVRMFiV6', 'patient', '2025-05-26 22:28:28', '2025-05-26 22:28:28'),
(5, 'aayi', '$2y$10$T23L2H1AJXsWuCTeBNhhue5RlJHcZ5siQErrJS0cTEf3qn.J80lXC', 'admin', '2025-05-27 03:19:44', '2025-05-27 03:19:44'),
(6, 'mayi pretty', '$2y$10$D1gH0c7tJDCk7eMgyRy52ORjmWbEnMK3m4a.NiO4gZ57rveAG5OR2', 'secretary', '2025-05-27 13:26:19', '2025-05-28 01:34:56'),
(7, 'panget', '$2y$10$05NydjpPPo63WFGA8PetnenTnxvWuvfa/N0J/CEmnRrvkHSYXzJRe', 'doctor', '2025-05-27 13:41:18', '2025-05-27 13:44:35'),
(8, 'super patient', '$2y$10$znTR71pG7xyLNtb9XoB3lehzLFLGeiZFpSU2/o/RswWkUPcQg2i2S', 'patient', '2025-05-28 01:24:10', '2025-05-28 01:24:56'),
(9, 'admin123', '$2y$10$fpT/oliFklCccQ3ZqWB/2eXq7BUWa44lSXl48DNZ09sMVd6PIq8Xa', 'admin', '2025-05-28 01:25:56', '2025-05-28 01:25:56'),
(10, 'aki', '$2y$10$6JLZG3YDkxY9FIySmxejmenBqR5kKDlEiAyfZacjEh5fOgHbzFcN2', 'patient', '2025-05-28 01:38:16', '2025-05-28 01:38:16'),
(11, 'yake', '$2y$10$C4nOGb62UM1BBDmowk.M5u58wwvm6N0fnJoPUbxcdsISr/NiNht62', 'secretary', '2025-05-28 01:39:28', '2025-05-28 01:39:28'),
(12, 'aki2004', '$2y$10$81ndqxAmf25y94FXx7mNPOKP8RgicwzM4z9qfhyWhZ0ApBdVyQrNO', 'patient', '2025-05-28 01:40:40', '2025-05-28 01:51:53'),
(13, 'secretary', '$2y$10$Xx11NjYaonfZbko0ncwlFebpHQtOfBDxQbYiWAWY9bZ9Ml4aKDjv.', 'secretary', '2025-05-28 09:20:31', '2025-05-28 09:20:31'),
(14, 'patient12', '$2y$10$ydU5OzFksiEn9YST3oKB/utIMi5lpb7HK7TRTMtQZpyEfrB8.ng5G', 'patient', '2025-05-28 09:22:02', '2025-05-28 09:22:02'),
(15, 'patient02', '$2y$10$y27PzcwOmwKb92O223lPMOXzBzl7AYy2PKaLozXA.unUcsjqP3REa', 'patient', '2025-05-28 09:23:33', '2025-05-28 09:23:33'),
(16, 'sec1', '$2y$10$M74x0cN8zVRCcHhWWsPX8.tdt0PhY3l3mrywGFfaS5R3SDEzgY0Oa', 'secretary', '2025-08-13 10:51:32', '2025-08-13 10:51:32'),
(17, 'waldo', '$2y$10$ykUlpLINTJXFYyWoxSbg4.za1GNJ74arwRdt9j/FeWnLFRV85LhNu', 'patient', '2025-08-13 11:17:59', '2025-08-13 11:17:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `dental_supplies`
--
ALTER TABLE `dental_supplies`
  ADD PRIMARY KEY (`supply_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `patient_archive`
--
ALTER TABLE `patient_archive`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `patient_results`
--
ALTER TABLE `patient_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dental_supplies`
--
ALTER TABLE `dental_supplies`
  MODIFY `supply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patient_archive`
--
ALTER TABLE `patient_archive`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_results`
--
ALTER TABLE `patient_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
