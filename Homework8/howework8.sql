/* 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений). */
SELECT from_user_id,
	COUNT(*) as total
FROM messages m
JOIN users u ON m.from_user_id = u.id
WHERE to_user_id = 2
GROUP BY from_user_id
ORDER BY total DESC;


/* 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет. */
SELECT COUNT(*) likes_total
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
WHERE YEAR(CURDATE()) - YEAR(birthday) < 10;


/* 3. Определить кто больше поставил лайков (всего): мужчины или женщины. */
-- Определяем количество лайков
SELECT COUNT(*) AS likes, gender 
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
GROUP BY gender;

-- Отвечаем на вопрос кто больше поставил лайков
 SELECT IF (
	(SELECT COUNT(id) 
	FROM likes l
	JOIN profiles p ON l.user_id = p.user_id
	WHERE gender="m")
		
	>  
	
	(SELECT COUNT(id) 
	FROM likes l
	JOIN profiles p ON l.user_id = p.user_id
	WHERE gender="f"),
   'мужчины', 'женщины'
  ) total; 
  