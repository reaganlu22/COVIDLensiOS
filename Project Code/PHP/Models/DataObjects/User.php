<?php

namespace Models\DataObjects;

/**
 * Description of User
 *
 * @author isaactaylor
 */
class User extends DataObject{
    private $userID;
    //private $report;
    private $email;
    private $password;
    private $additionalData;
    
    public function __construct() {
        $this->setTableName("User");
    }
    
    public function setUserID(string $userID) {
        $this->userID = $userID;
    }
    
    public function setEmail(string $email) {
        $this->email = $email;
    }
    
    public function setPassword(string $password){
        $this->password = $password;
    }
    
    public function setAdditionalData(string $additionalData){
        $this->additionalData = $additionalData;
    }
    
    public function getUserID() {
        return $this->additionalData;
    }
    
    public function getEmail() {
        return $this->email;
    }
    
    public function getPassword(){
        $this->password;
    }
    
    public function getAdditionalData(){
        $this->additionalData;
    }
}
