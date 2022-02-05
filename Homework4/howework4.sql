-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT firstname FROM users;

-- Как вариант. Выводить уникальные значения полей можно также с помощью группировки данных (GROUP BY) в запросе SELECT.
-- select distinct firstname from users group by firstname;


-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
ALTER TABLE profiles 
ADD COLUMN is_active BOOLEAN DEFAULT FALSE;

-- Поле is_active - логическое, т.е. должно принимать только значения "да", "нет". Поэтому для него в MySQL в качестве типа данных разумнее выбирать BIT.
-- то есть: add column is_active bit default false;

UPDATE profiles
SET is_active = true
WHERE YEAR(CURRENT_DATE) - YEAR(birthday) > 18;

-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
DELETE FROM messages
WHERE created_at > NOW();

