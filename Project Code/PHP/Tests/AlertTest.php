<?php

require_once '../includes/autoload.php';

/**
 * Description of AlertTests
 *
 * @author isaactaylor
 */
final class AlertTest extends TestCase {

    private $alert;
    private $connection;
    private $alertController;

    public function __construct() {

        $this->alert = new Alert();
        $this->alert->setAlertID(uniqid());
        $this->alert->setAlertTitle(date('Y-m-d H:i:s'));
        $this->alert->setAlertMessage("On Friday 16th, 2020, a positive case was reported by a member of the UNCG community.");
        $this->alertController = new AlertController();

        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

    public function testAlertCreation($display = true) {
        $this->alert->setRequest(Requests::alertCreation());
        $this->alert->setTableName("alert");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertCreation", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertCreation", $display);
        }
    }

    public function testAlertUpdate($display = true) {
        $this->alert->setAlertTitle(date('Y-m-d H:i:s'));
        $this->alert->setAlertMessage("On October 16th, 2020, a positive case was"
                . " reported by a member of the UNCG community.");
        $this->alert->setTableName("alert");
        $this->testAlertCreation(false);
        $this->alert->setRequest(Requests::alertUpdate());
        $this->alert->setAlertMessage("A cluster was identified on ...");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals($expected1, $this->alertController->invokeAlert($this->alert), "testAlertUpdate", $display);
        } else {
            $this->assertEquals($expected2, $this->alertController->invokeAlert($this->alert), "testAlertUpdate", $display);
        }
    }

    public function testAlertRead($display = true) {
        $this->alert->setRequest(Requests::alertRequest());
        $this->alert->setTableName("alert");
        //$this->alert->setAlertID('5f9deb2cda674');
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => array(
                'alertID' => $this->alert->getAlertID(),
                'title' => date('Y-m-d H:i:s'),
                'message' => 'A cluster was identified on ...'));
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertRead", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertRead", $display);
        }
    }

    public function testAlertDeletion($display = true) {
        $this->alert->setRequest(Requests::alertDeletion());
        $this->alert->setTableName("alert");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertDeletion", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertDeletion", $display);
        }
    }

}
