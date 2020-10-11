<?php

if (file_exists('../includes/autoload.php')) {
    require_once '../includes/autoload.php';
}

use PHPUnit\Framework\TestCase;

/**
 * Description of UserTests
 *
 * @author isaactaylor
 */
class UserTest extends TestCase {

   function testPass() {
        $this->assertSame(0, 0);
    }

}
