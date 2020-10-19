<?php

require_once '../includes/autoload.php';

/**
 * Description of ResourceModel
 *
 * @author isaactaylor
 */
class ResourceModel {

    private $connection;

    /**
     * Terminates the connection started by the Constructor
     */
    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    function __destruct() {
        $this->connection = null;
    }

    /**
     * This function creates a resource in the database 
     * 
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function createResource(Resource $resource) {
        $preparedStmt = "INSERT INTO " . $resource->getTableName() . " (resourceID,"
                . " title, categoryName, linkResource) VALUES (?,?,?,?)";
        $resource->setSql($preparedStmt);
        $response = $this->connection->create($resource);
        return $response;
    }

    /**
     * This function retrieves a resources info from the database
     * 
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function readResource(Resource $resource) {
        $preparedStmt = "SELECT * FROM " . $resource->getTableName() . " WHERE resourceID=?";
        $response = $this->connection->read($resource);
        return $response;
    }

    /**
     * This function updates a resources info from the database
     * 
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function updateResource(Resource $resource) {
        $preparedStmt = "UPDATE" . $resource->getTableName() . " SET title=?,"
                . " categoryName=?, linkResource=? WHERE resourceID=?";
        $response = $this->connection->delete($resource);
        return $response;
    }

    /**
     * This function removes a resources info from the database
     * 
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function deleteResource(Resource $resource) {
        $preparedStmt = "DELETE FROM " . $resource->getTableName() . " WHERE resourceID=?";
        $response = $this->connection->delete($resource);
        return $response;
    }

     /**
     * This function retrieves all resources from the database
     * 
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function getAllResource(Resource $resource) {
        $preparedStmt = "SELECT * FROM " . $resource->getTableName();
        $response = $this->connection->read($resource);
        return $response;
    }

}
