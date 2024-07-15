USE sakila;

/* Evaluación final Modulo II
-- BBDD Sakila
*/

/* Ejercicio Nº 1
-- Selecciona todos los nombres de las películas sin que aparezcan duplicados.
*/
SELECT DISTINCT title -- DISTINCT selecciona los datos, eliminando los duplicados
	FROM film;
    
/* Ejercicio Nº 2  
-- Muestra los nombres de todas las películas que tengan una clasificación de "PG-13"
*/
SELECT title
	FROM film
	WHERE rating = "PG-13";  

/* Ejercicio Nº 3  
-- Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
*/
SELECT title, description
	FROM film
	WHERE description LIKE '%amazing%'; 													-- busca valores que contiene la palabra amazing (LIKE %_%)
    
/* Ejercicio Nº 4
-- Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
*/
SELECT title
	FROM film
	WHERE length > 120;

/* Ejercicio Nº 5  
-- Recupera los nombres de todos los actores.
*/
SELECT first_name
	FROM actor;

/* Ejercicio Nº 6  
-- Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
*/
SELECT 	first_name, last_name
	FROM actor
	WHERE last_name LIKE '%Gibson%'; 												-- me devuelve todos los actores que en last_name contengan Gibson
    
/*SELECT 	first_name, last_name
	FROM actor
	WHERE last_name = 'Gibson'; -- el last_name sea completamente igual a Gibson*/    
    
/* Ejercicio Nº 7  
-- Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
*/
SELECT first_name
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20;
    
/* Ejercicio Nº 8 
-- Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación (rating)
*/
SELECT title
	FROM film
    WHERE rating NOT IN ('R', 'PG-13');

/* Ejercicio Nº 9
-- . Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
*/
SELECT rating, COUNT(*) 																		--  cuenta el número total de películas para cada clasificación.
	FROM film
    GROUP BY rating;
    
/* Ejercicio Nº 10
--Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
*/
SELECT cust.customer_id, cust.first_name, cust.last_name, COUNT(*) AS cant_alquileres  			-- cuantos registros de alquiler (rental) están asociados con cada cliente (customer)
	FROM customer AS cust
	INNER JOIN rental ON cust.customer_id = rental.customer_id 
    GROUP BY cust.customer_id;
   
/* Ejercicio Nº 11  
-- Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
*/
SELECT c.name, COUNT(*) AS total_alquileres 													-- cuantos alquileres han sido realizados para las películas de cada categoría
	FROM category AS c
    INNER JOIN film_category ON c.category_id = film_category.category_id
    INNER JOIN inventory ON film_category.film_id = inventory.film_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
	GROUP BY c.name;
   
/* Ejercicio Nº 12  
-- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
*/
SELECT rating, AVG(length) AS promedio 
	FROM film
    GROUP BY rating;
    
/* Ejercicio Nº 13  
-- Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
*/
SELECT act.first_name, act.last_name 											-- si pongo title me sirve para comparar que todos son de "Indian love"
	FROM actor AS act
    INNER JOIN film_actor ON act.actor_id = film_actor.actor_id 				-- para obtener los actores de cada pelicula
    INNER JOIN film ON film_actor.film_id = film.film_id 						-- para obtener los datos de las peliculas (titulo)
    WHERE title = "Indian Love"; 												-- filtro por el titulo
   
/* Ejercicio Nº 14  
-- Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
*/
SELECT title -- si agrego description, puedo comprobar que el resultado es correcto
	FROM film 
	WHERE description LIKE '%dog%' OR description LIKE '%cat%';

/* Ejercicio Nº 15 
-- Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.
*/
SELECT actor_id, first_name, last_name  				-- hice las select por separado de actor y film actor, las exporté y comparé las listas viendo que los actor_id son los mismos (200)
	FROM actor
    WHERE actor_id NOT IN(				
		SELECT actor_id									-- para comprobar que las subselect es correcta, puse los valores (1,2,3...) y recupera los que no indico en la lista y al final me aparece un null
			FROM film_actor
);

/*SELECT actor_id, first_name, last_name  
	FROM actor
    WHERE actor_id NOT IN(					
		1, 2, 3
);*/

/* Ejercicio Nº 16 
-- Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010
*/
SELECT title -- si pongo release_year compruebo que el año de lanzamiento está dentro del rango
FROM film 
WHERE release_year BETWEEN 2005 AND 2010; -- año lanzamiento

/* Ejercicio Nº 17 
-- Encuentra el título de todas las películas que son de la misma categoría que "Family".
*/                                                                        
SELECT title 
FROM film 
INNER JOIN film_category ON film.film_id = film_category.film_id   				-- para relacionar film y category, uso film_category y hago joins de las 3 tablas a traves de sus ids
INNER JOIN category ON film_category.category_id = category.category_id
WHERE name = "Family";													
																	
/* Ejercicio Nº 18  
-- Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
*/
SELECT act.first_name, act.last_name, COUNT(*) AS cantidad_peliculas
	FROM actor AS act
	INNER JOIN film_actor ON act.actor_id = film_actor.actor_id
    GROUP BY act.actor_id
    HAVING COUNT(*) > 10; -- me quedo con los actores que aparecen en mas de 10 peliculas.

/* Ejercicio Nº 19  
-- Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
*/
SELECT title 																		-- si pongo rating, length, compruebo que esta correcta
	FROM film 
	WHERE rating = 'R' AND length > 120;

/* Ejercicio Nº 20  
-- Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y 
muestra el nombre de la categoría junto con el promedio de duración.
*/
SELECT cat.name, AVG(length) AS duracion
	FROM category AS cat
    INNER JOIN film_category ON cat.category_id = film_category.category_id
    INNER JOIN film ON film_category.film_id = film.film_id
    GROUP BY cat.name 																-- agrupo por nombre de la tabla category
    HAVING AVG(length) > 120;														-- me quedo con las categorias (de group by) que tienen una duracion prom mayor a 120 min.

/* Ejercicio Nº 21  
-- Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto 
con la cantidad de películas en las que han actuado.
*/
SELECT first_name, last_name, COUNT(*) AS cantidad_peliculas 				-- count: numero de peliculas en las que ha actuado cada actor.
	FROM actor AS act
    INNER JOIN film_actor ON act.actor_id = film_actor.actor_id
    GROUP BY first_name, last_name
    HAVING COUNT(*) >= 5; 													-- filtra los actores para mostrar solo los que han participado en 5 o más películas

/* Ejercicio Nº 22  
-- Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar 
los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
*/
SELECT DISTINCT film.title 													-- uso distinct para que el nombre de la pelicula no salga repetido (interpretacion)
	FROM film
	INNER JOIN inventory ON film.film_id = inventory.film_id
	WHERE inventory.inventory_id IN(
		SELECT inventory_id 
		FROM rental
		WHERE DATEDIFF(return_date, rental_date) > 5
);

/*SELECT inventory_id, DATEDIFF(return_date, rental_date)
		FROM rental
		WHERE DATEDIFF(return_date, rental_date) > 5;*/ -- la uso para comprobar que la subselect es correcta (mayor a 5 dias)
        
/* Ejercicio Nº 23  
-- Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror".
Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
*/
SELECT first_name, last_name
	FROM actor
    WHERE actor_id NOT IN (															-- se usa para excluir a los actores que han participado en películas de la categoría "Horror".
		SELECT actor_id
		FROM film_actor
        INNER JOIN film_category ON film_actor.film_id = film_category.film_id
        INNER JOIN category ON film_category.category_id = category.category_id
        WHERE category.name = "Horror"
);
/*SELECT DISTINCT actor_id, category.name
		FROM film_actor
        INNER JOIN film_category ON film_actor.film_id = film_category.film_id
        INNER JOIN category ON film_category.category_id = category.category_id
        WHERE category.name = "Horror"*/  											-- la uso para comprobar que la subselect es correcta (horror)
        
#####BONUS#####

/* Ejercicio Nº 24  
-- Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
*/
SELECT title 																		-- category.name, length para comprobar que es correcta
	FROM film 
    INNER JOIN film_category ON film.film_id = film_category.film_id
    INNER JOIN category ON film_category.category_id = category.category_id
    WHERE category.name = "Comedy" AND film.length > 180;