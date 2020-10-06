<?php

require_once '../includes/autoload.php';

/**
 * Description of DatabaseAdapter
 *
 * @author isaactaylor
 */
class DatabaseAdapter implements DatabaseAdapterInterface {

    private $connection;

    private const SUCCESS = "SUCCESS";
    private const FAILED = "FAILED";

    function __construct(MysqlConnector $connector) {
        $dbConnector = $connector;
        $this->connection = $dbConnector->getConnection();
        if (mysqli_connect_error()) {
            echo 'DB Connection error';
            exit();
        }
    }

    //  REMEMBER TO ADD ERROR CHECKING AND TRY CATCH...

    public function create(DataObject $object) {
        $result = self::SUCCESS;
        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {// remember to check if user exists first...
                if ($object->getRequest() === Requests::adminCreation()) {
                    $stmt->bind_param("sss", $adminID, $email, $password);
                    $adminID = $object->getAdminID();
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                    $stmt->execute();
                } else if ($object->getRequest() === Requests::alertCreation()) {
                    $stmt->bind_param("sss", $alertID, $title, $message);
                    $alertID = $object->getAlertID();
                    $title = $object->getAlertTitle();
                    $message = $object->getAlertMessage();
                    $stmt->execute();
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
                    $stmt->execute();
                } else if ($object->getRequest() === Requests::locationCreation()) {
                    $stmt->bind_param("ssss", $locationID, $residenceHall, $latitude, $longitude);
                    $locationID = $object->getLocationID();
                    $residenceHall = $object->getResidenceHall();
                    $latitude = $object->getLatitude();
                    $longitude->getLongitutde();
                    $stmt->execute();
                } else if ($object->getRequest() === Requests::resourceCreation()) {
                    $stmt->bind_param("ssss", $resourceID, $title, $categoryName, $linkResource);
                    $resourceID = $object->getResourceID();
                    $title = $object->getTitle();
                    $categoryName = $object->getCategoryName();
                    $linkResource = $object->getLinkResource();
                    $stmt->execute();
                } else if ($object->getRequest() === Requests::userCreationRequest()) {
                    $stmt->bind_param("ssss", $userID, $email, $password, $userData);
                    $userID = $object->getUserID();
                    $email = $object->getEmail();
                    $password = $object->getPassword();
                    $userData = $object->getAdditionalData();
                    $stmt->execute();
                }

                if ($this->connection->affected_rows == 0) {
                    return self::FAILED;
                } else {
                    return self::SUCCESS;
                }
            }
        } catch (Exception $e) {
            
        }

        return self::FAILED;
    }

    public function read(DataObject $object) {
        $result = self::SUCCESS;
        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {
                if ($object->getRequest() === Requests::adminSignInRequest()) {
                    $stmt->bind_param("s", $adminID);
                } else if ($object->getRequest() === Requests::userDataRequest()) {
                                        $stmt->bind_param("s", $userID);

                } else if ($object->getRequest() === Requests::reportReadAll()) {
                    
                } else if ($object->getRequest() === Requests::reportRequest()) {
                                        $stmt->bind_param("s", $reportID);

                } else if ($object->getRequest() === Requests::resourceReadAll()) {
                    
                } else if ($object->getRequest() === Requests::resourceRequest()) {
                    
                } else if ($object->getRequest() === Requests::locationsReadAll()) {
                    
                } else if ($object->getRequest() === Requests::locationRequest()) {
                    
                } else if ($object->getRequest() === Requests::alertReadAll()) {
                    
                } else if ($object->getRequest() === Requests::alertRequest()) {
                    
                }
                if ($this->connection->affected_rows == 0) {
                    return self::FAILED;
                } else {
                    return self::SUCCESS;
                }
            }
        } catch (Exception $e) {
            
        }

        return self::FAILED;
    }

    public function update(DataObject $object) {
        $result = self::SUCCESS;
        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {
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
        } catch (Exception $e) {
            
        }

        return self::FAILED;
    }

    public function delete(DataObject $object) {
        $result = self::SUCCESS;
        try {
            $stmt = $this->connection->prepare($object->getSql());
            if ($stmt !== false) {
                $stmt = $this->connection->prepare($object->getSql());

                if ($object->getRequest() === Requests::adminDeletion()) {
                    
                } else if ($object->getRequest() === Requests::userDeletion()) {
                    
                } else if ($object->getRequest() === Requests::resourceDeletion()) {
                    
                } else if ($object->getRequest() === Requests::locationDeletion()) {
                    
                } else if ($object->getRequest() === Requests::alertDeletion()) {
                    
                }
            }
        } catch (Exception $e) {
            
        }

        return self::FAILED;
    }

}


