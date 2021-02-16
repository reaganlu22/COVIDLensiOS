<?php

require_once '../includes/autoload.php';

/**
 * Description of ReportTester
 *
 * @author isaactaylor
 */
final class ReportTest extends TestCase {

    private $report;
    private $connection;
    private $reportController;

    public function __construct() {

        $this->report = new Report();
        $this->report->setResidenceHall("Spartan Village");
        $this->report->setAge("19");
        $this->report->setPhoneNumber("3362529389");
        $this->report->setAffiliation("Student");
        $this->report->setLocationID("336");
        //MUST BE CONFIRMED OR UNCONFIRMED
        $this->report->setReportStatus("CONFIRMED");
        $this->report->setReportInfo("Tested at Cone Hall Hospital");
        $this->report->setSituationDescription("Tested on October 12th, 2020.");
        //MUST HAVE EXISTING USER TO TEST REPORT
        $this->report->setSubmitterID("5f9e7b24a512e");
        $this->report->setReportID(uniqid());
        $this->report->setConfirmerID("");
        $this->reportController = new ReportController();
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    public function __destruct() {
        $this->connection = null;
    }

    public function testReportCreation($display = true) {
        $this->report->setRequest(Requests::reportCreationRequest());
        $this->report->setTableName("report");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->reportController->invokeReport($this->report)),
                    "testReportCreation");
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->reportController->invokeReport($this->report)), "testReportCreation", $display);
        }
    }

    public function testReportUpdate($display = true) {
        $this->report->setRequest(Requests::reportConfirmation());
        $this->report->setTableName("report");
        //MUST BE EXISITING ADMIN
        $this->report->setConfirmerID("5f9df24f14abc");
        $expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->reportController->invokeReport($this->report)),
                    "testReportUpdate", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->reportController->invokeReport($this->report)), "testReportUpdate", $display);
        }
    }

    public function testReportRead($display = true) {
        $this->report->setRequest(Requests::reportRequest());
        $this->report->setTableName("report");
        $expected1 = array("status" => FailOrPass::getSuccess(), 
                'data' =>
                array(
                    'reportID' => $this->report->getReportID(),
                    'timeSubmitted' => 'TIMES MAY DIFFER SLIGHTLY',
                    'residenceHall' => $this->report->getResidenceHall(),
                    'age' => $this->report->getAge(),
                    'phoneNumber' => $this->report->getPhoneNumber(),
                    'affiliation' => $this->report->getAffiliation(),
                    'locationID' => $this->report->getLocationID(),
                    'reportStatus' => $this->report->getReportStatus(),
                    'reportInfo' => $this->report->getReportInfo(),
                    'situationDesc' => $this->report->getSituationDescription(),
                    'submitterID' => $this->report->getSubmitterID(),
                    'confirmerID' => $this->report->getConfirmerID(),
                )
        );
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $result = $this->reportController->invokeReport($this->report);
            $result['data']['timeSubmitted'] = 'TIMES MAY DIFFER SLIGHTLY';
            $this->assertEquals(json_encode($expected1), json_encode($result),
                    "testReportRead", $display);
        } else {
            $this->assertEquals(json_encode($expected2), json_encode($this->reportController->invokeReport($this->report)), "testReportRead", $display);
        }
    }

    /**
     * REPORT DELETION NOT ALLOWED
     *
     */
    // public function testReportDelection() {	}
}
