<?php ob_start(); ?>


<h1>TOUS NOS FILMS</h1>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/css/style.css">
    <title>Document</title>
</head>
<body>
    <div class="film-container">
        <?php foreach ($listFilms as $listFilm) { ?>

            <div class="film">           
                <a href="index.php?action=detailsFilm&id=<?= $listFilm['id_film'] ?>"><img src="<?= $listFilm['affiche']; ?>" alt=""></a>
                <p class="titre"><?= $listFilm['titre']; ?> (<?= $listFilm['anneeSortie']; ?>)</p>           
                <p class="note"><?= $listFilm['note']; ?></p> <br>
            </div>
            
        <?php } ?>
    </div>    
</body>
</html>

<?php 
$titre = "TOUS NOS FILMS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>