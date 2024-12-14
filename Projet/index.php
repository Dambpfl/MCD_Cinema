<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

$ctrlCinema = new CinemaController();


$id = isset($_GET['id']) ? (int)$_GET['id'] : null;


if(isset($_GET["action"])){
    switch ($_GET["action"]) {

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
    }
}
?>
