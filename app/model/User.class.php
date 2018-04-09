<?php

  class User {
    const DB_TABLE = 'users';

    //database fields for this table
    public $id = 0;
    public $first = '';
    public $last = '';
    public $username = '';
    public $password = '';
    public $email = '';

    //return a user object by id
    public static function loadById($id) {
      $db = Db::instance();// create db connection
      //build query
      $q = sprintf("SELECT * FROM '%s' WHERE id= %d;",
        self::DB_TABLE,
        $id
        );
      $result = $db->query($q); //execute query
      //make sure we found something
    
      if ($result->num_rows == 0) {
        return null;
      }
      else {
        $row = $result->fetch_assoc();

        $ue = new User(); // instantiate new User event

        // store db results in local object
        $ue->id =$row['id'];
        $ue->first = $row['first_name'];
        $ue->last = $row['last_name'];
        $ue->username =$row['username'];
        $ue->password = $row['password'];
        $ue->email = $row['email'];

        return $ue;//return the user event
      }

    }
    public static function getUsers() {
      $db = Db::instance();
      $q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY username ASC;";
      $result = $db->query($q);

      $users = array();
      if($result->num_rows != 0) {
        while ($row = $result->fetch_assoc()) {
          $users[] = self::loadById($row['id']);
        }
      }
      return $users;
    }
    public function insert() {
      if($this->id != 0)
        return null;

      $db = Db::instance(); //connect to database
      $q = sprintf("INSERT INTO '%s' ('first_name','last_name','username', 'password', 'email')
          VALUES(%s, %s, %s, %s, %s);",
            self::DB_TABLE,
            $db->escape($this->first),
            $db->escape($this->last),
            $db->escape($this->username),
            $db->escape($this->password),
            $db->escape($this->email)
            );
      $db->query($q);
      $this->id = $db->getInsertID();
      return $this->id;
    }
  }
  ?>
