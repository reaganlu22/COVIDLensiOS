<?php

//require_once '../includes/autoload.php';

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
    public function createResource(Resources $resources) {
        $preparedStmt = "INSERT INTO " . $resources->getTableName() . " (resourceID, title, categoryName, linkResource) VALUES (?,?,?,?)";
        $resources->setSql($preparedStmt);
        $response = $this->connection->create($resources);
        return $response;
    }

    /**
     * This function retrieves a resources info from the database
     *
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function readResource(Resources $resources) {
        $preparedStmt = "SELECT * FROM " . $resources->getTableName() . " WHERE resourceID=?";
        $resources->setSql($preparedStmt);
        $response = $this->connection->read($resources);
        return $response;
    }
    /**
     * This function updates a resources info from the database
     *
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function updateResource(Resources $resources) {
        $preparedStmt = "UPDATE " . $resources->getTableName() . " SET title=?, categoryName=?, linkResource=? WHERE resourceID=?";
        $resources->setSql($preparedStmt);
        $response = $this->connection->update($resources);
        return $response;
    }
    /**
     * This function removes a resources info from the database
     *
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function deleteResource(Resources $resources) {
        $preparedStmt = "DELETE FROM " . $resources->getTableName() . " WHERE resourceID=?";
        $resources->setSql($preparedStmt);
        $response = $this->connection->delete($resources);
        return $response;
    }
    /**
     * This function retrieves all resources from the database
     *
     * @param Resource $resource - A DataObject that represents a resource
     * @return array
     */
    public function getAllResource(Resources $resources) {
        $preparedStmt = "SELECT * FROM " . $resources->getTableName();
        $resources->setSql($preparedStmt);
        $response = $this->connection->read($resources);
    }

}
