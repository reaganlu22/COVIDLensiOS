<?php


/**
 * Description of DatabaseAdapter
 *
 * @author isaactaylor
 */
class DatabaseAdapter implements DBAdapterInterface {

    private $connection;

    function __construct(MysqlConnector $connector) {
        $dbConnector = $connector;
        $this->connection = $dbConnector->getConnection();
        if (mysqli_connect_error()) {
            echo 'DB Connection error';
            exit();
        }
    }

    public function create(DataObject $object) {
        
    }

    public function read(DataObject $object) {
       
    }

    public function update(DataObject $object) {
       
    }

    public function delete(DataObject $object) {
       
    }

}
