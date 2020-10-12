<?php

namespace Models;

use Database\DatabaseAdapter;
use Database\MysqlConnector;

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}

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
        return $response;
    }

    public function readAdmin(Admin $admin) {
        $preparedStmt = "SELECT * FROM " . $admin->getTableName() . " WHERE adminID=?";
        $response = $this->connection->read($admin);
        return $response;
    }

    public function updateAdmin(Admin $admin) {
        $preparedStmt = "UPDATE" . $admin->getTableName() . " SET email=?, password=? WHERE adminID=?";
        $response = $this->connection->delete($admin);
        return $response;
    }

    public function deleteAdmin(Admin $admin) {
        $preparedStmt = "DELETE FROM " . $admin->getTableName() . " WHERE adminID=?";
        $response = $this->connection->delete($admin);
        return $response;
    }

}
