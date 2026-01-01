End-to-End Retail Analytics with DBT, SQL & CI/CD
 Project Overview
In the modern data landscape, a Data Analyst must act as a Full-Stack Developer—owning the pipeline from raw data ingestion to business-ready insights.

This project demonstrates a production-grade ELT (Extract, Load, Transform) pipeline. I transformed fragmented retail data (Sales, Returns, Customers, Products, and Stores) into a centralized "Single Source of Truth" to drive demographic and product-level decision-making.

Key Business Objectives
The goal was to move beyond basic reporting and answer complex business questions:

Sales Performance: Analyze revenue breakdown by Product Category cross-referenced with Customer Gender.

Reverse Logistics: Identify high-risk Return Rates by category and demographic to optimize supply chain and marketing spend.

The Tech Stack
Data Warehouse: Databricks

Transformation: DBT (Data Build Tool) Core

Version Control: Git & GitHub

Orchestration & Quality: GitHub Actions (CI/CD)

Modeling: SQL (Jinja & Macros)

Data Architecture & Modeling
I implemented a modular architecture following DBT best practices:

Sources: Raw data ingested from CSV/Cloud Storage.

Staging Layer: Initial cleaning, renaming, and type casting (creating 1:1 models of source data).

Intermediate Layer: Complex joins (e.g., joining Sales and Returns with Customer demographics).

Mart Layer (Final): Business-ready tables optimized for BI tools.

fct_sales_performance: Sales sliced by Category and Gender.

fct_return_analysis: Return metrics by Category and Gender.

Engineering Excellence (The "Multiple Hats" Approach)
1. The Data Engineer Hat (Scalability)
Used the ELT pattern to ensure the warehouse does the heavy lifting. Leveraged DBT Macros and Jinja to write "DRY" (Don't Repeat Yourself) code, making the pipeline modular and easy to maintain.

2. The Product Owner Hat (Quality)
Data is only valuable if it is trusted. I implemented:

Generic Tests: Uniqueness and Non-null checks on primary keys.

Singular Tests: Custom logic to ensure refund_amount never exceeds gross_amount.

3. The Full-Stack Developer Hat (CI/CD)
I integrated GitHub Actions to automate the workflow. Every time code is pushed:

DBT logic is compiled.

Data quality tests are automatically triggered.

The build only succeeds if all tests pass, preventing "broken data" from hitting production.

📈 Key Insights Delivered
Category vs. Gender Revenue: Identified which product departments resonate most with specific customer segments.

Return Rate Optimization: Isolated categories where specific demographics had higher return rates, providing a starting point for the Product team to investigate sizing or description issues.

 How to Run This Project
Clone the repo:

Bash

git clone https://github.com/vinu1996/vin_dbt_project.git
Install DBT:

Bash

pip install dbt-core dbt-<your-adapter>
Verify Connection:

Bash

dbt debug
Run & Test:

Bash

dbt build

