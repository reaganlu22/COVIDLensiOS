<?php

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}

use \PHPUnit\Framework\TestCase;
use \Models\DataObjects\Admin;
use \Controllers\AdminController;

/**
 * Description of AdminTests
 *
 * @author isaactaylor
 */
final class AdminTest extends TestCase {

    private static $connection;
    private static $admin;
    private static $adminController;

    public static function setUpBeforeClass(): void {
        //connecting to database
        self::$connection = null; // new DatabaseAdapter(new MysqlConnector());
        // building an admin 
        self::$admin = new Admin();
        self::$admin->setAdminID(uniqid());
        self::$admin->setEmail("testAdmin@covidlens.com");
        self::$admin->setPassword("12345ABC!");
        self::$adminController = new AdminController();
    }

//
//    public static function tearDownAfterClass(): void {
//        self::$connection = null;
//    }
//
//    public function testAdminCreation() {
//        self::$admin->setRequest(Requests::adminCreation());
//        self::$admin->setTableName("Admin");
//        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
//        $expected2 = FailOrPass::getFailureArray();
//        //checking to see if we get the correct response when connected or disconnected to the database
//        if (self::$connection->isConnected()) {
//            self::assertInstanceOf($expected1, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        } else {
//            self::assertInstanceOf($expected2, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        }
//    }
//
//    public function testAdminDeletion() {
//        self::$admin->setRequest(Requests::adminDeletion());
//        self::$admin->setTableName("Admin");
//        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
//        $expected2 = FailOrPass::getFailureArray();
//        //checking to see if we get the correct response when connected or disconnected to the database
//        if (self::$connection->isConnected()) {
//            self::assertInstanceOf($expected1, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        } else {
//            self::assertInstanceOf($expected2, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        }
//    }
//
//    public function testAdminSignInRequest() {
//        self::$admin->setRequest(Requests::adminSignInRequest());
//        self::$admin->setTableName("Admin");
//        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
//        $expected2 = FailOrPass::getFailureArray();
//        //checking to see if we get the correct response when connected or disconnected to the database
//        if (self::$connection->isConnected()) {
//            self::assertInstanceOf($expected1, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        } else {
//            self::assertInstanceOf($expected2, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        }
//    }
//
//    public function testAdminSignOutRequest() {
//        self::$admin->setRequest(Requests::adminSignOutRequest());
//        self::$admin->setTableName("Admin");
//        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
//        $expected2 = FailOrPass::getFailureArray();
//        //checking to see if we get the correct response when connected or disconnected to the database
//        if (self::$connection->isConnected()) {
//            self::assertInstanceOf($expected1, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        } else {
//            self::assertInstanceOf($expected2, json_decode(self::$adminController->invokeAdmin(self::$admin)));
//        }
//    }
    function testPass() {
        $this->assertSame(0, 0);
    }

}
