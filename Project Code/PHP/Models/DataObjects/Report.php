<?php

require_once '../includes/autoload.php';

/**
 * Description of Report
 *
 * @author isaactaylor
 */
class Report extends DataObject {

    private $timeSubmitted;
    private $age;
    private $phoneNumber;
    private $residenceHall;
    private $affiliation;
    private $locationID;
    private $reportStatus;
    private $reportInfo;
    private $situationDescription;
    private $confirmerID;
    private $submitterID;
    
    public function __construct() {
        $this->setTableName("report");
    }

    public function setTimeSubmitted(string $timeSubmitted) {
        $this->timeSubmitted = $timeSubmitted;
    }
    
    public function setAge(int $age){
        $this->age = $age;
    }
    
    public function setPhoneNumber(string $phoneNumber) {
        $this->phoneNumber = $phoneNumber;
    }
    
    public function setResidenceHall(string $residenceHall){
        $this->residenceHall = $residenceHall;
    }
    
    public function setAffiliation(string $affiliation){
        $this->affiliation = $affiliation;
    }
    
    public function setLocationID(string $locationID){
        $this->locationID = $locationID;
    }
    
    public function setReportStatus(string $reportStatus) {
        $this->reportStatus = $reportStatus;
    }
    
    public function setSituationDescription(string $situationDescription) {
        $this->situationDescription = $situationDescription;
    }
    
    public function setConfirmerID(string $confirmerID){
        $this->confirmerID = $confirmerID;
    }
    
    public function setReportInfo(string $reportInfo) {
        $this->reportInfo = $reportInfo;
    }
    public function setSubmitterID(string $submitterID) {
        $this->submitterID = $submitterID;
    }

    public function getTimeSubmitted() {
        return $this->timeSubmitted;
    }

    public function getSubmitterID(){
        return $this->submitterID;
    }

    public function getAge(){
        return $this->age;
    }
    
    public function getPhoneNumber() {
        return $this->phoneNumber;
    }
    
    public function getResidenceHall(){
        return $this->residenceHall;
    }
    
    public function getAffiliation(){
        return $this->affiliation;
    }
    
    public function getLocationID(){
        return $this->locationID;
    }
    
    public function getReportStatus() {
        return $this->reportStatus;
    }
    
    public function getSituationDescription() {
        return $this->situationDescription;
    }
    
    public function getConfirmerID(){
        return $this->confirmerID;
    }
    
    public function getReportInfo() {
        return $this->reportInfo;
    }
}
