<?php ob_start(); ?>


<body>
    <?php foreach ($listRealisateurs as $listRealisateur) { ?>
        <div class="realisateur-container">
            <img class="realisateur-img" src="<?= $listRealisateur['photo']?>" alt="">
            <div class="realisateur">
                <a class="realisateur-nom" href="index.php?action=detailsRealisateur&id=<?= $listRealisateur['id_realisateur']?>"> <?= $listRealisateur['nomRealisateur']; ?> </a>
                <?= $listRealisateur['dateNaissanceFr']; ?>
            </div>
        </div>
    <?php } ?>
</body>


<?php 
$titre = "LISTE DES RÉALISATEURS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>