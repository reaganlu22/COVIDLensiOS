<?php

require_once '../includes/autoload.php';
/**
 * Description of DatabaseAdapter
 *
 * @author isaactaylor
 */
class DatabaseAdapter implements DatabaseAdapterInterface {

    private $connection;
    private $connected;

    /**
     * Constructs a Database adapter
     *
     * @param MysqlConnector $connector - the connector to the service of data storage
     * being used
     */
    function __construct(MysqlConnector $connector) {
        $dbConnector = $connector;
        $this->connection = $dbConnector->getConnection();
        if (mysqli_connect_error()) {
            $this->connected = false;
            exit();
        } else {
            $this->connected = true;
        }
    }

    /**
     * This function creates a DataObject in the database
     *
     * @param DataObject $object - an object with properties that can be stored
     * in the database
     * @return array
     */
    public function create(DataObject $object) {
        $result = FailOrPass::getFailureArray();
        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {// remember to check if user exists first...
                if ($object->getRequest() === Requests::adminCreation()) {
                    $stmt->bind_param("sss", $adminID, $email, $password);
                    $adminID = $object->getAdminId();
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                } else if ($object->getRequest() === Requests::alertCreation()) {
                    $stmt->bind_param("sss", $alertID, $title, $message);
                    $alertID = $object->getAlertID();
                    $title = $object->getAlertTitle();
                    $message = $object->getAlertMessage();
                } else if ($object->getRequest() === Requests::reportCreationRequest()) {
                    $stmt->bind_param("sss", $userID, $locationID, $residenceHall,
                            $reportStatus, $age, $reportInfo, $phoneNumber, $situationDesc,
                            $affiliation, $confirmerID);
                    $userID = $object->getUserID();
                    $locationID = $object->getLocationID();
                    $residenceHall = $object->getResidenceHall();
                    $reportStatus = $object->getReportStatus();
                    $age = $object->getAge();
                    $reportInfo = $object->getReportInfo();
                    $phoneNumber = $object->getPhoneNumber();
                    $situationDesc = $object->getSituationDescription();
                    $affiliation = $object->getAffiliation();
                    $confirmerID = $object->getConfirmerID();
                } else if ($object->getRequest() === Requests::locationCreation()) {
                    $stmt->bind_param("ssss", $locationID, $residenceHall, $latitude, $longitude);
                    $locationID = $object->getLocationID();
                    $residenceHall = $object->getResidenceHall();
                    $latitude = $object->getLatitude();
                    $longitude->getLongitutde();
                } else if ($object->getRequest() === Requests::resourceCreation()) {
                    $stmt->bind_param("ssss", $resourceID, $title, $categoryName, $linkResource);
                    $resourceID = $object->getResourceID();
                    $title = $object->getTitle();
                    $categoryName = $object->getCategoryName();
                    $linkResource = $object->getLinkResource();
                } else if ($object->getRequest() === Requests::userCreationRequest()) {
                    $stmt->bind_param("ssss", $userID, $email, $password, $userData);
                    $userID = $object->getUserID();
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                    $userData = $object->getAdditionalData();
                }
                $stmt->execute();

                if ($this->connection->affected_rows == 0) {
                    return $result;
                } else {
                    $result["status"] = FailOrPass::getSuccess();
                }
            }
        } catch (Exception $e) {

        }

        return $result;
    }

    /**
     * This function retrieves data stored in the database based on the properties
     * of a DataObject
     *
     * @param DataObject $object - an object with properties that can be stored
     * in the database
     * @return array
     */
    public function read(DataObject $object) {
        $result = FailOrPass::getFailureArray();
        $result_temp = [];
        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {
                if ($object->getRequest() === Requests::adminSignInRequest()) {

                    $stmt->bind_param("ss", $email, $password);
                    $email = $object->getEmail();
                    $password = $object->getPassword();

                } else if ($object->getRequest() === Requests::userDataRequest()) {
                    $stmt->bind_param("s", $userID);
                    $userID = $object->getUserID();
                } else if ($object->getRequest() === Requests::reportReadAll()) {
                    $stmt->query($object->getSql());
                } else if ($object->getRequest() === Requests::reportRequest()) {
                    $stmt->bind_param("s", $userID);
                    $userID = $object->getUserID();
                } else if ($object->getRequest() === Requests::resourceReadAll()) {
                    $stmt->query($object->getSql());
                } else if ($object->getRequest() === Requests::resourceRequest()) {
                    $stmt->bind_param("s", $resourceID);
                    $resourceID = $object->getResourceID();
                } else if ($object->getRequest() === Requests::locationsReadAll()) {
                    $stmt->query($object->getSql());
                } else if ($object->getRequest() === Requests::locationRequest()) {
                    $stmt->bind_param("s", $locationID);
                    $locationID = $object->getLocationID();
                } else if ($object->getRequest() === Requests::alertReadAll()) {
                    $stmt->query($object->getSql());
                } else if ($object->getRequest() === Requests::alertRequest()) {
                    $stmt->bind_param("s", $alertID);
                    $alertID = $object->getAlertID();
                }
                $stmt->execute();
		$result = $stmt->get_result();
                $data = array();
                while ($row = $result->fetch_assoc()) {
                    $result_temp[] = $row;
                }
                $result_temp["status"] = FailOrPass::getSuccess();
                $result_temp["data"] = $data;
            }
        } catch (Exception $e) {

        }

        return $result_temp;
    }

    /**
     * This function updates a record in the database based on the properties of a
     * DataObject
     *
     * @param DataObject $object - an object with properties that can be stored
     * in the database
     * @return array
     */
    public function update(DataObject $object) {
        $result = FailOrPass::getFailureArray();

        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {
                $stmt = $this->connection->prepare($object->getSql());

                if ($object->getRequest() === Requests::adminSignOutRequest()) {
                    //not currently implemented
                } else if ($object->getRequest() === Requests::userSave()) {
                    $stmt->bind_param("s", $userID);
                    $userID = $object->getUserID();
                } else if ($object->getRequest() === Requests::reportConfirmation()) {
                    $stmt->bind_param("s", $userID);
                    $userID = $object->getUserID();
                } else if ($object->getRequest() === Requests::resourceUpdate()) {
                    $stmt->bind_param("s", $resourceID);
                    $resourceID = $object->getResourceID();
                } else if ($object->getRequest() === Requests::locationUpdate()) {
                    $stmt->bind_param("s", $locationID);
                    $locationID = $object->getLocationID();
                } else if ($object->getRequest() === Requests::alertUpdate()) {
                    $stmt->bind_param("s", $alertID);
                    $alertID = $object->getAlertID();
                }
                $result["status"] = FailOrPass::getSuccess();
            }
        } catch (Exception $e) {

        }

        return $result;
    }
    /**
     * This function removes a record in the database based on the properties of a
     * DataObject
     *
     * @param DataObject $object - an object with properties that can be stored
     * in the database
     * @return array
     */
    public function delete(DataObject $object) {
        $result = FailOrPass::getFailureArray();

        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {
                $stmt = $this->connection->prepare($object->getSql());

                if ($object->getRequest() === Requests::adminDeletion()) {
                    $stmt->bind_param("s", $adminID);
		    $adminID = $object->getAdminId();
                } else if ($object->getRequest() === Requests::userDeletion()) {
                    $stmt->bind_param("s", $userID);
                } else if ($object->getRequest() === Requests::resourceDeletion()) {
                    $stmt->bind_param("s", $resourceID);
                } else if ($object->getRequest() === Requests::locationDeletion()) {
                    $stmt->bind_param("s", $locationID);
                } else if ($object->getRequest() === Requests::alertDeletion()) {
                    $stmt->bind_param("s", $aletID);
                }
		$stmt->execute();
                // if successful change status to SUCCESS
                $result["status"] = FailOrPass::getSuccess();
            }
        } catch (Exception $e) {

        }

        return $result;
    }

    /**
     * This function returns true if a connection to the database exists,
     * otherwise it returns false
     *
     * @return Boolean
     */
    public function isConnected() {
        return $this->connected;
    }

}
