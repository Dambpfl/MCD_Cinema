<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title><?php $titre ?></title>
</head>
<body>
    <nav><div class="boutons">
                <a href="index.php?action=listFilms">Films</a>
                <a href="index.php?action=listActeurs">Acteurs</a>
                <a href="index.php?action=listRealisateurs">Realisateurs</a>
                <a href="index.php?action=listGenres">Genres</a>
                <a href="index.php?action=listRoles">Roles</a>
            </div>
        </nav>
        <div> <?= $contenu ?></div>     
</body>
</html>