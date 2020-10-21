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
        $preparedStmt = "INSERT INTO " . $user->getTableName() . " (userID, userEmail, userPassword, userData) VALUES (?,?,?,?)";
        $user->setSql($preparedStmt);
        $response = $this->connection->create($user);
        return $response;
    }

    public function readUser(User $user) {
        $preparedStmt = "SELECT * FROM " . $user->getTableName() . " WHERE userID=?";
        $user->setSql($preparedStmt);
        $response = $this->connection->read($user);
        return $response;
    }

    public function updateUser(User $user) {
        $preparedStmt = "UPDATE" . $user->getTableName() . " SET userEmail=?,"
                . " userPassword=?, userData=? WHERE userID=?";
        $user->setSql($preparedStmt);
        $response = $this->connection->delete($user);
        return $response;
    }

    public function deleteUser(User $user) {
        $preparedStmt = "DELETE FROM " . $user->getTableName() . " WHERE userID=?";
        $user->setSql($preparedStmt);
        $response = $this->connection->delete($user);
        return $response;
    }

}
