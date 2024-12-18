<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?= $detActeur['nomActeur']; ?> <br>
    <?= $detActeur['dateNaissance']; ?> <br>
    <?= $detActeur['sexe']; ?> <br> <br>

    <?php foreach($detActeur2 as $detActeur2) { ?>
    film : <?= $detActeur2['titre']; ?> <br>
    role : <?= $detActeur2['nomPersonnage']; ?> <br>
    <?php } ?>
</body>
</html>



<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>