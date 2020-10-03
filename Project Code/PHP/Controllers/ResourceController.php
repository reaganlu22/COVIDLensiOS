<?php


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

    public function invokeResource(string $request, Resource $dataObj) {
        
    }

}
