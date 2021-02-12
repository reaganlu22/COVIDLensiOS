<?php

//require_once '../includes/autoload.php';

/**
 * Description of MapLocationsModel
 *
 * @author isaactaylor
 */
class MapLocationsModel {

    private $connection;

    /**
     * Constructor that starts a database connection for model to interact with
     */
    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

     /**
     * Terminates the connection started by the Constructor
     */
    function __destruct() {
        $this->connection = null;
    }

    /**
     * This function creates a mapLocation in the database
     *
     * @param MapLocation $mapLocation - A DataObject that represents a map location
     * @return array
     */
    public function createMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "INSERT INTO " . $mapLocation->getTableName() . " (locationID,"
                . " residenceHall, latitude, longitude) VALUES (?,?,?,?)";
        $mapLocation->setSql($preparedStmt);
        $response = $this->connection->create($mapLocation);
        return $response;
    }

     /**
     * This function retrieves a MapLocations info from the database
     *
     * @param MapLocation $mapLocation - A DataObject that represents a map location
     * @return array
     */
    public function readMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "SELECT * FROM " . $mapLocation->getTableName() . " WHERE locationID=?";
        $mapLocation->setSql($preparedStmt);
        $response = $this->connection->read($mapLocation);
        return $response;
    }

    /**
     * This function updates a MapLocations info from the database
     *
     * @param MapLocation $mapLocation - A DataObject that represents a map location
     * @return array
     */
    public function updateMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "UPDATE " . $mapLocation->getTableName() . " SET residenceHall=?,"
                . " latitude=?, longitude=? WHERE locationID=?";
        $mapLocation->setSql($preparedStmt);
        $response = $this->connection->update($mapLocation);
        return $response;
    }

     /**
     * This function removes a MapLocations info from the database
     *
     * @param MapLocation $mapLocation - A DataObject that represents a map location
     * @return array
     */
    public function deleteMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "DELETE FROM " . $mapLocation->getTableName() . " WHERE locationID=?";
        $mapLocation->setSql($preparedStmt);
        $response = $this->connection->delete($mapLocation);
        return $response;
    }

     /**
     * This function retrieves all MapLocations from the database
     *
     * @param MapLocation $mapLocation - A DataObject that represents a map location
     * @return array
     */
    public function getAllMapLocations(MapLocations $mapLocation) {
        $preparedStmt = "SELECT * FROM " . $mapLocation->getTableName();
        $mapLocation->setSql($preparedStmt);
        $response = $this->connection->read($mapLocation);
        return $response;
    }

}
