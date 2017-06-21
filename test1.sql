-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-06-21 14:31:34
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test1`
--

-- --------------------------------------------------------

--
-- 表的结构 `cloth_detail`
--

CREATE TABLE IF NOT EXISTS `cloth_detail` (
  `id` char(255) NOT NULL,
  `picture` char(255) NOT NULL,
  PRIMARY KEY (`picture`),
  KEY `id` (`id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cloth_detail`
--

INSERT INTO `cloth_detail` (`id`, `picture`) VALUES
('1', '00.jpeg'),
('2', '01.jpeg'),
('3', '02.jpg'),
('4', '05.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `cloth_dynasty`
--

CREATE TABLE IF NOT EXISTS `cloth_dynasty` (
  `id` char(255) NOT NULL,
  `dynasty` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cloth_dynasty`
--

INSERT INTO `cloth_dynasty` (`id`, `dynasty`) VALUES
('1', '唐朝'),
('2', '宋朝'),
('3', '清朝');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `rname` char(255) NOT NULL,
  `rpassword` char(255) NOT NULL,
  `pic` char(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`rname`, `rpassword`, `pic`) VALUES
('xwm', '123456', 'xwm.jpg'),
('www', '123456', NULL),
('ddd', '123456', NULL),
('eee', '123456', NULL),
('ttt', '123456', NULL),
('rrr', '123456', NULL),
('uuu', '123456', NULL),
('ksy', '123456', 'ksy.jpg'),
('ccc', '123456', NULL),
('rrr', '123', NULL),
('fff', '123456', ''),
('fff', '123456', ''),
('fff', '123456', ''),
('fff', '123456', ''),
('iii', '123456', ''),
('a', 'a', ''),
('lll', '123456', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
