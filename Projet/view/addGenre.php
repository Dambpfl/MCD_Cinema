<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

   <form action="index.php?action=addGenre" method="post">
        <p>
            <label for="nomGenre">
                Ajouter un genre :
                <input type="text" name="nomGenre">
            </label>
        </p>
        <p>
            <input type="submit" name="submit" value="Ajouter">
        </p>
    </form>

</body>
</html>


<?php 

$contenu = ob_get_clean(); 
require_once "view/template.php";
?>