<?php

require_once '../includes/autoload.php';

/**
 * Description of AlertModel
 *
 * @author isaactaylor
 */
class AlertModel {

    private $connection;

    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    function __destruct() {
        $this->connection = null;
    }

    public function createAlert(Alert $alert) {
        $preparedStmt = "INSERT INTO " . $alert->getTableName() . " (alertID, title, message) VALUES (?,?,?)";
        $alert->setSql($preparedStmt);
        $response = $this->connection->create($alert);
        return $response;
    }

    public function readAlert(Alert $alert) {
        $preparedStmt = "SELECT * FROM " . $alert->getTableName() . " WHERE alertID=?";
        $response = $this->connection->read($alert);
        return $response;
    }

    public function updateAlert(Alert $alert) {
        $preparedStmt = "UPDATE" . $alert->getTableName() . " SET email=?, password=? WHERE alertID=?";
        $response = $this->connection->delete($alert);
        return $response;
    }

    public function deleteAlert(Alert $alert) {
        $preparedStmt = "DELETE FROM " . $alert->getTableName() . " WHERE alertID=?";
        $response = $this->connection->delete($alert);
        return $response;
    }

    public function getAllAlerts(Alert $alert) {
        $preparedStmt = "SELECT * FROM " . $alert->getTableName();
        $response = $this->connection->read($alert);
        return $response;
    }

}
