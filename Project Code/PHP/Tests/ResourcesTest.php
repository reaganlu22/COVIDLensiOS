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

    public function testResourcesCreation($display = true) {

        $this->resources->setRequest(Requests::resourceCreation());
        $this->resources->setTableName("resources");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesCreation", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesCreation", $display);
        }
    }

    public function testResourcesRead($display = true) {

        $this->resources->setRequest(Requests::resourceRequest());
        $this->resources->setTableName("resources");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => array(
                'resourceID' => $this->resources->getResourceID(),
                'title' => $this->resources->getTitle(),
                'categoryName' => $this->resources->getCategoryName(),
                'linkResource' => $this->resources->getLinkResource()
        ));
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesRead", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesRead", $display);
        }
    }

    public function testResourcesUpdate($display = true) {

        $this->resources->setRequest(Requests::resourceUpdate());
        $this->resources->setTitle('Covid Lens News');
        $this->resources->setCategoryName('Health');
        $this->resources->setLinkResource('www.covidlensapp.com/news');
        $this->resources->setTableName("resources");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesUpdate", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesUpdate", $display);
        }
    }

    public function testResourcesDeletion($display = true) {
        $this->resources->setRequest(Requests::resourceDeletion());
        $this->resources->setTableName("resources");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesDeletion", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->resourcesController->invokeResource($this->resources)), "testResourcesDeletion", $display);
        }
    }

}
