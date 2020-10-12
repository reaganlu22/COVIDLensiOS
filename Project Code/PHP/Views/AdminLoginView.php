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
        if (file_exists('../includes/autoload.php')) {
            require_once '../includes/autoload.php';
        }
        //should return failure message since not connected to db...

        $object = new Admin();
        $object->setEmail("abc@gmail.com");
        $object->setRequest(Requests::adminCreation());
        $controller = new AdminController();
        echo json_encode($controller->invokeAdmin($object));
        // if sign in is successful, then load the signed in view
        ?>
    </body>
</html>
