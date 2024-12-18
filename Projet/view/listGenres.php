<?php ob_start(); ?>


<body>
    <div class="container-list-genre">
        <?php foreach ($listGenres as $listGenre) { ?>
            <div class="list-genre">
                <a href="index.php?action=detailsGenre&id= <?= $listGenre["id_genre"]?>"><?= $listGenre['type']; ?></a>
            </div>
        <?php } ?>
    </div>
</body>



<?php 
$titre = "TOUS LES GENRES";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>