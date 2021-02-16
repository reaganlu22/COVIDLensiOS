<?php
//require_once '../includes/autoload.php';
/**
 * Description of AlertController
 *
 * @author isaactaylor
 */
class AlertController {

    private $alertModel;

    /**
     * Constructs an AlertModel
     */
    public function __construct() {
        $this->alertModel = new AlertModel();
    }


    /**
     * This function notifies an AlertModel about a desired request
     *
     * @param Alert $dataObj - A DataObject that represents an Alert
     * @return array
     */
    public function invokeAlert(Alert $dataObj) {
        
        if ($dataObj->getRequest() === Requests::alertCreation()) {
            return $this->alertModel->createAlert($dataObj);
        } else if ($dataObj->getRequest() === Requests::alertRequest()) {
            return $this->alertModel->readAlert($dataObj);
        } else if ($dataObj->getRequest() === Requests::alertUpdate()) {
            return $this->alertModel->updateAlert($dataObj);
        } else if ($dataObj->getRequest() === Requests::alertDeletion()) {
            return $this->alertModel->deleteAlert($dataObj);
        }else if ($dataObj->getRequest() === Requests::alertRequest()) {
            return $this->alertModel->readAlert($dataObj);
        } else if ($dataObj->getRequest() === Requests::alertReadAll()) {
            return $this->alertModel->readAllAlerts($dataObj);
        } else {
            return FailOrPass::getFailureArray();
        }
    }

}
