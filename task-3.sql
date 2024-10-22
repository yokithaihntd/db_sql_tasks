-- task-1
SELECT c.name AS "Категорії фільмів", COUNT(f.film_id) AS "Кількість фільмів"
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY "Кількість фільмів" DESC;

-- task-2
SELECT c.name AS "Категорії фільмів", AVG(f.length) AS "Середня тривалість фільму"
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY "Середня тривалість фільму" DESC;

-- task-3
SELECT MIN(f.length) AS "Мінімальна тривалість фільму", MAX(f.length) AS "Максимальна тривалість фільму"
FROM film f;

-- task-4
SELECT COUNT(customer_id) AS "Загальна кількість клієнтів"
FROM customer;

-- task-5
SELECT c.first_name AS "Ім'я", c.last_name AS "Прізвище", SUM(p.amount) AS "Загальна сума платежів"
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY "Загальна сума платежів" DESC;

-- task-6
SELECT c.first_name AS "Ім'я", c.last_name AS "Прізвище", COUNT(p.payment_id) AS "Кількість платежів"
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY "Кількість платежів" DESC
LIMIT 5;

-- task-7
SELECT c.first_name AS "Ім'я", c.last_name AS "Прізвище", COUNT(r.rental_id) AS "Кількість орендованих фільмів"
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY "Кількість орендованих фільмів" DESC;

-- task-8
SELECT AVG(EXTRACT(YEAR FROM NOW()) - f.release_year) AS "Середній вік фільмів"
FROM film f;

-- task-9
SELECT COUNT(r.rental_id) AS "Кількість орендованих фільмів"
FROM rental r
WHERE r.rental_period BETWEEN '2005-05-20 00:00:00' AND '2005-07-15 23:59:59';

-- task-10
SELECT 
    DATE_TRUNC('month', p.payment_date) AS "Місяць",
    SUM(p.amount) AS "Загальна сума платежів"
FROM 
    payment p
GROUP BY 
    DATE_TRUNC('month', p.payment_date)
ORDER BY 
    "Місяць" ASC;

-- task-11
SELECT 
    p.customer_id AS "ID клієнта",
    MAX(p.amount) AS "Максимальна сума платежу"
FROM 
    payment p
GROUP BY 
    p.customer_id
ORDER BY 
    "ID клієнта" ASC;

-- task-12
SELECT 
    c.first_name AS "Ім'я клієнта",
    AVG(p.amount) AS "Середня сума платежів"
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, c.first_name
ORDER BY 
    "Середня сума платежів" DESC;

-- task-13
SELECT 
    f.rating AS "Рейтинг",
    COUNT(f.film_id) AS "Кількість фільмів"
FROM 
    film f
WHERE 
    f.rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17')
GROUP BY 
    f.rating
ORDER BY 
    f.rating;

-- task-14
SELECT 
    s.store_id AS "ID магазину",
    AVG(p.amount) AS "Середня сума платежів"
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    store s ON i.store_id = s.store_id
GROUP BY 
    s.store_id
ORDER BY 
    s.store_id;