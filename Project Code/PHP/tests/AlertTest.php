<?php

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}

use PHPUnit\Framework\TestCase;

/**
 * Description of AlertTests
 *
 * @author isaactaylor
 */
class AlertTest extends TestCase {

   function testPass() {
        $this->assertSame(0, 0);
    }

}
