CREATE TABLE [Customers] (
  [CustomerID] INT PRIMARY KEY,
  [FullName] VARCHAR(100),
  [Gender] VARCHAR(10),
  [DateOfBirth] date,
  [Phone] VARCHAR(20),
  [Email] VARCHAR(100),
  [City] VARCHAR(50),
  [Country] VARCHAR(50),
  [JoinDate] DATE
)
GO

CREATE TABLE [Accounts] (
  [AccountID] int PRIMARY KEY,
  [CustomerID] int,
  [AccountType] VARCHAR(30),
  [AccountStatus] VARCHAR(20),
  [OpenDate] date,
  [Balance] DECIMAL(18,2),
  [FOREIGN] KEY(CustomerID)
)
GO

CREATE TABLE [Devices] (
  [DeviceID] INT PRIMARY KEY,
  [DeviceType] VARCHAR(50),
  [OperatingSystem] VARCHAR(50),
  [IPAddress] VARCHAR(50)
)
GO

CREATE TABLE [Locations] (
  [LocationID] INT PRIMARY KEY,
  [Country] VARCHAR(50),
  [City] VARCHAR(50),
  [RegionRiskLevel] VARCHAR(20)
)
GO

CREATE TABLE [Transactions] (
  [TransactionID] INT PRIMARY KEY,
  [AccountID] INT,
  [TransactionDate] DATETIME,
  [TransactionType] VARCHAR(30),
  [Amount] DECIMAL(18,2),
  [TransactionStatus] VARCHAR(20),
  [DeviceID] INT,
  [LocationID] INT
)
GO

ALTER TABLE [Accounts] ADD FOREIGN KEY ([FOREIGN]) REFERENCES [Customers] ([FullName])
GO

ALTER TABLE [Transactions] ADD FOREIGN KEY ([AccountID]) REFERENCES [Accounts] ([AccountID])
GO

ALTER TABLE [Transactions] ADD FOREIGN KEY ([DeviceID]) REFERENCES [Devices] ([DeviceID])
GO

ALTER TABLE [Transactions] ADD FOREIGN KEY ([LocationID]) REFERENCES [Locations] ([LocationID])
GO
