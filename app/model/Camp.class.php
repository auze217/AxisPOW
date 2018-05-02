<?php

class Camp {
  const DB_TABLE = 'camps'; // database table name

  // database fields for this table
  public $id = 0;
  public $name = '';
  public $state = '';
  public $prisoners = '';
  public $image = '';
  //public $email = '';
//  public $permissions = 0;


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

        $soldier = new Camp(); // instantiate new Soldier object

        // store db results in local object
        $soldier->id           = $row['id'];
        $soldier->name   = $row['name'];
        $soldier->state    = $row['state'];
        $soldier->prisoners         = $row['prisoners'];
        $soldier->image = $row['image'];
        //$soldier->email = $row['email'];
        //$soldier->permissions = $row['permissions'];
        return $soldier; // return the soldier
      }
    }
  }
  public static function loadByName($name) {
    $db = Db::instance(); // create db connection
    // build query
    $q = sprintf("SELECT * FROM `%s` WHERE name = %d;",
      self::DB_TABLE,
      $name
      );
    $result = $db->query($q); // execute query
    // make sure we found something
    if($result) {
    if($result->num_rows == 0) {
      return null;
    } else {
      $row = $result->fetch_assoc(); // get results as associative array

      $soldier = new Camp(); // instantiate new Soldier object

      // store db results in local object
      $soldier->id           = $row['id'];
      $soldier->name   = $row['name'];
      $soldier->state    = $row['state'];
      $soldier->prisoners         = $row['prisoners'];
      $soldier->image = $row['image'];
      //$soldier->email = $row['email'];
      //$soldier->permissions = $row['permissions'];
      return $soldier; // return the soldier
    }
  }
  }

  // return all Soldiers as an array
  public static function getCamps() {
    $db = Db::instance();
    $q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY name ASC;";
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
    $q = sprintf("INSERT INTO `camps` (`id`, `name`, `state`, `prisoners`, `image`) VALUES (NULL, '$this->name', '$this->state', '$this->prisoners', '$this->image');"
    );

    //echo $q;
    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    echo $this->id;
    return $this->id;
  }

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("UPDATE `%s` SET
      `name` = %s,
      `state`  = %s,
      `prisoners` = %s,
      'image' = %s,
      WHERE `id` = %d;",
      self::DB_TABLE,
      $db->escape($this->name),
      $db->escape($this->state),
      $db->escape($this->prisoners),
      $db->escape($this->image),
      $this->id
      );
    $db->query($q); // execute query
    return $db->id; // return this object's ID
  }

}
