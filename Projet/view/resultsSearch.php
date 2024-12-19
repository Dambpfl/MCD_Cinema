<?php ob_start();
    foreach ($results as $result) { ?> 
        <div class="result-film">
            <img class='result-img' src=<?= $result['affiche'] ?> alt="">
            <p><?= $result["titre"]." (".$result["anneeSortie"].")"; ?> </p>
        </div>  
<?php } ?> 



<?php
$titre = "Résultats recherche";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>