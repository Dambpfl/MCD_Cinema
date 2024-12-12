<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

$ctrlCinema = new CinemaController();

$id = $_GET['id'];

if(isset($_GET["action"])){
    switch ($_GET["action"]) {

        case "listFilms" : $ctrlCinema->listFilms(); break;
        case "detailFilm" : $ctrlCinema->detailFilm($id); break;

        case "listActeurs" : $ctrlCinema->listActeurs(); break;
        case "detailsActeur" : $ctrlCinema->detActeur($id); break;

        case "listRealisateurs" : $ctrlCinema->listRealisateurs(); break;
        case "detailsRealisateur" : $ctrlCinema->detRealisateur(); break;

        case "listGenres" : $ctrlCinema->listGenres(); break;
        case "detailsGenre" : $ctrlCinema->detGenre(); break;
    }
}
?>
