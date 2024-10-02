-- task-1
SELECT 
    film.title AS "Назва фільму",
    film.length AS "Тривалість",
    category.name AS "Категорія"
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;

-- task-2
SELECT 
    f.title AS "Назва фільму",
    r.rental_period AS "Дата оренди"
FROM 
	customer c
JOIN 
	rental r ON c.customer_id = r.customer_id
JOIN 
	inventory i ON r.inventory_id = i.inventory_id
JOIN 
	film f ON i.film_id = f.film_id
WHERE c.customer_id = 455;

-- task-3
SELECT 
	film.title AS "Назва фільму", COUNT(r.rental_id) AS "Кількість оренд"
FROM 
	film
JOIN 
	inventory i ON film.film_id = i.film_id
JOIN 
	rental r ON i.inventory_id = r.inventory_id
GROUP BY 
	film.title
ORDER BY 
	"Кількість оренд" DESC
LIMIT 5;

-- task-4
INSERT INTO city (city, country_id)
VALUES ('San Francisco', 1)

INSERT INTO address (address, city_id, district, postal_code, phone)
VALUES ('123 Main St', (SELECT city_id FROM city WHERE city = 'San Francisco'), 'Union Square', '94016', '16509899813');

INSERT INTO customer (store_id, first_name, last_name, address_id)
VALUES (1, 'Alice', 'Cooper',
        (SELECT address_id FROM address WHERE address = '123 Main St' AND city_id = (SELECT city_id FROM city WHERE city = 'San Francisco')));
        
-- task-5
UPDATE address
SET address = '456 Elm St'
WHERE address_id = (
    SELECT c.address_id
    FROM customer c
    JOIN address a ON c.address_id = a.address_id
    WHERE c.first_name = 'Alice' AND c.last_name = 'Cooper'
);

-- task-6
DELETE FROM customer
WHERE first_name = 'Alice' 
AND last_name = 'Cooper';