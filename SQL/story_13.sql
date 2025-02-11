-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 30 oct. 2024 à 14:47
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
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `messages` text NOT NULL,
  `id_joueur` int(100) NOT NULL,
  `date_heure_mess` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chat`
--

INSERT INTO `chat` (`id`, `messages`, `id_joueur`, `date_heure_mess`) VALUES
(1, 'salut ma biche ca va ?', 1, '2024-10-30 15:17:57');

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
(1, 'Power Of Memory');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `message_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `game_id`, `sender_id`, `content`, `message_date`) VALUES
(1, 1, 1, 'Great game!', '2024-10-29 09:52:41'),
(2, 1, 1, 'Enjoyed this round!', '2024-10-29 09:52:41'),
(3, 1, 1, 'Let\'92s go again!', '2024-10-29 09:52:41'),
(4, 1, 2, 'Nice score!', '2024-10-29 09:52:41'),
(5, 1, 2, 'Almost beat my record.', '2024-10-29 09:52:41'),
(6, 1, 2, 'Anyone want to play?', '2024-10-29 09:52:41'),
(7, 1, 3, 'This is addictive!', '2024-10-29 09:52:41'),
(8, 1, 3, 'I like the hard mode.', '2024-10-29 09:52:41'),
(9, 1, 3, 'Trying for a new high score!', '2024-10-29 09:52:41'),
(10, 1, 4, 'Good game everyone!', '2024-10-29 09:52:41'),
(11, 1, 4, 'Just finished a great round!', '2024-10-29 09:52:41'),
(12, 1, 4, 'Who else is playing?', '2024-10-29 09:52:41'),
(13, 1, 5, 'New favorite game!', '2024-10-29 09:52:41'),
(14, 1, 5, 'Can\'92t stop playing!', '2024-10-29 09:52:41'),
(15, 1, 5, 'Just got a new high score!', '2024-10-29 09:52:41'),
(16, 1, 1, 'Did anyone beat 2000 yet?', '2024-10-29 09:52:41'),
(17, 1, 2, 'Back again for more!', '2024-10-29 09:52:41'),
(18, 1, 3, 'Let\'92s go!', '2024-10-29 09:52:41'),
(19, 1, 4, 'Game on!', '2024-10-29 09:52:41'),
(20, 1, 5, 'Loving this game!', '2024-10-29 09:52:41'),
(21, 1, 1, 'Who else likes hard mode?', '2024-10-29 09:52:41'),
(22, 1, 2, 'Trying for the top score!', '2024-10-29 09:52:41'),
(23, 1, 3, 'Need to practice more!', '2024-10-29 09:52:41'),
(24, 1, 4, 'This round is tough!', '2024-10-29 09:52:41'),
(25, 1, 5, 'Going for 1700+ points!', '2024-10-29 09:52:41');

-- --------------------------------------------------------

--
-- Structure de la table `message_priver`
--

CREATE TABLE `message_priver` (
  `id` int(11) NOT NULL,
  `id_sender` varchar(100) NOT NULL,
  `id_receiver` varchar(100) NOT NULL,
  `contenu_message` varchar(100) NOT NULL,
  `date_heure_envoi` datetime DEFAULT NULL,
  `date_heure_lu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `message_priver`
--

INSERT INTO `message_priver` (`id`, `id_sender`, `id_receiver`, `contenu_message`, `date_heure_envoi`, `date_heure_lu`) VALUES
(1, 'Alice', 'Bob', 'Salut Bob!', '2024-10-01 10:00:00', '2024-10-01 10:15:00'),
(2, 'Bob', 'Alice', 'Salut Alice!', '2024-10-01 10:05:00', '2024-10-01 10:15:00'),
(3, 'Alice', 'David', 'Bonjour David!', '2024-10-02 11:00:00', '2024-10-02 11:30:00'),
(4, 'David', 'Alice', 'Bonjour Alice!', '2024-10-02 11:15:00', '2024-10-02 13:00:00'),
(5, 'Bob', 'David', 'Comment ça va?', '2024-10-03 12:00:00', '2024-10-03 12:10:00'),
(6, 'David', 'Bob', 'Ça va bien, merci!', '2024-10-03 12:05:00', '2024-10-03 12:15:20'),
(7, 'Alice', 'Eve', 'Hey Eve!', '2024-10-04 09:00:00', '2024-10-04 10:50:00'),
(8, 'Eve', 'Alice', 'Salut Alice!', '2024-10-04 09:10:00', '2024-10-04 10:50:00'),
(9, 'Bob', 'Eve', 'Comment se passe ta journée?', '2024-10-05 14:00:00', '2024-10-05 15:30:00'),
(10, 'Eve', 'Bob', 'Tout va bien, merci!', '2024-10-05 14:20:00', '2024-10-05 15:30:00'),
(11, 'Alice', 'Bob', 'As-tu vu le nouveau film?', '2024-10-06 19:00:00', '2024-10-06 20:00:00'),
(12, 'Bob', 'Alice', 'Oui, c était génial!', '2024-10-06 19:30:00', '2024-10-06 20:00:00'),
(13, 'David', 'Eve', 'On se voit ce weekend', '2024-10-07 16:00:00', '2024-10-07 17:00:00'),
(14, 'Eve', 'David', 'Oui, avec plaisir!', '2024-10-07 16:15:00', '2024-10-07 17:00:00'),
(15, 'Alice', 'David', 'Pret pour la réunion?', '2024-10-08 08:00:00', '2024-10-08 08:30:00'),
(16, 'David', 'Alice', 'Oui, je suis prêt!', '2024-10-08 08:05:00', '2024-10-08 08:30:00'),
(17, 'Bob', 'Alice', 'Quoi de neuf?', '2024-10-09 13:00:00', '2024-10-09 13:30:00'),
(18, 'Alice', 'Bob', 'Pas grand-chose!', '2024-10-09 13:10:00', '2024-10-09 13:30:00'),
(19, 'David', 'Eve', 'On se retrouve où?', '2024-10-10 17:00:00', '2024-10-10 18:30:00'),
(20, 'Eve', 'David', 'Au café habituel!', '2024-10-10 17:05:00', '2024-10-10 18:30:00');

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
(1, 1, 1, 'Easy', 1200, '2024-10-29 09:52:41'),
(2, 1, 1, 'Medium', 1500, '2024-10-29 09:52:41'),
(3, 1, 1, 'Hard', 2000, '2024-10-29 09:52:41'),
(4, 1, 1, 'Easy', 1300, '2024-10-29 09:52:41'),
(5, 1, 1, 'Medium', 1600, '2024-10-29 09:52:41'),
(6, 2, 1, 'Easy', 1100, '2024-10-29 09:52:41'),
(7, 2, 1, 'Medium', 1550, '2024-10-29 09:52:41'),
(8, 2, 1, 'Hard', 1950, '2024-10-29 09:52:41'),
(9, 2, 1, 'Easy', 1250, '2024-10-29 09:52:41'),
(10, 2, 1, 'Medium', 1650, '2024-10-29 09:52:41'),
(11, 3, 1, 'Easy', 1000, '2024-10-29 09:52:41'),
(12, 3, 1, 'Medium', 1450, '2024-10-29 09:52:41'),
(13, 3, 1, 'Hard', 1800, '2024-10-29 09:52:41'),
(14, 3, 1, 'Easy', 1350, '2024-10-29 09:52:41'),
(15, 3, 1, 'Medium', 1500, '2024-10-29 09:52:41'),
(16, 4, 1, 'Easy', 900, '2024-10-29 09:52:41'),
(17, 4, 1, 'Medium', 1400, '2024-10-29 09:52:41'),
(18, 4, 1, 'Hard', 1700, '2024-10-29 09:52:41'),
(19, 4, 1, 'Easy', 1250, '2024-10-29 09:52:41'),
(20, 4, 1, 'Medium', 1550, '2024-10-29 09:52:41'),
(21, 5, 1, 'Easy', 950, '2024-10-29 09:52:41'),
(22, 5, 1, 'Medium', 1350, '2024-10-29 09:52:41'),
(23, 5, 1, 'Hard', 1650, '2024-10-29 09:52:41'),
(24, 5, 1, 'Easy', 1150, '2024-10-29 09:52:41'),
(25, 5, 1, 'Medium', 1450, '2024-10-29 09:52:41');

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
(1, 'user1@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserOne', '2024-10-29 09:52:41', NULL),
(2, 'user2@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserTwo', '2024-10-29 09:52:41', NULL),
(3, 'user3@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserThree', '2024-10-29 09:52:41', NULL),
(4, 'user4@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserFour', '2024-10-29 09:52:41', NULL),
(5, 'user5@example.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddbd924ff7e8e4b3e0b', 'UserFive', '2024-10-29 09:52:41', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_joueur` (`id_joueur`);

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
  ADD KEY `sender_id` (`sender_id`);

--
-- Index pour la table `message_priver`
--
ALTER TABLE `message_priver`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT pour la table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `message_priver`
--
ALTER TABLE `message_priver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

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
