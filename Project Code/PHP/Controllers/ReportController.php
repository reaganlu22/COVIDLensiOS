<?php


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

    public function invokeReport(string $request, Report $dataObj) {
        
    }

}
