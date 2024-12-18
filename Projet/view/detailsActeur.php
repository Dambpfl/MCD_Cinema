<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="container-detAct">
        <!-- div photo + infos -->
        <div class="info-detAct">
            <img class='detAct-img' src="<?= $detActeur['photo']; ?>" alt="">
            <h2>Informations</h2>
            <p><?= $detActeur['nomActeur']; ?></p>
            <p><?= $detActeur['dateNaissance'];?></p> 
            <p><?= $detActeur['sexe']; ?></p>
        </div>

        <!-- div bio + filmo -->
        <div class="bio-detAct">
            <h2>Biographie </h2>
            <h2>Filmographie</h2>
            <div class="filmo-detAct">
                <?php foreach($detActeur2 as $detActeur2) { ?>
                    <div class="bloc-detAct">
                        <img class='detAct-img2'src="<?= $detActeur2['affiche']; ?>" alt=""> 
                        <p><?= $detActeur2['titre']; ?> </p>
                        <i><?= $detActeur2['nomPersonnage'];?></i>
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