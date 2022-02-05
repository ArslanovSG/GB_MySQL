/* 1. ����� ����� ��������� ������������. �� ���� ������������� ���. ���� ������� ��������, ������� ������ ���� ������� � ��������� ������������� (������� ��� ���������). */
SELECT from_user_id,
	COUNT(*) AS total
FROM messages
WHERE to_user_id = 2
GROUP BY from_user_id
ORDER BY total DESC;


/* 2. ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���. */
SELECT COUNT(*) AS likes_total
FROM likes
WHERE user_id IN (
	SELECT user_id 
	FROM profiles
	WHERE YEAR(CURDATE()) - YEAR(birthday) < 10
);


/* 3. ���������� ��� ������ �������� ������ (�����): ������� ��� �������. */
-- ���������� ���������� ������
SELECT COUNT(*) AS likes, gender 
FROM likes, profiles
WHERE likes.user_id = profiles.user_id
GROUP BY gender;

-- �������� �� ������ ��� ������ �������� ������
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
   '�������', '�������'
  ) total; 
  

