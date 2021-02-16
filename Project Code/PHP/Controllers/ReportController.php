<?php

//require_once '../includes/autoload.php';

/**

<?php
namespace Controllers;

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}
*/


/**
 * Description of ReportController
 *
 * @author isaactaylor
 */
class ReportController {

    private $reportModel;

    /**
     * This function constructs a ReportModel
     */
    public function __construct() {
        $this->reportModel = new ReportModel();
    }

    /**
     * This function notifies an ReportModel about a desired request
     *
     * @param Report $dataObj - A DataObject that represents a Report
     * @return array
     */
    public function invokeReport(Report $dataObj) {
        if ($dataObj->getRequest() === Requests::reportCreationRequest()) {
            return $this->reportModel->createReport($dataObj);
        } else if ($dataObj->getRequest() === Requests::reportRequest()) {
            return $this->reportModel->readReport($dataObj);
        } else if ($dataObj->getRequest() === Requests::reportConfirmation()) {
            return $this->reportModel->updateReport($dataObj);
        } else if ($dataObj->getRequest() === Requests::reportReadAll()) {
            return $this->reportModel->getAllReport($dataObj);
        } else {
            return FailOrPass::getFailureArray();
        }
    }

}
