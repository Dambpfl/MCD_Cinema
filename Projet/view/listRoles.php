<?php ob_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach ($listRoles as $listRole) { ?>

    <a href="index.php?action=detailsRole&id=<?= $listRole['id_role']?>"><?= $listRole['nomPersonnage']; ?></a> <br>

        <?php } ?>

</body>
</html>


<?php 
$titre = "LISTE DES ROLES";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>