<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title><?php $titre ?></title>
</head>
<body>
    <nav>
        <div class="boutons">
            <a href="index.php?action=listFilms">ACCUEIL</a>
            <a href="index.php?action=listFilms">LISTE DES FILMS</a>
            <a href="index.php?action=listActeurs">ACTEURS</a>
            <a href="index.php?action=listRealisateurs">RÉALISATEURS</a>
            <a href="index.php?action=listGenres">GENRES</a>
            <a href="index.php?action=listRoles">ROLES</a>
        </div>
        <div class="btnGestion">
            <a href="index.php?action=addGenre">Ajouter un genre</a>
            <a href="index.php?action=addActeur">Ajouter un acteur</a>
            <a href="index.php?action=addFilm">Ajouter un film</a>
        </div>
    </nav>
        <div> <?= $contenu ?></div>     
</body>
</html>