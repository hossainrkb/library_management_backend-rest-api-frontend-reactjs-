-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2019 at 05:35 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libsys`
--

-- --------------------------------------------------------

--
-- Table structure for table `libsys_admin`
--

CREATE TABLE `libsys_admin` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(50) NOT NULL,
  `a_contact` varchar(20) NOT NULL,
  `a_password` varchar(255) NOT NULL,
  `a_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_admin`
--

INSERT INTO `libsys_admin` (`a_id`, `a_name`, `a_contact`, `a_password`, `a_status`) VALUES
(1, 'RANA', '01400654123', 'e10adc3949ba59abbe56e057f20f883e', 1),
(2, 'Rakib HOSSAIN', '01923144496', '789654', 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_author`
--

CREATE TABLE `libsys_author` (
  `au_id` int(11) NOT NULL,
  `au_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_author`
--

INSERT INTO `libsys_author` (`au_id`, `au_name`) VALUES
(1, 'Imdadul Haque Milon'),
(2, 'Humayun Ahmed'),
(3, 'Muntassir Mamoon'),
(4, 'Muhammed Zafar Iqbal'),
(5, 'Anisul Hoque'),
(6, 'Rabindranath Tagore'),
(7, 'Syed Shamsul Haque'),
(8, 'Selina Hossain');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_bk_author`
--

CREATE TABLE `libsys_bk_author` (
  `bk_au_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `au_id` int(11) NOT NULL,
  `ck_key` int(11) NOT NULL COMMENT 'bk+au'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_bk_author`
--

INSERT INTO `libsys_bk_author` (`bk_au_id`, `b_id`, `au_id`, `ck_key`) VALUES
(1, 1, 1, 11),
(2, 2, 1, 21),
(3, 1, 7, 17),
(4, 1, 4, 14),
(5, 2, 3, 23),
(6, 3, 2, 32),
(7, 1, 3, 13),
(8, 2, 7, 27);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_books`
--

CREATE TABLE `libsys_books` (
  `b_id` int(11) NOT NULL,
  `b_code` varchar(50) NOT NULL,
  `b_name` varchar(50) NOT NULL,
  `b_publishar` int(11) NOT NULL,
  `b_qty` int(11) NOT NULL,
  `b_self` int(11) NOT NULL,
  `b_row` int(11) NOT NULL,
  `b_medium` int(11) NOT NULL,
  `b_price` decimal(10,2) NOT NULL,
  `b_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_books`
--

INSERT INTO `libsys_books` (`b_id`, `b_code`, `b_name`, `b_publishar`, `b_qty`, `b_self`, `b_row`, `b_medium`, `b_price`, `b_status`) VALUES
(1, '100', 'PHP', 1, 449, 10, 5, 1, '250.00', 1),
(2, '101', 'JAVA', 1, 5684, 12, 0, 0, '222.00', 0),
(3, '233', 'ANDROID', 0, 105, 5, 0, 0, '778.00', 0),
(4, '567', 'WORDRESS', 0, 100, 7, 0, 0, '678.00', 0),
(5, '679', 'PHYSICS', 0, 100, 3, 0, 0, '545.00', 1),
(6, '673', 'MATH', 0, 86, 9, 0, 0, '545.00', 1),
(7, '239', 'BIOLOGY', 0, 100, 4, 0, 0, '345.00', 1),
(8, '559', 'C PROGRAMMING', 0, 87, 6, 0, 0, '345.00', 1),
(11, '600', 'C++', 0, 192, 4, 0, 0, '445.00', 1),
(13, '1785', 'BANGLA', 1, 9, 1, 0, 0, '123.00', 1),
(14, '964', 'ENGLISH', 2, 120, 1, 0, 0, '22.00', 1),
(15, '743', 'HOLA', 1, 121, 5, 0, 0, '147.00', 1),
(16, '', '', 0, 0, 0, 0, 0, '0.00', 0),
(20, 'B12345', 'PHP-PYTHON', 1, 53, 5, 0, 0, '3000.00', 1),
(21, 'B12346', 'JAVA-ANDROID', 5, 79, 7, 0, 0, '9000.00', 1),
(22, '7677', '767', 1, 5, 5, 0, 0, '5.00', 1),
(24, 'B123', 'বাংলা', 1, 25, 11, 5, 2, '250.00', 1),
(26, 'b7777', 'bbb', 1, 11, 11, 11, 1, '11.00', 1),
(27, '111111', '1', 1, 1, 1, 1, 1, '11.00', 1),
(28, 'gh', 'hg', 1, 76, 67, 67, 1, '76.00', 1),
(30, 'book.b_code', 'book.b_name', 1, 0, 0, 0, 0, '0.00', 1),
(31, 'B101', 'Artificial Intellengence', 1, 25, 11, 12, 1, '225.00', 1),
(33, '23911', 'Artificial Intellengence', 1, 25, 11, 12, 1, '225.00', 1),
(35, '8888', 'Artificial Intellengence', 1, 25, 11, 12, 1, '225.00', 1),
(37, '52525228585858584', 'Artificial Intellengence', 1, 25, 11, 12, 1, '225.00', 1),
(39, 'M1fasdf23', 'Machanical Engineering', 1, 25, 11, 12, 1, '225.00', 1),
(43, 'I123', 'IELTS', 1, 25, 11, 12, 1, '225.00', 1),
(44, 'I173', 'IELTS', 1, 25, 11, 12, 1, '225.00', 1),
(45, 'IS123', 'Islamic', 1, 25, 11, 12, 1, '225.00', 1),
(46, 'I7412', 'Islamic history', 1, 25, 11, 12, 1, '225.00', 1),
(47, 'I7414', 'Islamic history p2', 1, 25, 11, 12, 1, '225.00', 1),
(48, 'P785', 'bangla 2nd part', 1, 15, 11, 2, 1, '225.00', 1),
(49, 'B147852', 'Hola Science', 1, 45, 2, 1, 1, '450.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_daily_issue`
--

CREATE TABLE `libsys_daily_issue` (
  `i_id` int(11) NOT NULL,
  `i_book_id` int(11) NOT NULL,
  `i_student_id` int(11) NOT NULL,
  `i_check` int(11) NOT NULL COMMENT 'book_id+student_id',
  `i_date` date NOT NULL,
  `i_r_date` date NOT NULL,
  `i_fine` decimal(10,0) NOT NULL,
  `i_paid` decimal(10,0) NOT NULL,
  `i_fine_type` int(11) NOT NULL,
  `i_status` int(11) NOT NULL COMMENT 'r=0, i=1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_daily_issue`
--

INSERT INTO `libsys_daily_issue` (`i_id`, `i_book_id`, `i_student_id`, `i_check`, `i_date`, `i_r_date`, `i_fine`, `i_paid`, `i_fine_type`, `i_status`) VALUES
(6, 1, 2, 12, '2018-12-03', '2018-12-03', '0', '6', 1, 0),
(10, 3, 2, 32, '2018-12-02', '2018-12-02', '0', '1', 1, 1),
(12, 11, 2, 112, '2018-11-03', '2018-11-06', '0', '29', 0, 1),
(16, 2, 2, 22, '2018-12-02', '2018-12-02', '0', '0', 0, 1),
(21, 13, 3, 132, '2018-11-02', '2018-12-05', '0', '32', 0, 0),
(24, 14, 2, 142, '2018-11-03', '2018-12-02', '0', '26', 0, 0),
(30, 2, 1, 21, '2018-12-03', '2018-12-06', '0', '0', 0, 0),
(32, 6, 2, 62, '2018-12-02', '2018-12-05', '0', '0', 0, 0),
(33, 8, 2, 82, '2018-12-03', '2018-12-06', '0', '0', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_departments`
--

CREATE TABLE `libsys_departments` (
  `d_id` int(11) NOT NULL,
  `d_code` varchar(100) NOT NULL,
  `d_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_departments`
--

INSERT INTO `libsys_departments` (`d_id`, `d_code`, `d_name`) VALUES
(1, 'PHY', 'PHYSICS'),
(2, 'BAN', 'BANGLA'),
(3, 'CSE', 'COMPUTER SCIENCE'),
(4, 'ENG', 'ENGLISH LITERATURE');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_issue`
--

CREATE TABLE `libsys_issue` (
  `i_id` int(11) NOT NULL,
  `i_book_id` int(11) NOT NULL,
  `i_student_id` int(11) NOT NULL,
  `i_check` double NOT NULL COMMENT 'book_id+student_id',
  `i_date` date NOT NULL,
  `i_r_date` date NOT NULL,
  `i_fine` decimal(10,0) NOT NULL,
  `i_paid` decimal(10,0) NOT NULL,
  `i_fine_type` int(11) NOT NULL,
  `i_status` int(11) NOT NULL COMMENT 'r=0, i=1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_issue`
--

INSERT INTO `libsys_issue` (`i_id`, `i_book_id`, `i_student_id`, `i_check`, `i_date`, `i_r_date`, `i_fine`, `i_paid`, `i_fine_type`, `i_status`) VALUES
(90, 3, 2, 3.2, '2019-09-12', '2019-09-05', '4', '4', 0, 0),
(91, 49, 1, 49.1, '2019-08-30', '2019-09-04', '0', '0', 0, 1),
(96, 3, 26, 3.26, '2019-09-03', '2019-09-05', '4', '4', 0, 0),
(97, 47, 26, 47.26, '2019-09-04', '2019-09-09', '0', '0', 0, 1),
(98, 48, 26, 48.26, '2019-09-04', '2019-09-05', '0', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_medium`
--

CREATE TABLE `libsys_medium` (
  `m_id` int(11) NOT NULL,
  `m_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_medium`
--

INSERT INTO `libsys_medium` (`m_id`, `m_name`) VALUES
(1, 'English'),
(2, 'বাংলা');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_payment_type`
--

CREATE TABLE `libsys_payment_type` (
  `cpt_id` int(11) NOT NULL,
  `cpt_name` varchar(100) NOT NULL,
  `cpt_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_payment_type`
--

INSERT INTO `libsys_payment_type` (`cpt_id`, `cpt_name`, `cpt_status`) VALUES
(1, 'LIBRARY FINE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_publisher`
--

CREATE TABLE `libsys_publisher` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_publisher`
--

INSERT INTO `libsys_publisher` (`pub_id`, `pub_name`) VALUES
(1, 'SOMOY'),
(2, 'ANONNA'),
(3, 'OITIJJHYA'),
(4, 'AGAMEE PRAKASHANI'),
(5, 'UNIVERSITY PRESS'),
(6, 'KAKOLI PROKASHONI');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_semester`
--

CREATE TABLE `libsys_semester` (
  `sem_id` int(11) NOT NULL,
  `sem_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_semester`
--

INSERT INTO `libsys_semester` (`sem_id`, `sem_name`) VALUES
(1, '1st'),
(2, '2nd'),
(3, '3rd'),
(4, '4th'),
(5, '5th'),
(6, '6th'),
(7, '7th'),
(8, '8th');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_session`
--

CREATE TABLE `libsys_session` (
  `sess_id` int(11) NOT NULL,
  `sess_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_session`
--

INSERT INTO `libsys_session` (`sess_id`, `sess_name`) VALUES
(1, '2014-2015'),
(2, '2015-2016');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_students`
--

CREATE TABLE `libsys_students` (
  `s_id` int(11) NOT NULL,
  `s_roll` varchar(100) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `s_contact` varchar(50) NOT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_image` blob,
  `s_session` varchar(100) NOT NULL,
  `s_year` varchar(50) NOT NULL,
  `s_address` varchar(100) NOT NULL,
  `s_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_students`
--

INSERT INTO `libsys_students` (`s_id`, `s_roll`, `s_name`, `s_contact`, `s_email`, `s_image`, `s_session`, `s_year`, `s_address`, `s_status`) VALUES
(1, 'B12345', 'XYZ', '01316377019', 'xyz@gmail.com', '', '1', '1', 'Chokbazar, Chittagong', 1),
(2, 'বি১২১২১', 'Rakib', '00934243423', 'rkb@gmail.com', '', '1', '1', 'CTG', 1),
(17, 'B789654', '', '019231444966', 'rkb@gmail.com', '', '1', '1', 'হালিশহর', 1),
(22, 'B12346', 'রানা', '০১৯২৩১৪৪৪৯৬', 'rana@gmail.com', '', '1', '1', 'CTG', 1),
(23, 'C151045', 'Hossain', '01923144496', 'hossain@gmail.com', '', '1', '1', 'Halishahor', 1),
(25, 'C151044', 'rkb', '01923144497', 'ho4ssain@gmail.com', NULL, '1', '1', 'Halishahor', 1),
(26, 'C151046', 'rkb', '01944523144497', 'ho4s455445sain@gmail.com', NULL, '1', '1', 'Halishahor', 1),
(27, 'gdfgfdgfdg', 'hgfhfghhggf', 'dsfsdfdfd', 'hgfhfghgh@gmail.com', NULL, '1', '1', 'dsfdsf', 1),
(31, 'FDGFDGFGS', 'GFDSGFDG', 'FAFFAS', 'SGDFGFG@GMAIL.COM', NULL, '1', '1', 'ASDFDAFDSFSD', 1),
(32, 'FDGFDGFGSGHSH', 'GFDSGFDG', 'FHGFHFGHDFAFFAS', 'SGDFGFHFGFG@GMAIL.COM', NULL, '1', '1', 'ASDFDAFDSFSD', 1),
(33, 'C151038', 'Rafid', '01963857877', 'rafid@gmail.com', NULL, '1', '1', 'custom', 1),
(34, 'C151037', 'Rafid', '019683857877', 'rayyyfid@gmail.com', NULL, '1', '1', 'custom', 1),
(35, 'fafda', 'adfasd', 'afdfsfdsa', 'trtrt@gmail.com', NULL, '1', '1', 'fdafdfdf', 1),
(36, 'C151039', 'Joy kumar Shill', '019678521448', 'joyk@gmail.com', NULL, '1', '1', 'new market', 1),
(37, 'gsdfdg', 'gfdsgfdgfgg', 'gfagfgfdg', 'dfsgdfgdfg@gmail.com', NULL, '1', '1', 'dfgsdf', 1),
(38, 'gbfd', 'sgfdg', 'afdsafdsfsfdf', 'gsfd@gmail.com', NULL, '1', '1', 'dafsdfsdf', 1),
(39, 'sdafdf', 'dsfdsf', 'fdsfdsffrwe', 'dfasdfffdfdf@gmail.com', NULL, '1', '1', 'daf', 1),
(40, 'fdsfafdf', 'asdf', 'asdfdsf', 'dfasfd@gmail.com', NULL, '1', '1', 'fasdfda', 1),
(41, 'fdsfafdffgd', 'asdfdgf', 'asdfdgfgfdsf', 'dfdfgasfd@gmail.com', NULL, '1', '1', 'fasdfda', 1),
(42, 'dfvgdsfraf', 'fsdafsdfdf', 'afsdfsafsdf', 'farfadsfsdf@gail.com', NULL, '1', '1', 'dsafsdf', 1),
(43, 'dfvgdsdsdafsdffraf', 'fsdafsdfdf', 'affsdafdfsdfsafsdf', 'farfasdfdsafadsfsdf@gail.com', NULL, '1', '1', 'dsafsdf', 1),
(44, 'dsfafffffff', 'fasdfsdfdff', 'fassdffsdfdfdsa', 'asdfsdfff@gmail.com', NULL, '1', '1', 'fsffdf', 1),
(45, 'dsfafffffffdsfaf', 'fasdfsdfdff', 'fassdsdfdfffsdfdfdsa', 'asdsfadfsdfff@gmail.com', NULL, '1', '1', 'fsffdf', 1),
(46, 'gfd', 'gfd', 'fgdg', 'gfdg@gfg.com', NULL, '1', '1', 'dfg', 1),
(47, 'ghdfh', 'hdfgfh', 'fadsfsafd', 'hdffh@gmail.com', NULL, '1', '1', 'sdafsdffas', 1),
(48, 'C161007', 'Abir', '0178523699999', 'abir@gmail.com', NULL, '1', '1', 'halishahor', 1),
(49, 'C161008', 'Abir', '0178699999', 'abir1@gmail.com', NULL, '1', '1', 'halishahor', 1),
(50, 'dsfdsf', 'dsfd', 'afds', 'dfdf@gmail.com', NULL, '1', '1', 'sadfdsf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_teacher`
--

CREATE TABLE `libsys_teacher` (
  `id` int(11) NOT NULL,
  `t_id` varchar(100) NOT NULL,
  `t_name` varchar(500) NOT NULL,
  `t_contact` varchar(500) NOT NULL,
  `t_email` varchar(500) NOT NULL,
  `t_des` varchar(100) NOT NULL,
  `t_image` blob NOT NULL,
  `t_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_teacher`
--

INSERT INTO `libsys_teacher` (`id`, `t_id`, `t_name`, `t_contact`, `t_email`, `t_des`, `t_image`, `t_status`) VALUES
(1, '', '', '', '', '', '', 0),
(2, 'T12345', 'Shahid', '01923144496', 'rrr@gmail.com', 'Lecturer', '', 1),
(3, 'T102030', 'রাকিব', '01923144496', 'rkb@gmail.com', 'Assistant Professor', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_teacher_issue`
--

CREATE TABLE `libsys_teacher_issue` (
  `i_id` int(11) NOT NULL,
  `i_book_id` int(11) NOT NULL,
  `i_teacher_id` int(11) NOT NULL,
  `i_check` int(11) NOT NULL COMMENT 'book_id+teacher_id',
  `i_date` date NOT NULL,
  `i_r_date` date NOT NULL,
  `i_fine` decimal(10,0) NOT NULL,
  `i_paid` decimal(10,0) NOT NULL,
  `i_fine_type` int(11) NOT NULL,
  `i_status` int(11) NOT NULL COMMENT 'r=0, i=1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_teacher_issue`
--

INSERT INTO `libsys_teacher_issue` (`i_id`, `i_book_id`, `i_teacher_id`, `i_check`, `i_date`, `i_r_date`, `i_fine`, `i_paid`, `i_fine_type`, `i_status`) VALUES
(6, 1, 2, 12, '2018-10-14', '2018-11-06', '0', '6', 1, 1),
(10, 3, 2, 32, '2018-12-02', '2018-12-02', '0', '1', 1, 1),
(12, 11, 2, 112, '2018-11-03', '2018-11-06', '0', '29', 0, 1),
(16, 2, 2, 22, '2018-12-02', '2018-12-02', '0', '0', 0, 1),
(21, 13, 2, 132, '2018-12-02', '2018-12-05', '0', '32', 0, 0),
(24, 14, 2, 142, '2018-11-03', '2018-12-02', '0', '26', 0, 0),
(30, 2, 1, 21, '2018-12-02', '2018-12-02', '0', '0', 0, 0),
(32, 6, 2, 62, '2018-12-02', '2018-12-05', '0', '0', 0, 0),
(33, 8, 2, 82, '2018-12-03', '2018-12-06', '0', '0', 0, 1),
(37, 1, 3, 13, '2018-12-03', '2018-12-03', '0', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_year`
--

CREATE TABLE `libsys_year` (
  `y_id` int(11) NOT NULL,
  `y_year` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libsys_year`
--

INSERT INTO `libsys_year` (`y_id`, `y_year`) VALUES
(1, '2015'),
(2, '2016'),
(3, '2018'),
(4, '2018');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `libsys_admin`
--
ALTER TABLE `libsys_admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `a_contact` (`a_contact`);

--
-- Indexes for table `libsys_author`
--
ALTER TABLE `libsys_author`
  ADD PRIMARY KEY (`au_id`);

--
-- Indexes for table `libsys_bk_author`
--
ALTER TABLE `libsys_bk_author`
  ADD PRIMARY KEY (`bk_au_id`),
  ADD UNIQUE KEY `ck_key` (`ck_key`);

--
-- Indexes for table `libsys_books`
--
ALTER TABLE `libsys_books`
  ADD PRIMARY KEY (`b_id`),
  ADD UNIQUE KEY `b_code` (`b_code`);

--
-- Indexes for table `libsys_daily_issue`
--
ALTER TABLE `libsys_daily_issue`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `libsys_departments`
--
ALTER TABLE `libsys_departments`
  ADD PRIMARY KEY (`d_id`),
  ADD UNIQUE KEY `d_code` (`d_code`);

--
-- Indexes for table `libsys_issue`
--
ALTER TABLE `libsys_issue`
  ADD PRIMARY KEY (`i_id`),
  ADD UNIQUE KEY `i_check` (`i_check`);

--
-- Indexes for table `libsys_medium`
--
ALTER TABLE `libsys_medium`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `libsys_payment_type`
--
ALTER TABLE `libsys_payment_type`
  ADD PRIMARY KEY (`cpt_id`),
  ADD UNIQUE KEY `cpt_name` (`cpt_name`);

--
-- Indexes for table `libsys_publisher`
--
ALTER TABLE `libsys_publisher`
  ADD PRIMARY KEY (`pub_id`),
  ADD UNIQUE KEY `pub_name` (`pub_name`);

--
-- Indexes for table `libsys_semester`
--
ALTER TABLE `libsys_semester`
  ADD PRIMARY KEY (`sem_id`),
  ADD UNIQUE KEY `sem_name` (`sem_name`);

--
-- Indexes for table `libsys_session`
--
ALTER TABLE `libsys_session`
  ADD PRIMARY KEY (`sess_id`),
  ADD UNIQUE KEY `sess_name` (`sess_name`);

--
-- Indexes for table `libsys_students`
--
ALTER TABLE `libsys_students`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `s_contact` (`s_contact`);

--
-- Indexes for table `libsys_teacher`
--
ALTER TABLE `libsys_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `t_id` (`t_id`);

--
-- Indexes for table `libsys_teacher_issue`
--
ALTER TABLE `libsys_teacher_issue`
  ADD PRIMARY KEY (`i_id`),
  ADD UNIQUE KEY `i_check` (`i_check`);

--
-- Indexes for table `libsys_year`
--
ALTER TABLE `libsys_year`
  ADD PRIMARY KEY (`y_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `libsys_admin`
--
ALTER TABLE `libsys_admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `libsys_author`
--
ALTER TABLE `libsys_author`
  MODIFY `au_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `libsys_bk_author`
--
ALTER TABLE `libsys_bk_author`
  MODIFY `bk_au_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `libsys_books`
--
ALTER TABLE `libsys_books`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `libsys_daily_issue`
--
ALTER TABLE `libsys_daily_issue`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `libsys_departments`
--
ALTER TABLE `libsys_departments`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `libsys_issue`
--
ALTER TABLE `libsys_issue`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `libsys_medium`
--
ALTER TABLE `libsys_medium`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `libsys_payment_type`
--
ALTER TABLE `libsys_payment_type`
  MODIFY `cpt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `libsys_publisher`
--
ALTER TABLE `libsys_publisher`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `libsys_semester`
--
ALTER TABLE `libsys_semester`
  MODIFY `sem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `libsys_session`
--
ALTER TABLE `libsys_session`
  MODIFY `sess_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `libsys_students`
--
ALTER TABLE `libsys_students`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `libsys_teacher`
--
ALTER TABLE `libsys_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `libsys_teacher_issue`
--
ALTER TABLE `libsys_teacher_issue`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `libsys_year`
--
ALTER TABLE `libsys_year`
  MODIFY `y_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
