<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="addActeur">
        <form action="index.php?action=addActeur" method="post">
            <p>
                <label for="nomActeur">
                    Nom :
                    <input type="text" name="nomActeur">
                </label>
            </p>
            <p>
                <label for="prenomActeur">
                    Prenom :
                    <input type="text" name="prenomActeur">
                </label>
            </p>
            <p>
                <label for="sexeActeur">
                    <input type="radio" name="sexeActeur" values="H">
                    Homme
                    <input type="radio" name="sexeActeur" values="F">
                    Femme
                </label>
            </p>
            <p>
                <label for="dateNaissance">
                    Date de naissance :
                    <input type="date" name="dateNaissance">
                </label>
            </p>
            <p>
                 <input type="submit" name="submit" value="Ajouter">
             </p>
         </form>
    </div>

</body>
</html>


<?php 

$contenu = ob_get_clean(); 
require_once "view/template.php";
?>