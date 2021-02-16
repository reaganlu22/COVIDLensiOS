<?php

require_once '../includes/autoload.php';

/**
 * Description of PythonScriptCallerTest
 *
 * @author isaactaylor
 */
class PythonScriptCallerTest extends TestCase {

    private $api;

    public function __construct() {
        $this->api = new PythonScriptCallerAPI();
    }

    public function __destruct() {
        $this->api = null;
    }

    /**
     * This function tests a the PythonScriptCaller API
     * 
     * @param type $scriptName - The name of the python file
     * @param type $testData - An array of data to be analyzed
     * @param type $expected - The expected return value from the API
     * @param type $testName - A descriptive name for this test
     */
    public function testScript($testData, $expected, $testName) {
        $actual = str_replace("\n", "", $this->api->getStats($testData));
        $this->assertEquals(json_encode($expected), $actual, $testName);
    }

}
