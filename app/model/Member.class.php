<?php

class Member {
  const DB_TABLE = 'character_data'; // database table name


  // database fields for this table
  public $id = 0;
  public $first_name = '';
  public $last_name = '';
  public $picture_file = null;
  public $first_fact   = '';
  public $second_fact    = '';



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
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $member = new Member(); // instantiate new Soldier object

        // store db results in local object
        $member->id           = $row['id'];
        $member->first_name   = $row['first_name'];
        $member->last_name    = $row['last_name'];
        $member->first_fact   = $row['first_fact'];
        $member->second_fact    = $row['second_fact'];
        $member->picture_file    = $row['picture_file'];

        return $member; // return the member
      }
  }

  // return all members as an array
  public static function getMembers() {
    $db = Db::instance();
    $q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY first_name ASC;";
    $result = $db->query($q);

    $members = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $members[] = self::loadById($row['id']);
      }
    }
    return $members;
  }

  public function save(){
    if($this->id == 0) {
      return $this->insert(); // member is new and needs to be created
    } else {
      return $this->update(); // member already exists and needs to be updated
    }
  }

  public function insert() {
    if($this->id != 0)
      return null; // can't insert something that already has an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("INSERT INTO `%s` (`first_name`, `last_name`, `first_fact`, `second_fact`, `id`, `picture_file`, `tree_id`)
    VALUES (%s, '', %s, %s, NULL, %s, '');",
      self::DB_TABLE,
      $db->escape($this->first_name),
      $db->escape($this->first_fact),
      $db->escape($this->second_fact),
      $db->escape($this->picture_file)
      );

    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    return $this->id;
  }

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("UPDATE `%s` SET
      `first_name`  = %s,
      `first_fact`  = %s,
      `second_fact` = %s,
      `picture_file` = %s
      WHERE `%s`.`id` = %d;",
      self::DB_TABLE,
      $db->escape($this->first_name),
      $db->escape($this->first_fact),
      $db->escape($this->second_fact),
      $db->escape($this->picture_file),
      self::DB_TABLE,
      $db->escape($this->id)
      );
    $db->query($q); // execute query
    return $this->id; // return this object's ID
  }

  public function delete() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    //echo $this->second_fact;
    // build query
    $q = sprintf("DELETE FROM `%s`  WHERE `%s`.`id` = %d;",
      self::DB_TABLE,
      self::DB_TABLE,
      $db->escape($this->id)
      );

      $db->query($q); // execute query

  }

}
