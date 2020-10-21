<?php
require_once '../includes/autoload.php';

/**
 * Description of ResourceController
 *
 * @author isaactaylor
 */
class ResourceController {

    private $resourcesModel;

    /**
     * This function constructs a ResourceModel
     */
    public function __construct() {
        $this->resourcesModel = new ResourceModel();
    }

<<<<<<< HEAD
    public function invokeResource(Resources $dataObj) {
=======
    /**
     * This function notifies an ResourceModelModel about a desired request
     *
     * @param ResourceModel $dataObj - A DataObject that represents a ResourceModel
     * @return array
     */
    public function invokeResource(Resource $dataObj) {
>>>>>>> 03dd47a3c4cf84b93ad4a57ee80f74e158388523
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
