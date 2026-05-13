-- Database Creation
CREATE DATABASE FraudDetectionDB;
GO

-- Importing customer data into the database
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    JoinDate DATE
);

INSERT INTO Customers
VALUES
(1,'John Doe','Male','1995-04-12',
'08012345678','john@email.com',
'Lagos','Nigeria','2023-01-10'),

(2,'Sarah Johnson','Female','1992-07-21',
'08087654321','sarah@email.com',
'Abuja','Nigeria','2023-02-15'),

(3,'Michael Smith','Male','1988-11-02',
'08123456789','michael@email.com',
'Port Harcourt','Nigeria','2022-11-05'),

(4,'Aisha Bello','Female','1998-09-18',
'07012345678','aisha@email.com',
'Kano','Nigeria','2023-03-01'),

(5,'David Brown','Male','1990-05-10',
'08199887766','david@email.com',
'Ibadan','Nigeria','2022-12-20'),

(6,'Grace Lee','Female','1996-01-30',
'09023456789','grace@email.com',
'Lagos','Nigeria','2023-04-12'),

(7,'James Wilson','Male','1985-08-25',
'07098765432','james@email.com',
'Enugu','Nigeria','2022-10-01'),

(8,'Fatima Musa','Female','1994-06-14',
'08111222333','fatima@email.com',
'Kaduna','Nigeria','2023-05-02');

-- Importing Account data into the database

 CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(30),
    AccountStatus VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(18,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);
INSERT INTO Accounts
VALUES
(1001,1,'Savings','Active','2023-01-15',250000.00),
(1002,2,'Current','Active','2023-02-20',780000.00),
(1003,3,'Savings','Dormant','2022-11-10',120000.00),
(1004,4,'Savings','Active','2023-03-05',95000.00),
(1005,5,'Current','Blocked','2022-12-25',1500000.00),
(1006,6,'Savings','Active','2023-04-15',430000.00),
(1007,7,'Current','Active','2022-10-10',2100000.00),
(1008,8,'Savings','Active','2023-05-05',670000.00);


-- Importing Devices data into the database
CREATE TABLE Devices (
    DeviceID INT PRIMARY KEY,
    DeviceType VARCHAR(50),
    OperatingSystem VARCHAR(50),
    IPAddress VARCHAR(50)
);

INSERT INTO Devices
VALUES
(201,'Mobile Phone','Android','192.168.1.10'),
(202,'Laptop','Windows','192.168.1.11'),
(203,'Tablet','iOS','192.168.1.12'),
(204,'Desktop','Windows','192.168.1.13'),
(205,'Mobile Phone','iOS','192.168.1.14'),
(206,'Laptop','MacOS','192.168.1.15');

-- Importing Devices data into the database
 CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    Country VARCHAR(50),
    City VARCHAR(50),
    RegionRiskLevel VARCHAR(20)
);

INSERT INTO Locations
VALUES
(301,'Nigeria','Lagos','Medium'),
(302,'Nigeria','Abuja','Low'),
(303,'Nigeria','Port Harcourt','High'),
(304,'Nigeria','Kano','Medium'),
(305,'Nigeria','Ibadan','Low'),
(306,'Nigeria','Kaduna','High'),
(307,'Ghana','Accra','High'),
(308,'Kenya','Nairobi','Medium');

 -- Importing Devices data into the database
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATETIME,
    TransactionType VARCHAR(30),
    Amount DECIMAL(18,2),
    TransactionStatus VARCHAR(20),
    DeviceID INT,
    LocationID INT,

    FOREIGN KEY (AccountID)
    REFERENCES Accounts(AccountID),

    FOREIGN KEY (DeviceID)
    REFERENCES Devices(DeviceID),

    FOREIGN KEY (LocationID)
    REFERENCES Locations(LocationID)
);

INSERT INTO Transactions
VALUES
(5001,1001,'2026-05-01 08:15:00',
'Transfer',50000,'Successful',201,301),

(5002,1002,'2026-05-01 08:18:00',
'Withdrawal',200000,'Failed',202,302),

(5003,1003,'2026-05-01 09:05:00',
'Transfer',75000,'Successful',203,303),

(5004,1001,'2026-05-01 09:07:00',
'Transfer',60000,'Successful',201,301),

(5005,1005,'2026-05-01 09:10:00',
'Withdrawal',1000000,'Failed',204,307),

(5006,1006,'2026-05-01 09:12:00',
'Deposit',120000,'Successful',205,301),

(5007,1007,'2026-05-01 09:14:00',
'Transfer',450000,'Successful',202,308),

(5008,1008,'2026-05-01 09:18:00',
'Transfer',320000,'Failed',206,306),

(5009,1002,'2026-05-01 09:20:00',
'Transfer',150000,'Failed',202,302),

(5010,1005,'2026-05-01 09:22:00',
'Transfer',850000,'Failed',204,307),

(5011,1001,'2026-05-01 09:24:00',
'Withdrawal',30000,'Successful',201,301),

(5012,1007,'2026-05-01 09:25:00',
'Deposit',500000,'Successful',202,308),

(5013,1003,'2026-05-01 09:28:00',
'Transfer',95000,'Failed',203,303),

(5014,1006,'2026-05-01 09:32:00',
'Withdrawal',40000,'Successful',205,301),

(5015,1008,'2026-05-01 09:35:00',
'Transfer',700000,'Failed',206,306);

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Devices;
SELECT * FROM Locations;
SELECT * FROM Transactions;

-- Task 1
-- 1.  Total Transaction Volume ( Measure overall system activity)

SELECT 
     SUM(Amount) AS TotalTranactionvolume
FROM Transactions;

-- Task 2
-- 2. Failed Transaction Percentage (Evaluate system health and possible fraud attempts)
SELECT
     ROUND (
     100 *
     SUM(CASE 
     WHEN TransactionStatus = 'Failed'
     THEN 1
     ELSE 0
     END) 
     / COUNT (*), 2
)
     AS Failed_Tranaction_Status
FROM Transactions;

-- 3. Which Customers Transact the Most?(Identify high-activity users (potential normal or suspicious))
 SELECT 
       c.Fullname,
       SUM(t.amount) AS 'Total_Spent'
 FROM Customers c
 JOIN Accounts a
 ON c.CustomerID = a.CustomerID
 JOIN Transactions t
 ON t.AccountID = a.AccountID
 GROUP BY c.FullName
 ORDER BY Total_Spent DESC;

 -- 4. High-Risk Regions (Detect fraud concentration geographically) 
 SELECT 
        l.country,
        l.city,
        COUNT(*) AS 'Suspicious_Transaction'
FROM Transactions t
JOIN Locations l
ON t.LocationID = l.LocationID
WHERE RegionRiskLevel = 'High'
GROUP BY l.Country, l.city
ORDER BY Suspicious_Transaction DESC;

-- 5. Detect Shared Devices (Flag devices used by multiple accounts)
SELECT 
       t.DeviceID,
       d.DeviceType,
       COUNT(DISTINCT t.AccountID) AS 'NumberofAccount'
FROM Devices d
JOIN Transactions t
ON d.DeviceID = t.DeviceID
GROUP BY t.DeviceID, d.DeviceType
ORDER BY NumberofAccount

-- 6. Rank Most Suspicious Accounts (Combine multiple fraud indicators)
SELECT 
      AccountID,
      COUNT(*) AS 'FailedTransactions',
      RANK() OVER (
            ORDER BY COUNT(*) DESC
        ) AS 'RiskRank'
FROM Transactions
WHERE TransactionStatus = 'failed'
GROUP BY AccountID
ORDER BY RiskRank DESC;