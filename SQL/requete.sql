-- Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur
SELECT f.titre, f.anneeSortie,
DATE_FORMAT(SEC_TO_TIME(f.duree*60), "%Hh %im") AS Durée,
CONCAT(p.prenom, " ", p.nom) AS Réalisateur
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne

-- Liste des films dont la durée excède 2h15 classés par durée (du + long au + court) 
SELECT film.titre, DATE_FORMAT(SEC_TO_TIME(film.duree*60), "%Hh %im") AS Durée
FROM film
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
GROUP BY genre.type
ORDER BY nbFilm DESC

-- Nombre de films par réalisateur (classés dans l’ordre décroissant)
SELECT 
CONCAT(personne.prenom, " ", personne.nom) AS Réalisateur,
COUNT(film.id_film) AS nbFilm
FROM film
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne ON realisateur.id_personne = personne.id_personne
GROUP BY Réalisateur
ORDER BY nbFilm DESC

-- Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe
