<?php
//require_once '../includes/autoload.php';
/**
 * Description of Alert
 *
 * @author isaactaylor
 */
class Alert extends DataObject{

    private $alertID;
    private $title;
    private $message;
    
    public function __construct() {
        $this->setTableName("alert");
    }
    
    public function setAlertID(string $alertID) {
        $this->alertID = $alertID;
    }
    
    public function setAlertTitle(string $alertTitle) {
        $this->title = $alertTitle;
    }
    
    public function setAlertMessage(string $alertMessage) {
        $this->message = $alertMessage;
    }
    
    public function getAlertID() {
        return $this->alertID;
    }
    
    public function getAlertTitle() {
        return $this->title;
    }
    
    public function getAlertMessage() {
        return $this->message;
    }
    
    
}
