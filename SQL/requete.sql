-- Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur
SELECT f.titre, f.anneeSortie,
DATE_FORMAT(SEC_TO_TIME(f.duree*60), "%Hh %im") AS Durée,
CONCAT(p.prenom, " ", p.nom) AS Réalisateur
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
WHERE f.id_film = 5

-- Liste des films dont la durée excède 2h15 classés par durée (du + long au + court) 
SELECT film.titre, DATE_FORMAT(SEC_TO_TIME(film.duree*60), "%Hh %im") AS Durée
FROM film
WHERE film.duree > 135
ORDER BY film.duree DESC

-- Liste des films d’un réalisateur (en précisant l’année de sortie)
SELECT film.titre,
CONCAT(p.prenom, " ", p.nom) AS Réalisateur,
film.anneeSortie
FROM film 
INNER JOIN realisateur r ON film.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
WHERE r.id_realisateur = 3

-- Nombre de films par genre (classés dans l’ordre décroissant) 
SELECT genre.type,
COUNT(possede.id_film) AS nbFilm
FROM film
INNER JOIN possede ON film.id_film = possede.id_film
INNER JOIN genre ON possede.id_genre = genre.id_genre
GROUP BY genre.id_genre
ORDER BY nbFilm DESC

-- Nombre de films par réalisateur (classés dans l’ordre décroissant)
SELECT 
CONCAT(personne.prenom, " ", personne.nom) AS Réalisateur,
COUNT(film.id_film) AS nbFilm
FROM film
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne ON realisateur.id_personne = personne.id_personne
GROUP BY realisateur.id_realisateur
ORDER BY nbFilm DESC

-- Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe
SELECT
CONCAT(personne.nom, " ", personne.prenom) AS nomActeur,
personne.sexe,
film.titre
FROM personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne
INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
INNER JOIN film ON joue.id_film = film.id_film
WHERE film.id_film = 5

-- Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)
SELECT 
CONCAT(personne.prenom, " ", personne.nom) AS nomActeur,
role.nomPersonnage,
film.anneeSortie
FROM personne
INNER JOIN acteur ON acteur.id_personne = personne.id_personne
INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
INNER JOIN role ON joue.id_role = role.id_role
INNER JOIN film ON joue.id_film = film.id_film
WHERE acteur.id_acteur = 12
ORDER BY film.anneeSortie DESC

-- Liste des personnes qui sont à la fois acteurs et réalisateurs
SELECT CONCAT(personne.prenom, " ", personne.nom) AS actReal
FROM personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne
INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne;

-- Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)
SELECT 
film.titre, film.anneeSortie
FROM film
WHERE film.anneeSortie >= YEAR(CURDATE()) - 5 -- CURDATE() = NOW()
ORDER BY film.anneeSortie DESC

-- Nombre d’hommes et de femmes parmi les acteurs 
SELECT 
personne.sexe,
COUNT(personne.id_personne) AS nombre
FROM personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne
GROUP BY personne.sexe

-- Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu) 
SELECT 
CONCAT(personne.prenom, " ", personne.nom) AS nomActeur,
TIMESTAMPDIFF(YEAR, personne.dateNaissance, NOW()) age
FROM personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne
WHERE personne.dateNaissance <= DATE_SUB(NOW(), INTERVAL 50 YEAR);

-- Acteurs ayant joué dans 3 films ou plus 
SELECT
CONCAT(personne.prenom, " ", personne.nom) AS nomActeur,
COUNT(film.id_film) AS nbFilms
FROM personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne
INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
INNER JOIN film ON joue.id_film = film.id_film
GROUP BY personne.id_personne
HAVING nbFilms >= 3