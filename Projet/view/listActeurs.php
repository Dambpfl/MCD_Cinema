<?php ob_start(); ?>


<body>
    <?php foreach ($listActeurs as $listActeur) { ?>
        <div class="acteur-container">
            <img class='acteur-img' src="<?= $listActeur['photo']?>" alt="">
            <div class="acteur">
                <a class="acteur-nom" href="index.php?action=detailsActeur&id=<?= $listActeur['id_acteur']?>"><?= $listActeur['nomActeur']; ?></a>
                <?= $listActeur['dateNaissance']; ?>
                <a class="delete" href="index.php?action=deleteActeur&id=<?= $listActeur['id_acteur']?>" class='btn-delete'>Supprimer</a>
            </div>
        </div> 
    <?php } ?>
</body>



<?php 
$titre = "LISTE DES ACTEURS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>