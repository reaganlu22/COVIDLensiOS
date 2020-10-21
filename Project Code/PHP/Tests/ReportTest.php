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
		$this->report->setTimeSubmitted(date('Y-m-d H:i:s'));
		$this->report->setResidenceHall("Spartan Village");
		$this->report->setAge("19");
		$this->report->setPhoneNumber("3362529389");
		$this->report->setAffiliation("Student");
		$this->report->setLocationID("336");
		$this->report->setReportStatus("Positive");
		$this->report->setReportInfo("Tested at Cone Hall Hospital");
		$this->report->setSituationDescription("Tested on October 12th, 2020.");
		$this->report->setSubmitterID("1010");
		$this->report->setConfirmerID("5f878d5eed707");
		$this->reportController = new ReportController();
		$this->connection = new DatabaseAdapter(new MysqlConnector());
	}

	public function __destruct() {
		$this->connection = null;

	}

	public function testReportCreation() {
		$this->report->setRequest(Requests::reportCreationRequest());
		$this->report->setTableName("report");
		$expected1 = array("status" => FailOrPass::getSuccess(), "data" => null);
        $expected2 = FailOrPass::getFailureArray();
        if ($this->connection->isConnected()) {
            $this->assertEquals(json_encode($expected1), json_encode($this->reportController->invokeReport($this->report)),
                    "testReportCreation");
        } else {
			$this->assertEquals(json_encode($expected2), json_encode($this->reportController->invokeReport($this->report)), "testReportCreation");
		}
	}
	/**
	* Report Deletion not allowed
	*
	*/
	// public function testReportDelection() {	}
}
