<?php



/**
 * Description of Resources
 *
 * @author isaactaylor
 */
class Resources extends DataObject{
    private $categoryName;
    private $linkResource;
    
    public function setCategoryName(string $categoryName){
        $this->categoryName = $categoryName;
    }
    
    public function setLinkResource(string $linkResource) {
        $this->linkResource = $linkResource;
    }
    
    public function getCategoryName(){
        return $this->categoryName;
    }
    
    public function getLinkResource() {
        return $this->linkResource;
    }
}
