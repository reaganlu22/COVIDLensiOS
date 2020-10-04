<?php



/**
 *
 * @author isaactaylor
 */
interface DataObjectInterface {
    public function setSql(string $string);
    public function setTableName(string $tableName);
    public function getSql(): string;
    public function getTableName(): string;
}
