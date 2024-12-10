<?php ob_start(); ?>

<p>Il y a <?= $requete->rowCount(); ?></p>
<h1> HAHAH </h1>


<?php 
$titre = "mes films";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>