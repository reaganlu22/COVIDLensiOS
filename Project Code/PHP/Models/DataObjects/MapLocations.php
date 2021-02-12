<?php

//require_once '../includes/autoload.php';
/**
 * Description of MapLocations
 *
 * @author isaactaylor
 */
class MapLocations extends DataObject {

    private $locationID;
    private $residenceHall;
    private $latitude;
    private $longitude;

    public function __construct() {
        $this->setTableName("map_locations");
    }

    public function setLocationID(string $locationID) {
        $this->locationID = $locationID;
    }

    public function setResidenceHall(string $residenceHall) {
        $this->residenceHall = $residenceHall;
    }

    public function setLatitude(string $latitude) {
        $this->latitude = $latitude;
    }

    public function setLongitude(string $longitude) {
        $this->longitude = $longitude;
    }

    public function getLocationID() {
        return $this->locationID;
    }

    public function getResidenceHall() {
        return $this->residenceHall;
    }

    public function getLatitude() {
        return $this->latitude;
    }

    public function getLongitude() {
        return $this->longitude;
    }

}
