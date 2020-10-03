<?php


/**
 * Description of UserController
 *
 * @author isaactaylor
 */
class UserController {
     private $userModel;

    public function __construct() {
        $this->userModel = new UserModel();
    }

    public function invokeUser(string $request, User $dataObj) {
        
    }
}
