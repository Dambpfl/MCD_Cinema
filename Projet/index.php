<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

$ctrlCinema = new CinemaController();

if(isset($_GET["action"])){
    switch ($_GET["action"]) {

        case "listFilms" : $ctrlCinema->listFilms(); break;
        case "detailFilm" : $ctrlCinema->detailFilm($id); break;

        case "listActeurs" : $ctrlCinema->listActeurs(); break;
        case "detailActeur" : $ctrlCinema->detailActeur(); break

        case "listRealisateurs" : $ctrlCinema->listRealisateurs(); break;
        case "detailRealisateur" : $ctrlCinema->detailRealisateur(); break;

        case "listRoles" : $ctrlCinema->listRoles(); break;
        case "detailRole" : $ctrlCinema->detailRole(); break;

        case "listGenres" : $ctrlCinema->listGenres(); break;
        case "detailGenre" : $ctrlCinema->detailGenre(); break;
    }
}
?>