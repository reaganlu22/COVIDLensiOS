<?php

namespace API;

/**
 * Description of PythonScriptCallerAPI
 *
 * @author isaactaylor
 */
class PythonScriptCallerAPI {
    /**
     * 
     * @param string $pythonScript - The python script to run
     * @param type $data - The data to analyze
     * @return string - the analyzed results as a serialized string 
     */
    public function getStats(string $pythonScript, $data) {
        $analysis = exec($pythonScript . " .$data");
        return $analysis;
    }

}
