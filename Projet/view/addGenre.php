<?php ob_start(); ?>

<body>
    <div class="addGenre">
        <form action="index.php?action=addGenre" method="post">
             <p>
                 <label for="nomGenre">
                     Ajouter un genre :
                     <input type="text" name="nomGenre">
                 </label>
             </p>
             <p>
                 <input type="submit" name="submit" value="Ajouter">
             </p>
         </form>
    </div>
</body>



<?php 

$contenu = ob_get_clean(); 
require_once "view/template.php";
?>