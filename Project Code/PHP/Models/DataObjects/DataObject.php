<?php


/**
 * Description of DataObject
 *
 * @author isaactaylor
 */
class DataObject {
    private  $sql;
    

    public function getSql(){
        return $this->sql;
    }
    
    public function setSql(string $sql){
        $this->sql = $sql;
    }
}
