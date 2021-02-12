<?php

//require_once '../includes/autoload.php';

/**
 * Description of AdminModel
 *
 * @author isaactaylor
 */
class AdminModel {

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
     * This function creates a admin in the database
     *
     * @param Admin $admin - A DataObject that represents a admin
     * @return array
     */
    public function createAdmin(Admin $admin) {
        $preparedStmt = "INSERT INTO " . $admin->getTableName() . " (adminID, adminEmail, adminPassword, signedIn) VALUES (?,?,?,?)";
        $admin->setSql($preparedStmt);
        $response = $this->connection->create($admin);
        return $response;
    }

    /**
     * This function retrieves a admins info from the database
     *
     * @param Admin $admin - A DataObject that represents a admin
     * @return array
     */
    public function readAdmin(Admin $admin) {
        
        $preparedStmt = "SELECT adminID FROM " . $admin->getTableName() .
                " WHERE adminEmail=? AND adminPassword=?";
        $admin->setSql($preparedStmt);
        $response = $this->connection->read($admin);
        //if admin information is being read, then they are signed in
        $admin->setSignedIn('true');
        $this->updateAdmin($admin);
        return $response;
    }

    /**
     * This function updates a admins info from the database
     *
     * @param Admin $admin - A DataObject that represents a admin
     * @return array
     */
    public function updateAdmin(Admin $admin) {
        $preparedStmt = "UPDATE " . $admin->getTableName() . " SET adminEmail=?, "
                . "adminPassword=?, signedIn=? WHERE adminID=?";
        $admin->setSql($preparedStmt);
        $response = $this->connection->update($admin);
        return $response;
    }

    /**
     * This function removes an admins info from the database
     *
     * @param Admin $admin - A DataObject that represents a admin
     * @return array
     */
    public function deleteAdmin(Admin $admin) {
        $preparedStmt = "DELETE FROM " . $admin->getTableName() . " WHERE adminID=?";
        $admin->setSql($preparedStmt);
        $response = $this->connection->delete($admin);
        return $response;
    }

}
