<?php

require_once 'includes/autoload.php';
require_once 'GoogleAuthenticator.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

if (isset($_POST['request'])) {
    $request = $_POST['request'];
} else {
    $request = null;
}

// verify user's or admin's trying to access data
$accessGranted = false;


if ($request !== Requests::adminCreation() || $request !== Requests::userCreationRequest()) {
    $authenticator = new GoogleAuthenticator();
    if ($authenticator->verify($_POST['googleID'] ?? '')) {
        $accessGranted = true;
    } else if (isset($_POST['adminEmail']) && isset($_POST['adminPassword'])) {
        $accessGranted = true;
    } else if (isset($_POST['userEmail']) && isset($_POST['userPassword'])) {
        $accessGranted = true;
    }
} else if ($request !== Requests::adminCreation() || $request !== Requests::userCreationRequest()) {
    $accessGranted = true;
}
// provide information/allow service access once verified with a valid request
if ($accessGranted && in_array($request, Requests::getRequests())) {
    try {
        switch ($request) {
            case Requests::adminCreation():
            case Requests::adminDeletion():
            case Requests::adminSignInRequest():
            case Requests::adminSignOutRequest():
                $controller = new AdminController();
                $admin = new Admin();
                $admin->setAdminID($_POST['adminID'] ?? '');
                $admin->setEmail($_POST['adminEmail'] ?? '');
                $admin->setPassword($_POST['adminPassword']);
                $admin->setSignedIn(strtolower($_POST['signedIn'] ?? ''));
                $admin->setRequest($request);
                $admin->setTableName("admin_account");
                echo json_encode($controller->invokeAdmin($admin));
                break;

            case Requests::alertCreation():
            case Requests::alertDeletion():
            case Requests::alertReadAll():
            case Requests::alertRequest():
            case Requests::alertUpdate():
                $controller = new AlertController();
                $alert = new Alert();
                $alert->setAlertID($_POST['alertID'] ?? '');
                $alert->setAlertMessage($_POST['message'] ?? '');
                $alert->setAlertTitle($_POST['title'] ?? '');
                $alert->setRequest($request);
                $alert->setTableName("alert");
                echo json_encode($controller->invokeAlert($alert));
                break;
            case Requests::locationCreation():
            case Requests::locationDeletion():
            case Requests::locationRequest():
            case Requests::locationUpdate():
            case Requests::locationsReadAll():
                $controller = new MapLocationsController();
                $location = new MapLocations();
                $location->setLocationID($_POST['locationID'] ?? '');
                $location->setLatitude($_POST['latitude'] ?? '');
                $location->setLongitude($_POST['longitude'] ?? '');
                $location->setRequest($request);
                $location->setResidenceHall($_POST['residenceHall'] ?? '');
                $location->setTableName('map_locations');
                echo json_encode($controller->invokeMapLocations($location));
                break;
            case Requests::reportConfirmation():
            case Requests::reportCreationRequest():
            case Requests::reportReadAll():
            case Requests::reportReadAll():
                $controller = new ReportController();
                $report = new Report();

                $report->setAffiliation($_POST['affiliation'] ?? '');
                $report->setAge($_POST['$age'] ?? '');
                $report->setConfirmerID($_POST['confirmerID'] ?? '');
                $report->setLocationID($_POST['locationID'] ?? '');
                $report->setPhoneNumber($_POST['phoneNumber'] ?? '');
                $report->setReportInfo($_POST['reportInfo'] ?? '');
                $report->setReportStatus($_POST['reportStatus'] ?? '');
                $report->setRequest($request);
                $report->setReportID($_POST['reportID'] ?? '');
                $report->setSubmitterID($_POST['submitterID'] ?? '');
                $report->setResidenceHall($_POST['residenceHall'] ?? '');
                $report->setSituationDescription($_POST['situationDesc'] ?? '');
                $report->setTableName('report');
                echo json_encode($controller->invokeReport($report));
                break;
            case Requests::resourceCreation():
            case Requests::resourceDeletion():
            case Requests::resourceReadAll():
            case Requests::resourceRequest():
            case Requests::resourceUpdate():
                $controller = new ResourceController();
                $resource = new Resources();
                $resource->setResourceID($_POST['resourceID'] ?? '');
                $resource->setCategoryName($_POST['categoryName'] ?? '');
                $resource->setLinkResource($_POST['linkResource'] ?? '');
                $resource->setTitle($_POST['title'] ?? '');
                $resource->setRequest($request);
                $resource->setTableName('resources');
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
                $user->setUserID($_POST['userID'] ?? '');
                $user->setGoogleID($POST['googleID'] ?? '');
                $user->setAdditionalData($_POST['userData'] ?? '');
                $user->setRequest($request);
                $user->setEmail($_POST['userEmail'] ?? '');
                $user->setPassword($_POST['userPassword'] ?? '');
                $user->setSignedIn(strtolower($_POST['signedIn'] ?? ''));
                $user->setTableName('user_account');
                echo json_encode($controller->invokeUser($user));
                break;

            default:
                echo json_encode(FailOrPass::getFailureArray());
                break;
        }
    } catch (exception $e) {
        echo json_encode(FailOrPass::getFailureArray());
    }
} else {
    echo json_encode(FailOrPass::getFailureArray());
}
       