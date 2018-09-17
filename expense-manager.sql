-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 17 sep. 2018 à 15:49
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
-- Structure de la table `Admin`
--

CREATE TABLE `Admin` (
  `idAdmin` int(11) NOT NULL,
  `ad_Nom` varchar(50) NOT NULL,
  `ad_Prenom` varchar(50) NOT NULL,
  `idLogin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL,
  `cl_Nom` varchar(50) NOT NULL,
  `cl_Prenom` varchar(50) NOT NULL,
  `cl_tel` decimal(10,0) NOT NULL,
  `cl_email` varchar(50) NOT NULL,
  `idEntreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client_commercial`
--

CREATE TABLE `client_commercial` (
  `idCommercial` int(11) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Commercial`
--

CREATE TABLE `Commercial` (
  `idCommercial` int(11) NOT NULL,
  `co_Nom` varchar(50) NOT NULL,
  `co_Prenom` varchar(50) NOT NULL,
  `rib` varchar(30) NOT NULL,
  `idLogin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Commercial`
--

INSERT INTO `Commercial` (`idCommercial`, `co_Nom`, `co_Prenom`, `rib`, `idLogin`) VALUES
(1, 'Gregoire', 'Mathieu', 'd4sd5q464d', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Comptable`
--

CREATE TABLE `Comptable` (
  `idComptable` int(11) NOT NULL,
  `cp_Nom` varchar(50) NOT NULL,
  `cp_Prenom` varchar(50) NOT NULL,
  `tel` decimal(10,0) NOT NULL,
  `idLogin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Entreprise`
--

CREATE TABLE `Entreprise` (
  `idEntreprise` int(11) NOT NULL,
  `en_Nom` varchar(50) NOT NULL,
  `en_noSiret` int(11) NOT NULL,
  `en_ville` varchar(100) NOT NULL,
  `nbSalaries` int(11) NOT NULL,
  `en_adresse` varchar(100) NOT NULL,
  `codePostal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Frais`
--

CREATE TABLE `Frais` (
  `idFrais` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `r_etat` int(11) NOT NULL,
  `montant` decimal(15,3) NOT NULL,
  `idTypeFrais` int(11) NOT NULL,
  `idRemboursement` int(11) NOT NULL,
  `idJustificatif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `justificatifs`
--

CREATE TABLE `justificatifs` (
  `idJustificatif` int(11) NOT NULL,
  `j_commentaire` varchar(100) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  `idFrais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'mathieu', '123456', 'mathieu@greta.com', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Remboursement`
--

CREATE TABLE `Remboursement` (
  `idRemboursement` int(11) NOT NULL,
  `r_date` date NOT NULL,
  `r_periode` int(11) NOT NULL,
  `r_montant` decimal(15,3) NOT NULL,
  `idFrais` int(11) NOT NULL,
  `idCommercial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeFrais`
--

CREATE TABLE `typeFrais` (
  `idTypeFrais` int(11) NOT NULL,
  `typeFrais` varchar(50) NOT NULL,
  `budget` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeUtilisateur`
--

CREATE TABLE `typeUtilisateur` (
  `idType` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typeUtilisateur`
--

INSERT INTO `typeUtilisateur` (`idType`, `type`) VALUES
(1, 'superAdmin'),
(2, 'Admin'),
(3, 'Commercial'),
(4, 'Comptable');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD KEY `Admin_Login0_FK` (`idLogin`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `Client_Entreprise0_FK` (`idEntreprise`);

--
-- Index pour la table `client_commercial`
--
ALTER TABLE `client_commercial`
  ADD PRIMARY KEY (`idCommercial`,`idClient`),
  ADD KEY `client_commercial_Client1_FK` (`idClient`);

--
-- Index pour la table `Commercial`
--
ALTER TABLE `Commercial`
  ADD PRIMARY KEY (`idCommercial`),
  ADD KEY `Commercial_Login0_FK` (`idLogin`);

--
-- Index pour la table `Comptable`
--
ALTER TABLE `Comptable`
  ADD PRIMARY KEY (`idComptable`),
  ADD KEY `Comptable_Login0_FK` (`idLogin`);

--
-- Index pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  ADD PRIMARY KEY (`idEntreprise`);

--
-- Index pour la table `Frais`
--
ALTER TABLE `Frais`
  ADD PRIMARY KEY (`idFrais`),
  ADD UNIQUE KEY `Frais_Remboursement0_AK` (`idRemboursement`),
  ADD UNIQUE KEY `Frais_justificatifs1_AK` (`idJustificatif`),
  ADD KEY `Frais_typeFrais0_FK` (`idTypeFrais`);

--
-- Index pour la table `justificatifs`
--
ALTER TABLE `justificatifs`
  ADD PRIMARY KEY (`idJustificatif`),
  ADD UNIQUE KEY `justificatifs_Frais0_AK` (`idFrais`);

--
-- Index pour la table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`idLogin`),
  ADD KEY `Login_typeUtilisateur0_FK` (`idType`);

--
-- Index pour la table `Remboursement`
--
ALTER TABLE `Remboursement`
  ADD PRIMARY KEY (`idRemboursement`),
  ADD UNIQUE KEY `Remboursement_Frais0_AK` (`idFrais`),
  ADD KEY `Remboursement_Commercial1_FK` (`idCommercial`);

--
-- Index pour la table `typeFrais`
--
ALTER TABLE `typeFrais`
  ADD PRIMARY KEY (`idTypeFrais`);

--
-- Index pour la table `typeUtilisateur`
--
ALTER TABLE `typeUtilisateur`
  ADD PRIMARY KEY (`idType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Commercial`
--
ALTER TABLE `Commercial`
  MODIFY `idCommercial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Comptable`
--
ALTER TABLE `Comptable`
  MODIFY `idComptable` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  MODIFY `idEntreprise` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Frais`
--
ALTER TABLE `Frais`
  MODIFY `idFrais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `justificatifs`
--
ALTER TABLE `justificatifs`
  MODIFY `idJustificatif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Login`
--
ALTER TABLE `Login`
  MODIFY `idLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Remboursement`
--
ALTER TABLE `Remboursement`
  MODIFY `idRemboursement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typeFrais`
--
ALTER TABLE `typeFrais`
  MODIFY `idTypeFrais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typeUtilisateur`
--
ALTER TABLE `typeUtilisateur`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD CONSTRAINT `Admin_Login0_FK` FOREIGN KEY (`idLogin`) REFERENCES `Login` (`idLogin`);

--
-- Contraintes pour la table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_Entreprise0_FK` FOREIGN KEY (`idEntreprise`) REFERENCES `Entreprise` (`idEntreprise`);

--
-- Contraintes pour la table `client_commercial`
--
ALTER TABLE `client_commercial`
  ADD CONSTRAINT `client_commercial_Client1_FK` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`),
  ADD CONSTRAINT `client_commercial_Commercial0_FK` FOREIGN KEY (`idCommercial`) REFERENCES `Commercial` (`idCommercial`);

--
-- Contraintes pour la table `Commercial`
--
ALTER TABLE `Commercial`
  ADD CONSTRAINT `Commercial_Login0_FK` FOREIGN KEY (`idLogin`) REFERENCES `Login` (`idLogin`);

--
-- Contraintes pour la table `Comptable`
--
ALTER TABLE `Comptable`
  ADD CONSTRAINT `Comptable_Login0_FK` FOREIGN KEY (`idLogin`) REFERENCES `Login` (`idLogin`);

--
-- Contraintes pour la table `Frais`
--
ALTER TABLE `Frais`
  ADD CONSTRAINT `Frais_Remboursement1_FK` FOREIGN KEY (`idRemboursement`) REFERENCES `Remboursement` (`idRemboursement`),
  ADD CONSTRAINT `Frais_justificatifs2_FK` FOREIGN KEY (`idJustificatif`) REFERENCES `justificatifs` (`idJustificatif`),
  ADD CONSTRAINT `Frais_typeFrais0_FK` FOREIGN KEY (`idTypeFrais`) REFERENCES `typeFrais` (`idTypeFrais`);

--
-- Contraintes pour la table `justificatifs`
--
ALTER TABLE `justificatifs`
  ADD CONSTRAINT `justificatifs_Frais0_FK` FOREIGN KEY (`idFrais`) REFERENCES `Frais` (`idFrais`);

--
-- Contraintes pour la table `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `Login_typeUtilisateur0_FK` FOREIGN KEY (`idType`) REFERENCES `typeUtilisateur` (`idType`);

--
-- Contraintes pour la table `Remboursement`
--
ALTER TABLE `Remboursement`
  ADD CONSTRAINT `Remboursement_Commercial1_FK` FOREIGN KEY (`idCommercial`) REFERENCES `Commercial` (`idCommercial`),
  ADD CONSTRAINT `Remboursement_Frais0_FK` FOREIGN KEY (`idFrais`) REFERENCES `Frais` (`idFrais`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
