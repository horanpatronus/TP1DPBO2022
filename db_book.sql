-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 06:57 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_book`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `photo_name` varchar(50) DEFAULT NULL,
  `book_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id_author`, `name`, `nationality`, `photo_name`, `book_count`) VALUES
(1, 'JK Rowling', 'Great Britain', 'jkrowling.jpeg', 19),
(2, 'Rick Riordan', 'America', 'rickriordan.jpg', 26),
(3, 'Suzanne Collins', 'America', 'suzannecollins.jpg', 11);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id_book` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo_name` varchar(50) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `id_author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id_book`, `title`, `photo_name`, `publisher`, `description`, `id_author`) VALUES
(1, 'Harry Potter and The Deathly Hallows', 'harrypotter.jpg', 'Bloomsbury Publishing', 'This is the 7th book of Harry Potter series', 1),
(2, 'The Heroes of Olympus: The Mark of Athena', 'heroesofolympus.jpg', 'Disney Hyperion', 'This is the 3rd book of The Heroes of Olympus series.', NULL),
(3, 'The Hunger Games', 'thehungergames.jpg', 'Scholastic, Inc.', 'This is the 1st book of The Hunger Games series.', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
