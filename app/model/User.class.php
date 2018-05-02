<?php

class User {
  const DB_TABLE = 'users'; // database table name

  // database fields for this table
  public $id = 0;
  public $username = '';
  public $password = '';
  public $firstname = '';
  public $lastname = '';
  public $email = '';
  public $permissions = 0;
  public $image = '';
  public $gender = 'Male';


  // return a Soldier object by ID
  public static function loadById($id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE id = %d;",
        self::DB_TABLE,
        $id
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result) {
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $soldier = new User(); // instantiate new Soldier object

        // store db results in local object
        $soldier->id           = $row['id'];
        $soldier->username   = $row['username'];
        $soldier->password    = $row['password'];
        $soldier->firstname         = $row['first_name'];
        $soldier->lastname = $row['last_name'];
        $soldier->email = $row['email'];
        $soldier->permissions = $row['permissions'];
        $soldier->image = $row['image'];
        $soldier->gender = $row['gender'];
        return $soldier; // return the soldier
      }
    }
  }
  public static function loadByUn($un) {
    $db = Db::instance();
    $q = sprintf("SELECT * FROM `%s` WHERE username = '%s';",
      self::DB_TABLE,
      $un
      );
      $result = $db->query($q); // execute query
      if($result) {
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $soldier = new User(); // instantiate new Soldier object

        // store db results in local object
        $soldier->id           = $row['id'];
        $soldier->username   = $row['username'];
        $soldier->password    = $row['password'];
        $soldier->firstname         = $row['first_name'];
        $soldier->lastname         = $row['last_name'];
        $soldier->email          = $row['email'];
        $soldier->permissions = $row['permissions'];
        $soldier->image = $row['image'];
        $soldier->gender = $row['gender'];
        return $soldier; // return the soldier
      }
    }
  }

  // return all Soldiers as an array
  public static function getUsers() {
    $db = Db::instance();
    $q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY username ASC;";
    $result = $db->query($q);

    $soldiers = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $soldiers[] = self::loadById($row['id']);
      }
    }
    return $soldiers;
  }

  public function save(){
    if($this->id == 0) {
      return $this->insert(); // soldier is new and needs to be created
    } else {
      return $this->update(); // soldier already exists and needs to be updated
    }
  }

  public function insert() {
    if($this->id != 0)
      return null; // can't insert something that already has an ID
    $db = Db::instance(); // connect to db
    // build query

  //  echo $this->username;
    $q = sprintf("INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `permissions`, `image`, `gender`) VALUES (NULL, '$this->firstname', '$this->lastname', '$this->username', '$this->password', '$this->email', '$this->permissions', '$this->image', '$this->gender');"
    );

    //echo $q;
    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    //echo $this->id;
    return $this->id;
  }

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("UPDATE `users` SET `first_name` = '$this->firstname', `last_name` = '$this->lastname', `username` = '$this->username', `password` = '$this->password', `email` = '$this->email', `permissions` = '$this->permissions', `image` = '$this->image', `gender` = '$this->gender' WHERE `users`.`id` = $this->id;"
      );
    $db->query($q); // execute query
    return $db->id; // return this object's ID
  }
  public function delete() {
    if($this->id == 0)
      return null;

      $db = Db::instance();
      $q = sprintf("DELETE FROM users WHERE id='$this->id'");

      $db->query($q);
      return $this->id;


  }

}
