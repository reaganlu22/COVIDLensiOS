<?php
require_once '../includes/autoload.php';

/**
 * Description of APIAdapter
 *
 * @author isaactaylor
 */
class APIAdapter implements APIAdapterInterface {

    /**
     * This function returns statistics and data that has been analyzed for a user
     * 
     * @param array $data - the data to be analyzed
     * @return string - the analyzed results as a serialized string 
     */
    public function getStats($data) {
        $analyzer = new PythonScriptCallerAPI();
        return $analyzer->getStats($data);
    }

}
