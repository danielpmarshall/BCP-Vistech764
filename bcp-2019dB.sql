-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2019 at 11:21 AM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bcp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activities`
--

CREATE TABLE `Activities` (
  `id` int(11) NOT NULL,
  `activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `MTPD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bcp`
--

CREATE TABLE `bcp` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `clinical_unit_id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `mtpd_id` int(11) NOT NULL,
  `dependancy_rating_id` int(11) NOT NULL,
  `impact_rating_id` int(11) NOT NULL,
  `immediate_action` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pre_requisites` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_around` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `review_date` date NOT NULL,
  `created_by` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Clinical_Unit`
--

CREATE TABLE `Clinical_Unit` (
  `id` int(11) NOT NULL,
  `clinical_unit` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CombinedAct`
--

CREATE TABLE `CombinedAct` (
  `ID` int(11) NOT NULL,
  `CU_ID` int(11) NOT NULL,
  `SYS_ID` int(11) NOT NULL,
  `ACT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `mail_host` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_port` int(5) NOT NULL,
  `mail_use_auth` tinyint(1) NOT NULL,
  `mail_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_from_addr` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `self_register` tinyint(1) NOT NULL,
  `self_reg_priv_level` int(11) NOT NULL,
  `domain_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dependancy_rating`
--

CREATE TABLE `dependancy_rating` (
  `scale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `impact_reference`
--

CREATE TABLE `impact_reference` (
  `IR` int(11) NOT NULL,
  `People_Effects` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Financial_Impact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reputation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Service_Outputs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Legal_Compliance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Management_Impact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mtdp`
--

CREATE TABLE `mtdp` (
  `mtpd` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `mins_sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Programs`
--

CREATE TABLE `Programs` (
  `id` int(11) NOT NULL,
  `program_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Systems`
--

CREATE TABLE `Systems` (
  `id` int(11) NOT NULL,
  `it_system_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `it_system_description` text COLLATE utf8mb4_unicode_ci,
  `MTPD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `last_login` date NOT NULL,
  `confirm_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_active` tinyint(1) NOT NULL,
  `user_priv_level` int(4) NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL,
  `account_administratively_disabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Activities`
--
ALTER TABLE `Activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcp`
--
ALTER TABLE `bcp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Clinical_Unit`
--
ALTER TABLE `Clinical_Unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CombinedAct`
--
ALTER TABLE `CombinedAct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dependancy_rating`
--
ALTER TABLE `dependancy_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `impact_reference`
--
ALTER TABLE `impact_reference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mtdp`
--
ALTER TABLE `mtdp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Programs`
--
ALTER TABLE `Programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Systems`
--
ALTER TABLE `Systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Activities`
--
ALTER TABLE `Activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `bcp`
--
ALTER TABLE `bcp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Clinical_Unit`
--
ALTER TABLE `Clinical_Unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `CombinedAct`
--
ALTER TABLE `CombinedAct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dependancy_rating`
--
ALTER TABLE `dependancy_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `impact_reference`
--
ALTER TABLE `impact_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mtdp`
--
ALTER TABLE `mtdp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `Programs`
--
ALTER TABLE `Programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `Systems`
--
ALTER TABLE `Systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
