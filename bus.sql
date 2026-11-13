-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2026 at 07:08 AM
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
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_id` int(11) NOT NULL,
  `registration_no` varchar(20) NOT NULL,
  `bus_type_id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL
) ;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_id`, `registration_no`, `bus_type_id`, `capacity`) VALUES
(1, 'KL-11-A-1001', 1, 52),
(2, 'KL-11-A-1002', 2, 48),
(3, 'KL-11-B-2001', 3, 45),
(4, 'KL-11-B-2002', 4, 40);

-- --------------------------------------------------------

--
-- Table structure for table `bus_types`
--

CREATE TABLE `bus_types` (
  `bus_type_id` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_types`
--

INSERT INTO `bus_types` (`bus_type_id`, `type_name`) VALUES
(4, 'AC'),
(2, 'Fast Passenger'),
(1, 'Ordinary'),
(3, 'Super Fast');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` tinyint(4) NOT NULL,
  `day_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day_name`) VALUES
(5, 'Friday'),
(1, 'Monday'),
(6, 'Saturday'),
(7, 'Sunday'),
(4, 'Thursday'),
(2, 'Tuesday'),
(3, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `license_no` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `full_name`, `phone`, `license_no`) VALUES
(1, 'Ramesh Kumar', '9400000001', 'KL1120190001'),
(2, 'Abdul Rahman', '9400000002', 'KL1120180002'),
(3, 'Suresh Nair', '9400000003', 'KL1120170003'),
(4, 'Anil Das', '9400000004', 'KL1120160004');

-- --------------------------------------------------------

--
-- Table structure for table `fares`
--

CREATE TABLE `fares` (
  `direction_id` int(11) NOT NULL,
  `from_stop_id` int(11) NOT NULL,
  `to_stop_id` int(11) NOT NULL,
  `bus_type_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL
) ;

--
-- Dumping data for table `fares`
--

INSERT INTO `fares` (`direction_id`, `from_stop_id`, `to_stop_id`, `bus_type_id`, `amount`) VALUES
(1, 1, 2, 1, 8.00),
(1, 1, 2, 2, 10.00),
(1, 1, 3, 1, 10.00),
(1, 1, 3, 2, 12.00),
(1, 1, 5, 1, 30.00),
(1, 1, 5, 2, 36.00),
(1, 2, 3, 1, 8.00),
(1, 2, 3, 2, 10.00),
(1, 2, 5, 1, 28.00),
(1, 2, 5, 2, 34.00),
(1, 3, 5, 1, 25.00),
(1, 3, 5, 2, 30.00),
(2, 2, 1, 1, 8.00),
(2, 2, 1, 2, 10.00),
(2, 3, 1, 1, 10.00),
(2, 3, 1, 2, 12.00),
(2, 3, 2, 1, 8.00),
(2, 3, 2, 2, 10.00),
(2, 5, 1, 1, 30.00),
(2, 5, 1, 2, 36.00),
(2, 5, 2, 1, 28.00),
(2, 5, 2, 2, 34.00),
(2, 5, 3, 1, 25.00),
(2, 5, 3, 2, 30.00),
(3, 1, 6, 3, 45.00),
(3, 1, 7, 3, 70.00),
(3, 6, 7, 3, 28.00),
(4, 6, 1, 3, 45.00),
(4, 7, 1, 3, 70.00),
(4, 7, 6, 3, 28.00),
(5, 1, 4, 4, 35.00),
(5, 1, 8, 4, 75.00),
(5, 1, 9, 4, 15.00),
(5, 4, 8, 4, 45.00),
(5, 9, 4, 4, 25.00),
(5, 9, 8, 4, 65.00),
(6, 4, 1, 4, 35.00),
(6, 4, 9, 4, 25.00),
(6, 8, 1, 4, 75.00),
(6, 8, 4, 4, 45.00),
(6, 8, 9, 4, 65.00),
(6, 9, 1, 4, 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `route_number` varchar(20) NOT NULL,
  `route_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `route_number`, `route_name`) VALUES
(1, '101', 'Kozhikode - Mukkam'),
(2, '102', 'Kozhikode - Vadakara'),
(3, '103', 'Kozhikode - Thamarassery');

-- --------------------------------------------------------

--
-- Table structure for table `route_directions`
--

CREATE TABLE `route_directions` (
  `direction_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `direction_no` tinyint(4) NOT NULL,
  `direction_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_directions`
--

INSERT INTO `route_directions` (`direction_id`, `route_id`, `direction_no`, `direction_name`) VALUES
(1, 1, 0, 'Kozhikode to Mukkam'),
(2, 1, 1, 'Mukkam to Kozhikode'),
(3, 2, 0, 'Kozhikode to Vadakara'),
(4, 2, 1, 'Vadakara to Kozhikode'),
(5, 3, 0, 'Kozhikode to Thamarassery'),
(6, 3, 1, 'Thamarassery to Kozhikode');

-- --------------------------------------------------------

--
-- Table structure for table `route_stops`
--

CREATE TABLE `route_stops` (
  `direction_id` int(11) NOT NULL,
  `stop_sequence` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `minutes_from_start` int(11) NOT NULL DEFAULT 0,
  `distance_from_start_km` decimal(6,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_stops`
--

INSERT INTO `route_stops` (`direction_id`, `stop_sequence`, `stop_id`, `minutes_from_start`, `distance_from_start_km`) VALUES
(1, 1, 1, 0, 0.00),
(1, 2, 2, 10, 3.00),
(1, 3, 3, 20, 6.00),
(1, 4, 5, 45, 25.00),
(2, 1, 5, 0, 0.00),
(2, 2, 3, 25, 19.00),
(2, 3, 2, 35, 22.00),
(2, 4, 1, 45, 25.00),
(3, 1, 1, 0, 0.00),
(3, 2, 6, 45, 30.00),
(3, 3, 7, 80, 48.00),
(4, 1, 7, 0, 0.00),
(4, 2, 6, 35, 18.00),
(4, 3, 1, 80, 48.00),
(5, 1, 1, 0, 0.00),
(5, 2, 9, 15, 5.00),
(5, 3, 4, 30, 15.00),
(5, 4, 8, 60, 35.00),
(6, 1, 8, 0, 0.00),
(6, 2, 4, 30, 20.00),
(6, 3, 9, 45, 30.00),
(6, 4, 1, 60, 35.00);

-- --------------------------------------------------------

--
-- Table structure for table `service_calendars`
--

CREATE TABLE `service_calendars` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_calendars`
--

INSERT INTO `service_calendars` (`service_id`, `service_name`) VALUES
(1, 'Daily'),
(2, 'Weekdays');

-- --------------------------------------------------------

--
-- Table structure for table `service_days`
--

CREATE TABLE `service_days` (
  `service_id` int(11) NOT NULL,
  `day_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_days`
--

INSERT INTO `service_days` (`service_id`, `day_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `stop_id` int(11) NOT NULL,
  `stop_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`stop_id`, `stop_name`) VALUES
(6, 'Koyilandy'),
(1, 'Kozhikode KSRTC Stand'),
(4, 'Kunnamangalam'),
(2, 'Mavoor Road'),
(9, 'Medical College'),
(5, 'Mukkam'),
(3, 'Palazhi'),
(8, 'Thamarassery'),
(7, 'Vadakara');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_trips`
--

CREATE TABLE `timetable_trips` (
  `timetable_trip_id` int(11) NOT NULL,
  `direction_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `departure_time` time NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable_trips`
--

INSERT INTO `timetable_trips` (`timetable_trip_id`, `direction_id`, `service_id`, `bus_id`, `driver_id`, `departure_time`, `is_active`) VALUES
(1, 1, 1, 1, 1, '06:30:00', 1),
(2, 1, 1, 1, 1, '09:00:00', 1),
(3, 1, 2, 2, 2, '14:30:00', 1),
(4, 2, 1, 1, 1, '08:00:00', 1),
(5, 3, 1, 3, 3, '07:00:00', 1),
(6, 3, 1, 3, 3, '13:00:00', 1),
(7, 5, 2, 4, 4, '08:15:00', 1),
(8, 5, 2, 4, 4, '17:30:00', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_complete_details`
-- (See below for the actual view)
--
CREATE TABLE `v_complete_details` (
`route_number` varchar(20)
,`route_name` varchar(100)
,`direction_name` varchar(100)
,`origin_stop` varchar(100)
,`destination_stop` varchar(100)
,`stops_count` bigint(21)
,`stop_list` mediumtext
,`total_distance_km` decimal(6,2)
,`total_minutes` int(11)
,`service_name` varchar(50)
,`running_days` mediumtext
,`departure_time` time
,`arrival_time` time
,`registration_no` varchar(20)
,`bus_type` varchar(30)
,`capacity` int(11)
,`driver_name` varchar(100)
,`driver_phone` varchar(15)
,`driver_license` varchar(30)
,`full_journey_fare` decimal(8,2)
,`is_active` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_full_timetable`
-- (See below for the actual view)
--
CREATE TABLE `v_full_timetable` (
`route_number` varchar(20)
,`direction_name` varchar(100)
,`service_name` varchar(50)
,`departure_time` time
,`bus_type` varchar(30)
,`registration_no` varchar(20)
,`driver_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `v_complete_details`
--
DROP TABLE IF EXISTS `v_complete_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_complete_details`  AS SELECT `r`.`route_number` AS `route_number`, `r`.`route_name` AS `route_name`, `rd`.`direction_name` AS `direction_name`, `s_first`.`stop_name` AS `origin_stop`, `s_last`.`stop_name` AS `destination_stop`, `span`.`stops_count` AS `stops_count`, `stop_names`.`stop_list` AS `stop_list`, `rs_last`.`distance_from_start_km` AS `total_distance_km`, `rs_last`.`minutes_from_start` AS `total_minutes`, `sc`.`service_name` AS `service_name`, `sdays`.`running_days` AS `running_days`, `t`.`departure_time` AS `departure_time`, addtime(`t`.`departure_time`,sec_to_time(`rs_last`.`minutes_from_start` * 60)) AS `arrival_time`, `bu`.`registration_no` AS `registration_no`, `bt`.`type_name` AS `bus_type`, `bu`.`capacity` AS `capacity`, `dr`.`full_name` AS `driver_name`, `dr`.`phone` AS `driver_phone`, `dr`.`license_no` AS `driver_license`, `f`.`amount` AS `full_journey_fare`, `t`.`is_active` AS `is_active` FROM ((((((((((((((`timetable_trips` `t` join `route_directions` `rd` on(`rd`.`direction_id` = `t`.`direction_id`)) join `routes` `r` on(`r`.`route_id` = `rd`.`route_id`)) join `service_calendars` `sc` on(`sc`.`service_id` = `t`.`service_id`)) join `buses` `bu` on(`bu`.`bus_id` = `t`.`bus_id`)) join `bus_types` `bt` on(`bt`.`bus_type_id` = `bu`.`bus_type_id`)) join `drivers` `dr` on(`dr`.`driver_id` = `t`.`driver_id`)) join (select `route_stops`.`direction_id` AS `direction_id`,min(`route_stops`.`stop_sequence`) AS `first_seq`,max(`route_stops`.`stop_sequence`) AS `last_seq`,count(0) AS `stops_count` from `route_stops` group by `route_stops`.`direction_id`) `span` on(`span`.`direction_id` = `rd`.`direction_id`)) join `route_stops` `rs_first` on(`rs_first`.`direction_id` = `span`.`direction_id` and `rs_first`.`stop_sequence` = `span`.`first_seq`)) join `route_stops` `rs_last` on(`rs_last`.`direction_id` = `span`.`direction_id` and `rs_last`.`stop_sequence` = `span`.`last_seq`)) join `stops` `s_first` on(`s_first`.`stop_id` = `rs_first`.`stop_id`)) join `stops` `s_last` on(`s_last`.`stop_id` = `rs_last`.`stop_id`)) join (select `rs`.`direction_id` AS `direction_id`,group_concat(`s`.`stop_name` order by `rs`.`stop_sequence` ASC separator ' > ') AS `stop_list` from (`route_stops` `rs` join `stops` `s` on(`s`.`stop_id` = `rs`.`stop_id`)) group by `rs`.`direction_id`) `stop_names` on(`stop_names`.`direction_id` = `rd`.`direction_id`)) left join (select `sd`.`service_id` AS `service_id`,group_concat(`d`.`day_name` order by `d`.`day_id` ASC separator ', ') AS `running_days` from (`service_days` `sd` join `days` `d` on(`d`.`day_id` = `sd`.`day_id`)) group by `sd`.`service_id`) `sdays` on(`sdays`.`service_id` = `t`.`service_id`)) left join `fares` `f` on(`f`.`direction_id` = `rd`.`direction_id` and `f`.`from_stop_id` = `rs_first`.`stop_id` and `f`.`to_stop_id` = `rs_last`.`stop_id` and `f`.`bus_type_id` = `bu`.`bus_type_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_full_timetable`
--
DROP TABLE IF EXISTS `v_full_timetable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_full_timetable`  AS SELECT `r`.`route_number` AS `route_number`, `rd`.`direction_name` AS `direction_name`, `sc`.`service_name` AS `service_name`, `t`.`departure_time` AS `departure_time`, `bt`.`type_name` AS `bus_type`, `bu`.`registration_no` AS `registration_no`, `dr`.`full_name` AS `driver_name` FROM ((((((`timetable_trips` `t` join `route_directions` `rd` on(`rd`.`direction_id` = `t`.`direction_id`)) join `routes` `r` on(`r`.`route_id` = `rd`.`route_id`)) join `service_calendars` `sc` on(`sc`.`service_id` = `t`.`service_id`)) join `buses` `bu` on(`bu`.`bus_id` = `t`.`bus_id`)) join `bus_types` `bt` on(`bt`.`bus_type_id` = `bu`.`bus_type_id`)) join `drivers` `dr` on(`dr`.`driver_id` = `t`.`driver_id`)) WHERE `t`.`is_active` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`),
  ADD UNIQUE KEY `registration_no` (`registration_no`),
  ADD KEY `bus_type_id` (`bus_type_id`);

--
-- Indexes for table `bus_types`
--
ALTER TABLE `bus_types`
  ADD PRIMARY KEY (`bus_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`),
  ADD UNIQUE KEY `day_name` (`day_name`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `license_no` (`license_no`);

--
-- Indexes for table `fares`
--
ALTER TABLE `fares`
  ADD PRIMARY KEY (`direction_id`,`from_stop_id`,`to_stop_id`,`bus_type_id`),
  ADD KEY `idx_fare_to` (`direction_id`,`to_stop_id`),
  ADD KEY `idx_fare_type` (`bus_type_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD UNIQUE KEY `route_number` (`route_number`);

--
-- Indexes for table `route_directions`
--
ALTER TABLE `route_directions`
  ADD PRIMARY KEY (`direction_id`),
  ADD UNIQUE KEY `route_id` (`route_id`,`direction_no`);

--
-- Indexes for table `route_stops`
--
ALTER TABLE `route_stops`
  ADD PRIMARY KEY (`direction_id`,`stop_sequence`),
  ADD UNIQUE KEY `direction_id` (`direction_id`,`stop_id`),
  ADD KEY `idx_stop` (`stop_id`);

--
-- Indexes for table `service_calendars`
--
ALTER TABLE `service_calendars`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- Indexes for table `service_days`
--
ALTER TABLE `service_days`
  ADD PRIMARY KEY (`service_id`,`day_id`),
  ADD KEY `day_id` (`day_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stop_id`),
  ADD UNIQUE KEY `stop_name` (`stop_name`);

--
-- Indexes for table `timetable_trips`
--
ALTER TABLE `timetable_trips`
  ADD PRIMARY KEY (`timetable_trip_id`),
  ADD UNIQUE KEY `direction_id` (`direction_id`,`service_id`,`departure_time`),
  ADD KEY `idx_bus` (`bus_id`),
  ADD KEY `idx_driver` (`driver_id`),
  ADD KEY `service_id` (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bus_types`
--
ALTER TABLE `bus_types`
  MODIFY `bus_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `route_directions`
--
ALTER TABLE `route_directions`
  MODIFY `direction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_calendars`
--
ALTER TABLE `service_calendars`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `stop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `timetable_trips`
--
ALTER TABLE `timetable_trips`
  MODIFY `timetable_trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`bus_type_id`) REFERENCES `bus_types` (`bus_type_id`);

--
-- Constraints for table `fares`
--
ALTER TABLE `fares`
  ADD CONSTRAINT `fares_ibfk_1` FOREIGN KEY (`direction_id`,`from_stop_id`) REFERENCES `route_stops` (`direction_id`, `stop_id`),
  ADD CONSTRAINT `fares_ibfk_2` FOREIGN KEY (`direction_id`,`to_stop_id`) REFERENCES `route_stops` (`direction_id`, `stop_id`),
  ADD CONSTRAINT `fares_ibfk_3` FOREIGN KEY (`bus_type_id`) REFERENCES `bus_types` (`bus_type_id`);

--
-- Constraints for table `route_directions`
--
ALTER TABLE `route_directions`
  ADD CONSTRAINT `route_directions_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`);

--
-- Constraints for table `route_stops`
--
ALTER TABLE `route_stops`
  ADD CONSTRAINT `route_stops_ibfk_1` FOREIGN KEY (`direction_id`) REFERENCES `route_directions` (`direction_id`),
  ADD CONSTRAINT `route_stops_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`stop_id`);

--
-- Constraints for table `service_days`
--
ALTER TABLE `service_days`
  ADD CONSTRAINT `service_days_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service_calendars` (`service_id`),
  ADD CONSTRAINT `service_days_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `days` (`day_id`);

--
-- Constraints for table `timetable_trips`
--
ALTER TABLE `timetable_trips`
  ADD CONSTRAINT `timetable_trips_ibfk_1` FOREIGN KEY (`direction_id`) REFERENCES `route_directions` (`direction_id`),
  ADD CONSTRAINT `timetable_trips_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service_calendars` (`service_id`),
  ADD CONSTRAINT `timetable_trips_ibfk_3` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`),
  ADD CONSTRAINT `timetable_trips_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
