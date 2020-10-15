<?php

require_once '../includes/autoload.php'; ?>
<html>
<h2> Add A User </h2>

<form method="post">
    	<label for="$email">Email Address</label>
    	<input type="text" name="email" id="email">
    	<label for="$password">Password</label>
    	<input type="password" name="password" id="password">
    	<input type="Submit" name="Log In" value="Submit">
    </form>
</html>
</php> 
/**
 * Description of UserTests
 *
 * @author isaactaylor
 */
class UserTest extends TestCase {


}
