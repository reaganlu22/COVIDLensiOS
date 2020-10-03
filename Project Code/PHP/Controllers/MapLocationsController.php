<?php

/**
 * Description of MapLocationsController
 *
 * @author isaactaylor
 */
class MapLocationsController{

    private $mapLocationsModel;

    public function __construct() {
        $this->mapLocationsModel = new MapLocationsModel();
    }

    public function invokeMapLocations(string $request, MapLocations $dataObj) {
        
    }

}
