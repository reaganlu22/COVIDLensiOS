<?php
namespace Models;

require_once '../includes/autoload.php';

/**
 * Description of ReportModel
 *
 * @author isaactaylor
 */
class ReportModel {

    private $connection;

    public function __construct() {
        $this->connection = new DatabaseAdapter(new MysqlConnector());
    }

    function __destruct() {
        $this->connection = null;
    }

    public function createReport(Report $report) {
        $preparedStmt = "INSERT INTO " . $report->getTableName() . " (userID, locationID,"
                . " residenceHall, reportStatus, age, reportInfo, phoneNumber, "
                . "situationDesc, affiliation, confirmerID)"
                . " VALUES (?,?,?,?,?,?,?,?,?,?)";
        $report->setSql($preparedStmt);
        $response = $this->connection->create($report);
        return $response;
    }

    public function readReport(Report $report) {
        $preparedStmt = "SELECT * FROM " . $report->getTableName() . " WHERE userID=?";
        $response = $this->connection->read($report);
        return $response;
    }

    public function updateReport(Report $report) {
        $preparedStmt = "UPDATE" . $report->getTableName() . " SET confirmerID=?, "
                . "WHERE userID=?";
        $response = $this->connection->delete($report);
        return $response;
    }

    public function deleteReport(Report $report) {
        $preparedStmt = "DELETE FROM " . $report->getTableName() . " WHERE userID=?";
        $response = $this->connection->delete($report);
        return $response;
    }

    public function getAllReport(Report $report) {
        $preparedStmt = "SELECT * FROM " . $report->getTableName();
        $response = $this->connection->read($report);
        return $response;
    }

}
