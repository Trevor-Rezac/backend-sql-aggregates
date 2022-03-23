-- rank of film category by times rented
-- include the name, count, and rank
SELECT
	category.name,
    COUNT(rental.rental_id),
    RANK() OVER (ORDER BY COUNT(rental.rental_id) DESC)
FROM
	film
INNER JOIN
	film_category
ON
	film_category.film_id = film.film_id
INNER JOIN
	category
ON
	category.category_id = film_category.category_id
INNER JOIN
	inventory
ON
	inventory.film_id = film.film_id
INNER JOIN
	rental
ON
	inventory.inventory_id = rental.inventory_id
GROUP BY
	category.name
