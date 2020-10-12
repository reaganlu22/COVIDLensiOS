<?php

namespace Database;

/**
 *
 * @author isaactaylor
 */
interface DatabaseAdapterInterface {

    public function create(DataObject $object);

    public function read(DataObject $object);

    public function update(DataObject $object);

    public function delete(DataObject $object);
}
