<?php

$nom="chamla";
$prenom="lior";
$age=32;

$nom2="pernin";
$prenom2="magali";
$age2=32;

function presentation($nom,$prenom,$age){
    var_dump("bonjour, je suis $prenom $nom et j 'ai $age ans");
}
presentation($nom,$prenom,$age);
presentation($nom2,$prenom2,$age2);
?>