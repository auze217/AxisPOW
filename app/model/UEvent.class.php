<?php

class UEvent {
  const DB_TABLE = 'user_events'; // database table name

  // database fields for this table
  //for this im think have the title for what they did but make that an a with the details
  //being the href for what they just looked at.
  public $id = 0;
  public $title = '';
  //might possibly make it an int thats the camps id
  public $details = '';
  public $date_created = '';
  public $user_id = 0;


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
        $soldier->id           = $row['id'];
        $soldier->title   = $row['title'];
        $soldier->details    = $row['details'];
        $soldier->date_created         = $row['date_created'];
        $soldier->user_id = $row['user_id'];
        return $soldier; // return the soldier
      }
    }
  }
  // return all Soldiers as an array
  public static function getUvents($id) {
    $db = Db::instance();
    $q = sprintf("SELECT * FROM user_events WHERE user_id = '%d';",
      $id);
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
    $q = sprintf("INSERT INTO `user_events` (`id`, `title`, `details`, `date_created`, `user_id`) VALUES (NULL, '$this->title', '$this->details', '$this->date_created', '$this->user_id');"
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
    $q = sprintf("UPDATE `user_events` SET `title` = '$this->title', `details` = '$this->details', `date_created` = '$this->date_created', `user_id` = '$this->user_id' WHERE `users`.`id` = $this->id;"
      );
    $db->query($q); // execute query
    return $db->id; // return this object's ID
  }
  public function delete() {
    if($this->id == 0)
      return null;

      $db = Db::instance();
      $q = sprintf("DELETE FROM user_events WHERE id='$this->id'");

      $db->query($q);
      return $this->id;


  }

}
