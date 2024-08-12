# DVD Rental Star Schema

This project transforms the original DVD rental database schema into a star schema, optimizing it for analytical queries and reporting.

## Overview

The DVD rental star schema is based on the sample database provided by PostgreSQL.\ 
It reorganizes the data into a set of fact and dimension tables, following dimensional modeling principles to improve query performance and simplify complex analyses.

## What is a Star Schema?

A star schema is a type of data warehouse schema that simplifies complex data structures for easier querying and analysis. It consists of:

1. A central fact table containing the main numerical measurements of a business process.
2. Multiple dimension tables that provide descriptive attributes related to the fact table.

The schema is called a "star" because the diagram resembles a star, with the fact table at the center and dimension tables surrounding it.

## Why Create a Star Schema?

Star schemas offer several advantages:

1. Simplified queries: Joins are typically limited to the fact table and dimensions, making queries easier to write and understand.
2. Improved query performance: Denormalized structure and fewer joins lead to faster query execution.
3. Enhanced reporting capabilities: Ideal for OLAP (Online Analytical Processing) operations and business intelligence tools.
4. Easier to understand: The structure is intuitive for business users, facilitating self-service analytics.

## Features

- Converted the original ER diagram into a star schema
- Created fact and dimension tables for efficient querying
- Optimized for analytical operations and reporting

## Schema Design

The star schema consists of:

- Fact table(s): sales_fact
- Dimension tables: date_dim, customer_dim, movie_dim, store_dim

## Observations

In this project, we've observed significant performance improvements:

- Without star schema: A complex query using multiple joins took approximately **4 minutes 27 seconds (267,302 ms).**
- With star schema: The same query was executed in just **306 ms.**

This represents a remarkable 99.89% reduction in query execution time, demonstrating the power of star schema optimization for analytical queries.
