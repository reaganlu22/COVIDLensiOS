<?php

//require_once '../includes/autoload.php';
/**
 * Description of Resources
 *
 * @author isaactaylor
 */
class Resources extends DataObject {

    private $categoryName;
    private $linkResource;
    private $resourceID;
    private $title;

    public function __construct() {
        $this->setTableName("resources");
    }

    public function setResourceID(string $resourceID) {
        $this->resourceID = $resourceID;
    }
    public function setTitle(string $title) {
        $this->title = $title;
    }

    public function setCategoryName(string $categoryName) {
        $this->categoryName = $categoryName;
    }

    public function setLinkResource(string $linkResource) {
        $this->linkResource = $linkResource;
    }

    public function getResourceID() {
        return $this->resourceID;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getCategoryName() {
        return $this->categoryName;
    }

    public function getLinkResource() {
        return $this->linkResource;
    }

}
