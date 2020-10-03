<?php

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

    public function invokeAdmin(string $request, Admin $dataObj) {
        
    }

}
