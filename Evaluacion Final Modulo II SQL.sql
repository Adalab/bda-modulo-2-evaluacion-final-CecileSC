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
