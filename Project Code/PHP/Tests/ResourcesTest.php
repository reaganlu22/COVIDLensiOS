<?php

require_once '../includes/autoload.php';


/**
 * Description of ResourcesTest
 *
 * @author isaactaylor
 */
final class ResourcesTest extends TestCase {

	private $resources;
	private $connection;
	private $resourcesController;

	public function __construct() {

		$this->resources = new Resources();
		$this->resources->setResourceID(uniqid());
		$this->resources->setTitle("Latest News");
		$this->resources->setCategoryName("NEWS WHO");
		$this->resources->setLinkResource("www.who.int/news-room");
		$this->resourcesController = new ResourceController();

		$this->connection = new DatabaseAdapter(new MysqlConnector());
	}

	public function __destruct() {
		$this->connection = null;
	}

	public function testResourcesCreation() {

		$this->resources->setRequest(Requests::resourceCreation());
		$this->resources->setTableName("resources");
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();

		if ($this->connection->isConnected()){
			$this->assertEquals(json_encode($expected1), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesCreation");
		} else {
			$this->assertEquals(json_encode($expected2), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesCreation");
		}
	}

	public function testResourcesDeletion() {
		$this->resources->setRequest(Requests::resourceDeletion());
		$this->resources->setTableName("resources");
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
		$expected2 = FailOrPass::getFailureArray();
		if ($this->connection->isConnected()) {
			$this->assertEquals($expected1, $this->resourcesController->invokeResource($this->resources), "testResourcesDeletion");
		} else {
			$this->assertEquals($expected2, $this->resourcesController->invokeResource($this->resources), "testResourcesDeletion");
		}
	}

}
