-- Q1. Who is the senior most employee based on job title?

SELECT * 
FROM employee
ORDER BY levels DESC
LIMIT 1;

-- Q2. Which countries have the most Invoices?

SELECT COUNT(invoice_id) AS invoice, billing_country AS billing_country
FROM invoice
GROUP BY billing_country
ORDER BY billing_country DESC;

-- Q3. What are top 3 values of total invoice?

SELECT *
FROM invoice
ORDER BY total DESC
LIMIT 3;

-- Q4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--     Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.

SELECT billing_city, SUM(total) AS total
FROM invoice
GROUP BY billing_city
ORDER BY total DESC
LIMIT 1;

-- Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--     Write a query that returns the person who has spent the most money.

SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) AS total
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 1;

-- Q6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A 

SELECT DISTINCT email, first_name, last_name 
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id 
	IN (SELECT track_id 
	    FROM track
	    JOIN genre ON genre.genre_id = track.genre_id
	    WHERE genre.name LIKE 'Rock')
ORDER BY email;
