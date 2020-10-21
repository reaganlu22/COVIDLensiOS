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

    public function createResource(Resources $resources) {
        $preparedStmt = "INSERT INTO " . $resources->getTableName() . " (resourceID, title,categoryName, linkResource) VALUES (?,?,?,?)";
        $resources->setSql($preparedStmt);
        $response = $this->connection->create($resources);
        return $response;
    }

    public function readResource(Resources $resources) {
        $preparedStmt = "SELECT * FROM " . $resources->getTableName() . " WHERE resourceID=?";
        $resources->setSql($preparedStmt);
        $response = $this->connection->read($resources);
        return $response;
    }

    public function updateResource(Resources $resources) {
        $preparedStmt = "UPDATE" . $resources->getTableName() . " SET title=?, categoryName=?, linkResource=? WHERE resourceID=?";
        $resources->setSql($preparedStmt);
        $response = $this->connection->delete($resources);
        return $response;
    }

    public function deleteResource(Resources $resources) {
        $preparedStmt = "DELETE FROM " . $resources->getTableName() . " WHERE resourceID=?";
        $resources->setSql($preparedStmt);
        $response = $this->connection->delete($resources);
        return $response;
    }

    public function getAllResource(Resources $resources) {
        $preparedStmt = "SELECT * FROM " . $resources->getTableName();
        $resources->setSql($preparedStmt);
        $response = $this->connection->read($resources);
        return $response;
    }

}
