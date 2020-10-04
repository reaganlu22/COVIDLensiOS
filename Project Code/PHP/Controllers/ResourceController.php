<?php

require_once '../includes/autoload.php';

/**
 * Description of ResourceController
 *
 * @author isaactaylor
 */
class ResourceController {

    private $resourcesModel;

    public function __construct() {
        $this->resourcesModel = new ResourceModel();
    }

    public function invokeResource(Resource $dataObj, string $request = null) {
        
    }

}
