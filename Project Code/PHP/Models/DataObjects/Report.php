<?php



/**
 * Description of Report
 *
 * @author isaactaylor
 */
class Report extends DataObject {
    private $age;
    private $phoneNumber;
    private $residenceHall;
    private $affiliation;
    private $locationID;
    private $reportStatus;
    private $reportInfo;
    private $situationDescription;
    private $confirmerID;
    
    public function __construct() {
        $this->setTableName("Report");
    }
    
    public function setAge(int $age){
        $this->age = $age;
    }
    
    private function setPhoneNumber(string $phoneNumber) {
        $this->phoneNumber = $phoneNumber;
    }
    
    private function setResidenceHall(string $residenceHall){
        $this->residenceHall = $residenceHall;
    }
    
    private function setAffiliation(string $affiliation){
        $this->affiliation = $affiliation;
    }
    
    private function setLocationID(string $locationID){
        $this->locationID = $locationID;
    }
    
    private function setReportStatus(string $reportStatus) {
        $this->reportStatus = $reportStatus;
    }
    
    private function setSituationDescription(string $situationDescription) {
        $this->situationDescription = $situationDescription;
    }
    
    private function setConfirmerID(string $confirmerID){
        $this->confirmerID = $confirmerID;
    }
    
    private function setReportInfo(string $reportInfo) {
        $this->reportInfo = $reportInfo;
    }


    public function getAge(){
        return $this->age;
    }
    
    private function getPhoneNumber() {
        return $this->phoneNumber;
    }
    
    private function getResidenceHall(){
        return $this->residenceHall;
    }
    
    private function getAffiliation(){
        return $this->affiliation;
    }
    
    private function getLocationID(){
        return $this->locationID;
    }
    
    private function getReportStatus() {
        return $this->reportStatus;
    }
    
    private function getSituationDescription() {
        return $this->situationDescription;
    }
    
    private function getConfirmerID(){
        return $this->confirmerID;
    }
    
    public function getReportInfo() {
        return $this->reportInfo;
    }
}
