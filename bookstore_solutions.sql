-- 1. Find total number of customers in each city.

SELECT  city,Count(Customer_ID)
FROM Customers
GROUP BY city;

-- 2. Show the number of books available by each genre

SELECT genre,count(book_id) from books
group by genre

-- 3. For each author, count how many books they have written.

select author,count(book_ID)
from books
group by author 

-- 4. List each customer and show how many orders they placed

select
	c.customer_id,
	count(o.order_id) as Orders
FROM customers as c
JOIN orders as o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id
ORDER BY Orders DESC


-- 5. Show the highest price book in each genre.

select genre,max(price) as Maximum_Book_Price
from books
group by genre

-- 6. Show total quantity of books ordered for each book title

select 
	b.book_id,
	b.title,
	sum(o.quantity)
FROM books as b
JOIN orders as o
ON b.book_id=o.book_id
group by b.book_id,b.title
order by b.book_id ASC


-- 7. Find the total money spent by each customer.

SELECT 
	c.customer_id,
	c.name,
	SUM(o.total_amount) as total_spent
FROM 
	orders as o
JOIN 	
	customers as c
ON
	o.customer_id=c.customer_id
GROUP BY 
	c.customer_id,c.name
ORDER BY 
	total_spent DESC


-- 8. Show each author and the total revenue generated from their books

SELECT 
	b.author, 
	SUM(b.price*o.quantity) as total_earned
FROM books as b
JOIN orders as o
ON b.book_id=o.book_id
GROUP BY b.author


-- 9. List the cities where the total spending of customers exceeds $500.

SELECT 
	c.city,
	SUM(o.total_amount) as Total_spending
FROM
	customers as c
JOIN
	orders as o
ON c.customer_id=o.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount)>500
ORDER BY Total_spending DESC
		


-- 10. Find the top 3 customers who placed the highest number of orders

SELECT 
	c.customer_id,	
	c.name,	
	COUNT(o.order_id) as No_of_Orders
FROM 
	customers as c
JOIN
	orders as o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,	c.name
ORDER BY No_of_Orders DESC LIMIT 3;
	

-- 11. For each city, Find:number of customers,total orders,total revenue

SELECT 
	c.city,
	COUNT(DISTINCT c.customer_id) as No_of_Customers,
	COUNT(o.order_id) as Total_Orders,
	SUM(o.total_amount) as Total_Revenue
FROM
	customers as c
JOIN
	orders as o
ON c.customer_id=o.customer_id
GROUP BY c.city


-- 12. Show authors whose total sold quantity is higher than the average sold quantity of all authors. 

SELECT 
	b.author,
	SUM(o.quantity) as Total_sold_quantity
FROM books as b
JOIN orders as o
ON b.book_id=o.book_id
GROUP BY b.author
HAVING SUM(o.quantity)>
		(
		SELECT AVG(total_of_author) FROM 
			(SELECT sum(quantity) as total_of_author
			FROM orders
			JOIN books
			ON orders.book_id=books.book_id
			GROUP BY books.author)
)

-- 13. Find the customer who placed the largest single order quantity

SELECT 
	o.order_id,
	c.customer_id,
	c.name,
	o.quantity
FROM orders as o 
JOIN customers as c
ON o.customer_id=c.customer_id
WHERE o.quantity = (
	SELECT MAX(quantity) FROM orders
)


-- 14. List genres where the number of books ordered is greater than the number of books in stock.

SELECT 
	b.genre,
	SUM(o.quantity) as ordered_quantity,
	SUM(b.stock) as Initial_stock
FROM  books as b 
LEFT JOIN  orders as o
ON b.book_id=o.book_id
GROUP BY b.genre
HAVING SUM(o.quantity) > SUM(b.stock);


-- 15. Show the monthly sales report: Month → Total Orders → Total Revenue

SELECT
	TO_CHAR(order_date,'YYYY-MM') as Month,
	COUNT(order_id) as Total_Orders,
	SUM(total_amount) as Total_revenue
FROM orders 
GROUP BY TO_CHAR(order_date,'YYYY-MM')
ORDER BY Month








