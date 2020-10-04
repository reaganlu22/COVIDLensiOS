<?php

require_once '../includes/autoload.php';

/**
 * Description of AdminController
 *
 * @author isaactaylor
 */
class AdminController {

    private $adminModel;

    public function __construct() {
        $this->adminModel = new AdminModel();
    }

    public function invokeAdmin(Admin $dataObj, string $request = null) {
        if ($request === Requests::adminSignInRequest()) {
            
        } else if ($request === Requests::adminSignOutRequest()) {
            
        }
    }

}
