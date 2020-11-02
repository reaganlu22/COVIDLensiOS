<?php

require_once 'vendor/autoload.php';


/**
 * Description of GoogleAuthenticator
 *
 * @author isaactaylor
 */
class GoogleAuthenticator {

    //need to make this id more inconspicuous
    private const CLIENT_ID = "COVID_Lens_APP_ID";

    private $userID;
    private $client;

    public function __construct() {
        try {
            $this->client = new Google_Client(['client_id' => self::CLIENT_ID]);
        } catch (Exception $e) {
            echo 'INVALID ID';
        }
    }

    public function verify($id_token) {
        try {
            $payload = $this->client->verifyIdToken($id_token);

            if ($payload) {
                $this->userID = $payload['sub'];
                // success
                return true;
            } else {
                // Invalid ID token
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }

    public function getID() {
        return $this->userID;
    }

}
