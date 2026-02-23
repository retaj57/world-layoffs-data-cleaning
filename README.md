🌍 World Layoffs Data Cleaning & Analysis (MySQL)

📌 Project Overview

This project demonstrates a complete SQL-based data cleaning and transformation workflow using a real-world layoffs dataset.
The objective was to transform raw, inconsistent data into a structured and analysis-ready format following data engineering best practices.

🛠 Data Cleaning & Transformation Pipeline
1️⃣ Data Staging

Created a staging table to preserve raw data integrity.

Performed transformations on a duplicated working table.

2️⃣ Duplicate Detection & Removal

Used ROW_NUMBER() with PARTITION BY to identify duplicates.

Implemented a CTE-based strategy to safely remove redundant records.

3️⃣ Data Standardization

Trimmed whitespace inconsistencies.

Unified categorical values (e.g., industry variations such as "Crypto").

Cleaned country naming formats.

Converted date column from TEXT to proper DATE format using STR_TO_DATE().

Altered column data types to ensure schema consistency.

4️⃣ Handling Missing & Blank Values

Converted blank fields to NULL for consistency.

Used self-joins to populate missing industry values where possible.

Removed helper columns after transformation.


📊 Exploratory Data Analysis

Performed structured analysis on the cleaned dataset:

Total layoffs by company

Layoffs by country and industry

Year-over-year layoffs trend

Stage-based layoffs distribution

Monthly layoffs aggregation

Rolling cumulative totals using window functions


🧠 SQL Concepts Applied

CTE (Common Table Expressions)

Window Functions (ROW_NUMBER(), SUM() OVER)

Data Type Conversion

Self Join for data enrichment

Aggregations & Grouping

Date functions

Data normalization techniques


🏗 Data Engineering Relevance

This project simulates core components of an ETL workflow:

Extracting raw data

Transforming and standardizing data

Cleaning inconsistencies

Preparing structured datasets for analytics


💻 Tools Used

MySQL

SQL
