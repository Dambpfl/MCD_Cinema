<?php ob_start(); ?>


<h1>TOUS NOS FILMS</h1>

        <!-- Icone note -->
   
<body>
    <div class="film-container">
        <?php foreach ($listFilms as $listFilm) { ?>
            <div class="film">           
                <a href="index.php?action=detailsFilm&id=<?= $listFilm['id_film'] ?>"><img src="<?= $listFilm['affiche']; ?>" alt=""></a>
                <p class="titre"><?= $listFilm['titre']; ?> (<?= $listFilm['anneeSortie']; ?>)</p> 
                    <div class='note'>
                        <i class="ri-star-fill"></i> 
                            <?= $listFilm['note']; ?>
                    </div>
            </div> 
        <?php } ?>
    </div>    
</body>


<?php 
$titre = "TOUS NOS FILMS";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>