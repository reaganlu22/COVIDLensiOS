<?php

require 'PythonScriptCallerTest.php';
require 'AdminTest.php';
require 'AlertTest.php';
require 'MapLocationsTest.php';
require 'ReportTest.php';
require 'ResourcesTest.php';
require 'UserTest.php';

//Admin Tests
$tester1 = new AdminTest();
$tester1->testAdminCreation();
$tester1->testAdminSignInRequest();
$tester1->testAdminSignOutRequest();
$tester1->testAdminDeletion();
//--------------------------------------
//Alert Tests
$tester2 = new AlertTest();
$tester2->testAlertCreation();
$tester2->testAlertUpdate();
$tester2->testAlertRead();
$tester2->testAlertDeletion();
//-------------------------------------
////MapLocations Tests
$tester3 = new MapLocationsTest();
$tester3->testMapLocationsCreation();
$tester3->testMapLocationsUpdate();
$tester3->testMapLocationsRead();
$tester3->testMapLocationsDeletion();
//--------------------------------------
//Report Tests
$tester4 = new ReportTest();
$tester4->testReportCreation();
$tester4->testReportUpdate();
$tester4->testReportRead();
//--------------------------------------
//Resources Tests
$tester5 = new ResourcesTest();
$tester5->testResourcesCreation();
$tester5->testResourcesUpdate();
$tester5->testResourcesRead();
$tester5->testResourcesDeletion();
//--------------------------------------
//User Tests
$tester6 = new UserTest();
$tester6->testUserCreation();
$tester6->testUserSignInRequest();
$tester6->testUserSignOutRequest();
$tester6->testUserDeletion();
//---------------------------------------
//PythonScriptCallerAPI Tests
$tester7 = new PythonScriptCallerTest();
// mocking some ID's
$jID = uniqid();
$mendID = uniqid();
$sameConfirmer = uniqid();

// mock data that could be returned from the database to be analyzed

$testData = [array("timeStamp" => "2020-10-12", "userID" => uniqid(), "locationID" => $jID,
            "residenceHall" => "Jefferson Suites", "reportStatus" => "Confirmed",
            "age" => 21, "phoneNumber" => "123-456-7890", "reportInfo" => "I have been identified "
            . "as a close contact of someone who tested positve.",
            "situationDesc" => "I feel bad. ", "affiliation" => "Student", "confirmerID" => $sameConfirmer),
        array("timeStamp" => "2020-09-12", "userID" => uniqid(), "locationID" => $mendID,
            "residenceHall" => "Mendenhall Residence Hall", "reportStatus" => "Not Confirmed",
            "age" => 22, "phoneNumber" => "121-456-7890", "reportInfo" => "Someone in my household tested positive.",
            "situationDesc" => "I have had a fever all week. ", "affiliation" => "Student", "confirmerID" => ""),
        array("timeStamp" => "2020-08-12", "userID" => uniqid(), "locationID" => uniqid(),
            "residenceHall" => "NA", "reportStatus" => "Confirmed",
            "age" => 42, "phoneNumber" => "123-256-7890", "reportInfo" => "I have tested positve",
            "situationDesc" => "Recently, I lost my sense of smell out of nowhere.", "affiliation" => "Faculty",
            "confirmerID" => uniqid()),
        array("timeStamp" => "2020-07-12", "userID" => uniqid(), "locationID" => $mendID,
            "residenceHall" => "Mendenhall Residence Hall", "reportStatus" => "Not Confirmed",
            "age" => 18, "phoneNumber" => "123-436-7890", "reportInfo" => "I have sypmtoms but have not been tested",
            "situationDesc" => "My friend's daughters, son-in-law was sick, so I think I need to get tested",
            "affiliation" => "Student", "confirmerID" => ""),
        array("timeStamp" => "2020-06-12", "userID" => uniqid(), "locationID" => $jID,
            "residenceHall" => "Jefferson Suites", "reportStatus" => "Confirmed",
            "age" => 19, "phoneNumber" => "123-456-7490", "reportInfo" => "I have been tested but have not received"
            . " results yet.",
            "situationDesc" => "Recently, I have been feeling really bad after attending a gathering."
            . " I got tested and it came back positive.", "affiliation" => "Student", "confirmerID" => uniqid()),
        array("timeStamp" => "2020-06-12", "userID" => uniqid(), "locationID" => uniqid(),
            "residenceHall" => "NA", "reportStatus" => "Confirmed",
            "age" => 30, "phoneNumber" => "123-456-7490", "reportInfo" => "I have tested positive.",
            "situationDesc" => "My son came down with COVID-19, so I am waiting to get tested.",
            "affiliation" => "Staff", "confirmerID" => $sameConfirmer,
        "Map_Locations" => array())];

// not finshed...
$expected = array (
                   'MapStats' =>
                   array (
                     0 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.071220',
                         1 => '-79.807663',
                       ),
                       'name' => 'Cone Residence Hall',
                     ),
                     1 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.071238',
                         1 => '-79.808695',
                       ),
                       'name' => 'Grogan Residence Hall',
                     ),
                     2 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.070312',
                         1 => '-79.808645',
                       ),
                       'name' => 'Guilford Residence Hall',
                     ),
                     3 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.070248',
                         1 => '-79.807991',
                       ),
                       'name' => 'Mary Foust Residence Hall',
                     ),
                     4 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.071925',
                         1 => '-79.810980',
                       ),
                       'name' => 'Moore Strong Residence Hall',
                     ),
                     5 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.069807',
                         1 => '-79.808637',
                       ),
                       'name' => 'North Spencer Residence Hall',
                     ),
                     6 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.072588',
                         1 => '-79.809874',
                       ),
                       'name' => 'Phillips Hawkins Residence Hall',
                     ),
                     7 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.070663',
                         1 => '-79.810001',
                       ),
                       'name' => 'Ragsdale Mendenhall Residence Hall',
                     ),
                     8 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.070988',
                         1 => '-79.809119',
                       ),
                       'name' => 'Reynolds Residence Hall',
                     ),
                     9 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.068966',
                         1 => '-79.808702',
                       ),
                       'name' => 'South Spencer Residence Hall',
                     ),
                     10 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.071187',
                         1 => '-79.811050',
                       ),
                       'name' => 'Weil Winfield Residence Hall',
                     ),
                     11 =>
                     array (
                       'confirmed cases' => 2,
                       'location' =>
                       array (
                         0 => '36.064802',
                         1 => '-79.813160',
                       ),
                       'name' => 'Jefferson Suites',
                     ),
                     12 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.068831',
                         1 => '-79.811276',
                       ),
                       'name' => 'Shaw Residence Hall',
                     ),
                     13 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.069313',
                         1 => '-79.810866',
                       ),
                       'name' => 'Gray Residence Hall',
                     ),
                     14 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.069339',
                         1 => '-79.811541',
                       ),
                       'name' => 'Hinshaw Residence Hall',
                     ),
                     15 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.069931',
                         1 => '-79.811485',
                       ),
                       'name' => 'Bailey Residence Hall',
                     ),
                     16 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.069862',
                         1 => '-79.810816',
                       ),
                       'name' => 'Cotton Residence Hall',
                     ),
                     17 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.070422',
                         1 => '-79.810766',
                       ),
                       'name' => 'Coit Residence Hall',
                     ),
                     18 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.070482',
                         1 => '-79.811409',
                       ),
                       'name' => 'Jamison Residence Hall',
                     ),
                     19 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.062848',
                         1 => '-79.809885',
                       ),
                       'name' => 'Spartan Village',
                     ),
                     20 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.065425',
                         1 => '-79.814261',
                       ),
                       'name' => 'Spring Garden Apartments',
                     ),
                     21 =>
                     array (
                       'confirmed cases' => 0,
                       'location' =>
                       array (
                         0 => '36.064436',
                         1 => '-79.814264',
                       ),
                       'name' => 'Tower Village',
                     ),
                   ),
                   'TableStats' =>
                   array (
                     'Contractors' => 0,
                     'Faculty' => 1,
                     'Staff' => 1,
                     'Students' => 2,
                     'Total' => 4,
                   ),
                 );

$tester7->testScript($testData, $expected, "PythonScriptCallerAPI Data Analysis test");
    
    
