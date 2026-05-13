# Executive-Fraud-Monitoring-Risk-Intelligence-System

 An SQL(T-SQL) based project that walks us through the problem (insight) facing in this data

## Project Overview

In modern digital banking, fraud patterns are increasingly complex, often involving coordinated behaviors such as device sharing, rapid transaction bursts, and geographically distributed attacks. This project develops a centralized fraud intelligence system using T-SQL to analyze transactional data and surface high-risk signals.

The system is designed to support fraud analysts, data teams, and executive decision-makers by transforming raw transaction data into actionable insights. It focuses on identifying anomalies, monitoring transaction health, and ranking risk exposure across customers, devices, and regions.

Through structured querying and analytical modeling, this project delivers a data-driven fraud monitoring framework that can be extended into dashboards or real-time alerting systems.

## Problem Statement

The digital bank is currently facing a surge in fraudulent and suspicious activities, characterized by:

Increasing volume of suspicious and failed transactions
Evidence of device-sharing fraud, where multiple accounts use the same device
Regional spikes indicating possible coordinated fraud rings
Rapid-transfer behaviors suggesting laundering or bot-driven transactions

Despite having transactional data available, the bank lacks a centralized intelligence layer to:

Detect and flag high-risk accounts in real time
Monitor fraud trends across regions and devices
Quantify transaction failures and abnormal behaviors
Provide investigators with prioritized, actionable insights

Without this system, fraud detection remains reactive, fragmented, and inefficient-leading to financial losses, regulatory risk, and reduced customer trust.

## Project Objectives

Project Objectives

This project aims to:

- Build T-SQL-based analytical queries to detect fraud signals
- Create a risk-ranking logic for accounts and regions
- Identify behavioral anomalies such as:
   - High transaction frequency
   - Device reuse across accounts
   - Failed transaction spikes
- Enable data storytelling through structured outputs for BI tools

## Tools
  SQL (Microsoft Structured Query Language (Server) - MSSQL)

## Business Questions
1. Total Transaction Volume
   - Measure overall system activity.
2. Failed Transaction Percentage
   - Evaluate system health and possible fraud attempts.
3. Which Customers Transact the Most?
   - Identify high-activity users (potential normal or suspicious).
4. High-Risk Regions
   - Detect fraud concentration geographically.
5. Detect Shared Devices
   - Flag devices used by multiple accounts.
6. Rank Most Suspicious Accounts
    - Combine multiple fraud indicators.
      
## Model View
This project uses a relational data model with five core tables: Customers, Accounts, Transactions, Devices, and Locations.

The Transactions table is the central fact table, capturing all financial activities, including amount, type, status, device, and location. It connects to:

- Accounts → links transactions to customers
- Customers → provides user demographics
- Devices → enables detection of shared or suspicious device usage
- Locations → supports identification of high-risk regions

This structure allows:

Tracking transaction behavior
Detecting fraud patterns (e.g., shared devices, failed transactions)
Identifying high-risk accounts and regions

## Tasks solved using MSSQL

**1. Total Transaction Volume ( Measure overall system activity)**

  Failed Transaction
   - A total of 46 failed transactions were recorded.
   - This suggests possible fraud attempts, such as incorrect PIN entries, card testing, or system abuse.

**2. Failed Transaction Percentage(Evaluate system health and possible fraud attempts)**

   Top Spending Customers
   - David Brown leads with the highest transaction value, followed by Fatima Musa and James Wilson.
   - High transaction volume can indicate valuable customers, but also requires monitoring for unusual spending spikes.

  **3. Which Customers Transact the Most? (Identify high-activity users (potential normal or suspicious))**
     
   Top Spending Customers
   - David Brown leads with the highest transaction value, followed by Fatima Musa and James Wilson.
   - High transaction volume can indicate valuable customers, but also requires monitoring for unusual spending spikes.

**4. High-Risk Regions(Detect fraud concentration geographically)**

 High-Risk Locations
 - Suspicious transactions were detected in:
   - Accra (Ghana)
   - Kaduna (Nigeria)
   - Port Harcourt (Nigeria)
 - These locations show fraud activity signals and may require closer monitoring or regional controls.

** 5. Detect Shared Devices(Flag devices used by multiple accounts)**

Device Usage (Shared Devices Detection)
- Most devices are linked to one account, but Device 202 (Laptop) is used by 2 accounts.
- Shared devices are a strong fraud indicator, possibly suggesting account compromise or coordinated activity.

**6. Rank Most Suspicious Accounts (Combine multiple fraud indicators)**
   
High-Risk Accounts
- Accounts 1002, 1005, and 1008 have the highest risk ranking due to multiple failed transactions.
- These accounts should be prioritized for investigation, as repeated failures often signal fraud attempts.

## Overall Insight

The analysis reveals early fraud signals through failed transactions, shared devices, and risky locations. While some customers show high activity, combining these patterns helps identify accounts and regions that need immediate attention.
