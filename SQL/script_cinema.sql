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
  `id_acteur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int DEFAULT NULL,
  PRIMARY KEY (`id_acteur`),
  KEY `FK_acteur_personne` (`id_personne`),
  CONSTRAINT `FK_acteur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.acteur : ~10 rows (environ)
REPLACE INTO `acteur` (`id_acteur`, `id_personne`) VALUES
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
	(27, 38),
	(28, 40);

-- Listage de la structure de table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `anneeSortie` int DEFAULT NULL,
  `synopsis` text,
  `note` float NOT NULL DEFAULT '0',
  `affiche` varchar(255) NOT NULL DEFAULT '0',
  `id_realisateur` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_film`),
  KEY `FK_film_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.film : ~16 rows (environ)
REPLACE INTO `film` (`id_film`, `titre`, `duree`, `anneeSortie`, `synopsis`, `note`, `affiche`, `id_realisateur`) VALUES
	(1, 'Avengers : Endgame', 181, 2019, 'Les Avengers se regroupent pour inverser les effets du snap de Thanos et sauver l\'univers.', 8.4, 'https://cdn.traileraddict.com/content/marvel-studios/avengers-endgame-poster-35.jpg', 1),
	(2, 'The Dark Knight: Le Chevalier Noir', 152, 2008, 'Batman doit affronter le Joker, un criminel sans scrupules qui menace Gotham City.', 9, 'https://image.tmdb.org/t/p/original/pKKvCaL1TPTVtbI6EeliyND3api.jpg', 3),
	(3, 'Inception', 148, 2010, 'Un voleur spécialisé dans l\'extraction d\'idées doit réaliser l\'implantation d\'une idée.', 8.8, 'https://i.pinimg.com/originals/6e/25/74/6e25742131f52262b73d020e3f6c2ab2.jpg', 3),
	(4, 'Interstellar', 169, 2014, 'Des astronautes voyagent à travers un trou de ver pour sauver l\'humanité en crise.', 8.6, 'https://flxt.tmsimg.com/assets/p10543523_p_v13_aq.jpg', 3),
	(5, 'Titanic', 195, 1997, 'L\'histoire d\'amour entre Jack et Rose se déroule à bord du légendaire RMS Titanic.', 7.8, 'https://image.tmdb.org/t/p/original/vpsvHLkoeKUjceIMeNSqCp3xEyY.jpg', 4),
	(6, 'Avatar', 162, 2009, 'Jake Sully, un ex-marine paraplégique, est envoyé sur la planète Pandora pour espionner.', 7.8, 'https://image.tmdb.org/t/p/original/b9ixaRHHhkdeMfUn3xOcHWY5IXI.jpg', 4),
	(7, 'Deadpool', 108, 2016, 'Un ancien soldat des forces spéciales devenu mercenaire cherche à se venger de son agresseur.', 8, 'https://www.imgikzy.com/upload/vod/20221021-38/8c157b713079ae02c9deb2538e1a88bc.jpg', 5),
	(8, 'Deadpool 2', 119, 2018, 'Deadpool forme une équipe pour protéger un jeune mutant des menaces de l\'avenir.', 7.7, 'https://i.pinimg.com/originals/41/5e/c5/415ec596fe7863623bcccfca9d6c2382.jpg', 6),
	(9, 'Jurassic Park : Le Monde Perdu', 127, 1993, 'Des chercheurs retournent sur l\'île de Jurassic Park pour étudier les dinosaures survivants.', 6.9, 'https://www.tvguide.com/a/img/catalog/provider/1/2/1-9972933606.jpg', 8),
	(10, 'Pulp Fiction', 154, 1994, 'Les destins croisés de criminels à Los Angeles, entre violence et humour noir.', 8.9, 'https://picfiles.alphacoders.com/371/thumb-1920-371109.jpg', 9),
	(11, 'Forrest Gump', 142, 1994, 'L\'histoire de Forrest Gump, un homme simple mais au destin exceptionnel.', 8.8, 'https://www.originalfilmart.com/cdn/shop/files/forrest_gump_1991_original_film_art.webp?v=1700679183&width=1200', 10),
	(12, 'Matrix', 136, 1999, 'Neo découvre que la réalité qu\'il connaît n\'est qu\'une simulation.', 8.7, 'https://www.rogerebert.com/wp-content/uploads/2024/03/The-Matrix.jpg', 11),
	(13, 'Gladiator', 155, 2000, 'Un général romain trahi cherche à venger la mort de sa famille dans l\'arène des gladiateurs.', 8.5, 'https://i.pinimg.com/originals/97/e3/32/97e332e116d439c05a2ebf7fbc247f53.jpg', 12),
	(14, 'Green Lantern', 114, 2011, '	Hal Jordan, un pilote d\'avion, reçoit un anneau magique et devient un super-héros.', 5.5, 'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/1f19fadf4dce201689d63e1dca2d6df83a3cc7b37b84982b5f1b1f010a1ec00a._RI_TTW_.jpg', 7),
	(15, 'Terminator', 107, 1984, 'Un cyborg envoyé du futur pour tuer Sarah Connor, mère du futur leader de la résistance.', 8, 'https://i.etsystatic.com/27475238/r/il/7e8a92/3647228488/il_fullxfull.3647228488_37t3.jpg', 4),
	(16, 'Gran Torino', 116, 2008, 'Un vétéran de la guerre de Corée forme une relation avec ses voisins.', 8.1, 'https://image.tmdb.org/t/p/original/4QeeS8PO6Ys1KuKjmbWbOu1WD1U.jpg', 13);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.genre : ~9 rows (environ)
REPLACE INTO `genre` (`id_genre`, `type`) VALUES
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

-- Listage des données de la table cinema.joue : ~31 rows (environ)
REPLACE INTO `joue` (`id_film`, `id_acteur`, `id_role`) VALUES
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
	(15, 27, 29),
	(16, 28, 30);

-- Listage de la structure de table cinema. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sexe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dateNaissance` date NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `biographie` text,
  PRIMARY KEY (`id_personne`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.personne : ~39 rows (environ)
REPLACE INTO `personne` (`id_personne`, `nom`, `prenom`, `sexe`, `dateNaissance`, `photo`, `biographie`) VALUES
	(1, 'Downey Jr', 'Robert', 'M', '1965-04-04', 'https://br.web.img2.acsta.net/pictures/18/06/29/00/35/0101925.jpg', 'Robert Downey Jr. est bien plus qu’un simple acteur américain. Figure emblématique du cinéma, il incarne trois personnages mythiques sur grand écran. De Charlie Chaplin à Iron Man en passant par Sherlock Holmes, il brille par son talent incontestable. La crème du cinéma hollywoodien, il est l’un des acteurs les mieux payés et les plus bankables de sa génération.'),
	(2, 'Johansson', 'Scarlett', 'F', '1984-11-22', 'https://celebmafia.com/wp-content/uploads/2018/09/scarlett-johansson-2018-emmy-awards-27.jpg', 'Scarlett Johansson est une actrice, réalisatrice, scénariste, productrice de cinéma et chanteuse américano - danoise, née le 22 novembre 1984 à Manhattan (New York). Actrice la plus rentable de tous les temps, Johansson fait ses débuts au cinéma dans la comédie fantastique North (1994).'),
	(3, 'Bale', 'Christian', 'M', '1974-01-30', 'https://fr.web.img2.acsta.net/pictures/19/01/22/16/22/0699464.jpg', 'Christian Bale est un acteur britannico-américain né le 30 janvier 1974 à Haverfordwest, au pays de Galles (Royaume-Uni). Il est connu pour jouer dans des films à gros budget tels que la trilogie The Dark Knight, Terminator Renaissance, Exodus, ainsi que dans des films indépendants de petits producteurs tels Fighter, Les Brasiers de la colère et Knight of Cups.'),
	(4, 'Ledger', 'Heath', 'M', '1979-04-04', 'https://www.theplace2.ru/archive/heath_ledger/img/1-10.jpg', 'Heath Ledger, né le 4 avril 1979 à Perth et mort le 22 janvier 2008 à New York, est un acteur australien.'),
	(5, 'DiCaprio', 'Leonardo', 'M', '1974-11-11', 'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg', 'Leonardo DiCaprio, né le 11 novembre 1974 à Los Angeles en Californie, aux États-Unis, est un acteur et producteur américain qui s\'est imposé comme l\'un des principaux acteurs de Hollywood, remarqué pour ses interprétations de personnages non conventionnels et complexes.'),
	(6, 'Gordon-Levitt', 'Joseph', 'M', '1971-02-17', 'https://cdn.britannica.com/23/218723-050-153B19B5/American-actor-Joseph-Gordon-Levitt-2018.jpg', 'Joseph Gordon-Levitt est un acteur, réalisateur, producteur et scénariste américain né le 17 février 1981 à Los Angeles. Il est célèbre pour ses rôles dans les films Inception, The Dark Knight Rises, Looper, Lincoln ainsi que pour avoir réalisé Don Jon\'s Addiction.'),
	(7, 'McConaughey', 'Matthew', 'M', '1969-11-11', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_.jpg', 'Matthew McConaughey est né le 4 novembre 1969 au Texas, États-Unis. Il est acteur et producteur. Il est connu pour Interstellar (2014), Dallas Buyers Club (2013) et Magic Mike (2012). Il est marié avec Camila Alves McConaughey depuis le 9 juin 2012. Lui et Camila Alves McConaughey ont trois enfants.'),
	(8, 'Hathaway', 'Anne', 'F', '1982-11-12', 'https://www.hawtcelebs.com/wp-content/uploads/2015/08/anne-hathaway-at-the-intern-press-conference-in-los-angeles_1.jpg', 'Anne Hathaway, née le 12 novembre 1982, est une actrice américaine. Après un début de carrière au théâtre, elle apparaît dans la série télévisée La Famille Green, avant de débuter sa carrière au cinéma en 2001 dans Princesse malgré elle.'),
	(9, 'Winslet', 'Kate', 'F', '1975-10-05', 'https://cdn.britannica.com/38/130638-050-FE6FBCF4/Kate-Winslet-2009.jpg', 'Née le 5 octobre 1975 à Reading, Berkshire en Grande-Bretagne, Kate Winslet fait partie d\'une famille d\'acteurs et fait ses débuts à la télévision anglaise dès l\'âge de treize ans. Quatre ans plus tard, elle remporte son premier succès international dans Créatures Celestes de Peter Jackson.'),
	(10, 'Worthington', 'Sam', 'M', '1976-08-02', 'https://2.bp.blogspot.com/-dbSFKY-n2_Y/UBV3mMiMVII/AAAAAAAAMQ4/GoxZsw0ZqoY/s1600/Sam+25.jpg', 'Sam Worthington est un acteur, réalisateur et scénariste australien. Il est né le 2 août 1976 à Godalming dans le Surrey (Angleterre) et a grandi à Perth, en Australie. Il est notamment connu pour son rôle de Jake Sully dans le film Avatar. Après des études au National Institute of Dramatic Art de Sydney, il s\'est d\'abord imposé sur les planches dans Juda Kiss montée au Belvoir Street Theatre.'),
	(11, 'Saldana', 'Zoé', 'F', '1978-06-19', 'https://celebmafia.com/wp-content/uploads/2017/06/zoe-saldana-la-evening-of-tribute-benefiting-the-navy-seal-foundation-in-beverly-hills-06-01-2017-1.jpg', 'Actrice qui a fourni la voix de Neytiri dans le film Avatar de 2009 . Elle incarne également Uhura dans les films Star Trek et Gamora dans la franchise Les Gardiens de la Galaxie. Elle a étudié le ballet, le jazz et la danse moderne latine en République dominicaine.'),
	(12, 'Reynolds', 'Ryan', 'M', '1976-10-23', 'https://www.closerweekly.com/wp-content/uploads/2016/01/ryan-reynolds.jpg?fit=2025%2C3000', 'Acteur, producteur et scénariste américano-canadien, Ryan Reynolds a débuté dès l’âge de 14 ans dans une série télévisée pour enfants. Durant les années 90, il multiplie les rôles dans des séries, puis tente de percer au cinéma dans Blade : Trinity (Goyer, 2004) et Amityville (Douglas, 2005).'),
	(13, 'Baccarin', 'Morena', 'F', '1979-06-17', 'https://www.hawtcelebs.com/wp-content/uploads/2012/09/MORENA-BACCARIN-at-64th-Primetime-Emmy-Awards-in-Los-Angeles-10.jpg', 'Morena Baccarin est une actrice américano-brésilienne, née le 2 juin 1979 à Rio de Janeiro (Sud-Est).\r\n\r\nElle se fait connaître à la télévision pour ses interprétations dans plusieurs séries télévisées américaines ayant marqué l\'univers de la pop culture1, avec les rôles d\'Inara Serra dans Firefly (2002-2003) et d\'Adria dans Stargate SG-1 (2006-2007). Elle retrouve ces deux personnages dans des longs métrages, la première dans Serenity (2005) et la seconde dans Stargate : L\'Arche de vérité (2008).'),
	(14, 'Brolin', 'Josh', 'M', '1968-02-12', 'https://images.sr.roku.com/idType/roku/context/trc/id/14bb9c9b898c5a77a649076560a9987c/images/gracenote/person/v9/AllPhotos/74371/74371_v9_bc.jpg/magic/fit-in/2560x1440', 'Josh Brolin est un acteur américain. Fils de l’acteur James Brolin et le beau-fils de Barbra Streisand, il est célèbre pour avoir joué Brand dans les Goonies, ainsi que pour No Country for old men et W, l\'improbable président dans lequel il incarne le président Bush.'),
	(15, 'Neill', 'Sam', 'M', '1947-09-14', 'https://vignette.wikia.nocookie.net/sonypicturesanimation/images/2/22/Sam_Neill.jpg/revision/latest?cb=20180217030213', 'Né dans le Nord de l\'Irlande, Nigel John Dermot Neill, plus connu sous le nom de scène Sam Neill, s\'installe avec sa famille en Nouvelle-Zélande en 1954. Il suit des études de littérature anglaise qui développent en lui un intérêt particulier pour l\'art dramatique.'),
	(16, 'Dern', 'Laura', 'F', '1967-02-10', 'https://www.hawtcelebs.com/wp-content/uploads/2018/01/laura-dern-at-3rd-annual-moet-moment-film-festival-golden-globes-week-in-los-angeles-01-05-2018-6.jpg', 'Née en 1967 à Los Angeles, Laura Elizabeth Dern est une actrice américaine. Célèbre grâce à sa participation dans les trois premiers films Jurassic Park, elle est la fille des acteurs Bruce Dern et Diane Ladd.'),
	(17, 'Travolta', 'John', 'M', '1954-02-18', 'https://es.web.img2.acsta.net/pictures/18/05/15/15/20/5209194.jpg', 'John Travolta né le 18 février 1954 à Englewood (New Jersey), est un acteur, chanteur, danseur et producteur américain. Il est connu pour ses rôles emblématiques dans La Fièvre du samedi soir (1977), Grease (1978), Pulp Fiction (1994) et Get Shorty (1995).'),
	(18, 'Thurman', 'Uma', 'F', '1970-04-29', 'https://i.pinimg.com/originals/0b/17/d0/0b17d089ffe15a41860c08e4ad92d4a2.jpg', 'Uma Thurman est une actrice américaine née le 29 avril 1970 à Boston. Ses parents l\'ont prénommée Uma, d\'après le nom d\'une déesse hindoue de la lumière et de la beauté. Elle est célèbre pour ses rôles dans les films Pulp Fiction, Kill Bill, Bienvenue à Gattaca, Savages et Nymphomaniac. Elle a grandi dans un milieu familial intellectuel et bohème.'),
	(19, 'Hanks', 'Tom', 'M', '1956-07-09', 'https://fr.web.img2.acsta.net/pictures/20/01/30/15/03/1454869.jpg', 'Tom Hanks, né le 9 juillet 1956 à Concord (Californie), est un acteur, réalisateur et producteur de cinéma américano-grec.'),
	(20, 'Lively', 'Blake', 'F', '1987-08-25', 'https://cdn.britannica.com/89/215389-050-A7D13770/American-actress-Blake-Lively-2017.jpg', 'Blake Lively, née Blake Ellender Brown le 25 août 1987 à Los Angeles, est une actrice et mannequin américaine.'),
	(21, 'Wright', 'Robin', 'F', '1966-04-08', 'https://m.media-amazon.com/images/M/MV5BNzQwNDAwOTM1OF5BMl5BanBnXkFtZTcwNTgyMDM5Ng@@._V1_.jpg', 'Robin Wright, née le 8 avril 1966 à Dallas (Texas, États-Unis), est une actrice et réalisatrice américaine.'),
	(22, 'Reeves', 'Keanu', 'M', '1964-09-02', 'https://net-worth-stars.com/wp-content/uploads/2016/01/Keanu-Reeves_6.jpg', 'Keanu Reeves est un acteur, réalisateur, producteur et musicien canadien. Né le 2 septembre 1964 à Beyrouth au Liban, il est reconnu pour ses rôles emblématiques dans des films à succès tels que Speed, Matrix et la saga John Wick. Sa vie a été marquée par des tragédies, notamment la perte de sa petite amie Jennifer Syme.'),
	(23, 'Fishburne', 'Laurence', 'M', '1961-07-30', 'https://cdn.britannica.com/93/223293-050-28BCE441/American-actor-Laurence-Fishburne-2017.jpg', 'Laurence Fishburne est un acteur et réalisateur américain, né le 30 juillet 1961 à Augusta (Georgie, Etats-Unis). Il passe son enfance à Brooklyn et tient, à l\'âge de dix ans, son premier rôle au théâtre dans la pièce In My Many Many Names And Days.'),
	(24, 'Russo', 'Anthony', 'M', '1970-02-04', 'https://fr.web.img6.acsta.net/pictures/15/11/24/16/59/250993.jpg', 'Frère de Joe Russo et fils d\'un homme politique libéral, Anthony Russo grandit dans un quartier ouvrier italien de Cleveland, dans l\'Ohio. Avant de suivre une formation aux métiers du cinéma, il écrit, réalise et produit, en collaboration avec son frère, une comédie intitulée Pieces.'),
	(26, 'Nolan', 'Christopher', 'M', '1970-07-30', 'https://cdn2.ettoday.net/images/5930/d5930228.jpg', 'Christopher Nolan est un réalisateur britannique né à Londres le 30 juillet 1970. Il est connu pour ses films Memento, Insomnia, Inception ainsi que pour sa trilogie consacrée à Batman (Batman Begins, The Dark Knight, le chevalier noir et The Dark Knight Rises).'),
	(27, 'Cameron', 'James', 'M', '1954-08-16', 'https://image.tmdb.org/t/p/original/9NAZnTjBQ9WcXAQEzZpKy4vdQto.jpg', 'James Cameron, né le 16 août 1954 à Kapuskasing (Canada), est un réalisateur, scénariste, producteur et explorateur de fonds marins canadien qui habite en Nouvelle-Zélande.'),
	(28, 'Miller', 'Tim', 'M', '1972-11-26', 'https://www.filmler.com/wp-content/uploads/2021/10/dCyBYwhO76j5wA96HPb6k5xk2Le.jpg', 'Timothy Miller, dit Tim Miller, né le 10 octobre 1964 à Pasadena (Californie), est un réalisateur, scénariste et créateur d\'effets spéciaux américain.'),
	(29, 'Leitch', 'David', 'M', '1972-10-01', 'https://vignette.wikia.nocookie.net/xmenmovies/images/e/e7/David_Leitch.jpg/revision/latest?cb=20180516162659', 'David Leitch, né le 16 novembre 1975 à Kohler (Wisconsin), est un cascadeur, coordinateur de cascades, acteur, assistant réalisateur et réalisateur américain. Il est le cofondateur de la société de production 87North Productions.'),
	(30, 'Campbell', 'Martin', 'M', '1943-10-24', 'https://fr.web.img2.acsta.net/pictures/18/04/09/15/29/3493738.jpg', 'Martin Campbell, né le 24 octobre 1943 à Hastings (Nouvelle-Zélande), est un réalisateur, producteur et acteur néo-zélandais.'),
	(31, 'Spielberg', 'Steven', 'M', '1946-12-18', 'https://www.thefamousbirthdays.com/photo/2020/01/steven_spielberg_by_gage_skidmore_49fbaa87_large.jpg', 'Steven Spielberg est un réalisateur, producteur et scénariste américain. Il est né le 18 décembre 1946 à Cincinnati en Ohio (États-Unis). Spielberg a débuté sa carrière en réalisant des épisodes de séries télévisées et des longs métrages mineurs pour Universal Pictures1. Il est connu pour son cinéma relativement fantastique, notamment autour de personnages extra-terrestres. Spielberg a également monté des sociétés de production ainsi que des fondations.'),
	(32, 'Tarantino', 'Quentin', 'M', '1963-03-27', 'https://cdn.britannica.com/02/156802-050-8C6EBCC8/Quentin-Tarantino.jpg', 'Quentin Tarantino, né le 27 mars 1963, à Knoxville, Tennessee, est un réalisateur et scénariste américain dont les films sont réputés pour leur violence stylisée, leur dialogue acéré et leur fascination pour le cinéma et la culture pop.'),
	(33, 'Zemeckis', 'Robert', 'M', '1952-05-14', 'https://es.web.img3.acsta.net/pictures/16/11/10/15/18/427241.jpg', 'Robert Zemeckis est un réalisateur, producteur et scénariste américain, né le 14 mai 1952 à Chicago.'),
	(34, 'Wachowski', 'Lana', 'F', '1965-06-22', 'https://images.dailyhive.com/20170804174930/Lana-Wachowski-Shutterstock.jpg', 'Lana Wachowski - née Larry - est une réalisatrice, productrice et scénariste américaine, devenue célèbre avec sa soeur Lilly - née Andy - pour avoir réalisé les trois volets de la saga Matrix.'),
	(35, 'Crowe', 'Russell', 'M', '1964-04-07', 'https://m.media-amazon.com/images/M/MV5BMTQyMTExNTMxOF5BMl5BanBnXkFtZTcwNDg1NzkzNw@@._V1_.jpg', 'Né le 7 avril 1964 à Wellington, Russell Crowe est un acteur et musicien néo-zélandais. Après avoir débuté en Australie dans The Crossing, il fait ses premiers pas à Hollywood avec Mort ou vif en 1995. Les années 2000 le transforment en star...'),
	(36, 'Phoenix', 'Joaquin', 'M', '1974-10-28', 'https://image.tmdb.org/t/p/original/cK0BTrAM1xcsto8kVvHhd9AV8dW.jpg', 'Joaquín Rafael Bottom, dit Joaquin Phoenix, né le 28 octobre 1974 à San Juan (Porto Rico), est un acteur, producteur, musicien et militant écologiste américain.'),
	(37, 'Schwarzenegger', 'Arnold', 'M', '1947-07-30', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Arnold_Schwarzenegger_-_2019_(33730956438)_(cropped).jpg/1200px-Arnold_Schwarzenegger_-_2019_(33730956438)_(cropped).jpg', 'Arnold Schwarzenegger né le 30 juillet 1947 à Thal, en Autriche, est un culturiste, acteur, réalisateur, producteur de cinéma et homme politique austro-américain.'),
	(38, 'Hamilton', 'Linda', 'F', '1956-09-26', 'https://i.pinimg.com/originals/50/61/54/5061546c94a93b2bb4c43c0c5d83ae62.jpg', 'Linda Hamilton est une actrice américaine, née le 26 septembre 1956. Pour beaucoup son nom est synonyme de Sarah Connor, son rôle dans Terminator 1 et 2. Native de Salisbury (Maryland), Linda Hamilton grandit au sein d\'une famille de quatre enfants et passe son temps à dévorer des livres.'),
	(39, 'Scott', 'Ridley', 'M', '1937-11-30', 'https://m.media-amazon.com/images/M/MV5BMjAwMzc0NjY3OF5BMl5BanBnXkFtZTcwNTU0MjQ1Mw@@._V1_FMjpg_UX1000_.jpg', 'Ridley Scott est un réalisateur, producteur et scénariste britannique. Spécialisé dans les films de SF puis dans les drames, il est connu pour nombre de ses films : Alien - le huitième passager, Blade Runner, Thelma & Louise, 1492 Christophe Colomb, Gladiator...'),
	(40, 'Eastwood', 'Clint', 'M', '1930-05-31', 'https://www.tuttonews.net/wp-content/uploads/2013/12/Clint-Eastwood.jpg', 'Clint Eastwood est un acteur, réalisateur, compositeur et producteur de cinéma américain. Né le 31 mai 1930 à San Francisco, il a commencé sa carrière en interprétant de petits rôles dans des séries B avant de devenir célèbre grâce à la série "Rawhide". Il est également connu pour ses nombreux films à succès et sa longue carrière dans l\'industrie cinématographique.');

-- Listage de la structure de table cinema. possede
CREATE TABLE IF NOT EXISTS `possede` (
  `id_film` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `FK__film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK__genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.possede : ~0 rows (environ)
REPLACE INTO `possede` (`id_film`, `id_genre`) VALUES
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
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `FK_realisateur_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.realisateur : ~0 rows (environ)
REPLACE INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 24),
	(3, 26),
	(4, 27),
	(5, 28),
	(6, 29),
	(7, 30),
	(8, 31),
	(9, 32),
	(10, 33),
	(11, 34),
	(12, 39),
	(13, 40);

-- Listage de la structure de table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nomPersonnage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.role : ~30 rows (environ)
REPLACE INTO `role` (`id_role`, `nomPersonnage`) VALUES
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
	(29, 'Sarah Connor'),
	(30, 'Walt Kowalski');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
