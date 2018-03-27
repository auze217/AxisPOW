<?php

class Parable {
  const DB_TABLE = 'parables'; // database table name

  // database fields for this table
  public $id = 0;
  public $title = '';
  public $body = null;
  public $member_id = 0;

  // return a Parabe object by ID
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

        $le = new Parable(); // instantiate new parables object

        // store db results in local object
        $le->id           = $row['id'];
        $le->Title        = $row['Title'];
        $le->Body         = $row['Body'];
        $le->member_id    = $row['member_id'];

        return $le; // return the parable
      }
  }

  // return all parables attached to a member
  public static function getParablesById($memberID) {
    $db = Db::instance();
    $q = sprintf("SELECT le.id AS id FROM `%s` le
      INNER JOIN `%s` s ON
      le.member_id = s.id
      WHERE le.member_id = %d
      ",
      self::DB_TABLE,
      Member::DB_TABLE,
      $memberID
      );
    //echo $q;
    $result = $db->query($q);

    $parables = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $parables[] = self::loadById($row['id']);
      }
    }
    return $parables;
  }

  public function save(){
    if($this->id == 0) {
      return $this->insert(); // object is new and needs to be created
    } else {
      return $this->update(); // object already exists and needs to be updated
    }
  }

  public function insert() {
    if($this->id != 0)
      return null; // can't insert something that already has an ID

    $db = Db::instance(); // connect to db



    // build query
    $q = sprintf("INSERT INTO `%s` (`id`, `Title`, `Body`, `member_id`)
    VALUES (NULL, %s, %s, %d);",
      self::DB_TABLE,
      $db->escape($this->title),
      $db->escape($this->body),
      $db->escape($this->member_id)
      );
    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    return $this->id;
  }

}
