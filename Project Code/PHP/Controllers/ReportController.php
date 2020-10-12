<?php
namespace Controllers;

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}

/**
 * Description of ReportController
 *
 * @author isaactaylor
 */
class ReportController {

    private $reportModel;

    public function __construct() {
        $this->reportModel = new ReportModel();
    }

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
