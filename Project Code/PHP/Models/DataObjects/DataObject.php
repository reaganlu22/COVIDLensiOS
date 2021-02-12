<?php
//require_once '../includes/autoload.php';
/**
 * Description of DataObject
 *
 * @author isaactaylor
 */
class DataObject implements DataObjectInterface {

    private $sql;
    private $request;
    private $tableName;

    public function getSql() {
        return $this->sql;
    }

    public function getTableName() {
        return $this->tableName;
    }
    public function getRequest(){
        return $this->request;
    }
    public function setSql(string $sql) {
        $this->sql = $sql;
    }

    public function setRequest($request) {
        $this->request = $request;
    }

    public function setTableName(string $tableName) {
        $this->tableName = $tableName;
    }

}
