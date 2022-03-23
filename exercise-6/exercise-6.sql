-- customer ranking by total amount spent on *rentals*
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order
SELECT
	email,
  RANK() OVER (ORDER BY SUM(payment.amount) DESC)
FROM
	customer
INNER JOIN
	rental
ON
	rental.customer_id = customer.customer_id
INNER JOIN
	payment
ON
	payment.rental_id = rental.rental_id
GROUP BY
	customer.email;
