USE sakila;

-- Evaluación final Modulo II
-- BBDD Sakila
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

