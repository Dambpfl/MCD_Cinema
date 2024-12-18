<?php ob_start();?>


<div class="container-all">
    <div class="container-details-film">
            <img class="details-film-img" src="<?= $detFilm['affiche']; ?> " alt=""><br>
    </div>      
            <div class="container-infos-film">
                    <h2><?= $detFilm['titre']; ?></h2>

                    <div class="dfSortie"><p>Sortie : <?= $detFilm['anneeSortie'];?></div>
                    <div class="dfDuree"><p>Durée : <?= $detFilm['duree']; ?> min </p></div>

                    <h2>Synopsis</h2>
                    <div class="dfSynoposis"><p><?= $detFilm['synopsis']; ?> </p></div>
                    
                        
                    <h2>Acteurs</h2>
                    <?php foreach($casting as $cast) { ?>
                        <div class="dfNom"><p><?= $cast['nomActeur']; ?> en tant que : </p></div>
                        <div class="dfPerso"><i><?= $cast['nomPersonnage']; ?> </i></div>    
                    
                    <?php } ?>
            </div>
</div>

<?php
$titre = "Détail Film";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>