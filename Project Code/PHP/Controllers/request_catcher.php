<?php

require_once '../includes/autoload.php';

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// verify user
//...
//sanitize
//...
// provide information/allow service access once user is verified if they have a valid request

$request = "some COVID Lens request"; // not a valid request so it should fail.

if (in_array($request, Requests::getRequests())) {
    switch ($request) {
        case Requests::adminCreation():
        case Requests::adminDeletion():
        case Requests::adminSignInRequest():
        case Requests::adminSignOutRequest():
            $controller = new AdminController();
            $admin = new Admin();
            //---- remember to set the data objects values before echo---
            echo json_encode($controller->invokeAdmin($admin));
            break;

        case Requests::alertCreation():
        case Requests::alertDeletion():
        case Requests::alertReadAll():
        case Requests::alertRequest():
        case Requests::alertUpdate():
            $controller = new AlertController();
            $alert = new Alert();
            //---- remember to set the data objects values before echo---
            echo json_encode($controller->invokeAlert($alert));
            break;
        case Requests::locationCreation():
        case Requests::locationDeletion():
        case Requests::locationRequest():
        case Requests::locationUpdate():
        case Requests::locationsReadAll():
            $controller = new MapLocationsController();
            $location = new MapLocations();
            //---- remember to set the data objects values before echo---
            echo json_encode($controller->invokeMapLocations($location));

            break;
        case Requests::reportConfirmation():
        case Requests::reportCreationRequest():
        case Requests::reportReadAll():
        case Requests::reportReadAll():
            $controller = new ReportController();
            $report = new Report();
            //---- remember to set the data objects values before echo---
            echo json_encode($controller->invokeReport($report));
            break;
        case Requests::resourceCreation():
        case Requests::resourceDeletion():
        case Requests::resourceReadAll():
        case Requests::resourceRequest():
        case Requests::resourceUpdate():
            $controller = new ResourceController();
            $resource = new Resources();
            //---- remember to set the data objects values before echo---
            echo json_encode($controller->invokeResource($resource));
            break;
        case Requests::userCreationRequest():
        case Requests::userDataRequest():
        case Requests::userDeletion():
        case Requests::userSave():
        case Requests::userSignInRequest():
        case Requests::userSignOutRequest():
            $controller = new UserController();
            $user = new User();
            //---- remember to set the data objects values before echo---
            echo json_encode($controller->invokeUser($user));
            break;

        default:
            echo json_encode(array("status" => "FAILED", "data" => null));
            break;
    }
}