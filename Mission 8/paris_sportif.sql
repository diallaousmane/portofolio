-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 17 nov. 2025 à 19:11
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `paris sportif`
--

-- --------------------------------------------------------

--
-- Structure de la table `gain`
--

CREATE TABLE `gain` (
  `id_gain` int NOT NULL,
  `id_pari` int NOT NULL,
  `montant_gain` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE `match` (
  `id_match` int NOT NULL,
  `equipe_dom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `equipe_ext` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_match` datetime NOT NULL,
  `id_sport` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `match`
--

INSERT INTO `match` (`id_match`, `equipe_dom`, `equipe_ext`, `date_match`, `id_sport`) VALUES
(1, 'PSG', 'OM', '2025-11-17 19:04:00', 1),
(2, 'PSG', 'OM', '2025-11-17 19:04:00', 1),
(3, 'Lakers', 'Bulls', '2025-11-17 19:04:20', 3),
(4, 'Lakers', 'Bulls', '2025-11-17 19:04:20', 3),
(5, 'Nadal', 'Federer', '2025-11-17 19:04:43', 5),
(6, 'Nadal', 'Federer', '2025-11-17 19:04:43', 5);

-- --------------------------------------------------------

--
-- Structure de la table `pari`
--

CREATE TABLE `pari` (
  `id_pari` int NOT NULL,
  `id_user` int NOT NULL,
  `id_typepari` int NOT NULL,
  `id_match` int NOT NULL,
  `mise` decimal(6,2) NOT NULL,
  `choix` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id_sport` int NOT NULL,
  `nom_sport` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id_sport`, `nom_sport`) VALUES
(1, 'Football'),
(2, 'Football'),
(3, 'Basketball'),
(4, 'Basketball'),
(5, 'Tennis'),
(6, 'Tennis');

-- --------------------------------------------------------

--
-- Structure de la table `typepari`
--

CREATE TABLE `typepari` (
  `id_typepari` int NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `typepari`
--

INSERT INTO `typepari` (`id_typepari`, `description`) VALUES
(1, '-Vainqueur du match'),
(2, '-Vainqueur du match'),
(3, 'Nombre de buts'),
(4, 'Nombre de buts'),
(5, 'Score exact');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_user` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `nom`, `prenom`, `email`) VALUES
(7, 'Dupont', 'Marc', ''),
(10, 'Lopez', 'Sara', 'Lopez.sara'),
(13, 'Idrissi ', 'Karim', 'Idrissi.karil');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `gain`
--
ALTER TABLE `gain`
  ADD PRIMARY KEY (`id_gain`),
  ADD KEY `id_pari` (`id_pari`);

--
-- Index pour la table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id_match`),
  ADD KEY `id_sport` (`id_sport`);

--
-- Index pour la table `pari`
--
ALTER TABLE `pari`
  ADD PRIMARY KEY (`id_pari`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_typepari` (`id_typepari`),
  ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_sport`);

--
-- Index pour la table `typepari`
--
ALTER TABLE `typepari`
  ADD PRIMARY KEY (`id_typepari`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `gain`
--
ALTER TABLE `gain`
  MODIFY `id_gain` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `match`
--
ALTER TABLE `match`
  MODIFY `id_match` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `pari`
--
ALTER TABLE `pari`
  MODIFY `id_pari` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sport`
--
ALTER TABLE `sport`
  MODIFY `id_sport` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `typepari`
--
ALTER TABLE `typepari`
  MODIFY `id_typepari` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`id_sport`) REFERENCES `sport` (`id_sport`);

--
-- Contraintes pour la table `pari`
--
ALTER TABLE `pari`
  ADD CONSTRAINT `pari_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`),
  ADD CONSTRAINT `pari_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`),
  ADD CONSTRAINT `pari_ibfk_3` FOREIGN KEY (`id_pari`) REFERENCES `gain` (`id_pari`),
  ADD CONSTRAINT `pari_ibfk_4` FOREIGN KEY (`id_typepari`) REFERENCES `typepari` (`id_typepari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
