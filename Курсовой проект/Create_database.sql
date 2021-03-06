-- Область применения БД - страхование.
-- Задачей является отслеживание финансовой деятельности компании.
-- В зависимости от принимаемых на страхование объектов и страхуемых рисков, договор заключается по определенному виду страхования
-- При заключении договора фиксируется дата заключения, сроки страхования, страховая сумма, страховая премия, вид страхования и т.д.
-- Нужно учесть, что договоры заключают страховые агенты, кроме того, нужно указывать комиссионное вознаграждение агентам. 
-- Комиссионное вознаграждение составляет некоторую часть от страховой премии. Размер комиссионного вознаграждения зависит от вида страхования, по которому заключен договор.


DROP DATABASE IF EXISTS insurance;

CREATE DATABASE insurance;

USE insurance;

-- Страхователь
DROP TABLE IF EXISTS policyholder;
CREATE TABLE policyholder(
	id SERIAL AUTO_INCREMENT,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50), -- отчество
    birthdate DATE NOT NULL,
    pass BIGINT UNSIGNED NOT NULL PRIMARY KEY, -- серия и номер паспорта
    whopass VARCHAR(120) NOT NULL, -- кем выдан паспорт
    add_index BIGINT UNSIGNED NOT NULL, -- почтовый индекс
    add_area VARCHAR(50) NOT NULL, -- область
    add_region VARCHAR(50) NOT NULL, -- район
    add_city VARCHAR(50) NOT NULL, -- город
    add_house BIGINT UNSIGNED NOT NULL, -- номер дома
    add_flat BIGINT UNSIGNED, -- номер квартиры
	email VARCHAR(120) UNIQUE,
	phone BIGINT UNSIGNED UNIQUE,
	gender CHAR(1) NOT NULL,

	INDEX policyholder_firstname_lastname_idx(firstname, lastname)
);

-- Страховой полис
DROP TABLE IF EXISTS `policy`;
CREATE TABLE `policy`(
    ser_number BIGINT UNSIGNED NOT NULL UNIQUE, -- серия и номер полиса
    policyholder_id BIGINT UNSIGNED NOT NULL,
    pass_id BIGINT UNSIGNED NOT NULL, -- серия и номер паспорта страхователя
    date_conclusion DATETIME NOT NULL DEFAULT NOW(), -- дата заключения полиса
    `start_date` DATETIME NOT NULL, -- дата начала срока действия полиса
    `end_date` DATETIME NOT NULL, -- дата начала срока действия полиса
    `status` ENUM('оформлен', 'не оформлен') NOT NULL,
    type_insur ENUM('КАСКО', 'ОСАГО', 'НС', 'ДМС') NOT NULL, -- вид страхования
    unsur_amount DOUBLE(15, 2) NOT NULL, -- страховая сумма
    object_insur_id BIGINT UNSIGNED NOT NULL, -- объект страхования
    comm_fee_id BIGINT UNSIGNED NOT NULL, -- комиссионное вознаграждение
    workers_id BIGINT UNSIGNED NOT NULL, -- сотрудник компании
    beneficiary_id BIGINT UNSIGNED NOT NULL -- выгодоприобретатель
);

-- Страховой агент
DROP TABLE IF EXISTS agent;
CREATE TABLE agent(
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    ser_number_id BIGINT UNSIGNED NOT NULL,
    comm_fee DECIMAL(15, 2)
);

-- Объект страхования
DROP TABLE IF EXISTS `object`;
CREATE TABLE `object`(
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    body TEXT NOT NULL
);

-- Выгодоприобретатель
DROP TABLE IF EXISTS beneficiary;
CREATE TABLE beneficiary(
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    body TEXT NOT NULL
);

-- Банк
DROP TABLE IF EXISTS bank;
CREATE TABLE bank(
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    body TEXT NOT NULL
);

-- Лизинговая компания
DROP TABLE IF EXISTS leasing;
CREATE TABLE leasing(
    id SERIAL,
    name VARCHAR(100) NOT NULL,
    body TEXT NOT NULL
);

-- Страховая премия
DROP TABLE IF EXISTS prize;
CREATE TABLE prize(
    id SERIAL,
    prize_in DECIMAL(15, 2) UNSIGNED NOT NULL,
    ser_number_id BIGINT UNSIGNED NOT NULL
);

-- Страховая выплата
DROP TABLE IF EXISTS payments;
CREATE TABLE payments(
    id SERIAL,
    payment DECIMAL(15, 2) UNSIGNED NOT NULL,
    ser_number_id BIGINT UNSIGNED NOT NULL
);

-- Сотрудник компании
DROP TABLE IF EXISTS workers;
CREATE TABLE workers(
    id SERIAL,
    firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50), -- отчество
    post VARCHAR(50) NOT NULL -- должность сотрудника
);

-- Добавляем внешние ключи в таблицу policy
ALTER TABLE `policy`
ADD CONSTRAINT fk_policyholder_id FOREIGN KEY(policyholder_id) REFERENCES policyholder(id),
ADD CONSTRAINT fk_object_insur_id FOREIGN KEY(object_insur_id) REFERENCES `object`(id),
ADD CONSTRAINT fk_beneficiary_id FOREIGN KEY(beneficiary_id) REFERENCES beneficiary(id),
ADD CONSTRAINT fk_workers_id FOREIGN KEY(workers_id) REFERENCES workers(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- Добавляем внешние ключи в таблицу agent 
ALTER TABLE `agent` 
ADD CONSTRAINT fk_ser_number_id FOREIGN KEY(ser_number_id) REFERENCES `policy`(ser_number)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- Добавляем внешние ключи в таблицу bank
ALTER TABLE `bank` 
ADD CONSTRAINT fk1_id FOREIGN KEY(id) REFERENCES beneficiary(id)
ON UPDATE CASCADE
ON DELETE RESTRICT; 

-- Добавляем внешние ключи в таблицу leasing
ALTER TABLE `leasing` 
ADD CONSTRAINT fk2_id FOREIGN KEY(id) REFERENCES beneficiary(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- Добавляем внешние ключи в таблицу policyholder
ALTER TABLE `policyholder`
ADD CONSTRAINT fk3_id FOREIGN KEY(id) REFERENCES beneficiary(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- Добавляем внешние ключи в таблицу agent
ALTER TABLE `agent`
ADD CONSTRAINT fk4_id FOREIGN KEY(id) REFERENCES policyholder(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- Добавляем внешние ключи в таблицу prize
ALTER TABLE `prize` 
ADD CONSTRAINT fk1_ser_number_id FOREIGN KEY(ser_number_id) REFERENCES `policy`(ser_number)
ON UPDATE CASCADE
ON DELETE RESTRICT; 

-- Добавляем внешние ключи в таблицу payments
ALTER TABLE `payments` 
ADD CONSTRAINT fk2_ser_number_id FOREIGN KEY(ser_number_id) REFERENCES `policy`(ser_number)
ON UPDATE CASCADE
ON DELETE RESTRICT; 
