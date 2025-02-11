-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 30 oct. 2024 à 12:46
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id`, `name`) VALUES
(1, 'Power Of Memory'),
(2, 'Overwatch');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `message_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `read_date` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `game_id`, `sender_id`, `receiver_id`, `content`, `message_date`, `read_date`, `is_read`) VALUES
(1, 1, 1, 2, 'Great game!', '2024-10-30 11:37:08', NULL, 0),
(2, 1, 1, 2, 'Enjoyed this round!', '2024-10-30 11:37:08', NULL, 0),
(3, 1, 1, 2, 'Let’s go again!', '2024-10-30 11:37:08', NULL, 0),
(4, 1, 2, 2, 'Nice score!', '2024-10-30 11:37:08', NULL, 0),
(5, 1, 2, 2, 'Almost beat my record.', '2024-10-30 11:37:08', NULL, 0),
(6, 1, 2, 2, 'Anyone want to play?', '2024-10-30 11:37:08', NULL, 0),
(7, 1, 3, 2, 'This is addictive!', '2024-10-30 11:37:08', NULL, 0),
(8, 1, 3, 2, 'I like the hard mode.', '2024-10-30 11:37:08', NULL, 0),
(9, 1, 3, 2, 'Trying for a new high score!', '2024-10-30 11:37:08', NULL, 0),
(10, 1, 4, 2, 'Good game everyone!', '2024-10-30 11:37:08', NULL, 0),
(11, 1, 4, 2, 'Just finished a great round!', '2024-10-30 11:37:08', NULL, 0),
(12, 1, 4, 2, 'Who else is playing?', '2024-10-30 11:37:08', NULL, 0),
(13, 1, 5, 2, 'New favorite game!', '2024-10-30 11:37:08', NULL, 0),
(14, 1, 5, 2, 'Can’t stop playing!', '2024-10-30 11:37:08', NULL, 0),
(15, 1, 5, 2, 'Just got a new high score!', '2024-10-30 11:37:08', NULL, 0),
(16, 1, 1, 2, 'Did anyone beat 2000 yet?', '2024-10-30 11:37:08', NULL, 0),
(17, 1, 2, 2, 'Back again for more!', '2024-10-30 11:37:08', NULL, 0),
(18, 1, 3, 2, 'Let’s go!', '2024-10-30 11:37:08', NULL, 0),
(19, 1, 4, 2, 'Game on!', '2024-10-30 11:37:08', NULL, 0),
(20, 1, 5, 2, 'Loving this game!', '2024-10-30 11:37:08', NULL, 0),
(21, 1, 1, 2, 'Who else likes hard mode?', '2024-10-30 11:37:08', NULL, 0),
(22, 1, 2, 2, 'Trying for the top score!', '2024-10-30 11:37:08', NULL, 0),
(23, 1, 3, 2, 'Need to practice more!', '2024-10-30 11:37:08', NULL, 0),
(24, 1, 4, 2, 'This round is tough!', '2024-10-30 11:37:08', NULL, 0),
(25, 1, 5, 2, 'Going for 1700+ points!', '2024-10-30 11:37:08', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `game_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `score`
--

INSERT INTO `score` (`id`, `player_id`, `game_id`, `difficulty`, `score`, `game_date`) VALUES
(1, 1, 1, 'Easy', 1200, '2024-10-30 11:37:08'),
(2, 1, 1, 'Medium', 1500, '2024-10-30 11:37:08'),
(3, 1, 1, 'Hard', 2000, '2024-10-30 11:37:08'),
(4, 1, 1, 'Easy', 1300, '2024-10-30 11:37:08'),
(5, 1, 1, 'Medium', 1600, '2024-10-30 11:37:08'),
(6, 2, 1, 'Easy', 1100, '2024-10-30 11:37:08'),
(7, 2, 1, 'Medium', 1550, '2024-10-30 11:37:08'),
(8, 2, 1, 'Hard', 1950, '2024-10-30 11:37:08'),
(9, 2, 1, 'Easy', 1250, '2024-10-30 11:37:08'),
(10, 2, 1, 'Medium', 1650, '2024-10-30 11:37:08'),
(11, 3, 2, 'Easy', 1000, '2024-10-30 11:37:08'),
(12, 3, 2, 'Medium', 1450, '2024-10-30 11:37:08'),
(13, 3, 2, 'Hard', 1800, '2024-10-30 11:37:08'),
(14, 3, 2, 'Easy', 1350, '2024-10-30 11:37:08'),
(15, 3, 2, 'Medium', 1500, '2024-10-30 11:37:08'),
(16, 4, 1, 'Easy', 900, '2024-10-30 11:37:08'),
(17, 4, 1, 'Medium', 1400, '2024-10-30 11:37:08'),
(18, 4, 1, 'Hard', 1700, '2024-10-30 11:37:08'),
(19, 4, 1, 'Easy', 1250, '2024-10-30 11:37:08'),
(20, 4, 1, 'Medium', 1550, '2024-10-30 11:37:08'),
(21, 5, 1, 'Easy', 950, '2024-10-30 11:37:08'),
(22, 5, 1, 'Medium', 1350, '2024-10-30 11:37:08'),
(23, 5, 1, 'Hard', 1780, '2024-10-30 11:37:08'),
(24, 5, 1, 'Easy', 1150, '2024-10-30 11:37:08'),
(25, 5, 1, 'Medium', 1450, '2024-10-30 11:37:08');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(64) NOT NULL,
  `username` varchar(50) NOT NULL,
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`, `registration_date`, `last_login`) VALUES
(1, 'user1@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserOne', '2024-10-30 11:37:08', NULL),
(2, 'user2@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserTwo', '2024-10-30 11:37:08', NULL),
(3, 'user3@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserThree', '2024-10-30 11:37:08', NULL),
(4, 'user4@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserFour', '2024-10-30 11:37:08', NULL),
(5, 'user5@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserFive', '2024-10-30 11:37:08', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Index pour la table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `game_id` (`game_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
