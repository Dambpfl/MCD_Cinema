<?php

namespace Controller;
use Model\Connect;

class CinemaController {


    // All list

    public function listFilms() {
        
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT affiche, titre, anneeSortie, note, id_film
            FROM film
            ORDER BY anneeSortie DESC");
        $listFilms = $requete->fetchAll();
        require "view/listFilms.php";
    }

    public function listActeurs(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT CONCAT(personne.prenom, ' ',personne.nom) AS nomActeur, personne.dateNaissance, acteur.id_acteur
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            ORDER BY personne.nom ASC");
        $listActeurs = $requete->fetchAll();
        require "view/listActeurs.php";
    }

    public function listRealisateurs(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT CONCAT(personne.prenom, ' ',personne.nom) AS nomRealisateur, personne.dateNaissance, realisateur.id_realisateur
            FROM personne
            INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne
            ORDER BY personne.nom ASC");
        $listRealisateurs = $requete->fetchAll();
        require "view/listRealisateurs.php";
    }

    public function listGenres(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query("SELECT genre.type, genre.id_genre FROM genre ORDER BY genre.type ASC");
        $listGenres = $requete->fetchAll();
        require "view/listGenres.php";
    }

    public function listRoles(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query("SELECT role.nomPersonnage, role.id_role FROM role ");
        $listRoles = $requete->fetchAll();
        require "view/listRoles.php";
    }


    // All details


    public function detFilm($id) {
        $pdo = Connect::seConnecter();
        // req 1 : infos du film -> fetch()
        $requete = $pdo->prepare(
            "SELECT film.affiche, film.titre, film.note, film.anneeSortie, film.duree, film.synopsis
            FROM film
            WHERE film.id_film = :id");
        $requete->execute(["id" => $id]);
        $detFilm = $requete->fetch();

        // req 2 : casting du film -> fetchAll()
        $requete = $pdo->prepare(
            "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomActeur,
            role.nomPersonnage, film.id_film
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
            INNER JOIN role ON joue.id_role = role.id_role
            INNER JOIN film ON joue.id_film = film.id_film
            WHERE film.id_film = :id");
        $requete->execute(["id" => $id]);
        $detFilm2 = $requete->fetchAll();

        require "view/detailsFilm.php";
    }



    public function detActeur($id) {
        $pdo = Connect::seConnecter();
        // req 1 : infos de l'acteur
        $requete = $pdo->prepare(
            "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomActeur,
            personne.dateNaissance, personne.sexe
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            WHERE acteur.id_personne = :id");
        $requete->execute(["id" => $id]);
        $detActeur = $requete->fetch();

        // req 2 : filmographie + role -> fetchAll()
        $requete = $pdo->prepare(
            "SELECT film.titre, role.nomPersonnage,
            acteur.id_acteur
            FROM acteur
            INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
            INNER JOIN film ON joue.id_film = film.id_film
            INNER JOIN role ON joue.id_role = role.id_role
            WHERE acteur.id_personne = :id
            ORDER BY film.anneeSortie DESC");
        $requete->execute(["id" => $id]);
        $detActeur2 = $requete->fetchAll();

        require "view/detailsActeur.php";
    }


    
    public function detRealisateur($id) {
        $pdo = Connect::seConnecter();
        // req 1 : infos du réalisateur
        $requete = $pdo->prepare(
            "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomRealisateur,
            personne.dateNaissance, personne.sexe
            FROM personne
            INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne
            WHERE realisateur.id_realisateur = :id");
        $requete->execute(["id" => $id]);
        $detRealisateur = $requete->fetch();

        // req 2 : film réalisés
        $requete = $pdo->prepare(
            "SELECT film.titre, realisateur.id_realisateur, film.anneeSortie
            FROM film
            INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
            WHERE realisateur.id_realisateur = :id
            ORDER BY film.anneeSortie DESC");
        $requete->execute(["id" => $id]);
        $detRealisateur2 = $requete->fetchAll();
        
        require "view/detailsRealisateur.php";
    }


    public function detGenre($id) {
        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare(
            "SELECT genre.type, film.titre, genre.id_genre
            FROM genre
            INNER JOIN possede ON genre.id_genre = possede.id_genre
            INNER JOIN film ON possede.id_film = film.id_film
            WHERE genre.id_genre = :id");
        $requete->execute(["id" => $id]);
        $detGenre = $requete->fetchAll();
        require "view/detailsGenre.php";
    }

    public function detRole($id) {
        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare(
            "SELECT role.id_role,
	        CONCAT(personne.prenom, ' ', personne.nom) AS nomActeur,
	        film.titre
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
            INNER JOIN role ON joue.id_role = role.id_role
            INNER JOIN film ON joue.id_film = film.id_film
            WHERE role.id_role = :id");
        $requete->execute(["id" => $id]);
        $detRole = $requete->fetchAll();
        require "view/detailsRole.php";
    }

    // formulaires

    public function formulaires() {
        $pdo = Connect::seConnecter();
        require "view/formulaires.php";
    }
}


