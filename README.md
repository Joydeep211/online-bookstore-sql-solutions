# online-bookstore-sql-solutions
My SQL solutions for the Online Bookstore project

# 📚 Online Bookstore SQL Solutions

## 📌 Project Overview
This repository contains the full SQL implementation for an Online Bookstore database project. It includes the database schema, CSV data files for population, and solutions to **15 real-world business problems** covering querying, filtering, joins, aggregation, and advanced SQL operations.

**Database:** PostgreSQL
**Language:** SQL
**Tool:** PgAdmin

## 📂 Repository Structure

online-bookstore-sql-solutions/
│
├── data/                      # Raw CSV files used to populate the database
│   ├── authors.csv
│   ├── books.csv
│   ├── customers.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── ...
│
├── schema/                    # SQL scripts for creating tables
│   └── bookstore_schema.sql
│
├── bookstore_solutions.sql    # Solutions for SQL queries (Problems 1–15)
│
└── README.md                  # Project documentation



Overview

The project simulates an online bookstore and demonstrates:

  1)Designing a relational schema
  
  2)Creating database tables with constraints
  
  3)Importing large datasets (500+ records per table)
  
  4)Writing SQL queries to solve real-world business problems
  
  5)Using joins, aggregates, subqueries, filtering, grouping, sorting, and set operations


How to Use This Repository:-

1. Import the CSV Data

    Load the contents of the data/ folder into your SQL environment using its import tool.
    
    Typical flow for MySQL / PostgreSQL / SQLite:
    
    Create a new database.
    
    Run schema/bookstore_schema.sql to generate tables.
    
    Use your DB tool's Import Data feature to load each CSV file into its corresponding table.

2. Create the Database Schema

    Execute:
        schema/bookstore_schema.sql

  This script creates all tables required by the project.

3. Run the SQL Solutions

    All 15 problem solutions are included in:
        bookstore_solutions.sql

  Each solution is clearly numbered and fully commented.

  

Problem Set Coverage:-

The query solutions include:

  Data retrieval
  
  Filtering and sorting
  
  Table joins
  
  Aggregate functions
  
  Subqueries
  
  GROUP BY / HAVING
  
  Real-world bookstore operations

License:-
    This project is open for learning and reference purposes. Feel free to use or modify it for educational work.















