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
    public function getStats($data){
        define("API", "https://tammykale.pythonanywhere.com/api");
        $ch = curl_init(API);
        //Setup request to send json via POST
        $payload = json_encode($data);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        //Return response instead of printing.
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        //Send request.
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

}
