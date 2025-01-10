-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 03:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internify`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept`
--

CREATE TABLE `accept` (
  `stu_name` varchar(25) NOT NULL,
  `tital` text NOT NULL,
  `cname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accept`
--

INSERT INTO `accept` (`stu_name`, `tital`, `cname`) VALUES
('abhinav', 'Angular Developer (8 TO 13 Version)', 'g'),
('harsh', 'Angular Developer (8 TO 13 Version)', 'google'),
('kalpak', 'Angular Developer (8 TO 13 Version)', 'google'),
('roshan', 'Angular Developer (8 TO 13 Version)', 'google');

-- --------------------------------------------------------

--
-- Table structure for table `apply`
--

CREATE TABLE `apply` (
  `stu_name` varchar(25) NOT NULL,
  `tital` text NOT NULL,
  `c_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apply`
--

INSERT INTO `apply` (`stu_name`, `tital`, `c_name`) VALUES
('abhinav', 'Angular Developer (8 TO 13 Version)', 'google'),
('harsh', 'Angular Developer (8 TO 13 Version)', 'google'),
('kalpak', 'Angular Developer (8 TO 13 Version)', 'google'),
('roshan', 'Angular Developer (8 TO 13 Version)', 'google');

-- --------------------------------------------------------

--
-- Table structure for table `details_stu`
--

CREATE TABLE `details_stu` (
  `Username` varchar(25) NOT NULL,
  `image` longblob NOT NULL,
  `Aboutme` text NOT NULL,
  `Resume` longblob NOT NULL,
  `Github` text NOT NULL,
  `Linked_In` text NOT NULL,
  `leetcode` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details_stu`
--

INSERT INTO `details_stu` (`Username`, `image`, `Aboutme`, `Resume`, `Github`, `Linked_In`, `leetcode`) VALUES
('roshan', 0x576861747341707020496d61676520323032342d30342d32392061742031392e32382e30385f35373238613665302e6a7067, 'qwertyuiopasdfgh', 0x526573756d652e706466, 'https://github.com/Arpittgaikwad29/Internify', 'linkedin.com', 'leetcode.com'),
('abhinav', 0x576861747341707020496d61676520323032342d30342d32392061742031392e32382e30385f35373238613665302e6a7067, 'qwertyuiopasdfgh', 0x53706f727473204d616e6167656d656e742053797374656d322e646f6378, 'https://github.com/Arpittgaikwad29/Internify', 'linkedin.com', 'zxcvbnm'),
('harsh', 0x576861747341707020496d61676520323032342d30342d32392061742031392e32382e30385f35373238613665302e6a7067, 'i am web developer', 0x526573756d652e706466, 'https://github.com/Arpittgaikwad29/Internify', 'linkedin.com', 'leetcode.com'),
('kalpak', 0x576861747341707020496d61676520323032342d30342d32392061742031392e32382e30385f35373238613665302e6a7067, 'qqwertyyyyu', 0x526573756d652e706466, 'https://github.com/Arpittgaikwad29/Internify', 'linkedin.com', 'leetcode.com');

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

CREATE TABLE `internship` (
  `CName_int` varchar(15) NOT NULL,
  `tital` tinytext NOT NULL,
  `intro` text NOT NULL,
  `techno` text NOT NULL,
  `detail_info` text NOT NULL,
  `seats` int(3) NOT NULL,
  `About_company` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`CName_int`, `tital`, `intro`, `techno`, `detail_info`, `seats`, `About_company`) VALUES
('google', 'Angular Developer (8 TO 13 Version)', 'We are seeking a proficient Angular Developer to join our team and contribute to the development and maintenance of Angular applications spanning versions 8 to 13. As an Angular Developer, you will play a key role in architecting and implementing front-end solutions, ensuring high performance, scalability, and maintainability of our web applications. The ideal candidate will possess a deep understanding of Angular framework nuances across multiple versions, coupled with a passion for clean, efficient code and excellent problem-solving skills.', 'Angular, Angular 8 ,angular 13, TypeScript, HTML5, HTML', 'Requirements: Bachelor’s degree in Computer Science, Engineering, or a related field. Proven experience as an Angular Developer with expertise in versions 8 through 13. Strong proficiency in TypeScript, HTML5, CSS3, and JavaScript. Deep understanding of Angular architecture, components, modules, services, and dependency injection. Experience with reactive programming and observable patterns using RxJS. Familiarity with state management solutions such as NgRx or Redux. Proficiency in version control systems, particularly Git. Solid understanding of front-end build tools and package managers (e.g., Webpack, npm). Excellent problem-solving skills and attention to detail. Strong communication and collaboration skills, with the ability to work effectively in a team environment. Experience with Agile/Scrum methodologies is a plus. Familiarity with UI/UX design principles and practices is desirable. Knowledge of server-side technologies (e.g., Node.js, Java Spring Boot) and RESTful APIs is beneficial. Ability to adapt quickly to changes in technology and project requirements.', 15, ' Google is a multinational technology company specializing in Internet-related services and products. It was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University. Google\'s mission is to organize the world\'s information and make it universally accessible and useful. With its search engine, cloud computing services, and diverse portfolio of products like Google Maps, Gmail, and YouTube, Google has become an integral part of our daily lives, shaping the way we access and interact with information online'),
('google', 'asdfg', 'asdfg', 'asdfg', 'asdf', 34, 'asdfgh'),
('google', 'Full stack dev to move current next/typescript project', 'I need a skilled front end developer for building a portfolio on react framework.', 'Website ,React ,CSS', 'Today we have a web app that is build with next and typescript react. It consists of 3 pages. Login / dashboard and facilities page. We have a basic design and we need to update our app and move it to a react template. You need to import the needed frontend and backend parts (routes) to the new react template and also make sure that it works as it should', 50, 'Payment method verified Rating is 4.99 out of 5. 4.99 4.99 of 103 reviews Sweden Malmo 7:47 PM 178 jobs posted 71% hire rate, 1 open job $4.1K total spent 130 hires, 2 active Tech & IT Member since Oct 6, 2019'),
('google', 'Passing Props between components in TypeScript/JavaScript', 'I need a skilled front end developer for building a portfolio on react framework.', 'Website ,React ,CSS', 'We are looking for a skilled React developer to help resolve UI, functional, and design issues in our frontend. The ideal candidate should have a strong understanding of React and be able to troubleshoot and fix any issues that arise. This is a great opportunity for someone who enjoys problem-solving and has a keen eye for detail.  Skills required: - React - UI design - Troubleshooting - Problem-solving  Size: Medium Duration: 1 to 3 months Expertise: Intermediate', 25, ' Google is a multinational technology company specializing in Internet-related services and products. It was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University. Google\'s mission is to organize the world\'s information and make it universally accessible and useful. With its search engine, cloud computing services, and diverse portfolio of products like Google Maps, Gmail, and YouTube, Google has become an integral part of our daily lives, shaping the way we access and interact with information online'),
('google', 'qwertyuiop', 'qwertyui', 'sdfg', 'asdfgh', 34, 'asdfghjk'),
('google', 'React Frontend Issue Resolution', 'We are looking for a skilled React developer to help resolve UI, functional, and design issues in our frontend.', 'React, CSS, JavaScript, HTML, TypeScript', 'We are looking for a skilled React developer to help resolve UI, functional, and design issues in our frontend. The ideal candidate should have a strong understanding of React and be able to troubleshoot and fix any issues that arise. This is a great opportunity for someone who enjoys problem-solving and has a keen eye for detail.  Skills required: - React - UI design - Troubleshooting - Problem-solving  Size: Medium Duration: 1 to 3 months Expertise: Intermediate', 30, ' Google is a multinational technology company specializing in Internet-related services and products. It was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University. Google\'s mission is to organize the world\'s information and make it universally accessible and useful. With its search engine, cloud computing services, and diverse portfolio of products like Google Maps, Gmail, and YouTube, Google has become an integral part of our daily lives, shaping the way we access and interact with information online');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `FirstName` varchar(15) NOT NULL,
  `LastName` varchar(15) NOT NULL,
  `UserName` varchar(10) NOT NULL,
  `PhoneNo` int(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`FirstName`, `LastName`, `UserName`, `PhoneNo`, `Email`, `Password`) VALUES
('abhinav', 'Gaikwad', 'abhinav', 1234567890, 'arpitgaikwad210@gmai', 1234),
('harsh', 'rawte', 'harsh', 12345678, 'arpitgaikwad210@gmai', 1234),
('kalpak', 'Gaikwad', 'kalpak', 1234567890, 'arpitgaikwad0000@gma', 1234),
('roshan', 'Gaikwad', 'roshan', 23456789, 'arpit.gaikwad@vit.ed', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `signup_company`
--

CREATE TABLE `signup_company` (
  `CName` varchar(15) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup_company`
--

INSERT INTO `signup_company` (`CName`, `Email`, `Password`) VALUES
('google', 'google.com', 1234),
('zxc', 'arpitgaikwad0000@gma', 1234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accept`
--
ALTER TABLE `accept`
  ADD PRIMARY KEY (`stu_name`);

--
-- Indexes for table `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`stu_name`,`tital`(50));

--
-- Indexes for table `internship`
--
ALTER TABLE `internship`
  ADD PRIMARY KEY (`tital`(255));

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `signup_company`
--
ALTER TABLE `signup_company`
  ADD PRIMARY KEY (`CName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
