<?php ob_start(); ?>


<p>Il y a <?= $requete->rowCount(); ?> films</p>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach ($listFilms as $listFilm) { ?>

        <a href="index.php?action=detailsFilm&id=<?= $listFilm['id_film'] ?>"><img src="<?= $listFilm['affiche']; ?>" alt=""></a><br>

        <?= $listFilm['titre']; ?> (<?= $listFilm['anneeSortie']; ?>) <br>

        <?= $listFilm['note']; ?> <br>

    <?php } ?>
</body>
</html>

<?php 
$titre = "TOUS NOS FILMS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>