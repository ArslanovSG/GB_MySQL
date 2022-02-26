-- CКРИПТЫ ХАРАКТЕРНЫХ ВЫБОРОК (ВКЛЮЧАЮЩИЕ ГРУППИРОВКИ, JOIN'Ы, ВЛОЖЕННЫЕ ТАБЛИЦЫ)

-- 1. Действующие полисы
SELECT * FROM `policy`
WHERE (start_date <= CURDATE()) AND (end_date >= CURDATE());

-- 2. Страховая премия полученная за последние 30 дней
SELECT p2.ser_number, p.prize_in, p2.date_conclusion
FROM prize p
JOIN policy p2 ON p.ser_number_id = p2.ser_number 
WHERE (p2.date_conclusion <= CURDATE()) AND (p2.date_conclusion >= CURDATE() - 30);

-- 3. Какое количество полисов оформили сотрудники
SELECT w.firstname, w.lastname, w.patronymic, w.post ,
COUNT(
	CASE 
		WHEN p.ser_number = a.ser_number_id 
		THEN 1 ELSE NULL 
	END) AS total
FROM agent a 
JOIN workers w ON a.id = w.id
JOIN policy p ON a.ser_number_id = p.ser_number
GROUP BY w.post;


-- ПРЕДСТАВЛЕНИЯ (МИНИМУМ 2)

-- 1. Перечень договоров, по которым премия оплачена
DROP VIEW IF EXISTS rec_payment;

CREATE OR REPLACE VIEW rec_payment AS 
SELECT p.ser_number, p.policyholder_id, p2.prize_in
FROM policy p 
JOIN prize p2 ON p.ser_number = p2.ser_number_id
WHERE p2.prize_in > 0

	AND 

	(start_date <= CURDATE()) AND (end_date >= CURDATE())
;

SELECT * FROM rec_payment;


-- 2. Перечень договоров, по которым премия не оплачена
DROP VIEW IF EXISTS nonrec_payment;

CREATE OR REPLACE VIEW nonrec_payment AS
SELECT p.ser_number, p.policyholder_id, p2.prize_in
FROM policy p 
JOIN prize p2 ON p.ser_number = p2.ser_number_id
WHERE p2.prize_in < 0

	AND 

	(start_date <= CURDATE()) AND (end_date >= CURDATE())
;

SELECT * FROM nonrec_payment;


-- ХРАНИМЫЕ ПРОЦЕДУРЫ / ТРИГГЕРЫ

-- 1. Триггер обновления страховой премии в сторону увеличения на 10%, если размер комисси превышает 10.
DROP TRIGGER IF EXISTS update_prize;

DELIMITER //
CREATE TRIGGER update_prize BEFORE UPDATE ON prize 
FOR EACH ROW
BEGIN
	IF comm_fee > 10 THEN SET New.prize_in = prize_in * 1.1;
	end if;
END//
DELIMITER ;

-- 2. Триггер контроля даты заключения (не может быть нулевой) и контроля даты началы срока действия (не может быть ранее даты заключения)
DROP TRIGGER IF EXISTS policy_control_insert;

DELIMITER //
CREATE TRIGGER policy_control_insert BEFORE INSERT ON policy
FOR EACH ROW
BEGIN
    IF NEW.date_conclusion IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date cannot be NULL';
	END IF;
    
    IF NEW.start_date > NEW.date_conclusion THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date cannot be greater than the date of conclusion';
	END IF;
END//
DELIMITER ;

-- 3. Процедура, которая определяет лучшего сотрудника по продажам за заданный период
DROP PROCEDURE IF EXISTS best_worker;

DELIMITER //
CREATE PROCEDURE best_worker (d1 DATE, d2 DATE)
BEGIN
	SELECT lastname, SUM(unsur_amount) AS 'Суммарные продажи'
	FROM workers
	INNER JOIN policy ON policy.workers_id = workers.id
	AND date_conclusion BETWEEN d1 AND d2
	GROUP BY lastname
	ORDER BY SUM(unsur_amount) DESC
	LIMIT 1;
END//
DELIMITER ;

CALL best_worker ('2021-01-01', '2021-06-30');

-- 4. Процедура, которая отобразит информацию о совершенных продажах, стоимость которых выше заданного числа
DROP PROCEDURE IF EXISTS info_orders;

DELIMITER //
CREATE PROCEDURE info_orders (total INT)
BEGIN
	SELECT ser_number, unsur_amount, date_conclusion
	FROM policy
	WHERE unsur_amount > total;
END//
DELIMITER ;

CALL info_orders(13000000);

