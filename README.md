---

## Insights & Conclusions
*   **Blue & Silver cards** contribute to nearly 93% of the overall transactions.
*   **TX, NY, and CA** are the top three states contributing to approximately 68% of the total revenue.
*   The **Business** and **Graduate** segments show the highest credit utilization and lowest delinquency rates.

---

## How to Run
1.  Import the data from the `Dataset` folder into your **MySQL** server.
2.  Open the `Credit_Card_Report.pbix` file in **Power BI Desktop**.
3.  Update the data source settings to point to your local MySQL instance.
4.  Refresh the data to populate the# Credit Card Financial Weekly Dashboard

## Dashboard Visuals
Below are the primary visual snapshots of the interactive report.

### 1. Financial Overview
Provides a detailed view of revenue trends by quarter, card type, and transaction method.
![Financial Insights](https://raw.githubusercontent.com/DeveloperAnshuman/Credit_Card_Finance_Dashboard/main/Images/Dashboard_Overview.png)

### 2. Customer Demographics
Analyzes spending behavior based on age groups, education level, and job profession.
![Customer Analysis](https://raw.githubusercontent.com/DeveloperAnshuman/Credit_Card_Finance_Dashboard/main/Images/Customer_Report.png)

---

## Project Overview
This project provides a comprehensive analysis of credit card operations, focusing on key performance indicators (KPIs) such as revenue, transaction volume, and customer demographics. Built using **Power BI**, **MySQL**, and **DAX**, the dashboard enables real-time monitoring of financial health and identifies growth opportunities.

---

## Key Performance Indicators (KPIs)
*   **Total Revenue:** $55.3M (YTD)
*   **Total Interest Earned:** $7.8M
*   **Total Transaction Amount:** $44.5M
*   **Customer Satisfaction Score:** 3.19 (Avg)

---

## Technical Stack
*   **Data Warehouse:** MySQL
*   **Data Visualization:** Power BI Desktop
*   **Data Transformation:** Power Query & DAX (Data Analysis Expressions)

---

## Project Structure
- `SQL_Queries/`: Contains the database schema and data cleaning scripts.
- `Power_BI/`: The `.pbix` file containing the data model and interactive visuals.
- `Dataset/`: CSV files used for the initial data load.

---

## DAX Measures Used
A few examples of custom measures created for this analysis:
```dax
// Current Week Revenue
Current_Week_Revenue = 
CALCULATE(
    SUM('cc_details'[Revenue]),
    FILTER(
        ALL('cc_details'),
        'cc_details'[Week_Num2] = MAX('cc_details'[Week_Num2])
    )
)

// WOW Revenue Growth
Revenue_Growth = 
DIVIDE(
    ([Current_Week_Revenue] - [Previous_Week_Revenue]), 
    [Previous_Week_Revenue], 
    0
)
