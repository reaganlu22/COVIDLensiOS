<?php

require_once '../includes/autoload.php';

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

    public function invokeUser(User $dataObj) {
        if ($dataObj->getRequest() === Requests::userCreationRequest()) {
            return $this->userModel->createUser($dataObj);
        } else if ($dataObj->getRequest() === Requests::userDataRequest()) {
            return $this->userModel->readUser($dataObj);
        } else if ($dataObj->getRequest() === Requests::userSave() ||
                $dataObj->getRequest() == Requests::userSignOutRequest()) {
            return $this->userModel->updateUser($dataObj);
        } else if ($dataObj->getRequest() === Requests::userDeletion()) {
            return $this->userModel->deleteUser($dataObj);
        }
    }

}
