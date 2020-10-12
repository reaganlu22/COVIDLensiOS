<?php

require_once '../includes/autoload.php';

/**
 * Description of ResourceModel
 *
 * @author isaactaylor
 */
class ResourceModel {

    private $connection;

    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    function __destruct() {
        $this->connection = null;
    }

    public function createResource(Resource $resource) {
        $preparedStmt = "INSERT INTO " . $resource->getTableName() . " (resourceID,"
                . " title, categoryName, linkResource) VALUES (?,?,?,?)";
        $resource->setSql($preparedStmt);
        $response = $this->connection->create($resource);
        return $response;
    }

    public function readResource(Resource $resource) {
        $preparedStmt = "SELECT * FROM " . $resource->getTableName() . " WHERE resourceID=?";
        $response = $this->connection->read($resource);
        return $response;
    }

    public function updateResource(Resource $resource) {
        $preparedStmt = "UPDATE" . $resource->getTableName() . " SET title=?,"
                . " categoryName=?, linkResource=? WHERE resourceID=?";
        $response = $this->connection->delete($resource);
        return $response;
    }

    public function deleteResource(Resource $resource) {
        $preparedStmt = "DELETE FROM " . $resource->getTableName() . " WHERE resourceID=?";
        $response = $this->connection->delete($resource);
        return $response;
    }

    public function getAllResource(Resource $resource) {
        $preparedStmt = "SELECT * FROM " . $resource->getTableName();
        $response = $this->connection->read($resource);
        return $response;
    }

}
