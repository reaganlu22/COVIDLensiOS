<?php

//require_once '../includes/autoload.php';

/**
 * Description of UserModel
 *
 * @author isaactaylor
 */
class UserModel {

    private $connection;

    /**
     * Constructor that starts a database connection for model to interact with
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
     * This function creates a user in the database
     *
     * @param User $user - A DataObject that represents a user
     * @return array
     */
    public function createUser(User $user) {
        $preparedStmt;
        if ($user->getGoogleID() !== '') {
            $preparedStmt = $preparedStmt = "INSERT INTO " . $user->getTableName() . " (googleID, userID, userEmail,"
                    . " userPassword, userData, signedIn) VALUES (?,?,?,?,?,?)";
        } else {
            $preparedStmt = "INSERT INTO " . $user->getTableName() . " (userID, userEmail,"
                    . " userPassword, userData, signedIn) VALUES (?,?,?,?,?)";
        }

        $user->setSql($preparedStmt);
        $response = $this->connection->create($user);
        return $response;
    }

    /**
     * This function retrieves a users info from the database
     *
     * @param User $user - A DataObject that represents a user
     * @return array
     */
    public function readUser(User $user) {
        $preparedStmt = "SELECT userID, userData FROM " . $user->getTableName() . " WHERE userEmail=? "
                . "AND userPassword=?";

        $user->setSql($preparedStmt);
        $response = $this->connection->read($user);
        return $response;
    }

    /**
     * This function updates a users info from the database
     *
     * @param User $user - A DataObject that represents a user
     * @return array
     */
    public function updateUser(User $user) {
        $preparedStmt = "UPDATE " . $user->getTableName() . " SET userEmail=?,"
                . " userPassword=?, userData=?, signedIn=? WHERE userID=?";
        $user->setSql($preparedStmt);
        $response = $this->connection->update($user);
        return $response;
    }

    /**
     * This function removes a users info from the database
     *
     * @param User $user - A DataObject that represents a user
     * @return array
     */
    public function deleteUser(User $user) {
        $preparedStmt = "DELETE FROM " . $user->getTableName() . " WHERE userID=?";
        $user->setSql($preparedStmt);
        $response = $this->connection->delete($user);
        return $response;
    }

}
