-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
SELECT
	SUM(amount),
    EXTRACT (YEAR FROM payment.payment_date) AS y,
    EXTRACT (MONTH FROM payment.payment_date) AS m,
    EXTRACT (DAY FROM payment.payment_date) AS d, 
    film.rating
FROM
	payment
INNER JOIN
	rental
ON
	rental.rental_id = payment.rental_id
INNER JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
INNER JOIN
	film
ON
	film.film_id = inventory.film_id
GROUP BY
	CUBE(y, m, d, film.rating)
ORDER BY
  film.rating,
	y,
  m,
  d;