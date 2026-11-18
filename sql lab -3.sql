DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;
USE bank;

CREATE TABLE Customer (
  Customerid INT,
  Firstname VARCHAR(50),
  Lastname VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  dateofbirth DATE
);

CREATE TABLE Branches (
  BranchID INT,
  BranchName VARCHAR(100),
  BranchAddress VARCHAR(200),
  BranchPhone VARCHAR(20)
);

CREATE TABLE Accounts (
  AccountID INT,
  AccountType VARCHAR(50),
  Balance DECIMAL(15,2),
  Customerid INT,
  BranchID INT
);

CREATE TABLE Transactions (
  TransactionID INT,
  TransactionType VARCHAR(50),
  Amount DECIMAL(15,2),
  TransactionDate DATE,
  AccountID INT
);

CREATE TABLE loans (
  LoanID INT,
  LoanAmount DECIMAL(15,2),
  InterestRate DECIMAL(5,2),
  StartDate DATE,
  EndDate DATE,
  Customerid INT
);

ALTER TABLE Customer ADD CONSTRAINT PRIMARY KEY (Customerid);
ALTER TABLE Branches ADD CONSTRAINT PRIMARY KEY (BranchID);
ALTER TABLE Accounts ADD CONSTRAINT PRIMARY KEY (AccountID);
ALTER TABLE Transactions ADD CONSTRAINT PRIMARY KEY (TransactionID);
ALTER TABLE loans ADD CONSTRAINT PRIMARY KEY (LoanID);

ALTER TABLE Accounts ADD CONSTRAINT FOREIGN KEY (Customerid) REFERENCES Customer(Customerid);
ALTER TABLE Accounts ADD CONSTRAINT FOREIGN KEY (BranchID) REFERENCES Branches(BranchID);
ALTER TABLE Transactions ADD CONSTRAINT FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID);
ALTER TABLE loans ADD CONSTRAINT FOREIGN KEY (Customerid) REFERENCES Customer(Customerid);

INSERT INTO Customer VALUES
(101, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9999999999', '1998-04-15'),
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

INSERT INTO Branches VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

INSERT INTO Accounts VALUES
(201, 'Savings', 50000.00, 101, 1),
(202, 'Current', 120000.00, 102, 2),
(203, 'Savings', 75000.00, 103, 3),
(204, 'Savings', 30000.00, 104, 4),
(205, 'Current', 200000.00, 105, 5);

INSERT INTO loans VALUES
(301, 500000.00, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000.00, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000.00, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000.00, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000.00, 7.95, '2025-05-12', '2035-05-12', 105);

INSERT INTO Transactions VALUES
(401, 'Deposit', 10000.00, '2025-06-01', 201),
(402, 'Withdrawal', 5000.00, '2025-06-02', 202),
(403, 'Deposit', 20000.00, '2025-06-03', 203),
(404, 'Withdrawal', 2000.00, '2025-06-04', 204),
(405, 'Deposit', 50000.00, '2025-06-05', 205);

SELECT * FROM Customer;
SELECT * FROM loans;
select * from Transactions;
select * from Accounts;
select * from Branches;