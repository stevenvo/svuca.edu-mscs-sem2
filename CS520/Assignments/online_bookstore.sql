CREATE TABLE `admin` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `answer` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `content` LONGTEXT NOT NULL
);

CREATE TABLE `author` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL
);

CREATE TABLE `category` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` LONGTEXT NOT NULL
);

CREATE TABLE `book` (
  `isbn` LONGTEXT PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `price` DECIMAL(12, 2) NOT NULL,
  `year` INTEGER NOT NULL,
  `category` INTEGER NOT NULL,
  `author` INTEGER NOT NULL
);

CREATE INDEX `idx_book__author` ON `book` (`author`);

CREATE INDEX `idx_book__category` ON `book` (`category`);

ALTER TABLE `book` ADD CONSTRAINT `fk_book__author` FOREIGN KEY (`author`) REFERENCES `author` (`id`);

ALTER TABLE `book` ADD CONSTRAINT `fk_book__category` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

CREATE TABLE `page` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `page_number` INTEGER NOT NULL,
  `book` LONGTEXT NOT NULL
);

CREATE INDEX `idx_page__book` ON `page` (`book`);

ALTER TABLE `page` ADD CONSTRAINT `fk_page__book` FOREIGN KEY (`book`) REFERENCES `book` (`isbn`);

CREATE TABLE `query` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `content` VARCHAR(255) NOT NULL
);

CREATE TABLE `answer_query` (
  `answer` INTEGER NOT NULL,
  `query` INTEGER NOT NULL,
  PRIMARY KEY (`answer`, `query`)
);

CREATE INDEX `idx_answer_query` ON `answer_query` (`query`);

ALTER TABLE `answer_query` ADD CONSTRAINT `fk_answer_query__answer` FOREIGN KEY (`answer`) REFERENCES `answer` (`id`);

ALTER TABLE `answer_query` ADD CONSTRAINT `fk_answer_query__query` FOREIGN KEY (`query`) REFERENCES `query` (`id`);

CREATE TABLE `user` (
  `user_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` LONGTEXT NOT NULL,
  `address` LONGTEXT NOT NULL
);

CREATE TABLE `book_user` (
  `book` LONGTEXT NOT NULL,
  `user` INTEGER NOT NULL,
  PRIMARY KEY (`book`, `user`)
);

CREATE INDEX `idx_book_user` ON `book_user` (`user`);

ALTER TABLE `book_user` ADD CONSTRAINT `fk_book_user__book` FOREIGN KEY (`book`) REFERENCES `book` (`isbn`);

ALTER TABLE `book_user` ADD CONSTRAINT `fk_book_user__user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

CREATE TABLE `login` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `time` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `user` INTEGER NOT NULL,
  `admin` INTEGER NOT NULL
);

CREATE INDEX `idx_login__admin` ON `login` (`admin`);

CREATE INDEX `idx_login__user` ON `login` (`user`);

ALTER TABLE `login` ADD CONSTRAINT `fk_login__admin` FOREIGN KEY (`admin`) REFERENCES `admin` (`id`);

ALTER TABLE `login` ADD CONSTRAINT `fk_login__user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

CREATE TABLE `order` (
  `order_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `user` INTEGER NOT NULL
);

CREATE INDEX `idx_order__user` ON `order` (`user`);

ALTER TABLE `order` ADD CONSTRAINT `fk_order__user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

CREATE TABLE `book_order` (
  `book` LONGTEXT NOT NULL,
  `order` INTEGER NOT NULL,
  PRIMARY KEY (`book`, `order`)
);

CREATE INDEX `idx_book_order` ON `book_order` (`order`);

ALTER TABLE `book_order` ADD CONSTRAINT `fk_book_order__book` FOREIGN KEY (`book`) REFERENCES `book` (`isbn`);

ALTER TABLE `book_order` ADD CONSTRAINT `fk_book_order__order` FOREIGN KEY (`order`) REFERENCES `order` (`order_id`);

CREATE TABLE `query_user` (
  `query` INTEGER NOT NULL,
  `user` INTEGER NOT NULL,
  PRIMARY KEY (`query`, `user`)
);

CREATE INDEX `idx_query_user` ON `query_user` (`user`);

ALTER TABLE `query_user` ADD CONSTRAINT `fk_query_user__query` FOREIGN KEY (`query`) REFERENCES `query` (`id`);

ALTER TABLE `query_user` ADD CONSTRAINT `fk_query_user__user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`)