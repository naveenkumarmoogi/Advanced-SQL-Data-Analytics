#CORRELATED SUBQUERIES

#1.Find employees whose salary is greater than the average salary of their own department.

SELECT E1.EMPLOYEES_ID,
	   E1.EMPLOYEES_NAME,
       E1.DEPARTMENT,
       E1.SALARY
FROM EMPLOYEES AS E1
WHERE E1.SALARY > (SELECT AVG(E2.SALARY)
                FROM EMPLOYEES AS E2
                WHERE E1.DEPARTMENT=E2.DEPARTMENT);
                
#2.Find products whose price is greater than the average price of products in their own category.

SELECT P1.PRODUCT_ID,
	   P1.PRODUCT_NAME,
       P1.CATEGORY,
       P1.PRICE
FROM PRODUCTS AS P1
WHERE P1.PRICE > ( SELECT AVG(P2.PRICE) 
				   FROM PRODUCTS AS P2
                   WHERE P1.CATEGORY=P2.CATEGORY);
                   
#3.Find orders whose amount is greater than the average order amount of the same customer. 
SELECT O1.ORDER_ID,
       O1.CUSTOMER_ID,
       O1.AMOUNT
FROM ORDERS AS O1
WHERE O1.AMOUNT > ( SELECT AVG(O2.AMOUNT)
                    FROM ORDERS AS O2
                    WHERE O1.CUSTOMER_ID=O2.CUSTOMER_ID);
                    
#4.Find the highest-paid employee in each department. 
SELECT E1.EMPLOYEES_ID,
       E1.EMPLOYEES_NAME,
       E1.DEPARTMENT,
       E1.SALARY
FROM EMPLOYEES AS E1
WHERE E1.SALARY = ( SELECT MAX(E2.SALARY) AS HIGHEST_SALARY
					FROM EMPLOYEES AS E2
                    WHERE E1.DEPARTMENT = E2.DEPARTMENT);
                    
#5.Find the most expensive product in each category.

SELECT P1.PRODUCT_ID,
       P1.PRODUCT_NAME,
       P1.CATEGORY,
       P1.PRICE
FROM PRODUCTS AS P1
 WHERE P1.PRICE = ( SELECT MAX(P2.PRICE)
					FROM PRODUCTS AS P2
                    WHERE P1.CATEGORY=P2.CATEGORY);
                    
#6.Find customers whose total spending is greater than the average spending of customers from the same city. 

SELECT C1.CUSTOMER_ID,
	   C1.CUSTOMER_NAME,
       C1.CITY,
       SUM(O1.AMOUNT) AS TOTAL_SPENDING
FROM CUSTOMERS AS C1 INNER JOIN ORDERS AS O1
ON C1.CUSTOMER_ID=O1.CUSTOMER_ID
GROUP BY C1.CUSTOMER_ID,
	   C1.CUSTOMER_NAME,
       C1.CITY
      HAVING  SUM(O1.AMOUNT) > ( SELECT AVG(CUSTOMER_TOTAL)
								 FROM( SELECT C2.CUSTOMER_ID,
	                                          C2.CUSTOMER_NAME,
											  C2.CITY,
                                              SUM(O2.AMOUNT) AS CUSTOMER_TOTAL
                                              FROM CUSTOMERS AS C2 INNER JOIN ORDERS AS O2
                                              ON C2.CUSTOMER_ID=O2.CUSTOMER_ID
                                              WHERE C1.CITY=C2.CITY
											  GROUP BY C2.CUSTOMER_ID,
	                                                   C2.CUSTOMER_NAME,
                                                       C2.CITY) AS CUSTOMERS_TOTALS
                                                       );

#7. Find customers whose total spending is greater than the average spending of customers from the same state.

SELECT C1.CUSTOMER_ID,
	   C1.CUSTOMER_NAME,
       C1.STATE,
       SUM(O1.AMOUNT) AS TOTAL_SPENDING
FROM CUSTOMERS AS C1 INNER JOIN ORDERS AS O1
ON C1.CUSTOMER_ID = O1.CUSTOMER_ID
GROUP BY  C1.CUSTOMER_ID,
	   C1.CUSTOMER_NAME,
       C1.STATE
       HAVING SUM(O1.AMOUNT) > ( SELECT AVG(CUSTOMER_TOTAL)
								 FROM (SELECT C2.CUSTOMER_ID,
                                              C2.CUSTOMER_NAME,
                                              C2.STATE,
                                              SUM(O2.AMOUNT) AS CUSTOMER_TOTAL
										FROM CUSTOMERS AS C2 INNER JOIN ORDERS AS O2
                                        ON C2.CUSTOMER_ID = O2.CUSTOMER_ID
                                        WHERE C2.STATE = C1.STATE
                                        GROUP BY C2.CUSTOMER_ID,
                                                 C2.CUSTOMER_NAME,
                                                 C2.STATE) AS CUSTOMER_TOTALS 
										 );
                                         
#8. Find employees who were hired earlier than the average hire date of employees in their own department.
SELECT E1.EMPLOYEES_ID,
       E1.EMPLOYEES_NAME,
       E1.DEPARTMENT,
       E1.HIRE_DATE 
FROM EMPLOYEES AS E1 
WHERE TO_DAYS(E1.HIRE_DATE) < ( SELECT AVG(TO_DAYS(E2.HIRE_DATE))
                                 FROM EMPLOYEES AS E2
                                 WHERE E1.DEPARTMENT= E2.DEPARTMENT);
                                 

