CREATE TABLE `bank_system`.`bank`
(
 `code`    int NOT NULL ,
 `name`    varchar(45) NOT NULL ,
 `address` varchar(45) NOT NULL ,

PRIMARY KEY (`code`)
);

CREATE TABLE `bank_system`.`branch`
(
 `swift_code` int NOT NULL ,
 `name`       varchar(45) NOT NULL ,
 `address`    varchar(45) NOT NULL ,
 `code`       int NOT NULL ,

PRIMARY KEY (`swift_code`),
KEY `FK_1` (`code`),
CONSTRAINT `FK_1` FOREIGN KEY `FK_1` (`code`) REFERENCES `bank_system`.`bank` (`code`)
);

CREATE TABLE `bank_system`.`account`
(
 `account_num`  int NOT NULL ,
 `balance`      float NOT NULL ,
 `account_type` varchar(45) NOT NULL ,
 `swift_code`   int NOT NULL ,

PRIMARY KEY (`account_num`),
KEY `FK_1` (`swift_code`),
CONSTRAINT `FK_2` FOREIGN KEY `FK_1` (`swift_code`) REFERENCES `bank_system`.`branch` (`swift_code`)
);

CREATE TABLE `bank_system`.`loan`
(
 `loan_id`    int NOT NULL ,
 `amount`     integer NOT NULL ,
 `loan_type`  varchar(45) NOT NULL ,
 `swift_code` int NOT NULL ,

PRIMARY KEY (`loan_id`),
KEY `FK_1` (`swift_code`),
CONSTRAINT `FK_3` FOREIGN KEY `FK_1` (`swift_code`) REFERENCES `bank_system`.`branch` (`swift_code`)
);

CREATE TABLE `bank_system`.`customer`
(
 `cust_id`     int NOT NULL ,
 `name`        varchar(45) NOT NULL ,
 `phone`       varchar(11) NOT NULL ,
 `address`     varchar(45) NOT NULL ,
 `loan_id`     int NOT NULL ,
 `account_num` int NOT NULL ,

PRIMARY KEY (`cust_id`),
KEY `FK_1` (`loan_id`),
CONSTRAINT `FK_4` FOREIGN KEY `FK_1` (`loan_id`) REFERENCES `bank_system`.`loan` (`loan_id`),
KEY `FK_2` (`account_num`),
CONSTRAINT `FK_5` FOREIGN KEY `FK_2` (`account_num`) REFERENCES `bank_system`.`account` (`account_num`)
);
