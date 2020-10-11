<?php

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}

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

    public function invokeResource(Resource $dataObj) {
        if ($dataObj->getRequest() === Requests::resourceCreation()) {
            return $this->resourcesModel->createResource($dataObj);
        } else if ($dataObj->getRequest() === Requests::resourceRequest()) {
            return $this->resourcesModel->readResource($dataObj);
        } else if ($dataObj->getRequest() === Requests::resourceUpdate()) {
            return $this->resourcesModel->updateResource($dataObj);
        } else if ($dataObj->getRequest() === Requests::resourceDeletion()) {
            return $this->resourcesModel->deleteResource($dataObj);
        } else if ($dataObj->getRequest() === Requests::resourceReadAll()) {
            return $this->resourcesModel->getAllResource($dataObj);
        } else {
            return FailOrPass::getFailureArray();
        }
    }

}
