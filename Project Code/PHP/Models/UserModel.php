<?php

require_once '../includes/autoload.php';

/**
 * Description of UserModel
 *
 * @author isaactaylor
 */
class UserModel {

    private $connection;

    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    function __destruct() {
        $this->connection = null;
    }

    public function createUser(User $user) {
        $preparedStmt = "INSERT INTO " . $user->getTableName() . " (userID,"
                . " email, password, userData) VALUES (?,?,?,?)";
        $user->setSql($preparedStmt);
        $response = $this->connection->create($user);
        // if user creation was a success
        if ($response) {
            
        } else {
            // if user creation failed
        }
    }

    public function readUser(User $user) {
        $preparedStmt = "SELECT * FROM " . $user->getTableName() . " WHERE userID=?";
        $response = $this->connection->read($user);
        return $response;
    }

    public function updateUser(User $user) {
        $preparedStmt = "UPDATE" . $user->getTableName() . " SET email=?,"
                . " password=?, userData=? WHERE userID=?";
        $response = $this->connection->delete($user);
        // if user update was a success
        if ($response) {
            
        } else {
            // if user update failed
        }
    }

    public function deleteUser(User $user) {
        $preparedStmt = "DELETE FROM " . $user->getTableName() . " WHERE userID=?";
        $response = $this->connection->delete($user);
        // if user deletion was a success
        if ($response) {
            
        } else {
            // if user deletion failed
        }
    }

}
