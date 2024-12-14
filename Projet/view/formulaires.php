<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

   <form action="traitement.php?action=add" method="post">
        <p>
            <label>
                Ajouter un genre :
                <input type="text" name="name">
            </label>
        </p>
        <p>
            <label>
                Ajouter un acteur :
                <input type="text" name="name">
            </label>
        </p>
   </form>

</body>
</html>


<?php 

$contenu = ob_get_clean(); 
require_once "view/template.php";
?>