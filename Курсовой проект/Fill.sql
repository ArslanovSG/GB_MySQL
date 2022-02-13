-- скрипты наполнения БД данными
-- Таблица Страхователь
INSERT INTO `policyholder` (`id`, `firstname`, `lastname`, `patronymic`, `birthdate`, `pass`, `whopass`, `add_index`, `add_area`, `add_region`, `add_city`, `add_house`, `add_flat`, `email`, `phone`, `gender`) 
VALUES  ('1', 'Руслан', 'Лобанов', 'Романович', '1977-07-06', '5643463545', 'quaerat', '419024', 'ad', 'distinctio', 'Волоколамск', '4', '198', 'leonid83@example.net', '4959205260', 'м'), 
		('2', 'Марк', 'Виноградов', 'Александрович', '2010-11-28', '4674860396', 'sed', '183596', 'aut', 'qui', 'Красногорск', '71', '172', 'fedosa.kudravcev@example.com', '4956297862', 'м'), 
		('3', 'Никита', 'Зиновьев', 'Сергеевич', '2007-04-04', '20235913597', 'repellat', '041071', 'incidunt', 'vel', 'Балашиха', '100', '304', 'nosov.natala@example.com', '5222387810', 'м'), 
		('4', 'Фёдор', 'Гаврилов', 'Евгеньевич', '1980-05-22', '1027562857', 'sed', '184115', 'et', 'voluptas', 'Коломна', '45', '488', 'lytkina.vlad@example.com', '88009676905', 'м'), 
		('5', 'Марк', 'Горбачёв', 'Фёдорович', '1984-01-22', '3103948562', 'aut', '881490', 'rerum', 'deleniti', 'Подольск', '73', '13', 'omatveeva@example.com', '8122091326', 'м'), 
		('6', 'Тамара', 'Силина', 'Алексеевна', '2011-05-05', '1230294511', 'praesentium', '321473', 'ab', 'unde', 'Серпухов', '98', '440', 'nazar96@example.org', '8120860476', 'ж'), 
		('7', 'Платон', 'Никонов', 'Александрович', '1975-06-26', '4209765278', 'eos', '308971', 'necessitatibus', 'voluptatem', 'Мытищи', '83', '140', 'vasilisa.panfilov@example.net', '35222623557', 'м'), 
		('8', 'Роберт', 'Селиверстов', 'Львович', '2013-06-16', '7123456789', 'dolorum', '955227', 'sed', 'doloremque', 'Кашира', '60', '149', 'noskova.vikentij@example.org', '9228422572', 'м'), 
		('9', 'Юлия', 'Фадеева', 'Фёдоровна', '1989-10-20', '1030981276', 'totam', '856642', 'voluptas', 'eos', 'Наро-Фоминск', '25', '150', 'prohor34@example.com', '9225850802', 'ж'), 
		('10', 'Трофим', 'Прохоров', 'Андреевич', '1987-03-30', '8102938475', 'voluptas', '433408', 'repudiandae', 'aliquid', 'Солнечногорск', '19', '217', 'wsilov@example.org', '8126937803', 'м');
	
-- Таблица Объект Страхования
INSERT INTO `object` (`id`, `name`, `body`) 
VALUES  ('1', 'eligendi', 'Facilis et sit dolor enim. Facilis quasi est explicabo exercitationem ut porro. Esse sit dolores illum maiores aperiam earum. Aspernatur in est eligendi in vel ea. Laudantium nemo odio voluptas minus voluptatem. Eum maxime iste repudiandae.'), 
		('2', 'recusandae', 'Enim pariatur distinctio laborum consequuntur qui perferendis necessitatibus. Officiis quod et quia impedit esse sit et omnis. Sint voluptatem repellendus voluptatem est similique rerum modi dolores. Non quo unde sed. Est corrupti sed sint et tenetur beatae. Repellendus non neque alias porro deserunt. Voluptatum voluptas expedita autem.'), 
		('3', 'qui', 'Possimus molestiae mollitia totam ab. Ut consequatur voluptas quod veniam sapiente nulla et. Beatae rerum atque beatae illo aut sint rerum. Reprehenderit cumque odit dolor.'), 
		('4', 'ut', 'Praesentium quos sed eum dolore recusandae eum nisi. Autem sit eum quas et illum et. Cupiditate nihil facilis ut ipsam corrupti dicta. In similique id aut ut delectus. Consequatur harum omnis voluptatem consequatur. Rem dicta amet quisquam culpa repellendus quibusdam aut. Beatae magnam quas tempora ducimus. Quibusdam impedit sed officiis aperiam fugit explicabo voluptatem. Id aperiam recusandae in. Vel earum voluptas soluta minima et voluptas. Et consequuntur et aliquam accusamus fugiat. Ut dolores asperiores cum quia maiores quis. Officiis omnis quia nemo nobis excepturi reprehenderit. Odio aut ut officia quidem sed nihil. Aut sint error quo iure sunt. Minima odit dolor autem earum ut tempore deserunt. Quia quo cumque eos consequuntur. Perspiciatis repellendus quia quam. Id ad voluptatem eius fugiat quia quis impedit.'), 
		('5', 'sed', 'Aut quis assumenda dignissimos natus corporis voluptatibus eaque. Ipsam ut modi error et. Sunt commodi totam nemo fugit quam. Accusamus ducimus ut quidem similique consequuntur quo. Quia qui fugiat minus accusantium id. Cupiditate totam enim quibusdam rerum dolor. Eligendi sed non qui est in voluptatum et recusandae. Aspernatur quibusdam reiciendis aperiam ab atque doloribus. Distinctio eos sed aut ut dolores consectetur saepe. Vel atque aperiam est vel. Repellat vel et ipsa nulla qui. Et molestias temporibus ab dolorem. Omnis molestiae voluptate placeat consequatur repellendus. Eveniet error fugit voluptatem aperiam beatae. Voluptates reprehenderit dignissimos consequuntur veniam dolores dolor. Sit ut incidunt eveniet totam laboriosam. Quos asperiores aliquam delectus aut aut eum voluptate. Omnis ea rerum magni amet qui. Qui magnam animi qui placeat facere. Placeat hic voluptatum beatae modi veritatis et saepe illo.'), 
		('6', 'suscipit', 'Praesentium quisquam reprehenderit blanditiis explicabo eveniet nihil dolor. Voluptatem et mollitia assumenda consequatur quia quis doloribus unde. Eius mollitia et quibusdam tempora voluptate inventore sint. Vero veniam aut expedita quia reiciendis. Aut quia et illo aliquam numquam mollitia nobis. Perspiciatis placeat cumque ut enim eum consequatur quaerat. Aspernatur minus et esse quasi dolorum. Est eius molestiae ut rerum eius eveniet et. Et dolorum quo quia dolores. Esse ut eius maxime. Ut eum dignissimos voluptatum magnam. Fugiat voluptas explicabo vel consequuntur dolorem. Corrupti molestiae esse laboriosam porro at ut qui. Laborum voluptatem culpa nobis deleniti voluptatibus. Modi porro quis distinctio. Ut quaerat pariatur iure rerum iure rerum nam. Alias alias sunt natus assumenda. Itaque tenetur veniam similique voluptates cupiditate. Qui illum quae mollitia ea consectetur iste placeat.'), 
		('7', 'et', 'Ratione nihil aperiam reprehenderit amet sit.'), 
		('8', 'rerum', 'Nesciunt animi reiciendis iusto ducimus eos alias. Totam recusandae quae provident vel nemo iure. Accusantium et dolorem esse quod veritatis. Quia cum illo non. Qui voluptatem saepe delectus molestias. Sapiente perspiciatis eos blanditiis alias distinctio voluptatum porro. Et dignissimos deserunt consectetur corrupti quo nam. Rerum tenetur illo et dicta ratione ad.'), 
		('9', 'neque', 'Perferendis ipsum cum rerum consequatur quidem fugiat doloribus at. Est sint inventore aspernatur voluptatem. Esse aut rem aut sint. Laboriosam voluptates corrupti soluta vel autem. Magnam et quo laudantium laboriosam aspernatur pariatur itaque. Necessitatibus illum occaecati ad eum dolor. Inventore tempore expedita voluptatem molestias expedita. Perferendis vel ullam voluptate. Dolore aut asperiores aspernatur similique aliquid alias. Consequatur impedit earum voluptas quas corrupti numquam. Repellat aliquam facere iste aliquid similique. Voluptatem quis perferendis eaque rerum corporis soluta sunt. Veritatis quia quia explicabo eum aspernatur velit quis.'), 
		('10', 'eius', 'Enim quia aliquid aliquid eligendi animi.');
	
-- Таблица Выгодоприобретатель
INSERT INTO `beneficiary` (`id`, `name`, `body`) 
VALUES  ('1', 'at', 'Quisquam consectetur id ad. Nam est et ut esse qui.'), 
		('2', 'fugiat', 'Laboriosam atque veniam et aut. Expedita sunt ex et libero iure nesciunt.'), 
		('3', 'sit', 'In inventore quia id quis omnis eos ut.'), 
		('4', 'expedita', 'Illum laboriosam voluptas dolor. Veniam et reiciendis porro aliquam accusantium voluptatem.'), 
		('5', 'aut', 'Qui aperiam odio aut quos quas et.'), 
		('6', 'eaque', 'Nihil dolor iusto maxime ut velit. Praesentium soluta aut a repellendus distinctio consequuntur.'), 
		('7', 'qui', 'Est provident ad amet quasi facilis itaque. Eligendi necessitatibus blanditiis optio architecto qui doloremque.'), 
		('8', 'aut', 'Cupiditate vel a officiis dolore quis beatae a. Itaque est ab veritatis maxime autem est non.'), 
		('9', 'adipisci', 'Qui voluptate reprehenderit et quos in reprehenderit. Voluptatem quia velit mollitia dolor.'), 
		('10', 'sunt', 'Officiis quod aut nobis enim quod. Laboriosam dignissimos aspernatur sequi laboriosam adipisci omnis praesentium quam.');
	
-- Таблица Банк
INSERT INTO `bank` (`id`, `name`, `body`) 
VALUES  ('1', 'id', 'Sit sit quasi ut. Suscipit molestiae est repellat quia tempore dolores occaecati.'), 
		('2', 'quas', 'Accusamus maxime animi voluptatum a aut et sed. Ea eum officiis delectus ad.'), 
		('3', 'ea', 'Et rerum nemo qui qui officia. Rerum incidunt quas minus consequuntur quam.'), 
		('4', 'in', 'Ipsum molestias quia consequatur. Sint dicta ut aut id.'), 
		('5', 'nulla', 'Pariatur provident voluptatem necessitatibus eum.'), 
		('6', 'necessitatibus', 'Enim sit illum ab similique deleniti ipsa. Aliquid modi sed sit aliquam quia.'), 
		('7', 'facere', 'Accusantium et aut voluptas animi nobis. Nulla minus fugit vel aut sed impedit.'), 
		('8', 'dolores', 'Ex maiores voluptas quisquam ad. Voluptatem iste atque eum excepturi placeat ut.'), 
		('9', 'est', 'Ex saepe placeat occaecati esse corporis ducimus. Aut vitae eos qui.'), 
		('10', 'quibusdam', 'In nihil provident impedit repellendus accusamus. Dolore in porro repellat quia aperiam dolorem nostrum.');	
	
-- Таблица Лизинговая компания
INSERT INTO `leasing` (`id`, `name`, `body`) 
VALUES 	('1', 'sequi', 'Corrupti dolores qui amet voluptatem. Saepe exercitationem aut est totam.'), 
		('2', 'eligendi', 'Dolor dolorem magni reprehenderit quia.'), 
		('3', 'quasi', 'Dolorum cupiditate aut enim dolores suscipit in laboriosam.'), 
		('4', 'labore', 'Ullam recusandae qui sed dignissimos esse eum. Officia aperiam quaerat et et.'), 
		('5', 'provident', 'Qui qui dolor consequatur.'), 
		('6', 'aliquid', 'Ducimus voluptatem omnis et. Debitis voluptas beatae esse optio.'), 
		('7', 'aut', 'Cumque et recusandae quibusdam illum non ratione dolor.'), 
		('8', 'quia', 'Non nobis mollitia quis. Sit minus at magnam iste dolor distinctio.'), 
		('9', 'a', 'Earum modi nulla perspiciatis voluptatibus quia. Dolores ipsum ea consequatur facere eum atque molestias.'), 
		('10', 'consequuntur', 'Quia nostrum velit et et.');
	
-- Таблица Сотрудник компании
INSERT INTO `workers` (`id`, `firstname`, `lastname`, `patronymic`, `post`) 
VALUES  ('1', 'Семён', 'Богданов', 'Дмитриевич', 'Менеджер'), 
		('2', 'Милан', 'Ларионов', 'Фёдорович', 'Старший менеджер'), 
		('3', 'Дарья', 'Гордеева', 'Евгеньевна', 'Начальник отдела'), 
		('4', 'Альбина', 'Меркушева', 'Владимировна', 'Менеджер'), 
		('5', 'Регина', 'Логинова', 'Борисовна', 'Менеджер'), 
		('6', 'Юрий', 'Гаврилов', 'Дмитриевич', 'Главный менеджер'), 
		('7', 'Добрыня', 'Семёнов', 'Евгеньевич', 'Директор'), 
		('8', 'Василиса', 'Зыкова', 'Сергеевна', 'Старший менеджер'), 
		('9', 'Капитолина', 'Власова', 'Алексеевна', 'Менеджер'), 
		('10', 'Евгений', 'Бобылёв', 'Львович', 'Врач');
	
	
-- Таблица Страховой полис
INSERT INTO `policy` (`ser_number`, `policyholder_id`, `pass_id`, `date_conclusion`, `start_date`, `end_date`, `status`, `type_insur`, `unsur_amount`, `object_insur_id`, `comm_fee_id`, `workers_id`, `beneficiary_id`)
VALUES  ('1', '1', '1', 	'2021-12-14 07:01', '2021-12-27 16:56:03', '2022-12-26 02:44:22', 'не оформлен', 'КАСКО', '8935999.88',  '10', '13', '6', '1'), 
		('2', '2', '2', 	'2021-03-30 01:14', '2021-03-30 01:28:01', '2022-03-29 16:15:48', 'не оформлен', 'КАСКО', '2750904.45',  '9',  '16', '1', '8'), 
		('3', '3', '3', 	'2021-12-31 22:21', '2021-12-31 22:24:52', '2022-12-30 22:13:09', 'не оформлен', 'КАСКО', '6918480.86',  '8',  '18', '2', '6'), 
		('4', '4', '4', 	'2021-05-15 16:18', '2021-05-16 20:59:20', '2022-05-15 20:43:43', 'не оформлен', 'НС',    '16693576.33', '7',  '6',  '3', '7'), 
		('5', '5', '5', 	'2021-10-16 21:43', '2021-10-17 11:09:27', '2022-10-16 15:12:53', 'не оформлен', 'НС',    '18711999.36', '6',  '17', '6', '5'), 
		('6', '6', '6', 	'2021-06-24 16:39', '2021-06-25 09:48:17', '2022-06-24 05:32:09', 'оформлен', 	 'ДМС',   '9757760.96',  '5',  '16', '4', '2'), 
		('7', '7', '7', 	'2021-12-05 21:15', '2021-12-06 09:14:17', '2022-12-05 09:04:12', 'не оформлен', 'НС',    '682037.26',   '4',  '17', '7', '3'), 
		('8', '8', '8', 	'2021-10-26 19:45', '2021-10-28 11:31:52', '2022-10-27 22:39:03', 'оформлен',    'КАСКО', '5940112.24',  '3',  '9',  '8', '9'), 
		('9', '9', '9', 	'2021-10-30 12:55', '2021-10-31 09:44:05', '2022-10-30 02:24:44', 'оформлен',    'НС',    '10641962.96', '2',  '2',  '9', '4'), 
		('10', '10', '10', 	'2021-07-11 16:04', '2021-07-20 02:41:47', '2022-07-19 17:46:39', 'не оформлен', 'ДМС',   '13758121.38', '1',  '9',  '5', '10');
		
-- Таблица Страховой агент
INSERT INTO `agent` (`id`, `name`, `ser_number_id`, `comm_fee`) 
VALUES 	('1', 'consectetur', '1', '12.7'), 
		('2', 'provident', '2', '17.64'), 
		('3', 'repellat', '3', '4.3'), 
		('4', 'voluptatem', '4', '17.61'), 
		('5', 'possimus', '5', '7.2'), 
		('6', 'earum', '6', '2.66'), 
		('7', 'recusandae', '7', '16.45'), 
		('8', 'nobis', '8', '7.64'), 
		('9', 'deserunt', '9', '9.37'), 
		('10', 'sit', '10', '7.48');

-- Таблица Страховая премия
INSERT INTO `prize` (`id`, `prize_in`, `ser_number_id`) 
VALUES  ('1', '335459.64', '2'), 
		('2', '144637.34', '10'), 
		('3', '747171.72', '5'), 
		('4', '15552.31', '3'), 
		('5', '186439.52', '1'), 
		('6', '545750.33', '4'), 
		('7', '456558.1', '6'), 
		('8', '856606.99', '7'), 
		('9', '305212.34', '9'), 
		('10', '976266.36', '8');


-- Таблица Страховая выплата
INSERT INTO `payments` (`id`, `payment`, `ser_number_id`) 
VALUES  ('1', '678533.81', '2'), 
		('2', '615025.54', '1'), 
		('3', '791029.53', '3'), 
		('4', '233781.73', '3'), 
		('5', '609528.58', '4'), 
		('6', '886098.42', '5'), 
		('7', '609339.43', '6'), 
		('8', '947234.88', '7'), 
		('9', '453378.67', '8'), 
		('10', '73826.37', '9');
