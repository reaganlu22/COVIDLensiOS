<?php

require_once '../includes/autoload.php';

/**
 * Description of AdminModel
 *
 * @author isaactaylor
 */
class AdminModel {

    private $connection;

    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    function __destruct() {
        $this->connection = null;
    }

    public function createAdmin(Admin $admin) {
        $preparedStmt = "INSERT INTO " . $admin->getTableName() . " (adminID, email, password) VALUES (?,?,?)";
        $admin->setSql($preparedStmt);
        $response = $this->connection->create($admin);
        // if admin creation was a success
        if ($response) {
            
        } else {
            // if admin creation failed
        }
    }

    public function readAdmin(Admin $admin) {
        $preparedStmt = "SELECT * FROM " . $admin->getTableName() . " WHERE adminID=?";
        $response = $this->connection->read($admin);
        return $response;
    }

    public function updateAdmin(Admin $admin) {
        $preparedStmt = "UPDATE" . $admin->getTableName() . " SET email=?, password=? WHERE adminID=?";
        $response = $this->connection->delete($admin);
        // if admin update was a success
        if ($response) {
            
        } else {
            // if admin update failed
        }
    }

    public function deleteAdmin(Admin $admin) {
        $preparedStmt = "DELETE FROM " . $admin->getTableName() . " WHERE adminID=?";
        $response = $this->connection->delete($admin);
        // if admin deletion was a success
        if ($response) {
            
        } else {
            // if admin deletion failed
        }
    }

}
