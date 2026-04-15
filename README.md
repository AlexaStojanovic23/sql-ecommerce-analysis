# sql-ecommerce-analysis
SQL based analysis of an e-commerce dataset focusing on customer behavior, sales, and product performance.

# SQL E-commerce Analysis

This is a small SQL project where I practiced working with an e-commerce dataset.

The goal was to understand better how customers behave, how much they spend, and how products are being sold.

## What I focused on

In this project I mainly worked on:

- understanding how tables connect (customers, orders, products)
- writing different types of joins
- using GROUP BY and aggregations
- filtering data with WHERE and HAVING
- using EXISTS and subqueries
- trying some basic business logic with CASE

## Database structure

The database has 4 tables:

- customers
- orders
- order_items
- products

They are connected through foreign keys so I could simulate a simple real-world system.

## Queries

I split queries into two groups:

### Basic queries
- total orders per customer  
- total spending per customer  
- customers with more than one order  
- customers who bought expensive products  
- customers with no orders  

### Advanced queries
- active customers using EXISTS  
- inactive customers using NOT EXISTS  
- products that were never sold  
- order categorization using CASE  
- customers who bought a Laptop and spent more than 300  

## What I learned

Through this project I improved my SQL skills, especially:

- joins between multiple tables
- aggregations like COUNT and SUM
- using HAVING instead of WHERE
- writing subqueries
- thinking more in terms of real data, not just exercises

## How to run

1. Run the script from `database/schema.sql`
2. Run queries from `queries/basic_analysis.sql`
3. Run queries from `queries/advanced_analysis.sql`

## Personal note

This project is part of my SQL learning journey.  
I wanted to build something closer to a real scenario instead of just solving random tasks.
