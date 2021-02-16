<?php

//require_once '../includes/autoload.php';

/**
 * Description of ReportModel
 *
 * @author isaactaylor
 */
class ReportModel {

    private $connection;

    /**
     * Constructor that starts a database connection for model to interact with
     */
    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    /**
     * Terminates the connection started by the Constructor
     */
    function __destruct() {
        $this->connection = null;
    }

    /**
     * This function creates a report in the database
     *
     * @param Report $report - A DataObject that represents a report
     * @return array
     */
    public function createReport(Report $report) {
        $preparedStmt = "INSERT INTO " . $report->getTableName() . " (residenceHall, age, "
                . "phoneNumber, affiliation, locationID, reportStatus, reportInfo, situationDesc, "
                . "submitterID, confirmerID, reportID) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        $report->setSql($preparedStmt);
        $response = $this->connection->create($report);
        return $response;
    }

    /**
     * This function retrieves a reports info from the database
     *
     * @param Report $report - A DataObject that represents a report
     * @return array
     */
    public function readReport(Report $report) {

        $preparedStmt = "SELECT * FROM " . $report->getTableName() . " WHERE submitterID=? AND reportID=?";
        $report->setSql($preparedStmt);
        $response = $this->connection->read($report);
        return $response;
    }

    /**
     * This function updates a reports info in the database
     *
     * @param Report $report - A DataObject that represents a report
     * @return array
     */
    public function updateReport(Report $report) {
        $preparedStmt = "UPDATE " . $report->getTableName() . " SET confirmerID=? " . "WHERE submitterID=? "
                . "AND reportID=?";
        $report->setSql($preparedStmt);
        $response = $this->connection->update($report);
        return $response;
    }

    /**
     * This function removes a reports info from the database
     * IMPLEMENTED FOR COMPLETION ONLY
     * @param Report $report - A DataObject that represents a report
     * @return array
     */
    public function deleteReport(Report $report) {

        $preparedStmt = "DELETE FROM " . $report->getTableName() . " WHERE submitterID=?";
        $report->setSql($preparedStmt);
        $response = $this->connection->delete($report);
        return $response;
    }

    /**
     * This function retrieves all reports from the database
     *
     * @param Report $report - A DataObject that represents a report
     * @return array
     */
    public function getAllReport(Report $report) {
        $preparedStmt = "SELECT * FROM " . $report->getTableName();
        $report->setSql($preparedStmt);
        $response = $this->connection->read($report);
        return $response;
    }

}
