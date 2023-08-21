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
	
	
-- mix de querys sql e pandas

-- líneas de produto mais vendidas (por quantidade e por montos)
	
SELECT p.productName, p2.productLine,
	sum(o.quantityOrdered) as totalProductsSale
	from orderdetails o
	join orders o2 on o2.orderNumber = o.orderNumber 
	join products p on p.productCode = o.productCode 
	RIGHT join productlines p2 on p2.productLine = p.productLine 
	where o2.status in ('Shipped', 'Resolved')
	group by p.productName, p2.productLine  
	limit 10
	
SELECT * from orders o 
	inner join orderdetails o2 on o2.orderNumber = o.orderNumber 
	
	
SELECT c.customerName,
		p.paymentDate, p.amount
	from customers c
	join payments p on p.customerNumber = c.customerNumber
	order by p.paymentDate ASC 
	limit 20

	
SELECT  sum(quantityOrdered * priceEach) as total 
	from orderdetails o 
	where orderNumber = 10100
	
	
SELECT DISTINCT YEAR(orderDate)  from orders o 

select DISTINCT o.status from orders o 

select DISTINCT productName from products p 

-- by order number
select o.orderDate, o.orderNumber, sum(o2.priceEach * o2.quantityOrdered) as totalOrder
	from orders o 
	join orderdetails o2 on o2.orderNumber = o.orderNumber 
	GROUP by o.orderDate, o.orderNumber 

-- orders by date, with orders quantity and total ammount 
select o.orderDate, count(o.orderNumber) as qtyOrders, 
	sum(o2.priceEach * o2.quantityOrdered) as totalOrder
	from orders o 
	join orderdetails o2 on o2.orderNumber = o.orderNumber 
	GROUP by o.orderDate

	
	
	
	
	