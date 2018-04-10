<?php

class Followers {
  const DB_TABLE = 'user_followers'; // database table name

  // database fields for this table
  public $id = 0;
  public $user_id = 0;
  public $username = '';
  public $follower = '';
  public $follower_id = 0;

  //dont think we need this function
  // return a Soldier object by ID
  public static function loadById($id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE user_id = %d;",
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
        $soldier->id = $row['id'];
        $soldier->user_id           = $row['user_id'];
        $soldier->username   = $row['username'];
        $soldier->follower    = $row['follower'];
        $soldier->follower_id         = $row['follower_id'];
        return $soldier; // return the soldier
      }
    }
  }

  // return all Soldiers as an array
  public static function getFollowers($id) {
    $db = Db::instance();
    $q = sprintf("SELECT * FROM user_followers WHERE user_id = '%d';",
      $id);
    $result = $db->query($q);

    $soldiers = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $soldiers[] = User::loadById($row['follower_id']);
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
    $q = sprintf("INSERT INTO `user_followers` (`user_id`, `username`, `follower`, `follower_id`) VALUES ( '$this->user_id', '$this->username', '$this->follower', '$this->follower_id');"
    );

    //echo $q;
    $db->query($q); // execute query
    //might need to make an id for the follower alone
  //  $this->id = $db->getInsertID(); // set the ID for the new object
    //echo $this->id;
    return $this->id;
  }

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("UPDATE `user_followers` SET `user_id` = '$this->user_id', `username` = '$this->username', `follower` = '$this->follower', `follower_id` = '$this->follower_id' WHERE `user_followers`.`id` = $this->id;"
      );
    $db->query($q); // execute query
    return $db->id; // return this object's ID
  }
  public function delete() {
    if($this->id == 0)
      return null;

      $db = Db::instance();
      $q = sprintf("DELETE FROM user_followers WHERE id='$this->id'");

      $db->query($q);
      return $this->id;


  }

}
