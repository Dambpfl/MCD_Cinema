<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <!-- FONTAWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
                    <!-- REMIXICON-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.css">
                    <!-- CSS -->
    <link rel="stylesheet" href="public/css/style.css">
    <title><?php $titre ?></title>
</head>
<body>
    <nav>
        <div class="logo-container">
            <img class="logo-img" src="public/img/logo.png" alt="">
        </div>
        <div class="boutons" id="boutons">
            <a href="index.php?action=accueil">ACCUEIL</a>
            <a href="index.php?action=listFilms">LISTE DES FILMS</a>
            <a href="index.php?action=listActeurs">ACTEURS</a>
            <a href="index.php?action=listRealisateurs">RÉALISATEURS</a>
            <a href="index.php?action=listGenres">GENRES</a>
            <a href="index.php?action=listRoles">ROLES</a>
        </div>
               <!-- Ouverture bouton -->
        <div class="nav-toggle" id="nav-toggle">
            <i class="ri-menu-line"></i>
        </div>
             <!-- Fermeture bouton -->
        <div class="nav-close" id="nav-close">
            <i class="ri-close-large-line"></i>
        </div>
    </nav>
    <div class="btnGestion">
        <a href="index.php?action=addGenre">Ajouter un genre</a>
        <a href="index.php?action=addActeur">Ajouter un acteur</a>
        <a href="index.php?action=addFilm">Ajouter un film</a>
    </div>
    <form class='search' action="index.php?action=search" method="post">
        <input class='bar-search 'type="search" name="terme">
        <input class='sub-search' type="submit" name="submit" value ="Rechercher">
    </form>
        <div> <?= $contenu ?></div>
                <!-- JS -->
        <script src="public/js/main.js"></script>
</body>
</html>