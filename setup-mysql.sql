-- prepares a MySQL server for the project

CREATE DATABASE IF NOT EXISTS bank_system;
CREATE USER IF NOT EXISTS 'bank_db_usr'@'localhost' IDENTIFIED BY 'bank_db_pwd';
GRANT ALL PRIVILEGES ON `bank_system`.* TO 'bank_db_usr'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bank_db_usr'@'localhost';
FLUSH PRIVILEGES;