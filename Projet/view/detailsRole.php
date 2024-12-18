<?php ob_start();?>


<body>
    <div class="container-detRole">
        <?php foreach($detRole as $detRole) { ?>
           <div class="detRole">
               Incarné par <?= $detRole['nomActeur']; ?><br> dans <?= $detRole['titre']; ?>
           </div>
    </div>
    <?php } ?>
</body>



<?php
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>