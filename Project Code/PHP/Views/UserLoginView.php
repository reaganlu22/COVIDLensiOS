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
        session_start();

        $session =session_id();
        $time = time();

        $object = new User();
        $object->setEmail("efg@gmail.com");
        $object->setPassword("12345ABC!");
        $object->setRequest(Requests::userSignInRequest());
        // $object->setRequest(Requests::userCreationRequest());

        $controller = new UserController();
        

        echo json_encode($controller->invokeUser($object));
        // if sign in is successful, then load the signed in view
        ?>
    </body>
</html>
