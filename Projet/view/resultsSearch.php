<?php ob_start();
    foreach ($results as $result) {
        echo $result["titre"]."<br>";
    }
?>




<?php
$titre = "Résultats recherche";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>