select * from customers;
select * from employees;
select * from products;
select * from orders;
select * from payments;


#SUBQUERIES 

# 1.Find employees whose salary is greater than the average salary of all employees.
SELECT EMPLOYEES_ID,
       EMPLOYEES_NAME,
       SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) 
				FROM EMPLOYEES);
                
# 2. Find the employee(s) who receive the highest salary.
SELECT EMPLOYEES_ID,
       EMPLOYEES_NAME,
       SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) 
				FROM EMPLOYEES);

#Find products whose price is greater than the average price of all products.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE
FROM PRODUCTS
WHERE PRICE > (SELECT AVG(PRICE) 
               FROM PRODUCTS);
               
#4.Find customers who have placed at least one order whose amount is greater than ₹20,000.
SELECT CUSTOMER_ID,
       CUSTOMER_NAME,
       CITY
FROM CUSTOMERS 
WHERE CUSTOMER_ID IN ( SELECT CUSTOMER_ID
				  FROM ORDERS 
                  WHERE AMOUNT>20000);

#5.Find customers who have never placed an order.
SELECT CUSTOMER_ID,
       CUSTOMER_NAME,
       CITY
FROM CUSTOMERS 
WHERE CUSTOMER_ID NOT IN ( SELECT CUSTOMER_ID 
						   FROM ORDERS);
                           
#6.Find departments whose average salary is greater than the company's overall average salary.
SELECT DEPARTMENT,
	   AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > ( SELECT AVG(SALARY)
                  FROM EMPLOYEES);
                
#7.Find customers whose total order amount is greater than the average total spending of all customers.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       C.CITY,
       SUM(O.AMOUNT) AS TOTAL_SPENDING
FROM CUSTOMERS AS C INNER JOIN ORDERS AS O
ON C.CUSTOMER_ID=O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,
         C.CUSTOMER_NAME,
		 C.CITY
HAVING SUM(O.AMOUNT) > (SELECT AVG(TOTAL_SPENDING)
                        FROM (
                              SELECT CUSTOMER_ID,
									 SUM(AMOUNT) AS TOTAL_SPENDING
                              FROM ORDERS
                              GROUP BY CUSTOMER_ID) AS CUSTOMER_TOTALS
                               );
                               
#8.Find product categories whose average price is greater than the average price of the Electronics category.
SELECT CATEGORY,
       AVG(PRICE) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY
HAVING AVG(PRICE) > ( SELECT AVG(PRICE) 
                           FROM PRODUCTS
                           WHERE CATEGORY='ELECTRONICS');
                           

