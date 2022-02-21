DROP database IF EXISTS `Northwind_DW` ;
CREATE DATABASE `Northwind_DW` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Northwind_DW` ;
drop table if exists `dim_customers`;
CREATE TABLE `dim_customers` (
  `customer_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  #`email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  #`home_phone` varchar(25) DEFAULT NULL,
  #`mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  #`address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  #`web_page` longtext,
  #`notes` longtext,
  #`attachments` longblob,
  PRIMARY KEY (`customer_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
drop table if exists `dim_employees`;
CREATE TABLE `dim_employees` (
  `employee_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  #`mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  #`address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  #`web_page` longtext,
  #`notes` longtext,
  #`attachments` longblob,
  PRIMARY KEY (`employee_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
drop table if exists `dim_products`;
CREATE TABLE `dim_products` (
  #`supplier_ids` longtext,
  `product_key` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(25) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  #`description` longtext,
  `standard_cost` decimal(19,4) DEFAULT '0.0000',
  `list_price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `reorder_level` int DEFAULT NULL,
  `target_level` int DEFAULT NULL,
  `quantity_per_unit` varchar(50) DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_reorder_quantity` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  #`attachments` longblob,
  PRIMARY KEY (`product_key`),
  KEY `product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
drop table if exists `dim_shippers`;
CREATE TABLE `dim_shippers` (
  `shipper_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  #`last_name` varchar(50) DEFAULT NULL,
  #`first_name` varchar(50) DEFAULT NULL,
  #`email_address` varchar(50) DEFAULT NULL,
  #`job_title` varchar(50) DEFAULT NULL,
  #`business_phone` varchar(25) DEFAULT NULL,
  #`home_phone` varchar(25) DEFAULT NULL,
  #`mobile_phone` varchar(25) DEFAULT NULL,
  #`fax_number` varchar(25) DEFAULT NULL,
  #`address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  #`web_page` longtext,
  #`notes` longtext,
  #`attachments` longblob,
  PRIMARY KEY (`shipper_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  #KEY `first_name` (`first_name`),
  #KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
drop table if exists `fact_orders`;
CREATE TABLE `fact_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `shipper_id` int DEFAULT NULL,
  `ship_name` varchar(50) DEFAULT NULL,
  `ship_address` longtext,
  `ship_city` varchar(50) DEFAULT NULL,
  `ship_state_province` varchar(50) DEFAULT NULL,
  `ship_zip_postal_code` varchar(50) DEFAULT NULL,
  `ship_country_region` varchar(50) DEFAULT NULL,
  `shipping_fee` decimal(19,4) DEFAULT '0.0000',
  `taxes` decimal(19,4) DEFAULT '0.0000',
  `payment_type` varchar(50) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `tax_rate` double DEFAULT '0',
  `order_status_name` varchar(50) NOT NULL,
  `order_details_status_name` varchar(50) NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(19,4) DEFAULT '0.0000',
  `discount` double NOT NULL DEFAULT '0',
  KEY `customer_id` (`customer_id`),
  #KEY `customer_id_2` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  #KEY `employee_id_2` (`employee_id`),
  KEY `id` (`id`),
  #KEY `id_2` (`id`),
  KEY `shipper_id` (`shipper_id`),
  #KEY `shipper_id_2` (`shipper_id`),
  #KEY `id_3` (`id`),
  #KEY `tax_status` (`tax_status_id`),
  KEY `ship_zip_postal_code` (`ship_zip_postal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Northwind_DW`.`dim_customers`
(`customer_key`,
`company`,
`last_name`,
`first_name`,
`job_title`,
`business_phone`,
`fax_number`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `customers`.`id`,
    `customers`.`company`,
    `customers`.`last_name`,
    `customers`.`first_name`,
    `customers`.`job_title`,
    `customers`.`business_phone`,
    `customers`.`fax_number`,
    `customers`.`city`,
    `customers`.`state_province`,
    `customers`.`zip_postal_code`,
    `customers`.`country_region`
FROM `northwind`.`customers`;
;

INSERT INTO `Northwind_DW`.`dim_employees`
(`employee_key`,
`company`,
`last_name`,
`first_name`,
`email_address`,
`job_title`,
`business_phone`,
`home_phone`,
`fax_number`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `employees`.`id`,
    `employees`.`company`,
    `employees`.`last_name`,
    `employees`.`first_name`,
    `employees`.`email_address`,
    `employees`.`job_title`,
    `employees`.`business_phone`,
    `employees`.`home_phone`,
    `employees`.`fax_number`,
    `employees`.`city`,
    `employees`.`state_province`,
    `employees`.`zip_postal_code`,
    `employees`.`country_region`
FROM `northwind`.`employees`;
;

INSERT INTO `Northwind_DW`.`dim_products`
(`product_key`,
`product_code`,
`product_name`,
`standard_cost`,
`list_price`,
`reorder_level`,
`target_level`,
`quantity_per_unit`,
`discontinued`,
`minimum_reorder_quantity`,
`category`)
SELECT 
    `products`.`id`,
    `products`.`product_code`,
    `products`.`product_name`,
    `products`.`standard_cost`,
    `products`.`list_price`,
    `products`.`reorder_level`,
    `products`.`target_level`,
    `products`.`quantity_per_unit`,
    `products`.`discontinued`,
    `products`.`minimum_reorder_quantity`,
    `products`.`category`
FROM `northwind`.`products`;
;

INSERT INTO `Northwind_DW`.`dim_shippers`
(`shipper_key`,
`company`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `shippers`.`id`,
    `shippers`.`company`,
    `shippers`.`city`,
    `shippers`.`state_province`,
    `shippers`.`zip_postal_code`,
    `shippers`.`country_region`
FROM `northwind`.`shippers`;
;

INSERT INTO `Northwind_DW`.`fact_orders`
(`id`,
`employee_id`,
`customer_id`,
`order_date`,
`shipped_date`,
`shipper_id`,
`ship_name`,
`ship_address`,
`ship_city`,
`ship_state_province`,
`ship_zip_postal_code`,
`ship_country_region`,
`shipping_fee`,
`taxes`,
`payment_type`,
`paid_date`,
`tax_rate`,
`order_status_name`,
`order_details_status_name`,
`product_id`,
`quantity`,
`unit_price`,
`discount`)
SELECT `orders`.`id`,
    `orders`.`employee_id`,
    `orders`.`customer_id`,
    `orders`.`order_date`,
    `orders`.`shipped_date`,
    `orders`.`shipper_id`,
    `orders`.`ship_name`,
    `orders`.`ship_address`,
    `orders`.`ship_city`,
    `orders`.`ship_state_province`,
    `orders`.`ship_zip_postal_code`,
    `orders`.`ship_country_region`,
    `orders`.`shipping_fee`,
    `orders`.`taxes`,
    `orders`.`payment_type`,
    `orders`.`paid_date`,
    `orders`.`tax_rate`,
    `orders_status`.`status_name`,
    `order_details_status`.`status_name`,
    `order_details`.`product_id`,
    `order_details`.`quantity`,
    `order_details`.`unit_price`,
    `order_details`.`discount`
FROM northwind.orders
INNER JOIN northwind.orders_status 
ON orders.status_id = orders_status.id
RIGHT OUTER JOIN northwind.order_details 
ON orders.id = order_details.order_id
INNER JOIN northwind.order_details_status
ON order_details.status_id = order_details_status.id;
;

select Northwind_DW.dim_customers.last_name as customer_name, sum(Northwind_DW.fact_orders.quantity) as total_quantity, sum(Northwind_DW.fact_orders.unit_price) as total_unit_price
FROM Northwind_DW.dim_customers
join Northwind_DW.fact_orders on Northwind_DW.dim_customers.customer_key=Northwind_DW.fact_orders.customer_id
group by Northwind_DW.dim_customers.last_name















