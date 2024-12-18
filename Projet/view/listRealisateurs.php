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

        <div class="realisateur-container">
            <img class="realisateur-img" src="<?= $listRealisateur['photo']?>" alt="">
            <div class="realisateur">
                <a class="realisateur-nom" href="index.php?action=detailsRealisateur&id=<?= $listRealisateur['id_realisateur']?>"> <?= $listRealisateur['nomRealisateur']; ?> </a>
                <?= $listRealisateur['dateNaissance']; ?>
            </div>
        </div>

    <?php } ?>
</body>
</html>


<?php 
$titre = "LISTE DES RÉALISATEURS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>