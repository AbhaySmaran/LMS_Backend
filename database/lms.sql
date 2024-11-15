-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 03:10 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_associate`
--

CREATE TABLE `accounts_associate` (
  `last_login` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(200) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `associate_id` varchar(20) NOT NULL,
  `employee_title` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL,
  `company` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `joining_date` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `is_manager` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_associate`
--

INSERT INTO `accounts_associate` (`last_login`, `id`, `first_name`, `last_name`, `email`, `password`, `display_name`, `associate_id`, `employee_title`, `department`, `company`, `address`, `city`, `state`, `country`, `contact`, `joining_date`, `gender`, `is_manager`, `is_admin`) VALUES
('2024-11-14 03:02:28.651621', 1, 'Abhay Smaran', 'Das', 'dasabhaysmaran@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Abhay', 'EMP001', 'Associate', 'Digital transformation', 'Hyscaler', 'Patia,Nandan vihar', 'Bhubaneswar', 'Odisha', 'India', '7326892455', '2024-09-23', 'Male', 0, 0),
('2024-11-13 06:47:28.585598', 2, 'Ankit', 'Das', 'ankit@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Ankit', 'EMP002', 'Associate', 'Mordenization', 'Hyscaler', 'Patia', 'Bhubaneswar', 'Odisha', 'India', '7326892466', '2024-11-05', 'Male', 0, 0),
('2024-11-13 12:52:39.418662', 3, 'Ankita', 'Rana', 'manager@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Ankita', 'EMP003', 'Associate', 'Digital transformation', 'Hyscaler', 'Bhoomikhal', 'Bhubaneswar', 'Odisha', 'India', '7326892489', '2024-11-01', 'Female', 1, 0),
('2024-11-14 03:03:29.916361', 4, 'Rohit', 'Tyagi', 'asdrishi3@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Rohit', 'EMP004', 'Admin', '', 'Hyscaler', '', 'Bhubaneswar', 'Odisha', 'India', '9978654327', '0000-00-00', 'Male', 1, 1),
('2024-11-13 06:24:32.344581', 5, 'Rahul', 'Sharma', 'admin2@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Rahul', 'EMP005', 'Admin', '', 'Hyscaler', 'Patia', 'Bhubaneswar', 'Odisha', 'India', '7326892480', '2024-11-03', 'Male', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_workflowconfiguration`
--

CREATE TABLE `accounts_workflowconfiguration` (
  `id` bigint(20) NOT NULL,
  `workflow_modification_date` datetime(6) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `associate_id` bigint(20) NOT NULL,
  `home_manager_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_workflowconfiguration`
--

INSERT INTO `accounts_workflowconfiguration` (`id`, `workflow_modification_date`, `admin_id`, `associate_id`, `home_manager_id`) VALUES
(1, '2024-11-08 21:41:25.000000', 4, 1, 4),
(2, '2024-11-08 21:41:25.000000', 4, 2, 3),
(3, '2024-11-08 22:31:44.000000', 5, 3, 4),
(4, '2024-11-08 22:31:44.000000', 4, 4, 5),
(5, '2024-11-08 22:33:04.000000', 5, 5, 4);

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
  `id` int(11) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leaves_holiday`
--

CREATE TABLE `leaves_holiday` (
  `id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `date` date NOT NULL,
  `holiday_name` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaves_holiday`
--

INSERT INTO `leaves_holiday` (`id`, `year`, `date`, `holiday_name`, `day`) VALUES
(1, 2024, '2024-12-25', 'Christmas', 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `leaves_leave`
--

CREATE TABLE `leaves_leave` (
  `id` int(11) NOT NULL,
  `leave_type` varchar(100) NOT NULL,
  `leave_short_form` varchar(10) NOT NULL,
  `leave_count` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaves_leave`
--

INSERT INTO `leaves_leave` (`id`, `leave_type`, `leave_short_form`, `leave_count`, `updated_by`, `updated_on`) VALUES
(1, 'Casual leave', 'CL', 6, 'EMP005', '2024-11-09'),
(2, 'Earned leave', 'EL', 12, 'EMP005', '2024-11-09'),
(3, 'Sick leave', 'SL', 6, 'EMP005', '2024-11-09'),
(4, 'Paternity leave', 'PL', 15, 'EMP005', '2024-11-09'),
(5, 'Maternity leave', 'ML', 90, 'EMP005', '2024-11-09'),
(6, 'Loss of pay', 'LOP', 0, 'EMP004', '2024-11-09'),
(7, 'Compensatory off', 'CO', 0, 'EMP004', '2024-11-09'),
(8, 'Child adoption leave', 'CAL', 50, 'EMP004', '2024-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `leaves_leaveapplication`
--

CREATE TABLE `leaves_leaveapplication` (
  `application_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_half_day` tinyint(1) NOT NULL,
  `half_day_type` varchar(20) DEFAULT NULL,
  `no_of_days` double NOT NULL,
  `leave_remarks` longtext DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `leave_apply_date` datetime(6) NOT NULL,
  `leave_approve_date` date DEFAULT NULL,
  `approve_by` varchar(10) DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `associate_id` bigint(20) NOT NULL,
  `leave_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leaves_leavesetup`
--

CREATE TABLE `leaves_leavesetup` (
  `id` bigint(20) NOT NULL,
  `leave_year` int(11) NOT NULL,
  `leave_year_start` date NOT NULL,
  `leave_year_end` date NOT NULL,
  `casual_leave` double NOT NULL,
  `cl_carry` tinyint(1) NOT NULL,
  `earned_leave` double NOT NULL,
  `el_carry` tinyint(1) NOT NULL,
  `sick_leave` double NOT NULL,
  `sl_carry` tinyint(1) NOT NULL,
  `paternity_leave` double NOT NULL,
  `pl_carry` tinyint(1) NOT NULL,
  `maternity_leave` double NOT NULL,
  `ml_carry` tinyint(1) NOT NULL,
  `loss_of_pay` double NOT NULL,
  `lop_carry` tinyint(1) NOT NULL,
  `compensatory_off` double NOT NULL,
  `co_carry` tinyint(1) NOT NULL,
  `child_adoption_leave` double NOT NULL,
  `cal_carry` tinyint(1) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_on` date NOT NULL,
  `associate_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_associate`
--
ALTER TABLE `accounts_associate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `associate_id` (`associate_id`);

--
-- Indexes for table `accounts_workflowconfiguration`
--
ALTER TABLE `accounts_workflowconfiguration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_workflowcon_admin_id_63a97b97_fk_accounts_` (`admin_id`),
  ADD KEY `accounts_workflowcon_associate_id_e2c86665_fk_accounts_` (`associate_id`),
  ADD KEY `accounts_workflowcon_home_manager_id_df3de4d9_fk_accounts_` (`home_manager_id`);

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_associate_id` (`user_id`);

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
-- Indexes for table `leaves_holiday`
--
ALTER TABLE `leaves_holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves_leave`
--
ALTER TABLE `leaves_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves_leaveapplication`
--
ALTER TABLE `leaves_leaveapplication`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `leaves_leaveapplicat_associate_id_b34f6ad9_fk_accounts_` (`associate_id`),
  ADD KEY `leaves_leaveapplicat_leave_type_id_11fdf268_fk_leaves_le` (`leave_type_id`),
  ADD KEY `leaves_leaveapplicat_admin_id_6c0b4545_fk_accounts_` (`admin_id`);

--
-- Indexes for table `leaves_leavesetup`
--
ALTER TABLE `leaves_leavesetup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_leavesetup_associate_id_id_b348cc1a_fk_accounts_` (`associate_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_associate`
--
ALTER TABLE `accounts_associate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `accounts_workflowconfiguration`
--
ALTER TABLE `accounts_workflowconfiguration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves_holiday`
--
ALTER TABLE `leaves_holiday`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leaves_leave`
--
ALTER TABLE `leaves_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leaves_leaveapplication`
--
ALTER TABLE `leaves_leaveapplication`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves_leavesetup`
--
ALTER TABLE `leaves_leavesetup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_workflowconfiguration`
--
ALTER TABLE `accounts_workflowconfiguration`
  ADD CONSTRAINT `accounts_workflowcon_admin_id_63a97b97_fk_accounts_` FOREIGN KEY (`admin_id`) REFERENCES `accounts_associate` (`id`),
  ADD CONSTRAINT `accounts_workflowcon_associate_id_e2c86665_fk_accounts_` FOREIGN KEY (`associate_id`) REFERENCES `accounts_associate` (`id`),
  ADD CONSTRAINT `accounts_workflowcon_home_manager_id_df3de4d9_fk_accounts_` FOREIGN KEY (`home_manager_id`) REFERENCES `accounts_associate` (`id`);

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_associate_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_associate` (`id`);

--
-- Constraints for table `leaves_leaveapplication`
--
ALTER TABLE `leaves_leaveapplication`
  ADD CONSTRAINT `leaves_leaveapplicat_admin_id_6c0b4545_fk_accounts_` FOREIGN KEY (`admin_id`) REFERENCES `accounts_associate` (`id`),
  ADD CONSTRAINT `leaves_leaveapplicat_associate_id_b34f6ad9_fk_accounts_` FOREIGN KEY (`associate_id`) REFERENCES `accounts_associate` (`id`),
  ADD CONSTRAINT `leaves_leaveapplicat_leave_type_id_11fdf268_fk_leaves_le` FOREIGN KEY (`leave_type_id`) REFERENCES `leaves_leave` (`id`);

--
-- Constraints for table `leaves_leavesetup`
--
ALTER TABLE `leaves_leavesetup`
  ADD CONSTRAINT `leaves_leavesetup_associate_id_id_b348cc1a_fk_accounts_` FOREIGN KEY (`associate_id_id`) REFERENCES `accounts_associate` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
