-- -----------------------------------------------------
-- Schema full-stack-ecommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `full-stack-ecommerce`;

CREATE SCHEMA `full-stack-ecommerce`;
USE `full-stack-ecommerce` ;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
   `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------

INSERT INTO product_category(category_name) VALUES ('BOOKS');
INSERT INTO product_category(category_name) VALUES ('COFFEE MUGS');
INSERT INTO product_category(category_name) VALUES ('LUGGAGE TAGS');
INSERT INTO product_category(category_name) VALUES ('MOUSE PADS');

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1000', 'JavaScript - The Fun Parts', 'Learn JavaScript fundamentals through engaging examples', 'assets/images/products/books/book-luv2code-1000.png', 1, 100, 19.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1001', 'Python for Beginners', 'Start your programming journey with Python', 'assets/images/products/books/book-luv2code-1001.png', 1, 100, 24.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1002', 'Java Programming Masterclass', 'Comprehensive guide to Java development', 'assets/images/products/books/book-luv2code-1002.png', 1, 100, 29.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1003', 'C++ Essential Skills', 'Master C++ programming language', 'assets/images/products/books/book-luv2code-1003.png', 1, 100, 22.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1004', 'SQL Database Design', 'Learn database design and SQL queries', 'assets/images/products/books/book-luv2code-1004.png', 1, 100, 21.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1005', 'React.js Development', 'Build modern web applications with React', 'assets/images/products/books/book-luv2code-1005.png', 1, 100, 23.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1006', 'Node.js Backend Development', 'Server-side JavaScript programming', 'assets/images/products/books/book-luv2code-1006.png', 1, 100, 25.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1007', 'Spring Framework Essentials', 'Java Spring framework development guide', 'assets/images/products/books/book-luv2code-1007.png', 1, 100, 27.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1008', 'Angular Web Development', 'Build dynamic web applications with Angular', 'assets/images/products/books/book-luv2code-1008.png', 1, 100, 26.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1009', 'DevOps Practices', 'Modern software development and operations', 'assets/images/products/books/book-luv2code-1009.png', 1, 100, 28.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1010', 'Cloud Computing Basics', 'Introduction to cloud technologies', 'assets/images/products/books/book-luv2code-1010.png', 1, 100, 24.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1011', 'Machine Learning Fundamentals', 'Start your AI journey', 'assets/images/products/books/book-luv2code-1011.png', 1, 100, 29.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1012', 'Data Science with Python', 'Data analysis and visualization', 'assets/images/products/books/book-luv2code-1012.png', 1, 100, 31.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1013', 'Cybersecurity Basics', 'Introduction to information security', 'assets/images/products/books/book-luv2code-1013.png', 1, 100, 25.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1014', 'Docker and Kubernetes', 'Container orchestration guide', 'assets/images/products/books/book-luv2code-1014.png', 1, 100, 27.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1015', 'Full Stack Development', 'End-to-end web development', 'assets/images/products/books/book-luv2code-1015.png', 1, 100, 32.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1016', 'Mobile App Development', 'iOS and Android programming', 'assets/images/products/books/book-luv2code-1016.png', 1, 100, 26.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1017', 'Web Security', 'Secure web application development', 'assets/images/products/books/book-luv2code-1017.png', 1, 100, 23.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1018', 'Git Version Control', 'Master Git and GitHub', 'assets/images/products/books/book-luv2code-1018.png', 1, 100, 20.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1019', 'Blockchain Development', 'Cryptocurrency and smart contracts', 'assets/images/products/books/book-luv2code-1019.png', 1, 100, 28.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1020', 'Linux System Administration', 'Managing Linux servers', 'assets/images/products/books/book-luv2code-1020.png', 1, 100, 25.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1021', 'Software Testing', 'Quality assurance and testing', 'assets/images/products/books/book-luv2code-1021.png', 1, 100, 22.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1022', 'UI/UX Design', 'User interface and experience design', 'assets/images/products/books/book-luv2code-1022.png', 1, 100, 24.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1023', 'GraphQL API Development', 'Modern API development', 'assets/images/products/books/book-luv2code-1023.png', 1, 100, 26.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1024', 'TypeScript Programming', 'Typed JavaScript development', 'assets/images/products/books/book-luv2code-1024.png', 1, 100, 23.99, 1, NOW());
