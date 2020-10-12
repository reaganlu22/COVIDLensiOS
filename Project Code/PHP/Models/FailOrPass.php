<?php

/**
 * Description of Failures
 *
 * @author isaactaylor
 */
class FailOrPass {

    private const SUCCESS = "SUCCESS";
    private const FAILED = "FAILED";

    public static function getSuccess() {
        return self::SUCCESS;
    }

    public static function getFailure() {
        return self::FAILED;
    }

    public static function getFailureArray() {
        return array("status" => self::FAILED, "data" => null);
    }

}
