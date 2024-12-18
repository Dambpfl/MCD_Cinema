<?php ob_start();?>


<body>
    <div class="genre-titre">
        <h2>Catégorie : <?= $genre['type']; ?></h2>
    </div>
    <div class="genre-container">
        <?php foreach($detGenre as $detGenre) { ?>
            <div class="genre">
                <?= $detGenre['titre']; ?> <br>
            </div>
            <?php } ?>
    </div>
</body>




<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>