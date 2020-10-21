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

		$this->user = new User();
		$this->user->setUserID(uniqid());
		$this->user->setEmail("testStudent@uncg.edu");
		$this->user->setPassword("12345ABC!");
		$this->user->setAdditionalData("User1");
		$this->userController = new UserController();
        
		$this->connection = new DatabaseAdapter(new MysqlConnector());
	}

	public function __destruct() {
		$this->connection = null;
	}

	public function testUserCreation() {

		$this->user->setRequest(Requests::userCreationRequest());
		$this->user->setTableName("user_account");
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();

		if ($this->connection->isConnected()) {
			$this->assertEquals(json_encode($expected1), json_encode($this->userController->invokeUser($this->user))
                , "testUserCreation");
		} else {
			$this->assertEquals(json_encode($expected2), json_encode($this->userController->invokeUser($this->user))
                , "testUserCreation");
		}
	}

	public function testUserDeletion() {
        
        $this->user->setRequest(Requests::userDeletion());
        $this->user->setTableName("user_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->userController->invokeUser($this->user)
                    , "testUserDeletion");
        } else {
            $this->assertEquals($expected2, $this->userController->invokeUser($this->user)
                    , "testUserDeletion");
        }
    }

    public function testUserSignInRequest() {
        $this->user->setRequest(Requests::userSignInRequest());
        $this->user->setTableName("user_account");
	
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->userController->invokeUser($this->user)
                    , "testUserSignInRequest");
        } else {
            $this->assertEquals($expected2, $this->userController->invokeUser($this->user)
                    , "testUserSignInRequest");
        }
    }

    public function testUserSignOutRequest() {
        $this->user->setRequest(Requests::userSignOutRequest());
        $this->user->setTableName("user_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => []);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->userController->invokeUser($this->user)
                   , "testUserSignOutRequest");
        } else {
            $this->assertEquals($expected2, $this->userController->invokeUser($this->user)
                   , "testUserSignOutRequest");
        }
    }

}
