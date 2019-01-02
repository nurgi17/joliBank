-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 02 2019 г., 13:30
-- Версия сервера: 10.1.36-MariaDB
-- Версия PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `spring_final_project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `iin_number` varchar(255) DEFAULT NULL,
  `is_blocked` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `amount`, `birth_date`, `created_date`, `currency_id`, `first_name`, `iin_number`, `is_blocked`, `last_name`, `name`) VALUES
(1, 39257.09, '1999-07-19', '2018-12-24', 5, 'Ansar', '990719312456', b'0', 'Kairat', 'KZ007770000000000001'),
(2, 103.00744499477082, '2000-09-21', '2018-12-24', 4, 'Nina', '000921873425', b'0', 'Craina', 'US007773275104829391'),
(3, 940, '1996-06-13', '2018-12-25', 4, 'Erzhan', '960613301855', b'0', 'Asylov', 'US007775664135596444'),
(4, 999000, '1970-06-13', '2019-01-02', 3, 'Malik', '700613456786', b'0', 'Ussenov', 'GB007776934785143585'),
(5, 90517.27272727274, '1970-08-22', '2019-01-02', 1, 'Raushan', '700822123456', b'0', 'Jumanova', 'RU007779763506593511');

-- --------------------------------------------------------

--
-- Структура таблицы `bank_total_balance`
--

CREATE TABLE `bank_total_balance` (
  `id` bigint(20) NOT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `value` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bank_total_balance`
--

INSERT INTO `bank_total_balance` (`id`, `currency_id`, `value`) VALUES
(1, 1, 1194828.1818181819),
(2, 2, 998830.90481786),
(3, 3, 1999000),
(4, 4, 720263.2834759358),
(5, 5, 1845321.11),
(6, 6, 1000000),
(7, 7, 1000000);

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `short_name`) VALUES
(1, 'Russian ruble', 'RUB'),
(2, 'Euro', 'EUR'),
(3, 'British pound', 'GBP'),
(4, 'United States dollar', 'USD'),
(5, 'Kazakhstani tenge', 'KZT'),
(6, 'Kyrgyzstani som', 'KGS'),
(7, 'Chinese yuan', 'CNY');

-- --------------------------------------------------------

--
-- Структура таблицы `currency_exchange`
--

CREATE TABLE `currency_exchange` (
  `id` bigint(20) NOT NULL,
  `assigned_time` datetime DEFAULT NULL,
  `purchase_value` double DEFAULT NULL,
  `sale_value` double DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency_exchange`
--

INSERT INTO `currency_exchange` (`id`, `assigned_time`, `purchase_value`, `sale_value`, `currency_id`) VALUES
(1, '2018-12-25 00:24:36', 5.4, 5.5, 1),
(2, '2018-12-25 09:45:27', 442.5, 444.5, 2),
(3, '2018-12-25 00:25:38', 472, 477, 3),
(4, '2019-01-02 16:33:13', 380.5, 383.5, 4),
(5, '2018-12-25 00:26:24', 5.1, 5.42, 6),
(6, '2018-12-25 00:26:44', 53.1, 54.1, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `operations`
--

CREATE TABLE `operations` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `operations`
--

INSERT INTO `operations` (`id`, `name`) VALUES
(1, 'EXCHANGE'),
(2, 'DEBET'),
(3, 'CREDIT'),
(4, 'TRANSFER');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MANAGER');

-- --------------------------------------------------------

--
-- Структура таблицы `transaction_histories`
--

CREATE TABLE `transaction_histories` (
  `id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `operation_time` datetime DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `operation_id` bigint(20) DEFAULT NULL,
  `receiver_account_id` bigint(20) DEFAULT NULL,
  `sender_account_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `transaction_histories`
--

INSERT INTO `transaction_histories` (`id`, `amount`, `operation_time`, `currency_id`, `manager_id`, `operation_id`, `receiver_account_id`, `sender_account_id`) VALUES
(1, 37120, '2018-12-25 03:09:29', 5, 2, 1, NULL, NULL),
(2, 1269.0951821386604, '2018-12-25 03:11:01', 2, 2, 1, NULL, NULL),
(3, 2673.7967914438505, '2018-12-25 03:16:38', 4, 2, 1, NULL, NULL),
(4, 495, '2018-12-25 03:59:02', 5, 2, 2, 1, 1),
(5, 495, '2018-12-25 04:18:03', 5, 2, 2, 1, 1),
(6, 495, '2018-12-25 04:18:26', 5, 2, 3, 1, 1),
(7, 495, '2018-12-25 04:20:43', 5, 2, 3, 1, 1),
(8, 65.55350553505535, '2018-12-25 06:20:16', 4, 2, 4, 2, 1),
(9, 70.11070110701107, '2018-12-25 06:24:26', 4, 2, 4, 2, 1),
(10, 70.11070110701107, '2018-12-25 06:26:12', 4, 2, 4, 2, 1),
(11, 9.69, '2018-12-25 08:32:35', 5, 4, 4, 1, 2),
(12, 3526.4, '2018-12-25 08:38:05', 5, 4, 4, 1, 2),
(13, 1.0160427807486632, '2018-12-25 08:38:38', 4, 4, 4, 2, 1),
(14, 44250, '2018-12-25 09:45:39', 5, 14, 1, NULL, NULL),
(15, 37700, '2018-12-25 09:46:18', 5, 14, 1, NULL, NULL),
(16, 4950, '2018-12-25 09:47:25', 4, 14, 3, 3, 3),
(17, 0, '2018-12-25 09:48:25', 4, 14, 4, 2, 3),
(18, 121.77, '2018-12-28 02:31:37', 4, 14, 3, 2, 2),
(19, 198, '2018-12-28 02:32:06', 4, 14, 2, 2, 2),
(20, 35815, '2018-12-28 02:32:53', 5, 14, 4, 1, 2),
(21, 37700, '2019-01-02 15:36:12', 5, 2, 1, NULL, NULL),
(22, 990, '2019-01-02 15:37:11', 4, 2, 3, 3, 3),
(23, 990, '2019-01-02 17:36:04', 1, 9, 3, 5, 5),
(24, 81527.27272727274, '2019-01-02 17:36:54', 1, 9, 4, 5, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `full_name`, `login`, `password`) VALUES
(1, 'UN', 'nurgi17', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e'),
(2, 'BZ', 'bex', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e'),
(5, 'MS', 'marfa_lamova', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e'),
(4, 'IZ', 'ilyas_real', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e'),
(6, 'SK', 'altynboy', 'd30afd521506d7d66c4a0954cc3948f16791eb05'),
(7, 'MU', 'ussenova_madina', '5cec175b165e3d5e62c9e13ce848ef6feac81bff'),
(8, 'OS', 'selbay_olzhas', 'c91222e9b1c7e43d3e8c302f0a1021538636ae91'),
(9, 'UN', 'ussen_nuradil', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e'),
(10, 'Xavier Martines', 'xavi_15', 'ad1eb86a359db49569ab48307d5cfd83faf963a3'),
(13, 'Jemain Caburo', 'jemain_jFriend', '2856afc8f78b78895e393fa3e0e9795925a7ea5e'),
(14, 'Kassir apai', 'kassir', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--

CREATE TABLE `users_roles` (
  `Users_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_roles`
--

INSERT INTO `users_roles` (`Users_id`, `roles_id`) VALUES
(1, 1),
(2, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs08d0ccyak63pou9tfk093dbk` (`currency_id`);

--
-- Индексы таблицы `bank_total_balance`
--
ALTER TABLE `bank_total_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcjxyqbg50i11snen760thk5d1` (`currency_id`);

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currency_exchange`
--
ALTER TABLE `currency_exchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrqqob6rjdms6eoxal2ttwnxrv` (`currency_id`);

--
-- Индексы таблицы `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transaction_histories`
--
ALTER TABLE `transaction_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2r5ercshyuribri1gdst521yd` (`currency_id`),
  ADD KEY `FK36t90tdbk0dygqdisfqts6sqe` (`manager_id`),
  ADD KEY `FKofryon7gdkvtk1tufxxpngsdt` (`operation_id`),
  ADD KEY `FKf715mhk00db7q7bn0mr84g5me` (`receiver_account_id`),
  ADD KEY `FKi7xaw3jo3thquarpxf8sip76q` (`sender_account_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`Users_id`,`roles_id`),
  ADD KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `bank_total_balance`
--
ALTER TABLE `bank_total_balance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `currency_exchange`
--
ALTER TABLE `currency_exchange`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `operations`
--
ALTER TABLE `operations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `transaction_histories`
--
ALTER TABLE `transaction_histories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
