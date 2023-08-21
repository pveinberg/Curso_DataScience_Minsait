SELECT c.customerName,
	o.orderNumber,
	o2.quantityOrdered * o2.priceEach as totalLine
-- 	sum(o2.quantityOrdered * o2.priceEach)
	from customers c 
	join orders o on o.customerNumber = c.customerNumber 
	join orderdetails o2 on o2.orderNumber = o.orderNumber 
	where status='Shipped'
-- 	GROUP by (o.orderNumber)
	
SELECT 
	c.customerName as customer_name, 
	o.orderNumber as order_number,
	sum(o2.quantityOrdered * o2.priceEach) as total_order
	from orders o 
	join orderdetails o2 on o2.orderNumber = o.orderNumber 
	join customers c on c.customerNumber = o.customerNumber 
	where status='Shipped'
	GROUP by (o.orderNumber)
	order by c.customerNumber 
	
SELECT  sum(quantityOrdered * priceEach) as total 
	from orderdetails o 
	where orderNumber = 10100
	
	
SELECT DISTINCT YEAR(orderDate)  from orders o 

-- by order number
select o.orderDate, o.orderNumber, sum(o2.priceEach * o2.quantityOrdered) as totalOrder
	from orders o 
	join orderdetails o2 on o2.orderNumber = o.orderNumber 
	GROUP by o.orderDate, o.orderNumber 

-- by order date
select o.orderDate, sum(o2.priceEach * o2.quantityOrdered) as totalOrder
	from orders o 
	join orderdetails o2 on o2.orderNumber = o.orderNumber 
	GROUP by o.orderDate

	
	
	
	