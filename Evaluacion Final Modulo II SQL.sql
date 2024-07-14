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
###agrupo por rating y cuento el total de peliculas en cada rating?
*/
SELECT rating, COUNT(*)
	FROM film
    GROUP BY rating;
