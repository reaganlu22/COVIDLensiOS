<?php

require_once '../includes/autoload.php';

/**
 * Description of DatabaseAdapter
 *
 * @author isaactaylor
 */
class DatabaseAdapter implements DatabaseAdapterInterface {

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
        $stmt = $this->connection->prepare($object->getSql());

        if ($object->getRequest() === Requests::adminCreation()) {
            
        } else if ($object->getRequest() === Requests::alertCreation()) {
            
        } else if ($object->getRequest() === Requests::reportCreationRequest()) {
            
        } else if ($object->getRequest() === Requests::locationCreation()) {
            
        } else if ($object->getRequest() === Requests::resourceCreation()) {
            
        } else if ($object->getRequest() === Requests::userCreationRequest()) {
            
        }
    }

    public function read(DataObject $object) {
        $stmt = $this->connection->prepare($object->getSql());

        if ($object->getRequest() === Requests::adminSignInRequest()) {
            
        } else if ($object->getRequest() === Requests::userDataRequest()) {
            
        } else if ($object->getRequest() === Requests::reportReadAll()) {
            
        } else if ($object->getRequest() === Requests::reportRequest()) {
            
        } else if ($object->getRequest() === Requests::resourceReadAll()) {
            
        } else if ($object->getRequest() === Requests::resourceRequest()) {
            
        } else if ($object->getRequest() === Requests::locationsReadAll()) {
            
        } else if ($object->getRequest() === Requests::locationRequest()) {
            
        } else if ($object->getRequest() === Requests::alertReadAll()) {
            
        } else if ($object->getRequest() === Requests::alertRequest()) {
            
        }
    }

    public function update(DataObject $object) {
        $stmt = $this->connection->prepare($object->getSql());

        if ($object->getRequest() === Requests::adminSignInRequest()) {
            
        } else if ($object->getRequest() === Requests::adminSignOutRequest()) {
            
        } else if ($object->getRequest() === Requests::userSave()) {
            
        } else if ($object->getRequest() === Requests::reportConfirmation()) {
            
        } else if ($object->getRequest() === Requests::resourceUpdate()) {
            
        } else if ($object->getRequest() === Requests::locationUpdate()) {
            
        } else if ($object->getRequest() === Requests::alertUpdate()) {
            
        }
    }

    public function delete(DataObject $object) {
        $stmt = $this->connection->prepare($object->getSql());

        if ($object->getRequest() === Requests::adminCreation()) {
            
        } else if ($object->getRequest() === Requests::adminDeletion()) {
            
        } else if ($object->getRequest() === Requests::userDeletion()) {
            
        } else if ($object->getRequest() === Requests::resourceDeletion()) {
            
        } else if ($object->getRequest() === Requests::locationDeletion()) {
            
        } else if ($object->getRequest() === Requests::alertDeletion()) {
            
        }
    }

}
