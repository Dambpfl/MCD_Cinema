<?php

namespace Controller;
use Model\Connect;

class CinemaController {

    /**
     * Lister les films
     */
    public function listFilms() {
        
        $pdo = Connect::seConnecter();
        $requete = $pdo->query("SELECT affiche, titre, anneeSortie, note, id_film FROM film");
        $listFilms = $requete->fetchAll();
        require "view/listFilms.php";
    }

    public function listActeurs(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT CONCAT(personne.prenom, ' ',personne.nom) AS nomActeur, personne.dateNaissance, personne.id_personne
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne");
        $listActeurs = $requete->fetchAll();
        require "view/listActeurs.php";
    }

    public function listRealisateurs(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT CONCAT(personne.prenom, ' ',personne.nom) AS nomRealisateur, personne.dateNaissance
            FROM personne
            INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne");
        $listRealisateurs = $requete->fetchAll();
        require "view/listRealisateurs.php";
    }

    public function listGenres(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query("SELECT genre.type FROM genre");
        $listGenres = $requete->fetchAll();
        require "view/listGenres.php";
    }

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

        require "view/detailsFilm.php";
    }

    public function detActeur($id) {
        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare(
        "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomActeur,
        personne.dateNaissance, personne.sexe
        FROM personne
        INNER JOIN acteur ON personne.id_personne = acteur.id_personne
        WHERE id_acteur = :id");
        $requete->execute(["id" => $id]);
        $detActeur = $requete->fetch();
        require "view/detailsActeur.php";
    }
}


