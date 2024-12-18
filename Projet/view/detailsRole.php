<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php foreach($detRole as $detRole) { ?>
        Incarné par <?= $detRole['nomActeur']; ?><br> dans <?= $detRole['titre']; ?> <br> <br>
    <?php } ?>
</body>
</html>



<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>