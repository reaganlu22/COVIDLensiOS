<?php

//require_once '../includes/autoload.php';

/**
 * Description of UserController
 *
 * @author isaactaylor
 */
class UserController {

    private $userModel;

    /**
     * This function constructs a UserModel
     */
    public function __construct() {
        $this->userModel = new UserModel();
    }

    /**
     * This function notifies an UserModel about a desired request
     *
     * @param User $dataObj - A DataObject that represents a User
     * @return array
     */
    public function invokeUser(User $dataObj) {
        
        //signin request
        if ($dataObj->getRequest() === Requests::userSignInRequest()) {
            return $this->userModel->readUser($dataObj);
        //userData save? || signout
        } else if ($dataObj->getRequest() === Requests::userSave() ||
                $dataObj->getRequest() == Requests::userSignOutRequest()) {
            return $this->userModel->updateUser($dataObj);
        //create
        } else if ($dataObj->getRequest() === Requests::userCreationRequest()) {
            return $this->userModel->createUser($dataObj); 
        //read
        } else if ($dataObj->getRequest() === Requests::userDataRequest()) {
            return $this->userModel->readUser($dataObj);
        //delete
        } else if ($dataObj->getRequest() === Requests::userDeletion()) {
            return $this->userModel->deleteUser($dataObj);
        } else {
            return FailOrPass::getFailureArray();
        }
    }

}
