<?php ob_start();?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?= $detFilm['titre']; ?>
</body>
</html>



<?
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>