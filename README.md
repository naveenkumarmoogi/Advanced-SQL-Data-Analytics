# Advanced-SQL-Data-Analytics
# Advanced SQL Practice — Subqueries & Correlated Subqueries

## Overview

This repository documents my SQL practice on **Subqueries and Correlated Subqueries** using a custom relational database created for Data Analyst interview preparation.

The database contains five related tables:

* Employees
* Customers
* Products
* Orders
* Payments

The objective was to move beyond basic SQL queries and solve analytical problems involving comparisons, aggregations, group-level benchmarks, and row-by-row comparisons.

## Database Structure

| Table     | Rows |
| --------- | ---: |
| Employees |   25 |
| Customers |   20 |
| Products  |   15 |
| Orders    |   50 |
| Payments  |   50 |

## Topics Covered

### Subqueries

* Scalar subqueries
* Non-correlated subqueries
* `AVG()` and `MAX()` inside subqueries
* `IN`
* `NOT IN`
* Subqueries with `GROUP BY`
* Subqueries with `HAVING`
* Nested aggregation
* Comparing group-level metrics against overall benchmarks

### Correlated Subqueries

* Outer query and inner query relationships
* Correlation using business dimensions
* Department-level comparisons
* Category-level comparisons
* Customer-level comparisons
* City-level comparisons
* State-level comparisons
* Nested aggregation with correlated conditions
* Date comparison using `TO_DAYS()`

## Subquery Practice

I solved problems including:

1. Employees earning more than the overall average salary.
2. Employees receiving the highest salary.
3. Products priced above the overall average product price.
4. Customers who placed orders above ₹20,000.
5. Customers who never placed an order.
6. Departments whose average salary exceeds the company average.
7. Customers whose total spending exceeds average customer spending.
8. Product categories whose average price exceeds the Electronics category average.

## Correlated Subquery Practice

I solved problems including:

1. Employees earning more than their department average.
2. Products priced above their category average.
3. Orders exceeding the customer's average order amount.
4. Highest-paid employees within each department.
5. Most expensive products within each category.
6. Customers whose total spending exceeds the average spending of customers in their city.
7. Customers whose total spending exceeds the average spending of customers in their state.
8. Employees hired earlier than the average hire date of their department.

## Key Learning

### Subquery

A subquery is an SQL query placed inside another SQL query. The inner query can generally execute independently of the outer query.

Example concept:

```text
Overall Average
      ↓
Compare individual/group results
```

### Correlated Subquery

A correlated subquery depends on a value from the outer query.

Example concept:

```text
Current Employee
      ↓
Current Department
      ↓
Department Average Salary
      ↓
Compare Current Employee Salary
```

The key difference I practiced was understanding **the level of comparison**.

For example:

```text
Overall average salary
```

is different from:

```text
Average salary of the employee's department
```

Similarly:

```text
Average order amount
```

is different from:

```text
Average total spending per customer
```

Understanding the correct data grain was an important part of these exercises.

## SQL Concepts Used

* `SELECT`
* `WHERE`
* `INNER JOIN`
* `GROUP BY`
* `HAVING`
* `AVG()`
* `SUM()`
* `MAX()`
* `IN`
* `NOT IN`
* Scalar subqueries
* Nested subqueries
* Correlated subqueries
* Table aliases
* `TO_DAYS()`

## What I Learned

The main lesson from this practice was that advanced SQL is not only about remembering syntax.

The important part is identifying:

1. What is being measured?
2. At what level should it be aggregated?
3. What should it be compared against?
4. Should the benchmark be overall, departmental, categorical, city-level, or state-level?
5. Does the inner query depend on the current row of the outer query?

## Next Topic

**CTEs — Common Table Expressions**

The next stage will focus on using CTEs to break complex analytical queries into clear, reusable steps.

## Repository Structure

```text
SQL-Advanced-Practice/
│
├── README.md
├── Subqueries/
│   └── subqueries.sql
├── Correlated-Subqueries/
│   └── correlated_subqueries.sql
└── screenshots/
```


