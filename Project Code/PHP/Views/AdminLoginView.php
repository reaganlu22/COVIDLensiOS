<!DOCTYPE html>
<!--

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        require_once '../includes/autoload.php';

        //should return failure message since not connected to db...

        $db = new DatabaseAdapter(new MysqlConnector());
        $object = new User();
        $object->setEmail("abc@gmail.com");
        $object->setRequest(Requests::adminCreation());
        $object2 = new MapLocations();
        $object2->setLatitude("101");
        $object2->setLocationID("1fhaj3434");
        var_dump($db->create($object));
        var_dump($db->read($object2));
        $test = new GoogleAuthenticator();
        var_dump($test->verify("sfsdfsfe388333"));
        ?>
    </body>
</html>
