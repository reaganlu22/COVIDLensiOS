<?php

/**
 * Description of PythonScriptCallerAPI
 *
 * @author isaactaylor
 */
class PythonScriptCallerAPI implements APIAdapterInterface {

    public function getStats(string $pythonScript, $data) {
        $analysis = exec($pythonScript." .$item");
        return $analysis;
    }

}
