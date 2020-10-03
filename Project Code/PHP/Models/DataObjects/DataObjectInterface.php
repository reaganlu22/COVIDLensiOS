<?php



/**
 *
 * @author isaactaylor
 */
interface DataObjectInterface {
    public function setSql(string $string);
    public function getSql(): string;
}
