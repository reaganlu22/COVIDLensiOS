<?php

require_once '../includes/autoload.php';

/**
 * Description of AdminTests
 *
 * @author isaactaylor
 */
final class AdminTest extends TestCase {

    private $admin;
    private $connection;
    private $adminController;

    public function __construct() {
        // building an admin 
        $this->admin = new Admin();
        $this->admin->setAdminID(uniqid());
        $this->admin->setEmail("Admin" . uniqid() . "@covidlens.com");
        $this->admin->setPassword("12345ABC!");
        $this->adminController = new AdminController();
        //starting a connection
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

    public function testAdminCreation($display = true) {
        $this->admin->setSignedIn("true");
        $this->admin->setRequest(Requests::adminCreation());
        $this->admin->setTableName("admin_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->adminController->invokeAdmin($this->admin)),
                    "testAdminCreation",$display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->adminController->invokeAdmin($this->admin)),
                    "testAdminCreation",$display);
        }
    }

    public function testAdminDeletion($display = true) {
        //prepare a user new user that can be deleted
        $this->admin->setAdminID("5f9cfde41d71e");
        $this->admin->setEmail("willbedeleted@test.com");
        $this->testAdminCreation(false);
        $this->admin->setRequest(Requests::adminDeletion());
        $this->admin->setTableName("admin_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->adminController->invokeAdmin($this->admin)
                    , "testAdminDeletion",$display);
        } else {
            $this->assertEquals($expected2, $this->adminController->invokeAdmin($this->admin)
                    , "testAdminDeletion",$display);
        }
    }

    public function testAdminSignInRequest($display = true) {
        $this->admin->setSignedIn('false');
        $this->admin->setPassword('12345ABC!');
        $this->admin->setAdminID("5f9cfde41d71e");
        $this->admin->setEmail("willbedeleted@test.com");
        $this->testAdminCreation(false);
        $this->admin->setRequest(Requests::adminSignInRequest());
        $this->admin->setTableName("admin_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => array("adminID" => "5f9cfde41d71e"));
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->adminController->invokeAdmin($this->admin))
                    , "testAdminSignInRequest",$display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->adminController->invokeAdmin($this->admin))
                    , "testAdminSignInRequest",$display);
        }
    }

    public function testAdminSignOutRequest($display = true) {
        $this->admin->setSignedIn('false');
        $this->admin->setPassword('12345ABC!');
        $this->admin->setAdminID("5f9cfde41d71e");
        $this->admin->setEmail("willbedeleted@test.com");
        $this->admin->setRequest(Requests::adminSignOutRequest());
        $this->admin->setTableName("admin_account");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->adminController->invokeAdmin($this->admin))
                    , "testAdminSignOutRequest",$display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->adminController->invokeAdmin($this->admin))
                    , "testAdminSignOutRequest",$display);
        }
    }

}
