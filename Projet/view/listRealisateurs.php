<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach ($listRealisateurs as $listRealisateur) { ?>

        <a href="index.php?action=detailsRealisateur&id=<?= $listRealisateur['id_realisateur']?>"> <?= $listRealisateur['nomRealisateur']; ?> </a><br>
        <?= $listRealisateur['dateNaissance']; ?> <br><br>
    <?php } ?>
</body>
</html>


<?php 
$titre = "LISTE DES RÉALISATEURS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>