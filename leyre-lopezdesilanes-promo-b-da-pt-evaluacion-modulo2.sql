USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title 
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT title 
FROM film
WHERE rating = 'PG-13';

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT title, description 
FROM film
WHERE description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title 
FROM film
WHERE length > 120;

-- 5. Recupera los nombres de todos los actores.

SELECT CONCAT(first_name, ' ', last_name) AS ActorsName
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name AS Name, last_name AS LastName
FROM actor
WHERE last_name = 'Gibson';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT CONCAT(first_name, ' ', last_name) AS ActorsName
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT title
FROM film
WHERE rating NOT IN ('R', 'PG-13');

/* 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con
el recuento. */

SELECT COUNT(film_id) AS FilmQuantity, rating
FROM film
GROUP BY rating
ORDER BY FilmQuantity; -- para ordenarlas de menos a más cantidad

/* 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y
apellido junto con la cantidad de películas alquiladas. */

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS CustomerName, COUNT(r.rental_id) AS MoviesRented
FROM customer AS c
INNER JOIN rental AS r
USING (customer_id)
GROUP BY c.customer_id;

/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el
recuento de alquileres. */

SELECT cat.name AS CategoryName, COUNT(r.rental_id) AS MoviesRented
FROM category AS cat
INNER JOIN film_category USING (category_id)
INNER JOIN inventory USING (film_id)
INNER JOIN rental AS r USING (inventory_id)
GROUP BY cat.name
ORDER BY cat.name;

/* 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
clasificación junto con el promedio de duración. */

SELECT rating, ROUND(AVG(length), 1) AS AverageLength
FROM film
GROUP BY rating
ORDER BY AverageLength;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT CONCAT(a.first_name, ' ', a.last_name) AS ActorsName
FROM actor AS a
INNER JOIN film_actor USING (actor_id)
INNER JOIN film USING (film_id)
WHERE title = 'Indian Love';

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT title
FROM film
WHERE description LIKE '%dog%' OR description LIKE '%cat%';

-- 15. ¿Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor?

SELECT CONCAT(a.first_name, ' ', a.last_name) AS ActorsName
FROM actor AS a
LEFT JOIN film_actor AS fa USING (actor_id)
WHERE a.actor_id NOT IN (SELECT DISTINCT fa.actor_id
						FROM film_actor);

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT title
FROM film
WHERE release_year BETWEEN 2005 AND 2010
ORDER BY release_year;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT f.title, cat.name
FROM film AS f
INNER JOIN film_category USING (film_id)
INNER JOIN category  AS cat USING (category_id)
WHERE cat.name = 'Family';

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

SELECT CONCAT(a.first_name, ' ', a.last_name) AS ActorsName
FROM actor AS a
INNER JOIN film_actor AS fa USING (actor_id)
GROUP BY actor_id -- se agrupa por el id del actor
HAVING COUNT(film_id) >10; -- para que cada vez que aparezca la pelicula se agrupe en cada actor

-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

SELECT title
FROM film
WHERE rating = 'R' AND length > (2*60); -- paso de horas a minutos porque en la tabla está por minutos

/* 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el
nombre de la categoría junto con el promedio de duración. */

SELECT cat.name, ROUND(AVG(f.length), 0) AS AverageLength
FROM category AS cat
INNER JOIN film_category USING (category_id)
INNER JOIN film AS f USING (film_id)
GROUP BY cat.name
HAVING AverageLength > 120;

/* 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la
cantidad de películas en las que han actuado. */

SELECT CONCAT(a.first_name, ' ', a.last_name) AS ActorsName, COUNT(fa.film_id) AS Movies
FROM actor AS a
INNER JOIN film_actor AS fa USING (actor_id)
GROUP BY actor_id -- se agrupa por el id del actor
HAVING COUNT(film_id) >= 5;

/* 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para
encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes. */

SELECT DISTINCT title -- distinct porque daba varias veces el nombre de la misma pelicula
FROM film
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
WHERE rental_id IN (SELECT rental_id
					FROM rental
					WHERE (DATEDIFF(return_date, rental_date)) > 5); -- subconsulta para sacar la fecha que han alquilado más de 5 días

/* 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror".
Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego
exclúyelos de la lista de actores. */

SELECT CONCAT(first_name, ' ', last_name) AS ActorsName
FROM actor
WHERE actor_id NOT IN (SELECT actor_id
						FROM actor
                        INNER JOIN film_actor USING (actor_id)
						INNER JOIN film_category USING (film_id)
						INNER JOIN category USING (category_id)
                        WHERE name = 'Horror');

/* 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la
tabla film. */

SELECT f.title 
FROM film AS f
INNER JOIN film_category USING (film_id)
INNER JOIN category AS cat USING (category_id)
WHERE cat.name = 'Comedy' AND f.length > 180;

/* 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe
mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos. */

SELECT CONCAT(a1.first_name, ' ', a1.last_name) AS ActorName, CONCAT(a2.first_name, ' ', a2.last_name) AS ActorName2, COUNT(fa.film_id) AS MoviesInCommon
FROM actor AS a1, actor AS a2
INNER JOIN film_actor AS fa USING (actor_id)
WHERE a1.actor_id <> a2.actor_id 
GROUP BY ActorName, ActorName2
HAVING COUNT(fa.film_id) > 0;



