<?php ob_start(); ?>


<body>
    <div class="container-role">
        <?php foreach ($listRoles as $listRole) { ?>
            <div class="role">
                <a href="index.php?action=detailsRole&id=<?= $listRole['id_role']?>"><?= $listRole['nomPersonnage']; ?></a>
            </div>
        <?php } ?>
    </div>
</body>



<?php 
$titre = "LISTE DES ROLES";
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>