-- Dummy data for testing

USE bank_system;

-- Insert statements for table 'bank'
INSERT INTO bank (code, name, address) VALUES
(1, 'Bank of America', '123 Main Street'),
(2, 'Chase Bank', '456 Elm Street'),
(3, 'Wells Fargo', '789 Oak Avenue');

-- Insert statements for table 'branch'
INSERT INTO branch (swift_code, name, address, code) VALUES
(101, 'Downtown Branch', '789 Broadway', 1),
(102, 'Uptown Branch', '321 Oak Street', 1),
(103, 'Central Branch', '456 Maple Avenue', 1),
(104, 'Westside Branch', '987 Elm Street', 2),
(105, 'Eastside Branch', '654 Pine Street', 2),
(106, 'Northside Branch', '321 Elm Avenue', 3),
(107, 'Southside Branch', '789 Oak Street', 3);

-- Insert statements for table 'customer'
INSERT INTO customer (cust_id, name, phone, address) VALUES
(1, 'John Doe', '555-1234', '123 Pine Street'),
(2, 'Jane Smith', '555-5678', '456 Maple Street'),
(3, 'Alice Johnson', '555-7890', '789 Oak Avenue'),
(4, 'Bob Williams', '555-4321', '987 Elm Street');

-- Insert statements for table 'account'
INSERT INTO account (account_num, balance, account_type, swift_code, cust_id) VALUES
(1001, 5000.00, 'Savings', 101, 1),
(1002, 7500.00, 'Checking', 102, 1),
(1003, 3000.00, 'Savings', 103, 1),
(1004, 6000.00, 'Checking', 104, 2),
(1005, 2000.00, 'Savings', 105, 2),
(1006, 4000.00, 'Checking', 106, 3),
(1007, 8000.00, 'Savings', 107, 3),
(1008, 3500.00, 'Checking', 101, 4),
(1009, 5500.00, 'Savings', 102, 4),
(1010, 6500.00, 'Checking', 103, 4);

-- Insert statements for table 'loan'
INSERT INTO loan (loan_id, amount, loan_type, swift_code, cust_id) VALUES
(2001, 10000, 'Personal Loan', 101, 1),
(2002, 5000, 'Auto Loan', 102, 1),
(2003, 8000, 'Home Loan', 103, 1),
(2004, 3000, 'Personal Loan', 104, 2),
(2005, 20000, 'Business Loan', 105, 2),
(2006, 7000, 'Student Loan', 106, 2),
(2007, 12000, 'Personal Loan', 107, 3),
(2008, 10000, 'Auto Loan', 101, 3),
(2009, 15000, 'Home Loan', 102, 3),
(2010, 4000, 'Personal Loan', 103, 3),
(2011, 10000, 'Auto Loan', 104, 4),
(2012, 5000, 'Personal Loan', 105, 4),
(2013, 8000, 'Home Loan', 106, 4),
(2014, 3000, 'Personal Loan', 107, 4);


