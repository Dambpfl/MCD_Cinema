<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

$ctrlCinema = new CinemaController();

// verifie et recupere l'id via l'url
$id = isset($_GET['id']) ? (int)$_GET['id'] : null;

// listFilms = page de base
$action = isset($_GET['action']) ? $_GET['action'] : 'listFilms';


switch ($action) {

    case "listFilms" : $ctrlCinema->listFilms(); break;
    case "detailsFilm" : $ctrlCinema->detFilm($id); break;

    case "listActeurs" : $ctrlCinema->listActeurs(); break;
    case "detailsActeur" : $ctrlCinema->detActeur($id); break;

    case "listRealisateurs" : $ctrlCinema->listRealisateurs(); break;
    case "detailsRealisateur" : $ctrlCinema->detRealisateur($id); break;

    case "listGenres" : $ctrlCinema->listGenres(); break;
    case "detailsGenre" : $ctrlCinema->detGenre($id); break;

    case "listRoles" : $ctrlCinema->listRoles(); break;
    case "detailsRole" : $ctrlCinema->detRole($id); break;

    case "addGenre" : $ctrlCinema->addGenre(); break;
    case "addActeur" : $ctrlCinema->addActeur(); break;
    case "addFilm" : $ctrlCinema->addFilm(); break;
    case "deleteActeur" : $ctrlCinema->deleteActeur(); break;

    case "search" : $ctrlCinema->search(); break;
}


?>
