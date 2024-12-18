<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="container-detFilm">
        <img class='detActeur-img' src="<?= $detActeur['photo']; ?>" alt="">
        <div class="nom-detFilm"><?= $detActeur['nomActeur']; ?></div>
        <div class="dn-detFilm"><?= $detActeur['dateNaissance']; ?></div>
        <div class="sexe-detFilm"><?= $detActeur['sexe']; ?></div>
        
        <?php foreach($detActeur2 as $detActeur2) { ?>
            film : <?= $detActeur2['titre']; ?> <br>
            role : <?= $detActeur2['nomPersonnage']; ?> <br>
    </div>

    <?php } ?>
</body>
</html>



<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>