<?php

class Db {

  private static $_instance = null;
  private $conn;

	private function __construct() {
    $this->conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE)
			or die('Error: '.$conn->connect_error);
	}

	public static function instance() {
		if (self::$_instance === null) {
			self::$_instance = new Db();
		}
		return self::$_instance;
	}

  public function query($q) {
    $result = $this->conn->query($q);
    return $result;
  }

  // escape any characters that could cause trouble for MySQL
  public function escape($str) {
    if($str == '') {
      $escaped = 'NULL';
    } elseif(is_numeric($str)) {
      $escaped = $this->conn->real_escape_string($str);
    } else {
      $escaped = "'".$this->conn->real_escape_string($str)."'";
    }
    return $escaped;
  }

  // get the ID of the last inserted object
  public function getInsertID() {
    return $this->conn->insert_id;
  }

  // format any date as a MYSQL date
  public function formatDate($date) {
    $time = strtotime($date);
    $formattedDate = date("Y-m-d", $time);
    return $formattedDate;
  }

}
