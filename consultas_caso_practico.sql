SELECT *
FROM menu_items;
------------------------------------------------------------------------------------------
-- b)

--Encontrar el número de artículos en el menú.
SELECT COUNT(DISTINCT menu_item_id) AS numero_articulos
FROM menu_items;

--¿Cuálesel artículo menos caro y el más caro en el menú?
SELECT MIN(price) AS menos_caro,
	MAX(price) AS mas_caro
FROM menu_items;

--¿Cuántos platos americanos hay en el menú?
SELECT COUNT(item_name)
FROM menu_items
WHERE category = 'American';

--¿Cuál es el precio promedio de los platos? 
SELECT ROUND(AVG(price),2) AS precio_promedio_platillo
FROM menu_items;

------------------------------------------------------------------------------------------
-- c)

--¿Cuántos pedidos únicos se realizaron en total?
SELECT COUNT(DISTINCT order_id) AS pedidos_unicos
FROM order_details;

--¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT order_id AS pedidos, COUNT(order_details_id) AS numero_articulos
FROM order_details
GROUP BY 1
ORDER BY COUNT(order_details_id) DESC
LIMIT 5;

--¿Cuándo se realizó el primer pedido y el último pedido?
SELECT MIN(order_date) AS primer_pedido,
	MAX(order_date) AS ultimo_pedido
FROM order_details;

--¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT COUNT(order_id) numero_de_pedidos
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

------------------------------------------------------------------------------------------
-- d)

SELECT *
FROM order_details LEFT JOIN menu_items ON item_id = menu_item_id;

------------------------------------------------------------------------------------------
-- c)

-- 1) Los 10 platillos mas pedidos por los clientes
SELECT item_name AS platillos_mas_pedidos, COUNT(item_name) AS pedidos_totales
FROM order_details 
	LEFT JOIN menu_items ON item_id = menu_item_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 2) categoria de comida que mas piden los cliente
SELECT category AS categoria, COUNT(category) AS pedidos_totales
FROM order_details 
	LEFT JOIN menu_items ON item_id = menu_item_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 3) categoria de comidas que menos piden los clientes
SELECT category AS categoria, COUNT(category) AS pedidos_totales
FROM order_details 
	LEFT JOIN menu_items ON item_id = menu_item_id
GROUP BY 1
HAVING category IS NOT NULL
ORDER BY 2 ASC
LIMIT 1;

-- 4) numero de veces que pidieron comida en la categoria 'Mexican' or 'Italian'
SELECT COUNT(category) AS pedidos_totales
FROM order_details 
	LEFT JOIN menu_items ON item_id = menu_item_id
WHERE category = 'Mexican' OR category ='Italian';

-- 5) Los 10 platillos menos pedidos por los clientes
SELECT item_name AS platillos_menos_pedidos, COUNT(item_name) AS pedidos_totales
FROM order_details 
	LEFT JOIN menu_items ON item_id = menu_item_id
GROUP BY 1
HAVING item_name IS NOT NULL
ORDER BY 2 ASC
LIMIT 10;


