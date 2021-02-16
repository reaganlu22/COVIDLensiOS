<?php

//require_once '../includes/autoload.php';

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
            if ($stmt !== false) {
                if ($object->getRequest() === Requests::adminCreation()) {
                    $stmt->bind_param("ssss", $adminID, $email, $password, $signedIn);
                    $adminID = $object->getAdminId();
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                    $signedIn = $object->getSignedIn();
                } else if ($object->getRequest() === Requests::alertCreation()) {
                    $stmt->bind_param("sss", $alertID, $title, $message);
                    $alertID = $object->getAlertID();
                    $title = $object->getAlertTitle();
                    $message = $object->getAlertMessage();
                } else if ($object->getRequest() === Requests::reportCreationRequest()) {
                    $stmt->bind_param("sssssssssss", $residenceHall,
                            $age, $phoneNumber, $affiliation, $locationID,
                            $reportStatus, $reportInfo, $situationDesc,
                            $submitterID, $confirmerID, $reportID);
                    $residenceHall = $object->getResidenceHall();
                    $age = $object->getAge();
                    $phoneNumber = $object->getPhoneNumber();
                    $affiliation = $object->getAffiliation();
                    $locationID = $object->getLocationID();
                    $reportStatus = $object->getReportStatus();
                    $reportInfo = $object->getReportInfo();
                    $situationDesc = $object->getSituationDescription();
                    $submitterID = $object->getSubmitterID();
                    $confirmerID = $object->getConfirmerID();
                    $reportID = $object->getReportID();
                } else if ($object->getRequest() === Requests::locationCreation()) {
                    $stmt->bind_param("ssss", $locationID, $residenceHall, $latitude, $longitude);
                    $locationID = $object->getLocationID();
                    $residenceHall = $object->getResidenceHall();
                    $latitude = $object->getLatitude();
                    $longitude = $object->getLongitude();
                } else if ($object->getRequest() === Requests::resourceCreation()) {
                    $stmt->bind_param("ssss", $resourceID, $title, $categoryName, $linkResource);
                    $resourceID = $object->getResourceID();
                    $title = $object->getTitle();
                    $categoryName = $object->getCategoryName();
                    $linkResource = $object->getLinkResource();
                } else if ($object->getRequest() === Requests::userCreationRequest()) {
                    if ($object->getGoogleID() !== '') {
                        $stmt->bind_param("ssssss", $googleID, $userID, $email, $password, $userData, $signedIn);
                    } else {
                        $stmt->bind_param("sssss", $userID, $email, $password, $userData, $signedIn);
                    }
                    $userID = $object->getUserID();
                    $googleID = $object->getGoogleID();
                    $userID = $object->getUserID();
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                    $userData = $object->getUserData();
                    $signedIn = $object->getSignedIn();
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
                } else if ($object->getRequest() === Requests::userSignInRequest()) {
                    $stmt->bind_param("ss", $email, $password);
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                } else if ($object->getRequest() === Requests::userDataRequest()) {
                    $reports = new Report();
                    $reports->setRequest(Requests::reportReadAll());
                    $cont = new ReportController();
                    $x = $cont->invokeReport($reports);
                    //formatting data to match the way that python api handles it
                    $data = str_replace('CONFIRMED', 'Confirmed', json_encode($x['data']));
                    $fixOne = str_replace('UNConfirmed', 'Not Confirmed', $data);
                    $fixTwo = str_replace('timeSubmitted', 'timeStamp', $fixOne);
                    $finalFix = json_decode($fixTwo, true);
                    $result['status'] = FailOrPass::getSuccess();
                    $result['data'] = $finalFix;
                    return $result;
                } else if ($object->getRequest() === Requests::reportRequest()) {
                    $stmt->bind_param("ss", $submitterID, $reportID);
                    $submitterID = $object->getSubmitterID();
                    $reportID = $object->getReportID();
                } else if ($object->getRequest() === Requests::resourceRequest()) {
                    $stmt->bind_param("s", $resourceID);
                    $resourceID = $object->getResourceID();
                } else if ($object->getRequest() === Requests::locationRequest()) {
                    $stmt->bind_param("s", $locationID);
                    $locationID = $object->getLocationID();
                } else if ($object->getRequest() === Requests::alertRequest()) {
                    $stmt->bind_param("s", $alertID);
                    $alertID = $object->getAlertID();
                }
                $stmt->execute();
                $result = $stmt->get_result();
                $data = array();
                while ($row = $result->fetch_assoc()) {
                    $data[] = $row;
                }
                $result_temp["status"] = FailOrPass::getSuccess();
                if (sizeof($data) > 1) {
                    $result_temp["data"] = $data;
                } else if (array_key_exists(0, $data)) {
                    $result_temp["data"] = $data[0];
                } else {
                    $result_temp = null;
                }
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

                if ($object->getRequest() === Requests::adminSignInRequest() ||
                        $object->getRequest() === Requests::adminSignOutRequest()) {
                    $stmt->bind_param("ssss", $adminEmail, $adminPassword, $signedIn, $adminID);
                    $adminEmail = $object->getEmail();
                    $adminPassword = $object->getPassword();
                    $signedIn = $object->getSignedIn();
                    $adminID = $object->getAdminID();
                } else if ($object->getRequest() === Requests::userSave() ||
                        $object->getRequest() === Requests::userSignInRequest() ||
                        $object->getRequest() === Requests::userSignOutRequest()) {
                    $stmt->bind_param("sssss", $userEmail, $userPassword, $userData,
                            $signedIn, $userID);
                    $userEmail = $object->getEmail();
                    $userPassword = $object->getPassword();
                    $userData = $object->getUserData();
                    $signedIn = $object->getSignedIn();
                    $userID = $object->getUserID();
                } else if ($object->getRequest() === Requests::reportConfirmation()) {
                    $stmt->bind_param("sss", $confirmerID, $submitterID, $reportID);
                    $submitterID = $object->getSubmitterID();
                    $confirmerID = $object->getConfirmerID();
                    $reportID = $object->getReportID();
                } else if ($object->getRequest() === Requests::resourceUpdate()) {
                    $stmt->bind_param("ssss", $title, $categoryName, $linkResource, $resourceID);
                    $title = $object->getTitle();
                    $categoryName = $object->getCategoryName();
                    $linkResource = $object->getLinkResource();
                    $resourceID = $object->getResourceID();
                } else if ($object->getRequest() === Requests::locationUpdate()) {
                    $stmt->bind_param("ssss", $residenceHall, $latitude, $longitude, $locationID);
                    $residenceHall = $object->getResidenceHall();
                    $latitude = $object->getLongitude();
                    $longitude = $object->getLatitude();
                    $locationID = $object->getLocationID();
                } else if ($object->getRequest() === Requests::alertUpdate()) {
                    $stmt->bind_param("sss", $title, $message, $alertID);
                    $title = $object->getAlertTitle();
                    $message = $object->getAlertMessage();
                    $alertID = $object->getAlertID();
                }
                $stmt->execute();
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
                    $userID = $object->getUserID();
                } else if ($object->getRequest() === Requests::resourceDeletion()) {
                    $stmt->bind_param("s", $resourceID);
                    $resourceID = $object->getResourceID();
                } else if ($object->getRequest() === Requests::locationDeletion()) {
                    $stmt->bind_param("s", $locationID);
                    $locationID = $object->getLocationID();
                } else if ($object->getRequest() === Requests::alertDeletion()) {
                    $stmt->bind_param("s", $alertID);
                    $alertID = $object->getAlertID();
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
