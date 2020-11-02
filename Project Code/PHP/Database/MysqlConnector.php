<?php

/**
 * Description of MysqlConnector
 *
 * @author isaactaylor
 */
class MysqlConnector {

    const SERVERNAME = "localhost";
    const USERNAME = "root";
    const PASSWORD = "";
    const DBNAME = "covid_lens";

    private $connection;

    // private $session = session_start();

    /**
     * This is the constructor for a DatabaseConnection. It attempts to create a database connection
     * and returns an error if the connection fails.
     */
    function __construct() {
        // Create connection
        $this->connection = new mysqli(self::SERVERNAME, self::USERNAME, self::PASSWORD, self::DBNAME);

        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }
    }

    /*
     * This function returns mysql the connection
     */

    public function getConnection() {
        return $this->connection;
    }

    /**
     *  This function returns the name of the database
     * @return string
     */
    public function getDBName() {
        return self::DBNAME;
    }

}
