<?php ob_start(); ?>

<body>
    <form action="index.php?action=addFilm" method="post">
    <div class="addf-1">
        <p>
            <label for="titreFilm">
                Titre :
                <input type="text" name="titreFilm">
            </label>
        </p>

        <p>
            <label for="dureeFilm">
                Durée :
                <input type="text" name="dureeFilm">
            </label>
        </p>

        <p>
            <label for="anneeSortieFilm">
                Année de sortie :
                <input type="text" name="anneeSortieFilm">
            </label>
        </p>

        <p>
            <label for="synopsisFilm">
                Synopsis :
                <input type="text" name="synopsisFilm">
            </label>
        </p>

        <p>
            <label for="noteFilm">
                Note :
                <input type="text" name="noteFilm">
            </label>
        </p>

        <p>
            <label for="afficheFilm">
                Affiche :
                <input type="text" name="afficheFilm">
            </label>
        </p>
    </div>

    <div class="addf-2">
        <label for="idRealisateur">
            Réalisateur :
        </label> 
            <select name="idRealisateur">
                <?php foreach($realisateurs as $realisateur) { ?> 
                    <option value=<?= $realisateur["id_realisateur"]; ?> ><?= $realisateur["nomRealisateur"]; ?> </option>
                <?php } ?>
            </select>
    </div>
            
        <div class="addf-3">
            <?php foreach($genres as $genre) { ?>
                <input type="checkbox" id="<?= $genre['id_genre'];?>" name="genres[]" value="<?= $genre['id_genre'];?>">
                <label> 
                    <?= $genre["type"]; ?>
                </label>
            <?php } ?>
        </div>
        
        

<!-- 
        <p>
            <label for="prenomRealisateur">
                Prénom :
                <input type="text" name="prenomRealisateur">
            </label>
        </p>
        <p>
            <label for="nomRealisateur">
                Nom :
                <input type="text" name="nomRealisateur">
            </label>
        </p>
        <p>
           <label for="sexeRealisateur">
               <input type="radio" name="sexeRealisateur" values="H">
               Homme
               <input type="radio" name="sexeRealisateur" values="F">
               Femme
           </label>
       </p>
       <p>
           <label for="dateNaissanceRealisateur">
               Date de naissance :
               <input type="date" name="dateNaissanceRealisateur">
           </label>
       </p>  -->
        <div class="addf-submit">
            <p>
                <input type="submit" name="submit" value="Ajouter">
            </p>
        </div>
    </form>
</body>


<?php 

$contenu = ob_get_clean(); 
require_once "view/template.php";
?>