--
-- Database: `airbnb_clone`

CREATE DATABASE `airbnb_clone`;

USE `airbnb_clone`; 

--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` char(36) NOT NULL,
  `property_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `status` enum('Pending','Confirmed','Canceled') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  KEY `property_id` (`property_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` char(36) NOT NULL,
  `sender_id` char(36) DEFAULT NULL,
  `message_body` text NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Table structure for table `message_recipient`
--

DROP TABLE IF EXISTS `message_recipient`;
CREATE TABLE IF NOT EXISTS `message_recipient` (
  `message_id` char(36) NOT NULL,
  `recipient_id` char(36) NOT NULL,
  `received_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`,`recipient_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` char(36) NOT NULL,
  `booking_id` char(36) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` enum('Credit_Card','Paypal','Stripe') NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `property_id` char(36) NOT NULL,
  `host_id` char(36) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(300) NOT NULL,
  `price_per_night` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` char(36) NOT NULL,
  `property_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `property_id` (`property_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` char(36) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password_hash` varchar(1000) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `role` enum('Guest','Host','Admin') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `message_recipient`
--
ALTER TABLE `message_recipient`
  ADD CONSTRAINT `message_recipient_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `message_recipient_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
