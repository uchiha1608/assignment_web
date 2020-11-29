-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2020 at 10:36 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `family_tree`
--

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

CREATE TABLE `description` (
  `tree_id` int(15) NOT NULL,
  `node_id` int(15) NOT NULL,
  `level` int(5) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `birth_place` varchar(20) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `status` binary(10) NOT NULL,
  `death_date` date DEFAULT NULL,
  `death_place` varchar(20) NOT NULL,
  `age` int(5) DEFAULT NULL,
  `spouse_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`tree_id`, `node_id`, `level`, `first_name`, `last_name`, `date_of_birth`, `birth_place`, `sex`, `status`, `death_date`, `death_place`, `age`, `spouse_name`) VALUES
(123, 0, -1, 'Be', 'Nguyen', '2020-11-05', 'HCM', '', 0x00000000000000000000, '2020-11-25', '', 50, NULL),
(123, 1, 0, 'An', 'Nguyen', '2020-11-05', 'Long An', 'male', 0x00000000000000000000, '2020-11-04', '', 40, 'Minh'),
(123, 2, 1, 'Kha', 'Le', '2020-11-11', 'HCM', 'male', 0x00000000000000000000, '2020-11-10', '', 20, NULL),
(123, 3, 1, 'Anh', 'Tran', '2020-11-12', 'Binh Phuoc', '', 0x00000000000000000000, '2020-11-19', '', 25, NULL),
(123, 4, 2, 'Ni', 'Tran', '2020-11-04', 'HCM', '', 0x00000000000000000000, '2020-11-04', '', 20, NULL),
(123, 5, 2, 'Dang', 'Ly', '2020-11-04', '', '', 0x00000000000000000000, '2020-11-06', '', 15, NULL),
(123, 6, 2, 'Ly', 'Nguyen', '2020-11-19', '', '', 0x00000000000000000000, '2020-11-05', '', 14, NULL),
(123, 7, 2, 'Phuc', 'Nguyen', '2020-11-19', '', 'male', 0x00000000000000000000, '2020-11-14', '', 25, NULL),
(468, 1, 0, 'Gia Long', 'Hoang De', '1762-02-08', '', 'male', 0x00000000000000000000, '1820-02-03', 'Hue', 58, 'Tong Phuc Thi Lan'),
(468, 2, 1, 'Minh Mang', 'Hoang De', '1791-05-25', '', 'male', 0x00000000000000000000, '1841-01-20', '', 50, 'Ta Thien Nhan Hoang Hau'),
(468, 3, 2, 'Thieu Tri', 'Hoang De', '1807-06-16', '', 'male', 0x00000000000000000000, '1847-11-04', '', 40, 'Pham Dang thi'),
(468, 4, 3, 'Tu Duc', 'Hoang De', '1829-09-22', '', 'male', 0x00000000000000000000, '1883-07-19', '', 54, 'Le Thien Anh HH'),
(468, 5, 3, 'Thoai', 'Thai Vuong', '1833-10-25', '', '', 0x00000000000000000000, '1877-09-09', '', 44, NULL),
(468, 8, 4, 'Duc Duc', 'Hoang De', '1852-02-23', '', '', 0x00000000000000000000, '1883-10-06', '', 31, 'Tu Minh Hue HH'),
(468, 6, 3, 'Kien', 'Thai Vuong', '1845-12-13', '', '', 0x00000000000000000000, '1876-05-15', '', 32, NULL),
(468, 9, 4, 'Dong Khanh', 'Hoang De', '1864-02-02', '', '', 0x00000000000000000000, '1889-01-21', '', 25, 'Phu Thien Thuan HH'),
(468, 7, 3, 'Hiep Hoa', 'Hoang De', '1847-11-01', '', '', 0x00000000000000000000, NULL, '', NULL, NULL),
(468, 10, 4, 'Ham Nghi', 'Hoang De', '1872-02-06', '', '', 0x00000000000000000000, '1943-08-08', '', 71, NULL),
(468, 11, 4, 'Kien Phuc', 'Hoang De', '1869-02-08', '', '', 0x00000000000000000000, '1884-05-08', '', 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

CREATE TABLE `relationship` (
  `tree_id` int(15) NOT NULL,
  `par_node_id` int(15) NOT NULL,
  `child_node_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`tree_id`, `par_node_id`, `child_node_id`) VALUES
(123, 1, 2),
(123, 1, 3),
(123, 2, 4),
(123, 2, 5),
(123, 3, 6),
(123, 3, 7),
(123, 0, 1),
(468, 1, 2),
(468, 2, 3),
(468, 3, 4),
(468, 3, 5),
(468, 3, 6),
(468, 3, 7),
(468, 5, 8),
(468, 6, 9),
(468, 6, 10),
(468, 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tree`
--

CREATE TABLE `tree` (
  `tree_id` int(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `root_id` int(15) NOT NULL,
  `root_level` int(5) NOT NULL,
  `tree_pass` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tree`
--

INSERT INTO `tree` (`tree_id`, `username`, `root_id`, `root_level`, `tree_pass`) VALUES
(123, 'chikhang', 1, 0, ''),
(468, 'chikhang', 1, 0, 'giapha');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

NGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--



--
-- Indexes for dumped tables
--

--
-- Indexes for table `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`tree_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
