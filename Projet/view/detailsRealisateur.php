<?php ob_start();?>


<body>
    <div class="container-detRea">
        <div class="info-detRea">
            <img class='detRea-img' src="<?= $detRealisateur['photo'];?>" alt="">
            <h2>Informations</h2>
            <p><?= $detRealisateur['nomRealisateur']; ?></p> 
            <p><?= $detRealisateur['dateNaissanceFr']; ?> </p>
            <p><?= $detRealisateur['sexe']; ?></p>
        </div>

        <div class="bio-detRea">
            <h2>Biographie</h2>
            <p><?= $detRealisateur['biographie']; ?></p>
            <h2>Filmographie</h2>
            <div class="filmo-detRea">
                <?php foreach($detRealisateur2 as $detRealisateur2) { ?>
                    <div class="bloc-detRea">
                        <img class='detRea-img2' src="<?= $detRealisateur2['affiche']; ?>" alt="">
                     <p><?= $detRealisateur2['titre']; ?> (<?= $detRealisateur2['anneeSortie']; ?>)</p>
                    </div>
                 <?php } ?>
            </div>
        </div>
    </div>
</body>




<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>