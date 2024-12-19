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
            "SELECT CONCAT(personne.prenom, ' ',personne.nom) AS nomActeur, DATE_FORMAT(personne.dateNaissance, '%d-%m-%Y') AS dateNaissanceFr, personne.photo, acteur.id_acteur
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            ORDER BY personne.nom ASC");
        $listActeurs = $requete->fetchAll();
        require "view/listActeurs.php";
    }

    public function listRealisateurs(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT CONCAT(personne.prenom, ' ',personne.nom) AS nomRealisateur, DATE_FORMAT(personne.dateNaissance, '%d-%m-%Y') AS dateNaissanceFr, personne.photo, realisateur.id_realisateur
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
            "SELECT film.affiche, film.titre, film.note, film.anneeSortie, film.duree, film.synopsis,
            genre.type
            FROM film
            INNER JOIN possede ON film.id_film = possede.id_film
            INNER JOIN genre ON possede.id_genre = genre.id_genre
            WHERE film.id_film = :id");
        $requete->execute(["id" => $id]);
        $detFilm = $requete->fetch();

        // req 2 : casting du film -> fetchAll()
        $requete = $pdo->prepare(
            "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomActeur,
            role.nomPersonnage, film.id_film, acteur.id_acteur 
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
            INNER JOIN role ON joue.id_role = role.id_role
            INNER JOIN film ON joue.id_film = film.id_film
            WHERE film.id_film = :id");
        $requete->execute(["id" => $id]);
        $casting = $requete->fetchAll();

        require "view/detailsFilm.php";
    }



    public function detActeur($id) {
        $pdo = Connect::seConnecter();
        // req 1 : infos de l'acteur
        $requete = $pdo->prepare(
            "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomActeur,
            DATE_FORMAT(personne.dateNaissance, '%d-%m-%Y') AS dateNaissanceFr, personne.sexe, personne.photo, personne.biographie
            FROM personne
            INNER JOIN acteur ON personne.id_personne = acteur.id_personne
            WHERE acteur.id_acteur = :id");
        $requete->execute(["id" => $id]);
        $detActeur = $requete->fetch();

        // req 2 : filmographie + role -> fetchAll()
        $requete = $pdo->prepare(
            "SELECT film.titre, role.nomPersonnage, film.affiche, film.note, film.id_film,
            acteur.id_acteur
            FROM acteur
            INNER JOIN joue ON acteur.id_acteur = joue.id_acteur
            INNER JOIN film ON joue.id_film = film.id_film
            INNER JOIN role ON joue.id_role = role.id_role
            WHERE acteur.id_acteur = :id
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
            DATE_FORMAT(personne.dateNaissance, '%d-%m-%Y') AS dateNaissanceFr, personne.sexe, personne.photo, personne.biographie
            FROM personne
            INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne
            WHERE realisateur.id_realisateur = :id");
        $requete->execute(["id" => $id]);
        $detRealisateur = $requete->fetch();

        // req 2 : film réalisés
        $requete = $pdo->prepare(
            "SELECT film.titre, realisateur.id_realisateur, film.anneeSortie, film.affiche, film.id_film
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
            "SELECT genre.type
            FROM genre
            WHERE genre.id_genre = :id");
            $requete->execute(["id" => $id]);
        $genre = $requete->fetch();

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

        // add genre
    public function addGenre() {
        $pdo = Connect::seConnecter();
        if(isset($_POST["submit"])) {    // verif si submit
            
            $nomGenre = filter_input(INPUT_POST, "nomGenre", FILTER_SANITIZE_FULL_SPECIAL_CHARS);  // dit que ma string "submit" = $nomGenre

            if($nomGenre) { // si ok apres filtre
                $requete = $pdo->prepare(
                    "INSERT INTO genre(type)
                     VALUES (:nomGenre)");  // insert ma string "submit" dans table genre->type
                $requete->execute(["nomGenre" => $nomGenre]);
            }}
        require "view/addGenre.php";
    }


        // add acteur
    public function addActeur() {
        $pdo = Connect::seConnecter();
        if(isset($_POST["submit"])) { // verif si submit

            $prenomActeur = filter_input(INPUT_POST, "prenomActeur", FILTER_SANITIZE_FULL_SPECIAL_CHARS); // string 1 = $prenomActeur
            $nomActeur = filter_input(INPUT_POST, "nomActeur", FILTER_SANITIZE_FULL_SPECIAL_CHARS); // string 2 = $nomActeur
            $sexeActeur = filter_input(INPUT_POST, "sexeActeur", FILTER_SANITIZE_FULL_SPECIAL_CHARS); // radio -> values M or F
            $dateNaissance = filter_input(INPUT_POST, "dateNaissance", FILTER_SANITIZE_FULL_SPECIAL_CHARS); // date 


            if($prenomActeur && $nomActeur && $sexeActeur && $dateNaissance) { // si ok apres filtre
                
                $requeteActeur = $pdo->prepare(
                    "INSERT INTO personne(prenom, nom, sexe, dateNaissance)
                     VALUES (:prenomActeur, :nomActeur, :sexeActeur, :dateNaissance)"); // insert dans table personne->prenom,nom,sexe,dateNaissance
                $requeteActeur->execute(["prenomActeur" => $prenomActeur,
                                         "nomActeur" => $nomActeur,
                                         "sexeActeur" => $sexeActeur,
                                         "dateNaissance" => $dateNaissance]);
            }


            $idPersonne = $pdo->lastInsertId(); // recup le dernier ID -> de la new personne
            

            $requeteID = $pdo->prepare(
                "INSERT INTO acteur(id_personne)
                 VALUES (:id_personne)"); // insert le new id crée -> table acteur(id_personne)
            $requeteID->execute(["id_personne" => $idPersonne]);
        }
    require "view/addActeur.php";
    }


        // add film
    public function addFilm() {
        $pdo = Connect::seConnecter();

        $requete = $pdo->prepare(
            "SELECT CONCAT(personne.prenom, ' ', personne.nom) AS nomRealisateur,
            realisateur.id_realisateur
            FROM personne
            INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne");
        $requete->execute();
        $realisateurs = $requete->fetchAll();

        $requete = $pdo->prepare(
            "SELECT genre.`type`, genre.id_genre
             FROM genre ");
        $requete->execute();
        $genres = $requete->fetchAll();
            

        if(isset($_POST["submit"])) {
            
            // add id_realisateur film
          /*  $prenomRealisateur = $_POST["prenomRealisateur"];
            $nomRealisateur = $_POST["nomRealisateur"];
            $sexeRealisateur = $_POST["sexeRealisateur"];
            $dateNaissanceRealisateur = $_POST["dateNaissanceRealisateur"];

            $requeteRealisateur = $pdo->prepare(
                "INSERT INTO personne(prenom, nom, sexe, dateNaissance)
                VALUES (:prenomRealisateur, :nomRealisateur, :sexeRealisateur, :dateNaissanceRealisateur)");
            $requeteRealisateur->execute(["prenomRealisateur" => $prenomRealisateur,
                                          "nomRealisateur" => $nomRealisateur,
                                            "sexeRealisateur" => $sexeRealisateur,
                                            "dateNaissanceRealisateur" => $dateNaissanceRealisateur]);

            $idPersonne2 = $pdo->lastInsertId();

            $requeteID2 = $pdo->prepare(
                "INSERT INTO realisateur(id_personne)
                 VALUES (:id_personne)");
            $requeteID2->execute(["id_personne" => $idPersonne2]); */


             // $idRealisateur = $pdo->lastInsertId();




            // add film
           

            $titre = filter_input(INPUT_POST, "titreFilm", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $duree = filter_input(INPUT_POST, "dureeFilm", FILTER_VALIDATE_INT);
            $anneeSortie = filter_input(INPUT_POST, "anneeSortieFilm", FILTER_VALIDATE_INT);
            $synopsis = filter_input(INPUT_POST, "synopsisFilm", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $note = filter_input(INPUT_POST, "noteFilm", FILTER_VALIDATE_FLOAT);
            $affiche = filter_input(INPUT_POST, "afficheFilm", FILTER_SANITIZE_URL);
            $idRealisateur = filter_input(INPUT_POST, "idRealisateur", FILTER_VALIDATE_INT);

            $requete = $pdo->prepare(
                "INSERT INTO film(titre, duree, anneeSortie, synopsis, note, affiche, id_realisateur)
                VALUES (:titreFilm, :dureeFilm, :anneeSortieFilm, :synopsisFilm, :noteFilm, :afficheFilm, :id_realisateur)");
                $requete->execute(["titreFilm" => $titre,
                                   "dureeFilm" => $duree,
                                   "anneeSortieFilm" => $anneeSortie,
                                   "synopsisFilm" => $synopsis,
                                   "noteFilm" => $note,
                                   "afficheFilm" => $affiche,
                                   "id_realisateur" => $idRealisateur]);

            $idFilm = $pdo->lastInsertId(); // recup l'id du film crée

            // add genre -> film

            $idGenre = filter_input(INPUT_POST, 'genres', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);

            $requeteGenre = $pdo->prepare(
                "INSERT INTO possede(id_film, id_genre)
                 VALUES (:id_film, :id_genre)");

                 foreach($_POST["genres"] as $idGenre) {
                    $requeteGenre->execute(["id_film" => $idFilm,
                                            "id_genre" => $idGenre]);
                 }
            
        }
        require "view/addFilm.php";
    }

    // supprimer

    public function deleteActeur() {
        $pdo = Connect::seConnecter();

        if(isset($_GET["id"])) {

            $id_acteur = $_GET["id"];
            
            $requete = $pdo->prepare (
                "DELETE FROM joue
                WHERE joue.id_acteur = :id");
            $requete->execute(["id" => $id_acteur]);
    
            $requete = $pdo->prepare (
                "DELETE FROM acteur
                WHERE acteur.id_acteur = :id");
            $requete->execute(["id" => $id_acteur]);

        }

        header("Location:index.php?action=listActeurs");
        exit();
    }
}


