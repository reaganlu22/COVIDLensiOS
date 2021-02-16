<?php

require_once '../includes/autoload.php';

/**
 * Description of UserTests
 *
 * @author isaactaylor
 */
final class UserTest extends TestCase {

    private $user;
    private $connection;
    private $userController;

    public function __construct() {
        // building an user 
        $this->user = new User();
        $this->user->setUserID(uniqid());
        $this->user->setEmail("testUser" . uniqid() . "@covidlens.com");
        $this->user->setPassword("12345ABC!");
        $this->user->setSignedIn("true");
        $this->user->setUserData("user data, settings, etc");
        $this->userController = new UserController();
        //starting a connection
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

    public function testUserCreation($display = true) {
        $this->user->setRequest(Requests::userCreationRequest());
        $this->user->setTableName("user_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->userController->invokeUser($this->user)),
                    "testUserCreation", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->userController->invokeUser($this->user)),
                    "testUserCreation", $display);
        }
    }

    public function testUserDeletion($display = true) {
        $this->user->setRequest(Requests::userDeletion());
        $this->user->setTableName("user_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->userController->invokeUser($this->user)
                    , "testUserDeletion", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->userController->invokeUser($this->user))
                    , "testUserDeletion", $display);
        }
    }

    public function testUserSignInRequest($display = true) {
        $this->user->setRequest(Requests::userSignInRequest());
        $this->user->setTableName("user_account");

        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => array(
                'userID' => $this->user->getUserID(),
                'userData' => $this->user->getUserData()
        ));
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->userController->invokeUser($this->user)
                    , "testUserSignInRequest", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->userController->invokeUser($this->user))
                    , "testUserSignInRequest", $display);
        }
    }

    public function testUserSignOutRequest($display = true) {
        $this->user->setRequest(Requests::userSignOutRequest());
        $this->user->setSignedIn("false");
        $this->user->setTableName("user_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->userController->invokeUser($this->user))
                    , "testUserSignOutRequest", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->userController->invokeUser($this->user))
                    , "testUserSignOutRequest", $display);
        }
    }

}
