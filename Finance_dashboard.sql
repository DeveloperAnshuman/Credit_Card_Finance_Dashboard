-- 1. Create and select the database
CREATE DATABASE  cc;
USE cc;

-- 2. Build the table structure
CREATE TABLE  cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(50),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(50),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,2),
    Delinquent_Acc INT
);

-- 3. Ensure security settings allow local file uploads
SET GLOBAL local_infile = 1;

-- 4. Load the 2025 CSV data into the table
LOAD DATA LOCAL INFILE 'D:/credit_card_2025.csv' 
INTO TABLE cc_detail 
FIELDS TERMINATED BY ','  
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(
    Client_Num, 
    Card_Category, 
    Annual_Fees, 
    Activation_30_Days, 
    Customer_Acq_Cost, 
    @temp_date, 
    Week_Num, 
    Qtr, 
    current_year, 
    Credit_Limit, 
    Total_Revolving_Bal, 
    Total_Trans_Amt, 
    Total_Trans_Ct, 
    Avg_Utilization_Ratio, 
    Use_Chip, 
    Exp_Type, 
    Interest_Earned, 
    Delinquent_Acc 
) 
SET Week_Start_Date = STR_TO_DATE(@temp_date, '%d-%m-%Y');
--  Build the structure for the cust_detail table
CREATE TABLE IF NOT EXISTS cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(10),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(50),
    state_cd VARCHAR(10),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(10),
    House_Owner VARCHAR(10),
    Personal_loan VARCHAR(10),
    contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

--  Load the customer CSV data
-- (Uses '\r\n' because this is your original Windows file format)
LOAD DATA LOCAL INFILE 'D:/customer.csv' 
INTO TABLE cust_detail 
FIELDS TERMINATED BY ','  
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;


