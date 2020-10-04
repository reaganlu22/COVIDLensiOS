<?php

require_once '../includes/autoload.php';


/**
 * Description of MapLocationsModel
 *
 * @author isaactaylor
 */
class MapLocationsModel {

    private $connection;

    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }
    
    function __destruct() {
        $this->connection = null;
    }

    public function createMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "INSERT INTO " . $mapLocation->getTableName() . " (locationID,"
                . " residenceHall, latitude, longitude) VALUES (?,?,?,?)";
        $mapLocation->setSql($preparedStmt);
        $response = $this->connection->create($mapLocation);
        // if mapLocation creation was a success
        if ($response) {
            
        } else {
            // if mapLocation creation failed
        }
    }

    public function readMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "SELECT * FROM " . $mapLocation->getTableName() . " WHERE locationID=?";
        $response = $this->connection->read($mapLocation);
        return $response;
    }

    public function updateMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "UPDATE" . $mapLocation->getTableName() . " SET residenceHall=?,"
                . " latitude=?, longitude=? WHERE locationID=?";
        $response = $this->connection->delete($mapLocation);
        // if mapLocation update was a success
        if ($response) {
            
        } else {
            // if mapLocation update failed
        }
    }

    public function deleteMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "DELETE FROM " . $mapLocation->getTableName() . " WHERE locationID=?";
        $response = $this->connection->delete($mapLocation);
        // if mapLocation deletion was a success
        if ($response) {
            
        } else {
            // if mapLocation deletion failed
        }
    }

    public function getAllMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "SELECT * FROM " . $mapLocation->getTableName();
        $response = $this->connection->read($mapLocation);
        return $response;
    }
}
