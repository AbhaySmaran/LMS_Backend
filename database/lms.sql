-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 04:52 AM
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
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `associate_id` varchar(20) DEFAULT NULL,
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
('2024-11-14 19:47:27.009440', 1, 'Abhay Smaran', 'Das', 'dasabhaysmaran@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Abhay', 'EMP001', 'Associate', 'Digital transformation', 'Hyscaler', 'Patia,Nandan vihar', 'Bhubaneswar', 'Odisha', 'India', '7326892455', '2024-09-23', 'Male', 0, 0),
('2024-11-13 06:47:28.585598', 2, 'Ankit', 'Das', 'ankit@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Ankit', 'EMP002', 'Associate', 'Mordenization', 'Hyscaler', 'Patia', 'Bhubaneswar', 'Odisha', 'India', '7326892466', '2024-11-05', 'Male', 0, 0),
('2024-11-14 18:59:47.785659', 3, 'Ankita', 'Rana', 'manager@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Ankita', 'EMP003', 'Associate', 'Digital transformation', 'Hyscaler', 'Bhoomikhal', 'Bhubaneswar', 'Odisha', 'India', '7326892489', '2024-11-01', 'Female', 1, 0),
('2024-11-14 19:01:04.770242', 4, 'Rohit', 'Tyagi', 'asdrishi3@gmail.com', 'pbkdf2_sha256$150000$fr7HDFOJUXDv$seCkcjq0IMnhfPp9fE2b5HRJKrFIU8NyZfylm13ZVoQ=', 'Rohit', 'EMP004', 'Admin', '', 'Hyscaler', '', 'Bhubaneswar', 'Odisha', 'India', '9978654327', '0000-00-00', 'Male', 1, 1),
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add associate', 6, 'add_associate'),
(22, 'Can change associate', 6, 'change_associate'),
(23, 'Can delete associate', 6, 'delete_associate'),
(24, 'Can view associate', 6, 'view_associate'),
(25, 'Can add workflow configuration', 7, 'add_workflowconfiguration'),
(26, 'Can change workflow configuration', 7, 'change_workflowconfiguration'),
(27, 'Can delete workflow configuration', 7, 'delete_workflowconfiguration'),
(28, 'Can view workflow configuration', 7, 'view_workflowconfiguration'),
(29, 'Can add leave', 8, 'add_leave'),
(30, 'Can change leave', 8, 'change_leave'),
(31, 'Can delete leave', 8, 'delete_leave'),
(32, 'Can view leave', 8, 'view_leave'),
(33, 'Can add leave setup', 9, 'add_leavesetup'),
(34, 'Can change leave setup', 9, 'change_leavesetup'),
(35, 'Can delete leave setup', 9, 'delete_leavesetup'),
(36, 'Can view leave setup', 9, 'view_leavesetup'),
(37, 'Can add leave application', 10, 'add_leaveapplication'),
(38, 'Can change leave application', 10, 'change_leaveapplication'),
(39, 'Can delete leave application', 10, 'delete_leaveapplication'),
(40, 'Can view leave application', 10, 'view_leaveapplication'),
(41, 'Can add holiday', 11, 'add_holiday'),
(42, 'Can change holiday', 11, 'change_holiday'),
(43, 'Can delete holiday', 11, 'delete_holiday'),
(44, 'Can view holiday', 11, 'view_holiday');

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

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'associate'),
(7, 'accounts', 'workflowconfiguration'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(11, 'leaves', 'holiday'),
(8, 'leaves', 'leave'),
(10, 'leaves', 'leaveapplication'),
(9, 'leaves', 'leavesetup'),
(5, 'sessions', 'session');

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

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2024-11-08 14:11:59.865365'),
(2, 'contenttypes', '0001_initial', '2024-11-08 14:12:00.662516'),
(3, 'admin', '0001_initial', '2024-11-08 14:12:00.834839'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-08 14:12:01.242128'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-08 14:12:01.281933'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-08 14:12:01.491063'),
(7, 'auth', '0001_initial', '2024-11-08 14:12:01.912658'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-11-08 14:12:02.772021'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-11-08 14:12:02.787645'),
(10, 'auth', '0004_alter_user_username_opts', '2024-11-08 14:12:02.818897'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-11-08 14:12:02.842571'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-11-08 14:12:02.862704'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-11-08 14:12:02.890964'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-11-08 14:12:02.921323'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-11-08 14:12:02.941771'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-11-08 14:12:03.029232'),
(17, 'auth', '0011_update_proxy_permissions', '2024-11-08 14:12:03.065283'),
(18, 'sessions', '0001_initial', '2024-11-08 14:12:03.193690'),
(19, 'accounts', '0002_auto_20241108_2247', '2024-11-08 17:18:10.600683'),
(20, 'leaves', '0001_initial', '2024-11-09 07:28:23.624695'),
(21, 'leaves', '0002_leavesetup', '2024-11-10 02:27:06.082277'),
(22, 'leaves', '0003_auto_20241110_0758', '2024-11-10 02:29:01.356307'),
(23, 'leaves', '0004_delete_leavesetup', '2024-11-10 02:57:31.203042'),
(24, 'leaves', '0005_leavesetup', '2024-11-10 02:58:03.081286'),
(25, 'leaves', '0006_leaveapplication', '2024-11-11 14:48:46.005756'),
(26, 'leaves', '0007_auto_20241111_2021', '2024-11-11 14:52:03.912326'),
(27, 'leaves', '0008_auto_20241112_0838', '2024-11-12 03:08:19.585986'),
(28, 'leaves', '0009_holiday_day', '2024-11-12 03:14:33.415494'),
(29, 'leaves', '0010_auto_20241112_1223', '2024-11-12 06:53:32.117742'),
(30, 'leaves', '0011_auto_20241112_1244', '2024-11-12 07:14:44.117633'),
(31, 'leaves', '0012_auto_20241112_1918', '2024-11-12 13:48:40.319933'),
(32, 'leaves', '0013_auto_20241113_1122', '2024-11-13 05:53:09.028594'),
(33, 'leaves', '0014_auto_20241113_1136', '2024-11-13 06:06:22.206595'),
(34, 'leaves', '0015_auto_20241114_0856', '2024-11-14 03:27:00.456803'),
(35, 'accounts', '0003_auto_20241114_2132', '2024-11-14 16:02:35.540621'),
(36, 'accounts', '0004_auto_20241114_2133', '2024-11-14 16:03:26.145071'),
(37, 'accounts', '0005_auto_20241114_2136', '2024-11-14 16:07:01.733328'),
(38, 'accounts', '0006_auto_20241114_2148', '2024-11-14 16:19:10.478648');

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
('01rh3xxpyhhel3vubycpryc30oty7mk7', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 18:14:03.584242'),
('0gj3tv7mw2rqren7cilo9qxic0i6y3ls', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 08:58:04.278240'),
('0t3k82bgccuueoretfecevv61w1ajaui', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 02:31:16.773657'),
('1mob2gxegu991vk0suevv1dcblou137e', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 16:03:15.490282'),
('261ydy16mpq73ehgt5eyio3q60kkgekk', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 15:01:21.116894'),
('2fewn6wo37kqhjtai17n0w6vpih9c4ic', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 16:07:40.803375'),
('2uzgr1jsx31zrirhit53nbrh7ravw6gw', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 13:49:36.638362'),
('2xiro82rk2mjr75ofa5az19v1lc0va0s', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:45:43.184316'),
('399h53tw75lnyn2gtvyi55nj9kg315of', 'MzNhYTA4NjY5ZmU1MWRhMzMzODBkOTZjMTk0NDU1MDg3YTU5Y2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 12:52:39.434288'),
('3i4or0qz7rm3i9qy3ghif9it07jwb4us', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:42:47.145211'),
('4bzrcr9dhh1thxybxjlasr5tjsh1kclg', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:34:53.671227'),
('4zjzp1ic8hq4f83obtyzxw7x856mgdvr', 'OTAxMzdiYjMwMGQ1MWE0NWRhM2Y1MWYxZTkyNDkwOTNmYzA0YmE1ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 12:48:56.293724'),
('5f34eajbhnw2uq1lvgu60a81o2bvhrya', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 19:47:27.138217'),
('5wtcn4hnfrm29lgdl5tjwj9smkqzfetp', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:54:41.293727'),
('64kbtck81yrei1utykmvewdptsxchyie', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 18:16:30.619550'),
('65je5zk8u7qmxsttc7157bf31gc2g840', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:09:30.587800'),
('7fyjbgksmuyncxbxa15gkxjzalj4wtfh', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 02:20:51.559617'),
('8252eh6rg0jcusn2s3tme6wymolc2qir', 'OTAxMzdiYjMwMGQ1MWE0NWRhM2Y1MWYxZTkyNDkwOTNmYzA0YmE1ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 12:48:56.646514'),
('8845y8hqc2zwoxynaajcq9yl67una9qu', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 18:38:49.126537'),
('90q3gz3ov30wng6axjvxv5h1q8wfzsf7', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:05:39.917041'),
('9n8yjkvlfuhyw7apv1tvmctochj2lx50', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:35:05.637852'),
('9zpulug1awk4jy86wvdu8v3gcnep2ra0', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 02:30:57.201853'),
('b394mkgav2qq92nu0mu2mqaygn4ls6gg', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 08:06:31.254058'),
('b4f808shum75qxkwusqmqn98v429jpcn', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 12:43:12.390053'),
('bw4nu6216upneu4z450fh0dbxotvnpxg', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:36:45.262571'),
('c4tdcmyhxox4lbf6zfl6mc2hidc108ov', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 18:54:06.535574'),
('d2myjvprnpnge4xdjdny42s38cp40y0z', 'MzNhYTA4NjY5ZmU1MWRhMzMzODBkOTZjMTk0NDU1MDg3YTU5Y2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 18:59:47.785659'),
('dggz70t901kmg1dnygonug0h34e01ixk', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:36:54.075045'),
('dh0mnzaeqf2k2apxmhuccgz6hhuvqodx', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 12:51:24.452739'),
('dmo5s01aktooo51fyacqny8b57iqn1xv', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:42:41.216514'),
('ectpu64hj1c17y007dmkv7nhcub5xraf', 'MzNhYTA4NjY5ZmU1MWRhMzMzODBkOTZjMTk0NDU1MDg3YTU5Y2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:50:27.918762'),
('el37spizsqet1cbt1i0xx6svv9fha7ob', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 19:01:04.785790'),
('en3u3c8cat6y3h9l7vug9xwvmnvaila1', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:33:03.137414'),
('f1f75oguyfpdwmat7hcldqdimuz0xfwx', 'OTAxMzdiYjMwMGQ1MWE0NWRhM2Y1MWYxZTkyNDkwOTNmYzA0YmE1ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 06:47:28.600015'),
('f3ob5in5e5z1eye1j6e0k6heckp0z9rd', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:57:53.382514'),
('f41n5mh7zfvfm8mw4a2rt551616te156', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:00:19.011948'),
('fasn68f2o58vz3h346o9rnsozwl6dbhr', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:25:45.329681'),
('fqnkomt8xdjswg62upfek51hu36bdip9', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:06:49.429346'),
('fugph5f9ex1bwkon1iy7jb981ggk895t', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 06:24:32.360207'),
('fui4zfk01ju7d2knphrtpcd8jvynpqx0', 'OTAxMzdiYjMwMGQ1MWE0NWRhM2Y1MWYxZTkyNDkwOTNmYzA0YmE1ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:19:26.279416'),
('g3yq7l0gu2mochvmh9oc88u8yau0pp6j', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:35:35.496671'),
('gws3y3bbvbeu4g0xcavgt789aeac04a7', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 06:22:38.119268'),
('h54vir734if55lt6i2kpc9mldhjqooql', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 18:39:16.771976'),
('hi3ohfpzbyihpax3m1sfhx17z8gxr9ma', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:00:41.247534'),
('ho1d08byzgq6idutzhzal4si7spvlzcy', 'MzNhYTA4NjY5ZmU1MWRhMzMzODBkOTZjMTk0NDU1MDg3YTU5Y2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 06:53:46.079696'),
('i06614qt2g9wdytwdbucac4aykknsc6t', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 08:08:44.997183'),
('i7p68sgbv24cvkiqbdr99kz6vf928vdi', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:22:54.638248'),
('iephky1vy7pve02qc3o6cqzjz3liphjt', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 02:21:40.653885'),
('iscozcswgaapyhxg5ls3fi850w5o87h6', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 02:31:31.701021'),
('iwzjm1s1et59coztvfg76jls62wcxi3z', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 06:56:32.387926'),
('jln6hk72fmv1yutui7dch5n4zl4zks66', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 05:47:47.810622'),
('jmtv7ka7enco8kc1sp149e46tjxva0e2', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:16:55.371808'),
('l5uf29vs576v4jtovx4gfsmtsam2kjrr', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:22:55.103134'),
('l9nn4arar2ids4djc7iksn5u21dqq8kp', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 16:00:07.333477'),
('m453tfi8c61um3o8zoggelo2h49d6s07', 'MzNhYTA4NjY5ZmU1MWRhMzMzODBkOTZjMTk0NDU1MDg3YTU5Y2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:51:56.777916'),
('m5ms05sw18n72je8sqpaoutmt81q9zuj', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:06:38.825314'),
('mu0e7kosyzsjlt0ojaj5k3hm64cnt5ym', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-22 16:01:31.615752'),
('nrhg528oohifijgf94oppguekstk6wkp', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 03:03:29.931941'),
('ny4svg7jf6g1xmpjdq0iblofkmytqypz', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:12:21.950281'),
('o71pjz25ldbp3ebl8nrop4r2xa1a990y', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:44:50.808089'),
('p25kxkjud59249pu86pk6fxyhfjii6fc', 'MzNhYTA4NjY5ZmU1MWRhMzMzODBkOTZjMTk0NDU1MDg3YTU5Y2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:40:57.099772'),
('p3mn223k0jra1gwv0egd2lhejvl02h18', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 18:40:37.220579'),
('p6fx4uvlj3ea5yg2ckp50oye8juqz6bf', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 13:11:38.200201'),
('pkj6m17yettdbh44zcpn0dpe4no9wsmq', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 06:44:57.387773'),
('pyrgwbnwaazu87wmti4hauc8sz5721yn', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:15:17.075466'),
('ri4p6b31mf41oxdw0netfj0cix0t2e1b', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-26 17:04:01.429274'),
('rt52zil5iiu7ljlruvk8jo81a6qsyp84', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:24:28.403462'),
('rz1ua7kdroxx4p3cy2tifuh6osdtiveq', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:45:38.821506'),
('s8vsxa39lr8otpfq56lteke3xvc36h6x', 'NjI0OTQ3MTkxZGM2ODZjNTA1ODJjNWRjMTJkMTliN2U1YWEzN2QzMzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:08:14.294859'),
('sz4wneb3eo2hdv91qmyqak9cc8z7tijb', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:40:35.315285'),
('t61quyg1j502gtja9w70uuec847x8h3y', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:07:00.605360'),
('tix1c18gb0ys353ax1j9t56yqm4pydo6', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-28 03:02:28.698497'),
('u51x3kpd10am6fdubndfoe3ms4sbcdnp', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:42:40.413300'),
('uhcmhty2vhy8tsrupq1irp58p9uqdq7h', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:11:16.981413'),
('uz1opfvrtzj6w0x6yh4wrw0tcu12oe0p', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 09:20:11.425354'),
('v4tju45h4xfnlmazx3kr8e4tuz9ntfkc', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:59:49.522706'),
('veg08sqdd1ytac8475x3a3trx8xijhz8', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 03:19:03.075875'),
('veiru3aos082qwdmsctnl853casz226k', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-23 13:47:10.982178'),
('wx4py2jm5ezmfzopca2fk13bewkmn94x', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 08:02:05.661857'),
('yl372a65h904u2e5u3p7pnblqk1t8z3d', 'Y2VjNjUwZjlmOGY5YTMwMWRhMTdmZmM1MDZhZWY5MGUzMmFkY2Y0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 07:21:42.244048'),
('zh3qznbn3nuhxv0zvgnufkii7x9gwyyh', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 10:13:04.774717'),
('zxqgfqx6u0so01082eo29ujiseug81en', 'NzkzYjYyNjNmYTQzODBjOTE4NDU3Y2MxNmQ0ZDAxM2Q5OGFhNjg5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOTMzYjZhMmY5NWE0ZTU2OWUxMTFhMTc5NWJkYjBlOTk3YTJmN2FlIn0=', '2024-11-27 08:59:59.164946');

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

--
-- Dumping data for table `leaves_leaveapplication`
--

INSERT INTO `leaves_leaveapplication` (`application_id`, `start_date`, `end_date`, `is_half_day`, `half_day_type`, `no_of_days`, `leave_remarks`, `status`, `leave_apply_date`, `leave_approve_date`, `approve_by`, `comments`, `admin_id`, `associate_id`, `leave_type_id`) VALUES
(1, '2024-11-15', '2024-11-19', 1, 'start_day', 2.5, 'Having Fever', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 3),
(2, '2024-11-14', '2024-11-15', 1, 'start_day', 1.5, 'For casual leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(3, '2024-11-15', '2024-11-15', 1, 'start_day', 0.5, 'Work frm home', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, NULL, 5, 1),
(4, '2024-11-20', '2024-11-20', 1, 'start_day', 0.5, 'Test', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, NULL, 5, 1),
(5, '2024-11-15', '2024-11-19', 0, NULL, 3, 'Having Fever', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-13', 'EMP004', NULL, NULL, 5, 1),
(6, '2024-11-22', '2024-11-28', 0, NULL, 5, 'Fever', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, NULL, 5, 3),
(7, '2024-11-14', '2024-11-22', 0, NULL, 7, 'Accident', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-13', NULL, NULL, 4, 1, 2),
(8, '2024-11-15', '2024-11-21', 0, NULL, 5, 'Health isuue', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 2, 3),
(9, '2024-11-18', '2025-01-31', 0, NULL, 54, 'Maternity leave', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-14', 'EMP004', NULL, 5, 3, 5),
(10, '2024-11-29', '2024-11-29', 0, NULL, 1, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 1, 1),
(11, '2024-11-29', '2024-11-29', 0, NULL, 1, 'leave', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-13', NULL, NULL, 4, 1, 1),
(12, '2024-11-15', '2024-11-20', 0, NULL, 4, 'Fever', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 5, 3, 3),
(13, '2024-11-15', '2024-11-21', 0, NULL, 5, 'Fever', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 5, 3, 3),
(14, '2024-11-15', '2024-11-15', 0, NULL, 1, 'Fever', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-14', 'EMP004', NULL, 5, 3, 3),
(15, '2024-11-14', '2024-11-15', 0, NULL, 2, 'Leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(16, '2024-11-14', '2024-11-18', 0, NULL, 3, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(17, '2024-11-15', '2024-11-18', 0, NULL, 2, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(18, '2024-11-15', '2024-11-19', 0, NULL, 3, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(19, '2024-11-14', '2024-11-15', 0, NULL, 2, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(20, '2024-11-15', '2024-11-18', 0, NULL, 2, 'Test', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 2),
(21, '2024-11-14', '2024-11-18', 0, NULL, 3, 'Test', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 2),
(22, '2024-11-14', '2024-11-15', 0, NULL, 2, 'Leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(23, '2024-11-14', '2024-11-22', 0, NULL, 7, 'Accident', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 2),
(24, '2024-11-14', '2024-11-15', 0, NULL, 2, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(25, '2024-11-14', '2024-11-15', 0, NULL, 2, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 2),
(26, '2024-11-14', '2024-11-14', 0, NULL, 1, 'leave', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(27, '2024-11-14', '2024-11-21', 0, NULL, 6, 'Accident', 'Cancelled', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 2),
(28, '2024-11-15', '2024-11-19', 0, NULL, 3, 'leave', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-14', 'EMP004', NULL, 4, 4, 1),
(29, '2024-11-27', '2024-11-29', 0, NULL, 3, 'leave', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 4, 1),
(30, '2024-11-15', '2024-11-18', 0, NULL, 2, 'leae', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 5, 3, 1),
(31, '2024-11-15', '2024-11-18', 0, NULL, 2, 'For Health issue', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 1, 1),
(32, '2024-11-15', '2024-11-18', 0, NULL, 2, 'For Health issue', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 1, 1),
(33, '2024-11-15', '2024-11-18', 0, NULL, 2, 'For Health issue', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-13', NULL, NULL, 4, 1, 1),
(34, '2024-11-15', '2024-11-18', 0, NULL, 2, 'For Health issue', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 1, 1),
(35, '2024-11-28', '2024-11-29', 0, NULL, 2, 'leave', 'Rejected', '2024-11-13 00:00:00.000000', NULL, NULL, NULL, 4, 1, 1),
(36, '2024-11-21', '2024-11-22', 0, NULL, 2, 'fever', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-14', 'EMP004', NULL, 4, 1, 3),
(37, '2024-11-21', '2024-11-22', 0, NULL, 2, 'fever', 'Approved', '2024-11-13 00:00:00.000000', '2024-11-14', 'EMP004', NULL, 4, 1, 3),
(38, '2024-11-15', '2024-11-15', 0, NULL, 1, 'leave', 'Cancelled', '2024-11-14 16:40:16.558595', NULL, NULL, NULL, 4, 4, 1),
(39, '2024-11-16', '2024-11-20', 0, NULL, 3, 'leave', 'Pending', '2024-11-14 19:08:36.372240', NULL, NULL, NULL, 4, 4, 1),
(40, '2024-11-20', '2024-11-28', 0, NULL, 7, 'leave', 'Pending', '2024-11-14 19:48:08.729360', NULL, NULL, NULL, 4, 1, 1);

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
-- Dumping data for table `leaves_leavesetup`
--

INSERT INTO `leaves_leavesetup` (`id`, `leave_year`, `leave_year_start`, `leave_year_end`, `casual_leave`, `cl_carry`, `earned_leave`, `el_carry`, `sick_leave`, `sl_carry`, `paternity_leave`, `pl_carry`, `maternity_leave`, `ml_carry`, `loss_of_pay`, `lop_carry`, `compensatory_off`, `co_carry`, `child_adoption_leave`, `cal_carry`, `updated_by`, `updated_on`, `associate_id_id`) VALUES
(1, 2024, '2024-01-01', '2024-12-31', 6, 0, 12, 0, 6, 0, 15, 0, 90, 0, 0, 0, 0, 0, 50, 0, 'EMP005', '2024-11-13', 1),
(2, 2024, '2024-01-01', '2024-12-31', 6, 0, 12, 0, 6, 0, 15, 0, 90, 0, 0, 0, 0, 0, 50, 0, 'EMP005', '2024-11-13', 2),
(3, 2024, '2024-01-01', '2024-12-31', 6, 0, 12, 0, 6, 0, 15, 0, 36, 0, 0, 0, 0, 0, 50, 0, 'EMP005', '2024-11-13', 3),
(4, 2024, '2024-01-01', '2024-12-31', 6, 0, 12, 0, 6, 0, 15, 0, 90, 0, 0, 0, 0, 0, 50, 0, 'EMP005', '2024-11-13', 4),
(5, 2024, '2024-01-01', '2024-12-31', 6, 0, 12, 0, 6, 0, 15, 0, 90, 0, 0, 0, 0, 0, 50, 0, 'EMP005', '2024-11-13', 5);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `leaves_leavesetup`
--
ALTER TABLE `leaves_leavesetup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
