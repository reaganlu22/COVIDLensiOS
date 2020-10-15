<?php

/**
 * This class is used for creating tests
 *
 * @author isaactaylor
 */
class TestCase {

    /**
     * THis function simulates a test assertion 
     * 
     * @param type $expected - The value that is expected
     * @param type $actual - The actual result
     * @param type $testName - Descriptive test name
     */
    public function assertEquals($expected, $actual, $testName = null) {
        if (!empty($testName)) {
            echo "<h2>$testName</h2>";
        }
        if ($expected === $actual) {
            echo "<p style='color:green'>-----PASSED----- </p>";
        } else {
            echo "<p style='color:red'>-----FAILED----- </p>";
        }
        echo "<br>";
        echo "expected: " . json_encode($expected);
        echo "<br>";
        echo "actual: " . json_encode($actual);
        echo "<br><br>";
    }

}
