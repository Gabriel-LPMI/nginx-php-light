<?php try{
    $dbh = new pdo( 'mysql:host=localhost:3306;dbname=station_meteo',
                    'php',
                    '1234',
                    array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    die(json_encode(array('outcome' => true)));
}
catch(PDOException $ex){
    die(json_encode(array('outcome' => false, 'message' => 'Unable to connect')));
}
?>