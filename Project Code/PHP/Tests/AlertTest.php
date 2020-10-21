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

	public function testAlertCreation() {
		$this->alert->setRequest(Requests::alertCreation());
		$this->alert->setTableName("alert");
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();

		if ($this->connection->isConnected()){
			$this->assertEquals(json_encode($expected1), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertCreation");
		} else {
			$this->assertEquals(json_encode($expected2), json_encode($this->alertController->invokeAlert($this->alert)), "testAlertCreation");
		}
	}

	public function testAlertUpdate() {
		$this->alert->setRequest(Requests::alertUpdate());
		$this->alert->setTableName("alert");

		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();

		if ($this->connection->isConnected()) {
			$this->assertEquals($expected1, $this->alertController->invokeAlert($this->alert), "testAlertUpdate");
		} else {
			$this->assertEquals($expected2, $this->alertController->invokeAlert($this->alert), "testAlertUpdate");
		}
	}

	public function testAlertReadAll() {
		$this->alert->setRequest(Requests::alertReadAll());
		$this->alert->setTableName("alert");
		
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();

		if ($this->connection->isConnected()) {
			$this->assertEquals($expected1, $this->alertController->invokeAlert($this->alert), "testAlertReadAll");
		} else {
			$this->assertEquals($expected2, $this->alertController->invokeAlert($this->alert), "testAlertReadAll");
		}
	}

	public function testAlertDeletion() {
		
		$this->alert->setRequest(Requests::alertDeletion());
		$this->alert->setTableName("alert");
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();
		if ($this->connection->isConnected()) {
			$this->assertEquals($expected1, $this->alertController->invokeAlert($this->alert), "testAlertDeletion");
		} else {
			$this->assertEquals($expected2, $this->alertController->invokeAlert($this->alert), "testAlertDeletion");
		}
	}

}
