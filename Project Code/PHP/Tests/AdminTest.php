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
        $this->admin->setEmail("testAdmin@covidlens.com");
        $this->admin->setPassword("12345ABC!");
        $this->adminController = new AdminController();
        //starting a connection
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

    public function testAdminCreation() {
        $this->admin->setRequest(Requests::adminCreation());
        $this->admin->setTableName("Admin");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, json_encode($this->adminController->invokeAdmin($this->admin)),
                    "testAdminCreation");
        } else {
            $this->assertEquals($expected2, json_encode($this->adminController->invokeAdmin($this->admin)),
                   "testAdminCreation" );
        }
    }

    public function testAdminDeletion() {
        $this->admin->setRequest(Requests::adminDeletion());
        $this->admin->setTableName("Admin");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->adminController->invokeAdmin($this->admin)
                    , "testAdminDeletion");
        } else {
            $this->assertEquals($expected2, $this->adminController->invokeAdmin($this->admin)
                    , "testAdminDeletion");
        }
    }

    public function testAdminSignInRequest() {
        $this->admin->setRequest(Requests::adminSignInRequest());
        $this->admin->setTableName("Admin");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->adminController->invokeAdmin($this->admin)
                    , "testAdminSignInRequest");
        } else {
            $this->assertEquals($expected2, $this->adminController->invokeAdmin($this->admin)
                    , "testAdminSignInRequest");
        }
    }

    public function testAdminSignOutRequest() {
        $this->admin->setRequest(Requests::adminSignOutRequest());
        $this->admin->setTableName("Admin");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        //checking to see if we get the correct response when connected or disconnected to the database
        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->adminController->invokeAdmin($this->admin)
                   , "testAdminSignOutRequest");
        } else {
            $this->assertEquals($expected2, $this->adminController->invokeAdmin($this->admin)
                   , "testAdminSignOutRequest");
        }
    }

}
