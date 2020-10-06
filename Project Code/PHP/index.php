<?php

include_once 'includes/autoload.php';

$db = new DatabaseAdapter(new MysqlConnector());
$object = new User();
$object->setEmail("abc@gmail.com");
$object->setRequest(Requests::adminCreation());
$object2 = new MapLocations();
$object2->setLatitude("101");
echo $db->create($object);
