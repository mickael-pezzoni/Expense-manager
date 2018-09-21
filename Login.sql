-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  ven. 21 sep. 2018 à 14:30
-- Version du serveur :  10.1.35-MariaDB
-- Version de PHP :  7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expense-manager`
--

-- --------------------------------------------------------

--
-- Structure de la table `Login`
--

CREATE TABLE `Login` (
  `idLogin` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `idType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Login`
--

INSERT INTO `Login` (`idLogin`, `user`, `password`, `mail`, `idType`) VALUES
(1, 'micka', '123456', 'mickaelpezzoni@gmail.com', 1),
(2, 'mathieu', '123456', 'mathieu@greta.com', 3),
(4, 'test', 'test', 'toto@toto.fr', 3),
(5, 'root', 'root', 'root@root.fr', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`idLogin`),
  ADD KEY `Login_typeUtilisateur0_FK` (`idType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Login`
--
ALTER TABLE `Login`
  MODIFY `idLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `Login_typeUtilisateur0_FK` FOREIGN KEY (`idType`) REFERENCES `typeUtilisateur` (`idType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
