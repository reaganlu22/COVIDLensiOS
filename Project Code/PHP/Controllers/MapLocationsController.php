<?php

require_once '../includes/autoload.php';

/**
 * Description of MapLocationsController
 *
 * @author isaactaylor
 */
class MapLocationsController {

    private $mapLocationsModel;

    public function __construct() {
        $this->mapLocationsModel = new MapLocationsModel();
    }

    public function invokeMapLocations(MapLocations $dataObj, string $request = null) {
        
    }

}
