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
        $preparedStmt = "INSERT INTO " . $admin->getTableName() . " (adminID, adminEmail, adminPassword) VALUES (?,?,?)";
	$admin->setSql($preparedStmt);
        $response = $this->connection->create($admin);
        return $response;
    }

    public function readAdmin(Admin $admin) {
        $preparedStmt = "SELECT adminID FROM " . $admin->getTableName() . " WHERE adminEmail=? AND adminPassword=?";

	$admin->setSql($preparedStmt);
        $response = $this->connection->read($admin);
        return $response;
    }

    public function updateAdmin(Admin $admin) {
        $preparedStmt = "UPDATE" . $admin->getTableName() . " SET email=?, password=? WHERE adminID=?";
        $admin->setSql($preparedStmt);
	$response = $this->connection->delete($admin);
        return $response;
    }

    public function deleteAdmin(Admin $admin) {
        $preparedStmt = "DELETE FROM " . $admin->getTableName() . " WHERE adminID=?";
        $admin->setSql($preparedStmt);
	$response = $this->connection->delete($admin);
        return $response;
    }

}
