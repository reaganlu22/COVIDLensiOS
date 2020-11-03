<?php


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
        $analysis = shell_exec($pythonScript . escapeshellarg(json_encode($data)) . ' 2>&1');
        return $analysis;
    }

}
