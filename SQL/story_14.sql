-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 30 oct. 2024 à 15:01
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
(20, 'Eve', 'David', 'MY BAD JE ME SUIS TROMPER C EST LA BIBLIOTHEQUE', '2024-10-30 16:01:17', '2024-10-10 18:30:00'),
(22, '', '', 'ce noeille humide frr', '2024-10-30 16:01:16', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `message_priver`
--
ALTER TABLE `message_priver`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `message_priver`
--
ALTER TABLE `message_priver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
