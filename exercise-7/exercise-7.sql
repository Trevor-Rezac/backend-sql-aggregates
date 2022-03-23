-- customer ranking by total film time watched
-- similar to exercise 6
SELECT
	customer.email,
    RANK() OVER (ORDER BY SUM(film.length) DESC)
FROM
	customer
INNER JOIN
	rental
ON
	rental.customer_id = customer.customer_id
INNER JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
INNER JOIN
	film
ON
	film.film_id = inventory.film_id
GROUP BY
	customer.email