USE sakila;

/* Evaluación final Modulo II
-- BBDD Sakila
*/

/* Ejercicio Nº 1
-- Selecciona todos los nombres de las películas sin que aparezcan duplicados.
###DISTINCT selecciona datos eliminando los duplicados.
*/
SELECT DISTINCT title -- selecciona los datos, eliminando los duplicados
	FROM film;
    
/* Ejercicio Nº 2  
-- Muestra los nombres de todas las películas que tengan una clasificación de "PG-13"
*/
SELECT title
	FROM film
	WHERE rating = "PG-13";  -- es igual a "PG 13"

/* Ejercicio Nº 3  
-- Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
###LIKE busca valores que cumplan con ciertos criterios usando patrones. %amazing% busca los valores que contiene amazing
*/
SELECT 	title, description
	FROM film
	WHERE description LIKE '%amazing%'; -- busca valores que contiene la palabra amazing (LIKE %_%)
    
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
### (o = 'Gibson')
*/
SELECT 	first_name, last_name
	FROM actor
	WHERE last_name LIKE '%Gibson%'; 
    
/* Ejercicio Nº 7  
-- Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
###BETWEEN: seleciona los datos que estan dentro de un rango de valores
*/
SELECT first_name
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20;
    
    /* Ejercicio Nº 8 
-- Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
###NOT IN excluye los valores que especifico
*/
SELECT title
	FROM film
    WHERE rating NOT IN ('R', 'PG-13');

/* Ejercicio Nº 9
-- . Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
*/
SELECT rating, COUNT(*)
	FROM film
    GROUP BY rating;
    
/* Ejercicio Nº 10
--Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
*/
SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(*) AS cant_alquileres
	FROM customer
	INNER JOIN rental ON customer.customer_id = rental.customer_id 
    GROUP BY customer.customer_id;
   

/* Ejercicio Nº 11  
-- Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
*/
SELECT c.name, COUNT(*) AS recuento_alquileres
	FROM category AS c
    INNER JOIN film_category ON c.category_id = film_category.category_id
    INNER JOIN inventory ON film_category.film_id = inventory.film_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
	GROUP BY c.name;
   
/* Ejercicio Nº 12  
-- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
###  AVR promedio de la duracion de la peli, agrupando por rating
*/
SELECT rating, AVG(length) AS promedio 
	FROM film
    GROUP BY rating;