-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2024 at 02:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jbblogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'XYZ', 'XYZ@GMAIL.COM', '8586858685', 'hII tHEWRE', '0000-00-00 00:00:00.000000'),
(2, 'Operating System', 'XYZ@GMAIL.COM', '8585868585', 'HOO HII\r\n', '2024-03-17 09:57:01.598797'),
(4, 'Operating System', 'priyanshu123@gmail.com', '8585868585', 'Hii There bro', '2024-03-17 19:19:57.732945'),
(5, 'Operating System', 'priyanshu123@gmail.com', '8585868585', 'Hii There bro', '2024-03-17 19:20:49.247917'),
(6, 'Operating System', 'priyanshu123@gmail.com', '8585868585', 'Hii There bro', '2024-03-17 19:23:20.088997'),
(7, 'Operating System', 'priyanshu123@gmail.com', '8585868585', 'Hii There bro', '2024-03-17 19:25:19.438043'),
(8, 'Operating System', 'jagannathbehera4440@gmail', '6372939199', 'Hii There', '2024-03-17 19:28:14.500523'),
(9, 'Operating System', 'jagannathbehera4440@gmail', '6372939199', 'Hii There', '2024-03-17 19:31:09.463205'),
(10, 'Operating System', 'jagannathbehera44400@gmai', '8585868585', 'HII therer', '2024-03-17 19:32:08.220464'),
(11, 'Operating System', 'jagannathbehera44400@gmai', '8585868585', 'HII therer', '2024-03-17 19:34:46.286026'),
(12, 'Operating System', 'jagannathbehera44400@gmai', '8585868585', 'HII therer', '2024-03-17 19:34:52.387380'),
(13, 'Jagannath Behera', 'jagannath@gmail.com', '8585868585', 'Hii There', '2024-03-17 19:37:00.338180'),
(14, 'Operating System', 'jagannath440@gmail.com', '8585868585', 'Hii There I am here', '2024-03-17 19:39:54.589518'),
(15, 'Operating System', 'jagannathbehera4@gmail.co', '8585868585', 'Hii There\r\n', '2024-03-17 19:41:49.000590');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `Title` text NOT NULL,
  `content` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `author` varchar(25) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `tagline` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `Title`, `content`, `Date`, `author`, `slug`, `img_file`, `tagline`) VALUES
(1, 'Intro To Blockchain', 'A blockchain is a distributed database or ledger shared among a computer network\'s nodes. They are best known for their crucial role in cryptocurrency systems for maintaining a secure and decentralized record of transactions, but they are not limited to cryptocurrency uses. Blockchains can be used to make data in any industry immutable—the term used to describe the inability to be altered.Because there is no way to change a block, the only trust needed is at the point where a user or program enters data. This aspect reduces the need for trusted third parties, which are usually auditors or other humans that add costs and make mistakes.Since Bitcoin\'s introduction in 2009, blockchain uses have exploded via the creation of various cryptocurrencies, decentralized finance (DeFi) applications, non-fungible tokens (NFTs), and smart contracts.', '2024-03-18 00:19:39', 'Jagannath', 'blockchain', 'blockchain.jpg', 'A modern technology'),
(4, 'Dark Web', 'The term “dark web\" sounds ominous, and there\'s a reason for that. The dark web is a part of the internet that\'s made up of hidden sites you can\'t find through conventional web browsers. Instead, you must rely on the Tor browser—a web browser that anonymizes your web traffic within its internal network—and search engines designed specifically to unearth these hidden sites.\r\n\r\nDark web sites use encryption software so their visitors and owners can remain anonymous—it’s why the dark web is home to so much illegal activity. However, this side of the internet isn’t reserved for criminals. Over 2.7 million active users browse the dark web every day, and many do so for legitimate reasons.', '2024-03-18 01:33:32', '', 'dark_web', 'dark_web.jpg', 'Hidden Part of Internet'),
(5, 'Artificial Intelligence', 'Most people are not very familiar with the concept of artificial intelligence (AI). As an illustration, when 1,500 senior business leaders in the United States in 2017 were asked about AI, only 17 percent said they were familiar with it.1 A number of them were not sure what it was or how it would affect their particular companies. They understood there was considerable potential for altering business processes, but were not clear how AI could be deployed within their own organizations.\r\n\r\nDespite its widespread lack of familiarity, AI is a technology that is transforming every walk of life. It is a wide-ranging tool that enables people to rethink how we integrate information, analyze data, and use the resulting insights to improve decisionmaking. Our hope through this comprehensive overview is to explain AI to an audience of policymakers, opinion leaders, and interested observers, and demonstrate how AI already is altering the world and raising important questions for society, the economy, and governance.\r\n\r\nIn this paper, we discuss novel applications in finance, national security, health care, criminal justice, transportation, and smart cities, and address issues such as data access problems, algorithmic bias, AI ethics and transparency, and legal liability for AI decisions. We contrast the regulatory approaches of the U.S. and European Union, and close by making a number of recommendations for getting the most out of AI while still protecting important human values', '2024-03-18 01:37:15', '', 'artificial_intellige', 'artificial_intel.jpg', 'Transforming industries with intelligent machines');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
