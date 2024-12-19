<?php ob_start();?>


<div class="container-all">
    <div class="container-details-film">
        <img class="details-film-img" src="<?= $detFilm['affiche']; ?> " alt=""><br>
    </div>      
        <div class="container-infos-film">
                <h2><?= $detFilm['titre']; ?></h2>
                <div class="dfSortie">
                        <p>Sortie : <?= $detFilm['anneeSortie'];?></p>
                </div>
                <div class="dfgenre">
                        <p>Genre : <?= $detFilm['type']; ?></p>
                </div>
                <div class="dfDuree">
                        <p>Durée : <?= $detFilm['duree']; ?> min </p>
                </div>

                <h2>Synopsis</h2>
                <div class="dfSynopsis">
                        <p><?= $detFilm['synopsis']; ?></p>
                </div>
                        
                <h2>Acteurs</h2>
                <div class="dfCasting">
                        <?php foreach($casting as $cast) { ?>
                                <p><a class='df-detAct' href="index.php?action=detailsActeur&id=<?= $cast['id_acteur']?>"><?= $cast['nomActeur']; ?></a> en tant que : </p>
                                <i><?= $cast['nomPersonnage']; ?> </i> 
                        <?php } ?>
                </div>
        </div>
</div>

<?php
$titre = "Détails Film";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>