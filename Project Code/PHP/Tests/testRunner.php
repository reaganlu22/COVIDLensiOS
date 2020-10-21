<?php

require 'AdminTest.php';
require 'AlertTest.php';
require 'MapLocationsTest.php';
require 'ReportTest.php';
require 'ResourcesTest.php';
require 'UserTest.php';

//Admin Tests
// $tester1 = new AdminTest();
// $tester1->testAdminCreation();
// $tester1->testAdminDeletion();
// $tester1->testAdminSignInRequest();
// $tester1->testAdminSignOutRequest();

//Alert Tests
// $tester2 = new AlertTest();
// $tester2->testAlertCreation();
// $tester2->testAlertUpdate();
// $tester2->testAlertDeletion();
// $tester2->testAlertReadAll();

//MapLocations Tests

// $tester3 = new MapLocationsTest();
// $tester3->testMapLocationsCreation();
// $tester3->testMapLocationsDeletion();

//Report Tests

$tester4 = new ReportTest();
$tester4->testReportCreation();
// $tester4->testReportDeletion(); (not allowed to delete)

//Resources Tests

// $tester5 = new ResourcesTest();
// $tester5->testResourcesCreation();
// $tester5->testResourcesDeletion();


//User Tests

// $tester6 = new UserTest();
// $tester6->testUserCreation();
// $tester6->testUserDeletion();
// $tester6->testUserSignInRequest();
// $tester6->testUserSignOutRequest();
