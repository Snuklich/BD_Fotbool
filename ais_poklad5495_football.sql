-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 22 2022 г., 08:57
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_poklad5495_cinemapark`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Goal`
--

CREATE TABLE `Goal` (
  `id` int NOT NULL COMMENT 'ID гола',
  `id_matchgame` int NOT NULL COMMENT 'ID матча',
  `id_player` int NOT NULL COMMENT 'ID игрока',
  `date_match` datetime(6) NOT NULL COMMENT 'время от начала матча'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сущность "Гол"';

-- --------------------------------------------------------

--
-- Структура таблицы `MatchGame`
--

CREATE TABLE `MatchGame` (
  `id` int NOT NULL COMMENT 'ID матча',
  `id_team1` int NOT NULL COMMENT 'ID команды 1',
  `id_team2` int NOT NULL COMMENT 'ID команды 2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сущность "Матч"';

-- --------------------------------------------------------

--
-- Структура таблицы `Player`
--

CREATE TABLE `Player` (
  `id` int NOT NULL COMMENT 'ID',
  `id_team` int NOT NULL COMMENT 'ID команды',
  `fullName` varchar(255) NOT NULL COMMENT 'ФИО',
  `amplua` varchar(255) NOT NULL COMMENT 'Роль игрока'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сущность "Игрок"';

-- --------------------------------------------------------

--
-- Структура таблицы `Team`
--

CREATE TABLE `Team` (
  `id` int NOT NULL COMMENT 'ID команды',
  `name` varchar(255) NOT NULL COMMENT 'Наименование команды'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сущность "Команда"';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Goal`
--
ALTER TABLE `Goal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_matchgame` (`id_matchgame`),
  ADD KEY `id_player` (`id_player`);

--
-- Индексы таблицы `MatchGame`
--
ALTER TABLE `MatchGame`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_team1` (`id_team1`),
  ADD KEY `id_team2` (`id_team2`);

--
-- Индексы таблицы `Player`
--
ALTER TABLE `Player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_team` (`id_team`);

--
-- Индексы таблицы `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Goal`
--
ALTER TABLE `Goal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID гола';

--
-- AUTO_INCREMENT для таблицы `MatchGame`
--
ALTER TABLE `MatchGame`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID матча';

--
-- AUTO_INCREMENT для таблицы `Player`
--
ALTER TABLE `Player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT для таблицы `Team`
--
ALTER TABLE `Team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID команды';

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Goal`
--
ALTER TABLE `Goal`
  ADD CONSTRAINT `Goal_ibfk_1` FOREIGN KEY (`id_matchgame`) REFERENCES `MatchGame` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Goal_ibfk_2` FOREIGN KEY (`id_player`) REFERENCES `Player` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `MatchGame`
--
ALTER TABLE `MatchGame`
  ADD CONSTRAINT `MatchGame_ibfk_1` FOREIGN KEY (`id_team1`) REFERENCES `Team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `MatchGame_ibfk_2` FOREIGN KEY (`id_team2`) REFERENCES `Team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Player`
--
ALTER TABLE `Player`
  ADD CONSTRAINT `Player_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `Team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
