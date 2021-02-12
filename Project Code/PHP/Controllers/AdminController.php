<?php

//require_once '../includes/autoload.php';

/**
 * Description of AdminController
 *
 * @author isaactaylor
 */
class AdminController {

    private $adminModel;

    /**
     * Construction an AdminModel
     */
    public function __construct() {
        $this->adminModel = new AdminModel();
    }

    /**
     * This function notifies an AdminModel about a desired request
     *
     * @param Admin $dataObj - A DataObject that represents an Admin
     * @return array
     */
    public function invokeAdmin(Admin $dataObj) {
        if ($dataObj->getRequest() === Requests::adminSignInRequest()) {
            return $this->adminModel->readAdmin($dataObj);
        } else if ($dataObj->getRequest() === Requests::adminSignOutRequest()) {
            return $this->adminModel->updateAdmin($dataObj);
        } else if ($dataObj->getRequest() === Requests::adminCreation()) {
            return $this->adminModel->createAdmin($dataObj);
        } else if ($dataObj->getRequest() === Requests::adminDeletion()) {
            return $this->adminModel->deleteAdmin($dataObj);
        } else {
            return FailOrPass::getFailureArray();
        }
    }

}
