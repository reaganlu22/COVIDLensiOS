<?php

//require_once '../includes/autoload.php';

/**
 * Description of User
 *
 * @author isaactaylor
 */
class User extends DataObject {

    private $userID;
    private $email;
    private $googleID;
    private $password;
    private $userData;
    private $signedIn;

    public function __construct() {
        $this->setTableName("user_account");
    }

    public function setUserID(string $userID) {
        $this->userID = $userID;
    }

    public function setEmail(string $email) {
        $this->email = $email;
    }

    public function setPassword(string $password) {
        $this->password = $password;
    }

    public function setUserData(string $userData) {
        $this->userData = $userData;
    }

    public function setSignedIn(string $signedIn) {
        $this->signedIn = $signedIn;
    }

    public function setGoogleID(string $googleID) {
        $this->googleID = $googleID;
    }

    public function getGoogleID() {
        return $this->googleID;
    }

    public function getUserID() {
        return $this->userID;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getPassword() {
        return $this->password;
    }

    public function getUserData() {
        return $this->userData;
    }

    public function getSignedIn() {
        return $this->signedIn;
    }

}
