
<!DOCTYPE html>
<html>
<body>

<h1>PHP Counter-Controlled Loops</h1>

<?php


    echo "\n";

    $i = 0;
    for (; $i < 5; $i++) {
        echo $i;
    }

    echo "\n";
   
    for ( $i = 0; $i < 5; $i++) {
        $i++;
        echo $i;
    }
    echo "\n";
    echo $i;




?>

</body>
</html> 