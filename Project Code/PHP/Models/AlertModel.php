<?php
//require_once '../includes/autoload.php';

/**
 * Description of AlertModel
 *
 * @author isaactaylor
 */
class AlertModel {

    private $connection;

    /**
     * Constructor that start's a database connection for model to interact with
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
     * This function creates a alert in the database
     *
     * @param Alert $alert - A DataObject that represents an alert
     * @return array
     */
    public function createAlert(Alert $alert) {
        $preparedStmt = "INSERT INTO " . $alert->getTableName() . " (alertID, title, message) VALUES (?,?,?)";
        $alert->setSql($preparedStmt);
        $response = $this->connection->create($alert);
        return $response;
    }

     /**
     * This function retrieves an alert's info from the database
     *
     * @param Alert $alert - A DataObject that represents a alert
     * @return array
     */
    public function readAlert(Alert $alert) {
        $preparedStmt = "SELECT * FROM " . $alert->getTableName() . " WHERE alertID=?";
        $alert->setSql($preparedStmt);
        $response = $this->connection->read($alert);
        return $response;
    }

    /**
     * This function updates an alert's info from the database
     *
     * @param Alert $alert - A DataObject that represents a alert
     * @return array
     */
    public function updateAlert(Alert $alert) {
        $preparedStmt = "UPDATE " . $alert->getTableName() . " SET title=?, message=? WHERE alertID=?";
        $alert->setSql($preparedStmt);
        $response = $this->connection->update($alert);
        return $response;
    }

     /**
     * This function removes an alert's info from the database
     *
     * @param Alert $alert - A DataObject that represents a alert
     * @return array
     */
    public function deleteAlert(Alert $alert) {
        $preparedStmt = "DELETE FROM " . $alert->getTableName() . " WHERE alertID=?";
        $alert->setSql($preparedStmt);
        $response = $this->connection->delete($alert);
        return $response;
    }

     /**
     * This function retrieves all alert's from the database
     *
     * @param Alert $alert - A DataObject that represents a alert
     * @return array
     */
    public function readAllAlerts(Alert $alert) {
        $preparedStmt = "SELECT * FROM " . $alert->getTableName();
        $alert->setSql($preparedStmt);
        $response = $this->connection->read($alert);
        return $response;
    }

}
