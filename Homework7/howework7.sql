/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. */
SELECT id, name FROM users
WHERE id IN (
    SELECT user_id FROM orders
);

-- вариант с JOIN
SELECT
	users.id,
	users.name
FROM orders
JOIN users 
ON (users.id=orders.user_id);

/* 2. Выведите список товаров products и разделов catalogs, который соответствует товару. */

SELECT id, name, (
    SELECT name FROM catalogs WHERE id = catalog_id
) 
FROM products;

-- вариант с JOIN
SELECT 
	products.id, 
	products.name AS product,
    catalogs.name
FROM products 
LEFT JOIN catalogs 
ON catalogs.id = products.catalog_id;


/* 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов. */

-- Создадим таблицы flights и flights
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    id SERIAL,
    `from` VARCHAR(50),
    `to` VARCHAR(50)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    `label` VARCHAR(50),
    `name` VARCHAR(50)
);

-- Заполняем таблицы
INSERT INTO flights
VALUES (DEFAULT, 'Moscow', 'Irkutsk'),
       (DEFAULT, 'SPeterburg', 'Omsk'),
       (DEFAULT, 'Omsk', 'Moscow'),
       (DEFAULT, 'Kazan', 'Irkutsk'),
       (DEFAULT, 'Moscow', 'Kazan');

INSERT INTO cities
VALUES ('Moscow', 'Москва'),
       ('Irkutsk', 'Иркутск'),
       ('SPeterburg', 'С-Петербург'),
       ('Kazan', 'Казань'),
       ('Omsk', 'Омск');

-- Решение задачи
SELECT id,
	(SELECT name FROM cities WHERE label = `from`) AS `Откуда`,
	(SELECT name FROM cities WHERE label = `to`) AS `Куда`
FROM flights;

-- вариант с JOIN
SELECT id,
    from_label.name AS 'Откуда',
    to_label.name   AS 'Куда'
FROM flights
    JOIN cities from_label ON flights.`from` = from_label.label
    JOIN cities to_label ON flights.`to` = to_label.label
ORDER BY id;