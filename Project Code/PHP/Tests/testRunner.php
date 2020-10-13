<?php

require 'AdminTest.php';
require 'PythonScriptCallerTest.php';
//Admin Tests
$tester1 = new AdminTest();
$tester1->testAdminCreation();
$tester1->testAdminDeletion();
$tester1->testAdminSignInRequest();
$tester1->testAdminSignOutRequest();

//PythonScriptCallerAPI Tests
$tester2 = new PythonScriptCallerTest();
// mocking some ID's
$jID = uniqid();
$mendID = uniqid();
$sameConfirmer = uniqid();

// mock data that could be returned from the database to be analyzed
//$testData = array("Report" => array(array("timeStamp" => "2020-10-12", "userID" => uniqid(), "locationID" => $jID(),
//            "residenceHall" => "Jefferson Suites", "reportStatus" => "Confirmed",
//            "age" => 21, "phoneNumber" => "123-456-7890", "reportInfo" => "I have been identified "
//            . "as a close contact of someone who tested positve.",
//            "situationDesc" => "I feel bad. ", "affiliation" => "Student", "confirmerID" => $sameConfirmer),
//        array("timeStamp" => "2020-09-12", "userID" => uniqid(), "locationID" => $mendID,
//            "residenceHall" => "Mendenhall Residence Hall", "reportStatus" => "Not Confirmed",
//            "age" => 22, "phoneNumber" => "121-456-7890", "reportInfo" => "Someone in my household tested positive.",
//            "situationDesc" => "I have had a fever all week. ", "affiliation" => "Student", "confirmerID" => ""),
//        array("timeStamp" => "2020-08-12", "userID" => uniqid(), "locationID" => uniqid(),
//            "residenceHall" => "NA", "reportStatus" => "Confirmed",
//            "age" => 42, "phoneNumber" => "123-256-7890", "reportInfo" => "I have tested positve",
//            "situationDesc" => "Recently, I lost my sense of smell out of nowhere.", "affiliation" => "Faculty",
//            "confirmerID" => uniqid()),
//        array("timeStamp" => "2020-07-12", "userID" => uniqid(), "locationID" => $mendID,
//            "residenceHall" => "Mendenhall Residence Hall", "reportStatus" => "Not Confirmed",
//            "age" => 18, "phoneNumber" => "123-436-7890", "reportInfo" => "I have sypmtoms but have not been tested",
//            "situationDesc" => "My friend's daughters, son-in-law was sick, so I think I need to get tested",
//            "affiliation" => "Student", "confirmerID" => ""),
//        array("timeStamp" => "2020-06-12", "userID" => uniqid(), "locationID" => $jID,
//            "residenceHall" => "Jefferson Suites", "reportStatus" => "Confirmed",
//            "age" => 19, "phoneNumber" => "123-456-7490", "reportInfo" => "I have been tested but have not received"
//            . " results yet.",
//            "situationDesc" => "Recently, I have been feeling really bad after attending a gathering."
//            . " I got tested and it came back positive.", "affiliation" => "Student", "confirmerID" => uniqid()),
//        array("timeStamp" => "2020-06-12", "userID" => uniqid(), "locationID" => uniqid(),
//            "residenceHall" => "NA", "reportStatus" => "Confirmed",
//            "age" => 30, "phoneNumber" => "123-456-7490", "reportInfo" => "I have tested positive.",
//            "situationDesc" => "My son came down with COVID-19, so I am waiting to get tested.",
//            "affiliation" => "Staff", "confirmerID" => $sameConfirmer),
//        "Map_Locations" => array())
//);

//Easier method ... Run Python and let it Query From the database itself on map data

$expected = array("Students" => 2, "Faculty" => 1, "Staff" => 1, "Contractors" => 0, "Total" => 4,
    "map_data" => array("Jefferson Suites" => 2, "Mendenhall Residence Hall" => 0));//... all other locations
    //and there counts
//$tester2->testScript("python", $testData, $expected, "PythonScriptCaller Test 1");


