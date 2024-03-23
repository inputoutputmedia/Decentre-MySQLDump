-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 23, 2024 at 03:57 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdwebui_extention_local`
--

-- --------------------------------------------------------

--
-- Table structure for table `captions_table`
--

CREATE TABLE `captions_table` (
  `caption_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `text` text,
  `model_used` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `captions_table`
--

INSERT INTO `captions_table` (`caption_id`, `image_id`, `text`, `model_used`, `created_at`) VALUES
(1, 1, 'A beautiful space featuring girl with a matellic ball behind', 'clip', '2024-03-22 01:09:52'),
(2, 2, 'A 90s hitman with a gun.', 'GPT-4', '2024-03-22 01:28:46'),
(3, 3, 'Skyscrapper having pool with alligaters.', 'GPT-4', '2024-03-22 01:28:46'),
(4, 4, 'a female robot under development', 'GPT-4', '2024-03-22 01:28:46'),
(5, 5, 'a creature with germs molecules', 'GPT-4', '2024-03-22 01:28:46'),
(6, 6, 'octopus in a super store cinematic.', 'GPT-4', '2024-03-22 01:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `image_table`
--

CREATE TABLE `image_table` (
  `image_id` int(11) NOT NULL,
  `image_path` text,
  `prompt_text` text,
  `generation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_table`
--

INSERT INTO `image_table` (`image_id`, `image_path`, `prompt_text`, `generation_time`, `user_id`) VALUES
(1, 'C:\\Users\\anish\\Downloads\\sdwebui-pics\\6.jpg', 'A anime girl with matellic moon in the background', '2024-03-01 09:36:27', 1),
(2, 'C:\\Users\\anish\\Downloads\\sdwebui-pics\\5.jpg', 'A 90s hitman with a gun', '2024-03-06 09:36:39', 2),
(3, 'C:\\Users\\anish\\Downloads\\sdwebui-pics\\4.jpg', 'Skyscrapper having pool with alligaters', '2024-03-13 09:36:45', 3),
(4, 'C:\\Users\\anish\\Downloads\\sdwebui-pics\\3.jpg', 'a femnale ronot under development', '2024-03-15 09:36:50', 4),
(5, 'C:\\Users\\anish\\Downloads\\sdwebui-pics\\2.jpg', 'a creature with germs molecules', '2024-03-16 09:36:54', 1),
(6, 'C:\\Users\\anish\\Downloads\\sdwebui-pics\\1.jpg', 'octopus in a super store cinematic', '2024-03-15 09:36:59', 2);

-- --------------------------------------------------------

--
-- Table structure for table `object_detection_table`
--

CREATE TABLE `object_detection_table` (
  `object_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `model_used` varchar(255) DEFAULT NULL,
  `object_name` varchar(255) DEFAULT NULL,
  `object_path` text,
  `confidence_score` decimal(5,2) DEFAULT NULL,
  `bounding_box` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_detection_table`
--

INSERT INTO `object_detection_table` (`object_id`, `image_id`, `model_used`, `object_name`, `object_path`, `confidence_score`, `bounding_box`, `created_at`) VALUES
(1, 1, 'YOLOv4', 'girl', 'C:UsersanishDownloadssdwebui-pics6.jpg', '95.00', '{\"x\":100,\"y\":200,\"width\":300,\"height\":400}', '2024-03-23 14:37:39'),
(2, 1, 'YOLOv4', 'metalic ball', 'C:UsersanishDownloadssdwebui-pics6.jpg', '88.50', '{\"x\":150,\"y\":250,\"width\":100,\"height\":150}', '2024-03-22 01:08:21'),
(3, 2, 'YOLOv5', 'gun', 'C:UsersanishDownloadssdwebui-pics5.jpg', '89.70', '{\"x\":250,\"y\":100,\"width\":220,\"height\":180}', '2024-03-22 01:26:07'),
(4, 3, 'YOLOv5', 'alligater', 'C:UsersanishDownloadssdwebui-pics4.jpg', '92.30', '{\"x\":300,\"y\":200,\"width\":100,\"height\":300}', '2024-03-22 01:26:07'),
(5, 4, 'YOLOv5', 'face', 'C:UsersanishDownloadssdwebui-pics3.jpg', '95.00', '{\"x\":150,\"y\":250,\"width\":400,\"height\":200}', '2024-03-22 01:26:07'),
(6, 5, 'YOLOv5', 'mouse', 'C:UsersanishDownloadssdwebui-pics2.jpg', '99.10', '{\"x\":200,\"y\":100,\"width\":50,\"height\":50}', '2024-03-22 01:26:07'),
(7, 6, 'YOLOv5', 'octopus', 'C:UsersanishDownloadssdwebui-pics1.jpg', '93.80', '{\"x\":100,\"y\":200,\"width\":300,\"height\":400}', '2024-03-22 01:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `role`, `email`, `created_at`) VALUES
(1, 'Jessielim', 'Admin', 'jessie@iomedia.io', '2024-03-22 01:02:36'),
(2, 'AnishHassan', 'Editor', 'anish@iomedia.io', '2024-03-22 01:13:03'),
(3, 'AdilHussain', 'Contributor', 'adil@iomedia.io', '2024-03-22 01:13:03'),
(4, 'Muaz', 'Viewer', 'muaz@iomedia.io', '2024-03-22 01:13:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captions_table`
--
ALTER TABLE `captions_table`
  ADD PRIMARY KEY (`caption_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `image_table`
--
ALTER TABLE `image_table`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `object_detection_table`
--
ALTER TABLE `object_detection_table`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captions_table`
--
ALTER TABLE `captions_table`
  MODIFY `caption_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `image_table`
--
ALTER TABLE `image_table`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `object_detection_table`
--
ALTER TABLE `object_detection_table`
  MODIFY `object_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `captions_table`
--
ALTER TABLE `captions_table`
  ADD CONSTRAINT `captions_table_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `image_table` (`image_id`);

--
-- Constraints for table `image_table`
--
ALTER TABLE `image_table`
  ADD CONSTRAINT `image_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `object_detection_table`
--
ALTER TABLE `object_detection_table`
  ADD CONSTRAINT `object_detection_table_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `image_table` (`image_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
