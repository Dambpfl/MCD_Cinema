<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach ($listActeurs as $listActeur) { ?>

        <a href="index.php?action=detailsActeur&id=<?= $listActeur['id_personne']?>"><?= $listActeur['nomActeur']; ?></a> <br>
        <?= $listActeur['dateNaissance']; ?> <br><br>
    <?php } ?>
</body>
</html>


<?php 
$titre = "LISTE DES ACTEURS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>