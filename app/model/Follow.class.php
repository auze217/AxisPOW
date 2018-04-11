<?php

class Follow {
  const DB_TABLE = 'follower'; // database table name

  // database fields for this table
  public $id = 0;
  public $followed = 0;
  public $followee = 0;

  // return object by ID
  public static function loadById($id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE id = %d;",
        self::DB_TABLE,
        $id
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $fo = new Follow(); // instantiate new object

        // store db results in local object
        $fo->id           = $row['id'];
        $fo->followed  = $row['followed'];
        $fo->followee  = $row['followee'];


        return $fo; // return the object
      }
  }

  public static function isFollower($followerID, $followeeID) {
    $db = Db::instance(); // create db connection
    // build query
    $q = sprintf("SELECT id FROM `%s` WHERE followed = %d AND followee = %d;",
      self::DB_TABLE,
      $followerID,
      $followeeID
      );
    $result = $db->query($q); // execute query
    // make sure we found something
    if($result->num_rows == 0) {
      return false; // not following
    } else {
      return true; // is following
    }
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

    $q = sprintf("INSERT INTO `%s` (
        `followed`,
        `followee`
      ) VALUES (%d, %d);",
      self::DB_TABLE,
      $db->escape($this->followed),
      $db->escape($this->followee)
      );
    //echo $q;
    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    return $this->id;
  }

  public function update() {}

}
