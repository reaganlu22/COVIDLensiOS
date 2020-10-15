<?php

require_once '../includes/autoload.php';

/**
 * Description of UserTests
 *
 * @author isaactaylor
 */
class UserTest extends TestCase {

    private $user;
    private $connection;
    private $userController;

    public function __construct() {
        // building an user 
        $this->user = new User();
        $this->user->setUserID(uniqid());
        $this->user->setEmail("testUser@covidlens.com");
        $this->user->setPassword("12345ABC!");
        $this->userController = new UserController();
        //starting a connection
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

}
