-- ii. �������� ������, ������������ ������ ���� (������ firstname) ������������� ��� ���������� � ���������� �������
SELECT DISTINCT firstname FROM users;

-- ��� �������. �������� ���������� �������� ����� ����� ����� � ������� ����������� ������ (GROUP BY) � ������� SELECT.
-- select distinct firstname from users group by firstname;


-- iii. �������� ������, ���������� ������������������ ������������� ��� ���������� (���� is_active = false). �������������� �������� ����� ���� � ������� profiles �� ��������� �� ��������� = true (��� 1)
ALTER TABLE profiles 
ADD COLUMN is_active BOOLEAN DEFAULT FALSE;

-- ���� is_active - ����������, �.�. ������ ��������� ������ �������� "��", "���". ������� ��� ���� � MySQL � �������� ���� ������ �������� �������� BIT.
-- �� ����: add column is_active bit default false;

UPDATE profiles
SET is_active = true
WHERE YEAR(CURRENT_DATE) - YEAR(birthday) > 18;

-- iv. �������� ������, ��������� ��������� ��� �������� (���� ������ �����������)
DELETE FROM messages
WHERE created_at > NOW();

