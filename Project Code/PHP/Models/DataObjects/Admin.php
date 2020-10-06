<?php



/**
 * Description of Admin
 *
 * @author isaactaylor
 */
class Admin extends DataObject {

    private $adminId;
    private $email;
    private $password;
    
    public function __construct() {
        $this->setTableName("Admin");
    }
    public function setAdminID(string $id) {
        $this->adminId = $id;
    }

    public function setEmail(string $email) {
        $this->email = $email;
    }

    public function setPassword(string $password) {
        $this->password = $password;
    }

    public function getAdminId() {
        return $this->adminId;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getPassword() {
        return $this->password;
    }

}
