-- Практическое задание по теме “Транзакции, переменные, представления”
-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
START TRANSACTION;

INSERT INTO sample.users 
SELECT id, name 
FROM shop.users 
WHERE id = 1;

COMMIT;

-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
CREATE OR REPLACE VIEW c_prod(prod_name, cat_name) AS
SELECT p.name, c.name
FROM products p
JOIN catalogs c ON p.catalog_id = c.id;

SELECT * FROM c_prod;

-- Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)
/* 1. Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
   второму пользователю shop — любые операции в пределах базы данных shop. */
DROP USER IF EXISTS shop_read;
CREATE USER shop_read;
GRANT SELECT ON shop.* TO shop_read;

DROP USER IF EXISTS shop;
CREATE USER shop;
GRANT ALL ON shop.* TO shop;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"
/* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
   с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/
DELIMITER //
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello()
RETURNS VARCHAR(50) READS SQL DATA
BEGIN
	CASE  
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN RETURN 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN RETURN 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN RETURN 'Добрый вечер';
		WHEN CURTIME() BETWEEN '00:00:00' AND '05:59:59' THEN RETURN 'Доброй ночи';
	END CASE;
END//
DELIMITER ;

SELECT hello();

/* 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. 
   Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
   При попытке присвоить полям NULL-значение необходимо отменить операцию.*/
DROP TRIGGER IF EXISTS inserts;
DELIMITER //
CREATE TRIGGER inserts BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(new.name) AND ISNULL(new.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Название и описание не может быть нулевым!';
	END IF;
END//
DELIMITER ;