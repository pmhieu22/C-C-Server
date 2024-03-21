-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 27, 2022 lúc 02:39 PM
-- Phiên bản máy phục vụ: 5.7.38-0ubuntu0.18.04.1
-- Phiên bản PHP: 7.2.24-0ubuntu0.18.04.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `noderatio`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_admins`
--

CREATE TABLE `t_admins` (
  `admin_id` int(11) NOT NULL,
  `admin_pseudo` varchar(100) DEFAULT NULL,
  `admin_mail` varchar(100) DEFAULT NULL,
  `admin_password` varchar(100) DEFAULT NULL,
  `admin_lvl` int(11) DEFAULT NULL,
  `admin_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `t_admins`
--

INSERT INTO `t_admins` (`admin_id`, `admin_pseudo`, `admin_mail`, `admin_password`, `admin_lvl`, `admin_active`) VALUES
(25, 'Demo User1', 'demo@demo.com', '8gkHg+VRPaWJMzsFDH3RIYK6Ffg=', 10, 1),
(26, 'Demo User2', 'demo2@demo.com', '123456', 10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_clients`
--

CREATE TABLE `t_clients` (
  `client_id` int(11) NOT NULL,
  `client_hostname` varchar(200) DEFAULT NULL,
  `client_ip` varchar(200) DEFAULT NULL,
  `client_os` varchar(200) DEFAULT NULL,
  `client_os_version` varchar(200) DEFAULT NULL,
  `client_version` varchar(200) DEFAULT NULL,
  `client_privilege_access` int(11) DEFAULT NULL,
  `client_country` varchar(200) DEFAULT NULL,
  `client_socket` varchar(200) DEFAULT NULL,
  `client_active` int(11) DEFAULT NULL,
  `cluster_id` int(11) DEFAULT NULL,
  `cpu_info` varchar(20) DEFAULT NULL,
  `disk_id` varchar(20) DEFAULT NULL,
  `mac_addr` varchar(20) DEFAULT NULL,
  `network` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `t_clients`
--

INSERT INTO `t_clients` (`client_id`, `client_hostname`, `client_ip`, `client_os`, `client_os_version`, `client_version`, `client_privilege_access`, `client_country`, `client_socket`, `client_active`, `cluster_id`, `cpu_info`, `disk_id`, `mac_addr`, `network`) VALUES
(38, 'DESKTOP-QEAJHSI', '::ffff:10.16.208.213', 'Microsoft Windows Professional Windows 10', ' x64 Edition', ' Build 19044', 0, '/', '/nodeClient#CKhAKeo3EdirzJdSAAAA', 1, 1, NULL, NULL, 'F4:D1:08:A0:8A:6F', '113.160.37.207'),
(39, 'DESKTOP-QEAJHSI', '::ffff:172.20.10.2', 'Microsoft Windows Professional Windows 10', ' x64 Edition', ' Build 19044', 0, '/', '/nodeClient#dHeq94VtGsO2MYdiAAAD', NULL, 1, NULL, NULL, 'A0:66:10:B4:04:F6', '171.255.64.164');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_clusters`
--

CREATE TABLE `t_clusters` (
  `id` int(11) NOT NULL,
  `client_serial` varchar(200) DEFAULT NULL,
  `client_key` varchar(200) DEFAULT NULL,
  `cluster_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `t_clusters`
--

INSERT INTO `t_clusters` (`id`, `client_serial`, `client_key`, `cluster_active`) VALUES
(1, '000-000-000-001', '03006512XcG3b8EMg9l1uU54ZUejzuog', 1),
(11, '000-000-000-011', '03006512XcG3b8EMg9l1uU54ZUejzuog', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_configs`
--

CREATE TABLE `t_configs` (
  `config_id` int(11) NOT NULL,
  `config_mode` varchar(10) DEFAULT NULL,
  `config_password` varchar(200) DEFAULT NULL,
  `config_active` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `t_configs`(`config_id`, `config_mode`, `config_password`, `config_active`) VALUES ('1','close','8gkHg+VRPaWJMzsFDH3RIYK6Ffg=','1');
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_downloaded`
--

CREATE TABLE `t_downloaded` (
  `id` int(100) NOT NULL,
  `plugin_id` int(100) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_logs`
--

CREATE TABLE `t_logs` (
  `log_id` int(11) NOT NULL,
  `log_datetime` datetime DEFAULT NULL,
  `log_ip` varchar(100) DEFAULT NULL,
  `log_type` varchar(10) DEFAULT NULL,
  `log_origin` varchar(10) DEFAULT NULL,
  `log_text` text,
  `log_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_plugins`
--

CREATE TABLE `t_plugins` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(500) NOT NULL,
  `desc` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `t_admins`
--
ALTER TABLE `t_admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `t_clients`
--
ALTER TABLE `t_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Chỉ mục cho bảng `t_clusters`
--
ALTER TABLE `t_clusters`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `t_configs`
--
ALTER TABLE `t_configs`
  ADD PRIMARY KEY (`config_id`);

--
-- Chỉ mục cho bảng `t_downloaded`
--
ALTER TABLE `t_downloaded`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `t_logs`
--
ALTER TABLE `t_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Chỉ mục cho bảng `t_plugins`
--
ALTER TABLE `t_plugins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `t_admins`
--
ALTER TABLE `t_admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT cho bảng `t_clients`
--
ALTER TABLE `t_clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT cho bảng `t_clusters`
--
ALTER TABLE `t_clusters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT cho bảng `t_configs`
--
ALTER TABLE `t_configs`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `t_logs`
--
ALTER TABLE `t_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1753;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
