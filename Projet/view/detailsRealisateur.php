<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="container-detRea">
        <div class="info-detRea">
            <img class='detRea-img' src="<?= $detRealisateur['photo'];?>" alt="">
            <h2>Informations</h2>
            <p><?= $detRealisateur['nomRealisateur']; ?></p> 
            <p><?= $detRealisateur['dateNaissance']; ?> </p>
            <p><?= $detRealisateur['sexe']; ?></p>
        </div>

        <div class="bio-detRea">
            <h2>Biographie</h2>
            <p><?= $detRealisateur['biographie']; ?></p>
            <h2>Filmographie</h2>
            <div class="filmo-detRea">
                <?php foreach($detRealisateur2 as $detRealisateur2) { ?>
                    <div class="bloc-detRea">
                        <img class='detRea-img2' src="<?= $detRealisateur2['affiche']; ?>" alt="">
                     <p><?= $detRealisateur2['titre']; ?> (<?= $detRealisateur2['anneeSortie']; ?>)</p>
                    </div>
                 <?php } ?>
            </div>
        </div>
    </div>

</body>
</html>



<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>