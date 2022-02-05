/* 1. ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������. */
SELECT id, name FROM users
WHERE id IN (
    SELECT user_id FROM orders
);

-- ������� � JOIN
SELECT
	users.id,
	users.name
FROM orders
JOIN users 
ON (users.id=orders.user_id);

/* 2. �������� ������ ������� products � �������� catalogs, ������� ������������� ������. */

SELECT id, name, (
    SELECT name FROM catalogs WHERE id = catalog_id
) 
FROM products;

-- ������� � JOIN
SELECT 
	products.id, 
	products.name AS product,
    catalogs.name
FROM products 
LEFT JOIN catalogs 
ON catalogs.id = products.catalog_id;


/* 3. (�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). 
���� from, to � label �������� ���������� �������� �������, ���� name � �������. �������� ������ ������ flights � �������� ���������� �������. */

-- �������� ������� flights � flights
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

-- ��������� �������
INSERT INTO flights
VALUES (DEFAULT, 'Moscow', 'Irkutsk'),
       (DEFAULT, 'SPeterburg', 'Omsk'),
       (DEFAULT, 'Omsk', 'Moscow'),
       (DEFAULT, 'Kazan', 'Irkutsk'),
       (DEFAULT, 'Moscow', 'Kazan');

INSERT INTO cities
VALUES ('Moscow', '������'),
       ('Irkutsk', '�������'),
       ('SPeterburg', '�-���������'),
       ('Kazan', '������'),
       ('Omsk', '����');

-- ������� ������
SELECT id,
	(SELECT name FROM cities WHERE label = `from`) AS `������`,
	(SELECT name FROM cities WHERE label = `to`) AS `����`
FROM flights;

-- ������� � JOIN
SELECT id,
    from_label.name AS '������',
    to_label.name   AS '����'
FROM flights
    JOIN cities from_label ON flights.`from` = from_label.label
    JOIN cities to_label ON flights.`to` = to_label.label
ORDER BY id;