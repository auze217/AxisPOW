<?php

  class Camp {
    const DB_TABLE = 'camps';

    //database fields for this table
    public $id = 0;
    public $name = '';
    public $state = '';
    public $prisoners = '';

    public static function loadById($id) {
      $db = Db::instance();

      $q = sprintf("SELECT * FROM '%s' WHERE id=%d;",
        self::DB_TABLE,
        $id
      );
      $result = $db->query($q);

      if ($result->num_rows == 0) {
        return null;
      }
      else {
        $row = $result->fetch_assoc();

        $camps = new Camp();

        $camps->id = $row['id'];
        $camps->name = $row['name'];
        $camps->state = $row['state'];
        $camps->prisoners = $row['prisoners'];

        return $camps;
      }

    }
    public static function getCamps() {
      $db = Db::instance();
      $q = "SELECT * FROM '".self::DB_TABLE"' ORDER BY name ASC;";
      $result = $db->query($q);

      $users = array();
      if($result->num_rows != 0) {
        while ($row = result->fetch_assoc()) {
          $users[] = self::loadById($row['id']);
        }
      }
      return $users;
    }
    public function save() {
      if($this->id == 0) {
        return $this->insert();
      }
      else  {
        return $this->update();
      }
    }
    public function insert() {
      if($this->id != 0)
        return null;

      $db = Db::instance(); //connect to database
      $q = sprintf("INSERT INTO '%s' ('first_name','last_name','username', 'password', 'email')
          VALUES(%s, %s, %s, %s, %s);"
            self::DB_TABLE,
            $db->escape($this->first)
            $db->escape($this->last)
            $db->escape($this->username)
            $db->escape($this->password)
            $db->escape($this->email)
            );
      $db->query($q);
      $this->id = $db->getInsertID();
      return $this->id;
    }
    public function insert() {
      if($this->id != 0)
        return null;

      $db = Db::instance(); //connect to database
      $q = sprintf("INSERT INTO '%s' ('name','state','prisoners')
          VALUES(%s, %s, %d);"
            self::DB_TABLE,
            $db->escape($this->name),
            $db->escape($this->state),
            $db->escape($this->prisoners)
            );
      $db->query($q);
      $this->id = $db->getInsertID();
      return $this->id;
    }
    public function update() {
      if($this->id = 0) {
        return null;
      }
      $db = Db::instance();

      // build query
      $q = sprintf("UPDATE `%s` SET
        `name`  = %s,
        `state`  = %s,
        `prisoners` = %s,
        WHERE `%s`.`id` = %d;",
        self::DB_TABLE,
        $db->escape($this->name),
        $db->escape($this->state),
        $db->escape($this->prisoners),
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
