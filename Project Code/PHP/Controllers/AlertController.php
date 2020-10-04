<?php

require_once '../includes/autoload.php';

/**
 * Description of AlertController
 *
 * @author isaactaylor
 */
class AlertController {

    private $alertController;

    public function __construct() {
        $this->alertModel = new AlertModel();
    }

    public function invokeAlert(string $request, Alert $dataObj) {
        
    }

}


