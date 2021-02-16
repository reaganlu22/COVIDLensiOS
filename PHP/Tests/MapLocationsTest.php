<?php

require_once '../includes/autoload.php';

/**
 * Description of MapLocationsTests
 *
 * @author isaactaylor
 */
final class MapLocationsTest extends TestCase {

    private $mapLocations;
    private $connection;
    private $mapLocationsController;

    public function __construct() {

        $this->mapLocations = new MapLocations();
        $this->mapLocations->setLocationID(uniqid());
        $this->mapLocations->setResidenceHall("The Province");
        $this->mapLocations->setLatitude("106744840359415");
        $this->mapLocations->setLongitude("63572375290155");
        $this->mapLocationsController = new MapLocationsController();
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

    public function testMapLocationsCreation($display = true) {
        $this->mapLocations->setRequest(Requests::locationCreation());
        $this->mapLocations->setTableName("Map_Locations");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();

        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsCreation", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsCreation", $display);
        }
    }

    public function testMapLocationsUpdate($display = true) {
        $this->mapLocations->setResidenceHall("The Province has changed");
        $this->mapLocations->setRequest(Requests::locationUpdate());
        $this->mapLocations->setTableName("Map_Locations");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsUpdate", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsUpdate", $display);
        }
    }

    public function testMapLocationsRead($display = true) {
        $this->mapLocations->setRequest(Requests::locationRequest());
        $this->mapLocations->setTableName("Map_Locations");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => array(
                'locationID' => $this->mapLocations->getLocationID(),
                'residenceHall' => 'The Province has changed',
                'latitude' => '63572375290155',
                'longitude' => '106744840359415'
        ));
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsRead", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsRead", $display);
        }
    }

    public function testMapLocationsDeletion($display = true) {
        $this->mapLocations->setRequest(Requests::locationDeletion());
        $this->mapLocations->setTableName("Map_Locations");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsDeletion", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->mapLocationsController->invokeMapLocations($this->mapLocations)), "testMapLocationsDeletion", $display);
        }
    }

}
