<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach ($listGenres as $listGenre) { ?>

        <?= $listGenre['type']; ?> <br><br>
    <?php } ?>
</body>
</html>


<?php 
$titre = "TOUS LES GENRES";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>