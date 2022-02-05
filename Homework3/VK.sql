DROP DATABASE IF EXISTS vk;

CREATE DATABASE vk;

USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50) comment 'Фамилия',
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE,
	
	INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	gender CHAR(1),
	birthday DATE,
	photo_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	hometown_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES users(id)
);



DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY(from_user_id) REFERENCES users(id),
	FOREIGN KEY(to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests(
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	`status` ENUM('requested', 'approved', 'declined', 'unfriended'),
	request_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (initiator_user_id, target_user_id),
	FOREIGN KEY(initiator_user_id) REFERENCES users(id),
	FOREIGN KEY(target_user_id) REFERENCES users(id)
);

-- проверка на дружбу самому себе
ALTER TABLE friend_requests
ADD CHECK (initiator_user_id <> target_user_id);


DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL,
	name VARCHAR(100),
	admin_user_id BIGINT UNSIGNED NOT NULL,
	
	INDEX communities_name_idx(name),
	FOREIGN KEY(admin_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS user_communities;
CREATE TABLE user_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	communities_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, communities_id),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(communities_id) REFERENCES communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL,
	name VARCHAR(50),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL,
	media_type_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	filename VARCHAR(255),
	`size` INT,
	METADATA JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	
	FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS photos;
CREATE TABLE photos(
	id SERIAL,
	album_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY(album_id) REFERENCES photo_albums(id),
	FOREIGN KEY(media_id) REFERENCES media(id)
);



-- Домашнее задание. Создать 3 новые таблицы с перечнем полей, указанием индексов и внешних ключей


-- добавляем таблицу города
DROP TABLE IF EXISTS hometowns;
CREATE TABLE hometowns(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(255),
	
	FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Обновляем таблицу profiles. Добавляем ссылки на таблицы media и hometowns
ALTER TABLE profiles
ADD CONSTRAINT fk_photo_id FOREIGN KEY(photo_id) REFERENCES media(id),
ADD CONSTRAINT fk_hometown_id FOREIGN KEY(hometown_id) REFERENCES hometowns(id)
ON UPDATE CASCADE
ON DELETE restrict; 

-- добавляем таблицу посты пользователей
DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY(user_id) REFERENCES users(id)
);

-- добавляем таблицу лайки постов
DROP TABLE IF EXISTS like_posts;
CREATE TABLE like_posts(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	posts_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(posts_id) REFERENCES posts(id)
);




