<?php

/**
 * Description of APIAdapter
 *
 * @author isaactaylor
 */
class APIAdapter implements APIAdapterInterface {
    
    public function getStats($data) {
       $analyzer = new PythonScriptCallerAPI();
       $analyzer->getStats("some python script file", $data);
    }

}
