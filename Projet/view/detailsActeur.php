<?php ob_start();?>


<body>
    <div class="container-detAct">
       
        <div class="info-detAct">
            <img class='detAct-img' src="<?= $detActeur['photo']; ?>" alt="">
            <h2>Informations</h2>
            <p><?= $detActeur['nomActeur']; ?></p>
            <p><?= $detActeur['dateNaissance'];?></p> 
            <p><?= $detActeur['sexe']; ?></p>
        </div>

      
        <div class="bio-detAct">
                <h2>Biographie </h2>
                    <p><?= $detActeur['biographie']; ?></p>
                <h2>Filmographie</h2>
            <div class="filmo-detAct">
                <?php foreach($detActeur2 as $detActeur2) { ?>
                    <div class="bloc-detAct">
                        <img class='detAct-img2'src="<?= $detActeur2['affiche']; ?>" alt=""> 
                        <p><?= $detActeur2['titre']; ?> </p>
                        <i><?= $detActeur2['nomPersonnage'];?></i>
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