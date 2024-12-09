-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;

-- Listage de la structure de table cinema. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL,
  `id_personne` int DEFAULT NULL,
  PRIMARY KEY (`id_acteur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_acteur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.acteur : ~27 rows (environ)
INSERT INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21),
	(22, 22),
	(23, 23),
	(24, 35),
	(25, 36),
	(26, 37),
	(27, 38);

-- Listage de la structure de table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `anneeSortie` int DEFAULT NULL,
  `synopsis` text,
  `note` float NOT NULL DEFAULT '0',
  `affiche` varchar(255) NOT NULL DEFAULT '0',
  `id_realisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.film : ~15 rows (environ)
INSERT INTO `film` (`id_film`, `titre`, `duree`, `anneeSortie`, `synopsis`, `note`, `affiche`, `id_realisateur`) VALUES
	(1, 'Avengers : Endgame', 181, 2019, 'Les Avengers se regroupent pour inverser les effets du snap de Thanos et sauver l\'univers.', 8.4, 'https://cdn.traileraddict.com/content/marvel-studios/avengers-endgame-poster-35.jpg', NULL),
	(2, 'The Dark Knight: Le Chevalier Noir', 152, 2008, 'Batman doit affronter le Joker, un criminel sans scrupules qui menace Gotham City.', 9, 'https://image.tmdb.org/t/p/original/pKKvCaL1TPTVtbI6EeliyND3api.jpg', NULL),
	(3, 'Inception', 148, 2010, 'Un voleur spécialisé dans l\'extraction d\'idées doit réaliser l\'implantation d\'une idée.', 8.8, 'https://i.pinimg.com/originals/6e/25/74/6e25742131f52262b73d020e3f6c2ab2.jpg', NULL),
	(4, 'Interstellar', 169, 2014, 'Des astronautes voyagent à travers un trou de ver pour sauver l\'humanité en crise.', 8.6, 'https://flxt.tmsimg.com/assets/p10543523_p_v13_aq.jpg', NULL),
	(5, 'Titanic', 195, 1997, 'L\'histoire d\'amour entre Jack et Rose se déroule à bord du légendaire RMS Titanic.', 7.8, 'https://image.tmdb.org/t/p/original/vpsvHLkoeKUjceIMeNSqCp3xEyY.jpg', NULL),
	(6, 'Avatar', 162, 2009, 'Jake Sully, un ex-marine paraplégique, est envoyé sur la planète Pandora pour espionner.', 7.8, 'https://image.tmdb.org/t/p/original/b9ixaRHHhkdeMfUn3xOcHWY5IXI.jpg', NULL),
	(7, 'Deadpool', 108, 2016, 'Un ancien soldat des forces spéciales devenu mercenaire cherche à se venger de son agresseur.', 8, 'https://www.imgikzy.com/upload/vod/20221021-38/8c157b713079ae02c9deb2538e1a88bc.jpg', NULL),
	(8, 'Deadpool 2', 119, 2018, 'Deadpool forme une équipe pour protéger un jeune mutant des menaces de l\'avenir.', 7.7, 'https://i.pinimg.com/originals/41/5e/c5/415ec596fe7863623bcccfca9d6c2382.jpg', NULL),
	(9, 'Jurassic Park : Le Monde Perdu', 127, 1993, 'Des chercheurs retournent sur l\'île de Jurassic Park pour étudier les dinosaures survivants.', 6.9, 'https://www.tvguide.com/a/img/catalog/provider/1/2/1-9972933606.jpg', NULL),
	(10, 'Pulp Fiction', 154, 1994, 'Les destins croisés de criminels à Los Angeles, entre violence et humour noir.', 8.9, 'https://picfiles.alphacoders.com/371/thumb-1920-371109.jpg', NULL),
	(11, 'Forrest Gump', 142, 1994, 'L\'histoire de Forrest Gump, un homme simple mais au destin exceptionnel.', 8.8, 'https://www.originalfilmart.com/cdn/shop/files/forrest_gump_1991_original_film_art.webp?v=1700679183&width=1200', NULL),
	(12, 'Matrix', 136, 1999, 'Neo découvre que la réalité qu\'il connaît n\'est qu\'une simulation.', 8.7, 'https://www.rogerebert.com/wp-content/uploads/2024/03/The-Matrix.jpg', NULL),
	(13, 'Gladiator', 155, 2000, 'Un général romain trahi cherche à venger la mort de sa famille dans l\'arène des gladiateurs.', 8.5, 'https://i.pinimg.com/originals/97/e3/32/97e332e116d439c05a2ebf7fbc247f53.jpg', NULL),
	(14, 'Green Lantern', 114, 2011, '	Hal Jordan, un pilote d\'avion, reçoit un anneau magique et devient un super-héros.', 5.5, 'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/1f19fadf4dce201689d63e1dca2d6df83a3cc7b37b84982b5f1b1f010a1ec00a._RI_TTW_.jpg', NULL),
	(15, 'Terminator', 107, 1984, 'Un cyborg envoyé du futur pour tuer Sarah Connor, mère du futur leader de la résistance.', 8, 'https://i.etsystatic.com/27475238/r/il/7e8a92/3647228488/il_fullxfull.3647228488_37t3.jpg', NULL);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.genre : ~9 rows (environ)
INSERT INTO `genre` (`id_genre`, `type`) VALUES
	(1, 'Action'),
	(2, 'Aventure'),
	(3, 'Science-fiction'),
	(4, 'Thriller'),
	(5, 'Drame'),
	(6, 'Romance'),
	(7, 'Comédie'),
	(8, 'Crime'),
	(9, 'Fantastique');

-- Listage de la structure de table cinema. joue
CREATE TABLE IF NOT EXISTS `joue` (
  `id_film` int DEFAULT NULL,
  `id_acteur` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_acteur` (`id_acteur`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `FK_joue_acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `FK_joue_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK_joue_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.joue : ~30 rows (environ)
INSERT INTO `joue` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(2, 3, 3),
	(2, 4, 4),
	(3, 5, 5),
	(3, 6, 6),
	(4, 7, 7),
	(4, 8, 8),
	(5, 5, 24),
	(5, 9, 9),
	(6, 10, 10),
	(6, 11, 11),
	(7, 12, 12),
	(7, 13, 13),
	(8, 12, 12),
	(8, 14, 14),
	(9, 15, 16),
	(9, 16, 17),
	(10, 17, 18),
	(10, 18, 19),
	(11, 19, 20),
	(11, 21, 21),
	(12, 22, 22),
	(12, 23, 23),
	(14, 12, 25),
	(14, 20, 15),
	(13, 24, 26),
	(13, 25, 27),
	(15, 26, 28),
	(15, 27, 29);

-- Listage de la structure de table cinema. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sexe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dateNaissance` date NOT NULL,
  PRIMARY KEY (`id_personne`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.personne : ~38 rows (environ)
INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `sexe`, `dateNaissance`) VALUES
	(1, 'Downey Jr', 'Robert', 'M', '1965-04-04'),
	(2, 'Johansson', 'Scarlett', 'F', '1984-11-22'),
	(3, 'Bale', 'Christian', 'M', '1974-01-30'),
	(4, 'Ledger', 'Heath', 'M', '1979-04-04'),
	(5, 'DiCaprio', 'Leonardo', 'M', '1974-11-11'),
	(6, 'Gordon-Levitt', 'Joseph', 'M', '1971-02-17'),
	(7, 'McConaughey', 'Matthew', 'M', '1969-11-11'),
	(8, 'Hathaway', 'Anne', 'F', '1982-11-12'),
	(9, 'Winslet', 'Kate', 'F', '1975-10-05'),
	(10, 'Worthington', 'Sam', 'M', '1976-08-02'),
	(11, 'Saldana', 'Zoé', 'F', '1978-06-19'),
	(12, 'Reynolds', 'Ryan', 'M', '1976-10-23'),
	(13, 'Baccarin', 'Morena', 'F', '1979-06-17'),
	(14, 'Brolin', 'Josh', 'M', '1968-02-12'),
	(15, 'Neill', 'Sam', 'M', '1947-09-14'),
	(16, 'Dern', 'Laura', 'F', '1967-02-10'),
	(17, 'Travolta', 'John', 'M', '1954-02-18'),
	(18, 'Thurman', 'Uma', 'F', '1970-04-29'),
	(19, 'Hanks', 'Tom', 'M', '1956-07-09'),
	(20, 'Lively', 'Blake', 'F', '1987-08-25'),
	(21, 'Wright', 'Robin', 'F', '1966-04-08'),
	(22, 'Reeves', 'Keanu', 'M', '1964-09-02'),
	(23, 'Fishburne', 'Laurence', 'M', '1961-07-30'),
	(24, 'Russo', 'Anthony', 'M', '1970-02-04'),
	(25, 'Russo', 'Joe', 'M', '1971-07-15'),
	(26, 'Nolan', 'Christopher', 'M', '1970-07-30'),
	(27, 'Cameron', 'James', 'M', '1954-08-16'),
	(28, 'Miller', 'Tim', 'M', '1972-11-26'),
	(29, 'Leitch', 'David', 'M', '1972-10-01'),
	(30, 'Campbell', 'Martin', 'M', '1943-10-24'),
	(31, 'Spielberg', 'Steven', 'M', '1946-12-18'),
	(32, 'Tarantino', 'Quentin', 'M', '1963-03-27'),
	(33, 'Zemechis', 'Robert', 'M', '1952-05-14'),
	(34, 'Wachowski', 'Lana', 'F', '1965-06-22'),
	(35, 'Crowe', 'Russell', 'M', '1964-04-07'),
	(36, 'Phoenix', 'Joaquin', 'M', '1974-10-28'),
	(37, 'Schwarzenegger', 'Arnold', 'M', '1947-07-30'),
	(38, 'Hamilton', 'Linda', 'F', '1956-09-26');

-- Listage de la structure de table cinema. possede
CREATE TABLE IF NOT EXISTS `possede` (
  `id_film` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `FK__film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK__genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.possede : ~42 rows (environ)
INSERT INTO `possede` (`id_film`, `id_genre`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 8),
	(2, 5),
	(3, 1),
	(3, 3),
	(3, 4),
	(4, 2),
	(4, 5),
	(4, 3),
	(5, 5),
	(5, 6),
	(6, 1),
	(6, 2),
	(6, 3),
	(7, 1),
	(7, 2),
	(7, 7),
	(8, 1),
	(8, 2),
	(8, 7),
	(9, 1),
	(9, 2),
	(9, 3),
	(10, 8),
	(10, 5),
	(11, 5),
	(11, 6),
	(12, 1),
	(12, 3),
	(12, 4),
	(13, 1),
	(13, 2),
	(13, 5),
	(14, 1),
	(14, 2),
	(14, 9),
	(15, 1),
	(15, 3),
	(15, 4);

-- Listage de la structure de table cinema. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  KEY `FK_realisateur_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.realisateur : ~11 rows (environ)
INSERT INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 24),
	(2, 25),
	(3, 26),
	(4, 27),
	(5, 28),
	(6, 29),
	(7, 30),
	(8, 31),
	(9, 32),
	(10, 33),
	(11, 34);

-- Listage de la structure de table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL,
  `nomPersonnage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.role : ~29 rows (environ)
INSERT INTO `role` (`id_role`, `nomPersonnage`) VALUES
	(1, 'Iron Man'),
	(2, 'Black Widow'),
	(3, 'Batman'),
	(4, 'Le Joker'),
	(5, 'Dom Cobb'),
	(6, 'Arthur'),
	(7, 'Cooper'),
	(8, 'Amelia Brand'),
	(9, 'Rose DeWitt Bukater'),
	(10, 'Jake Sully'),
	(11, 'Neytiri'),
	(12, 'Deadpool'),
	(13, 'Vanessa Carlysle'),
	(14, 'Cable'),
	(15, 'Carol Ferris'),
	(16, 'Dr. Alan Grant'),
	(17, 'Ellie Sattler'),
	(18, 'Vincent Vega'),
	(19, 'Mia Wallace'),
	(20, 'Forrest Gump'),
	(21, 'Jenny Curran'),
	(22, 'Neo'),
	(23, 'Morpheus'),
	(24, 'Jake Dawson'),
	(25, 'Green Lantern'),
	(26, 'Maximus'),
	(27, 'Commodus'),
	(28, 'Terminator'),
	(29, 'Sarah Connor');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
