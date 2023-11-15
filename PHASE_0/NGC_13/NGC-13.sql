CREATE TABLE `profil` (
  `profil_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `is_admin` boolean NOT NULL DEFAULT false,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `transactions` (
  `transaction_id` integer PRIMARY KEY AUTO_INCREMENT,
  `profil_id` integer NOT NULL,
  `total_price` text NOT NULL
);

CREATE TABLE `products` (
  `product_id` integer PRIMARY KEY AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `tags` (
  `tag_id` integer PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(255) UNIQUE NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `transaction_product` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `transaction_id` integer,
  `product_id` integer,
  `quantity` integer NOT NULL DEFAULT 1
);

CREATE TABLE `product_tag` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `product_id` integer,
  `tag_id` integer
);

ALTER TABLE `transactions` ADD FOREIGN KEY (`transaction_id`) REFERENCES `profil` (`profil_id`);

ALTER TABLE `transaction_product` ADD FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`);

ALTER TABLE `transaction_product` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `product_tag` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `product_tag` ADD FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`);
