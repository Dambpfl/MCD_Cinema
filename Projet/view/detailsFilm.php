<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <img src="<?= $detFilm['affiche']; ?> " alt=""><br>
    <?= $detFilm['titre']; ?> <br>
    <?= $detFilm['anneeSortie']; ?> <br>
    <?= $detFilm['duree']; ?>min <br>
    <?= $detFilm['synopsis']; ?> <br> <br>

    <?php foreach($detFilm2 as $detFilm2) { ?>
    <?= $detFilm2['nomActeur']; ?> <br>
    <?= $detFilm2['nomPersonnage']; ?> <br><br>
    <?php } ?>

</body>
</html>



<?
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>