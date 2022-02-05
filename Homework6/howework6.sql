/* 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений). */
SELECT from_user_id,
	COUNT(*) AS total
FROM messages
WHERE to_user_id = 2
GROUP BY from_user_id
ORDER BY total DESC;


/* 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет. */
SELECT COUNT(*) AS likes_total
FROM likes
WHERE user_id IN (
	SELECT user_id 
	FROM profiles
	WHERE YEAR(CURDATE()) - YEAR(birthday) < 10
);


/* 3. Определить кто больше поставил лайков (всего): мужчины или женщины. */
-- Определяем количество лайков
SELECT COUNT(*) AS likes, gender 
FROM likes, profiles
WHERE likes.user_id = profiles.user_id
GROUP BY gender;

-- Отвечаем на вопрос кто больше поставил лайков
SELECT IF (
	(SELECT COUNT(id) 
	FROM LIKES 
	WHERE user_id IN (
		SELECT user_id 
		FROM profiles 
		WHERE gender="m")
		) 
		
	>  
	
	(SELECT COUNT(id) 
	FROM LIKES 
	WHERE user_id IN (
		SELECT user_id 
		FROM profiles 
		WHERE gender="f")
	), 
   'мужчины', 'женщины'
  ) total; 
  

