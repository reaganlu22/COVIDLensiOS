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
        // if alert creation was a success
        if ($response) {
            
        } else {
            // if alert creation failed
        }
    }

    public function readAlert(Alert $alert) {
        $preparedStmt = "SELECT * FROM " . $alert->getTableName() . " WHERE alertID=?";
        $response = $this->connection->read($alert);
        return $response;
    }

    public function updateAlert(Alert $alert) {
        $preparedStmt = "UPDATE" . $alert->getTableName() . " SET email=?, password=? WHERE alertID=?";
        $response = $this->connection->delete($alert);
        // if alert update was a success
        if ($response) {
            
        } else {
            // if alert update failed
        }
    }

    public function deleteAlert(Alert $alert) {
        $preparedStmt = "DELETE FROM " . $alert->getTableName() . " WHERE alertID=?";
        $response = $this->connection->delete($alert);
        // if alert deletion was a success
        if ($response) {
            
        } else {
            // if alert deletion failed
        }
    }

    public function getAllAlerts(Alert $alert) {
        $preparedStmt = "SELECT * FROM " . $alert->getTableName();
        $response = $this->connection->read($alert);
        return $response;
    }

}
