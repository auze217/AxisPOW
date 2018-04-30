<?php

include_once '../global.php';

//get identifier for the page we want
$action = $_GET['action'];
//instantiate a campController and route it
$cc = new CampController();
$cc->route($action);

class CampController {
  public function route($action) {
    switch($action) {
    case 'index':

      $this->index();
      break;
    case 'add':
      $this->add();
      break;
    case 'addProcess':
      $this->addProcess();
      break;
    case 'view':
      $id = $_GET['id'];

      $this->view($id);
      break;
    case 'update':
      $id = $_GET['id'];
      $this->update($id);
      break;
    case 'delete':
      $id = $_GET['id'];
      $this->delete($id);
      break;
    case 'deleteProcess':
      $id = $_GET['id'];
      $this->deleteProcess($id);
      break;
    case 'updateProcess':
      $id = $_GET['id'];
      $this->updateProcess($id);
      break;
    case 'addLifeEventProcess':
        $id = $_GET['id'];
        $this->addLifeEventProcess($id);
        break;
    case 'deleteLifeEventProcess':
        $id = $_GET['id'];
        $this->deleteLifeEventProcess($id);
        break;
    }
  }
  public function deleteLifeEventProcess($id) {
    if(!isset($_SESSION['username'])){
      header('Location: '.BASE_URL.'/login'); exit();
    }
    if (isset($_SESSION['username'])) {
      $user= User::loadByUn($_SESSION['username']);
    }
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);
    $sql = sprintf("SELECT * FROM life_event WHERE camp_id = '%d';",
      $id);
    $life = $conn->query($sql);
    if(!$life) {
      trigger_error('Invalid query: '.$conn->error);
    }
    $event = $life->fetch_assoc();
    $camp_id = $event['camp_id'];
    $q = sprintf("DELETE FROM life_event WHERE id='$id'");

    $conn->query($q) or die('Error: '.$conn->error);
    header('Location: '.BASE_URL.'/camps/view/'.$camp_id); exit();
  }
    public function addLifeEventProcess($id) {
		    $title = $_POST['title'];
		    $details = $_POST['details'];
        $image = $_POST['image']; //possibly wont be used
        $url = $_POST['url'];
        $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);

    $q = sprintf("INSERT INTO `life_event` (`title`, `details`, `image`, `url`, `camp_id`) VALUES
    ('%s', '%s', '%s', '%s', '%s');", $title, $details, "", $url, $id);

    $result = $conn->query($q);
    if(!$result) {
      trigger_error('Invalid query: '.$conn->error);
    }

    $sql = sprintf("SELECT * FROM life_event WHERE camp_id = '%d';",
      $id);
    $life = $conn->query($sql);
    if(!$life) {
      trigger_error('Invalid query: '.$conn->error);
    }

	}
  public function index() {
    if (isset($_SESSION['username'])) {
      $user= User::loadByUn($_SESSION['username']);
    }
  //  $camps = Camp::getCamps();
  $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE)or die('Error: '.$conn->connect_error);
      //getting all the characters from the database
      $q = "SELECT * FROM camps ORDER BY name ASC;";
      $result = $conn->query($q);
    $pageTitle = "POW Camps";
    include_once SYSTEM_PATH.'/view/header.tpl';
    include_once SYSTEM_PATH.'/view/camps.tpl';
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }
  public function add() {
    if(!isset($_SESSION['username'])){
      header('Location: '.BASE_URL.'/login'); exit();
    }
    if (isset($_SESSION['username'])) {
      $user= User::loadByUn($_SESSION['username']);
    }
    $pageTitle = "Add Camp";
  	include_once SYSTEM_PATH.'/view/add.tpl';
  }
  public function addProcess() {
    $name = $_POST['camp_name'];
    $state = $_POST['state'];
    $prisoners = $_POST['prisoners'];
    $image = $_POST['image'];

    if (empty($name) || empty($state)) {
      header('Location: '.BASE_URL.'/camps/add'); exit();
    }
    $camp = new Camp();
    $camp->name = $name;
    $camp->state = $state;
    $camp->prisoners = $prisoners;
    $camp->image = $image;
    $camp->save();
    header('Location: '.BASE_URL.'/camps'); exit();
  }
  public function view($id) {
    if (isset($_SESSION['username'])) {
      $user= User::loadByUn($_SESSION['username']);
        $userID = $user->id;
        $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);
        $j = Camp::loadById($id);
        //$result = $conn->query($j);
        $campName = 'Visited '.$j->name;
        $q = sprintf("UPDATE `user_events` SET `title` = '$campName', `details` = '$id' WHERE `user_events`.`user_id` = '$userID';");
        $result = $conn->query($q);
    }
    //connecting to the database
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);
    $q = sprintf("SELECT * FROM camps WHERE id = '%d';",
      $id
    ) ;
    //getting the information of that character based on the sql line
    $result = $conn->query($q);
    if(!$result) {
      trigger_error('Invalid query: '.$conn->error);
    }
    if ($result->num_rows == 0) {
    }
    //getting information of the character's lifeevents
    $sql = sprintf("SELECT * FROM life_event WHERE camp_id = '%d';",
      $id);
    $life = $conn->query($sql);
    if(!$life) {
      trigger_error('Invalid query: '.$conn->error);
    }
    $r = $result->fetch_assoc();
    $pageTitle = $r['name'];
    include_once SYSTEM_PATH.'/view/header.tpl';
    include_once SYSTEM_PATH.'/view/camp.tpl';
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }
  public function update($id) {
    if(!isset($_SESSION['username'])){
      header('Location: '.BASE_URL.'/login'); exit();
    }
    if (isset($_SESSION['username'])) {
      $user= User::loadByUn($_SESSION['username']);
    }
    $pageTitle="Update";
    //connecting to the database
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);
    $q = sprintf("SELECT * FROM camps WHERE id = '%d';",
      $id
    ) ;
    //getting the information of that character based on the sql line
    $result = $conn->query($q);
    if(!$result) {
      trigger_error('Invalid query: '.$conn->error);
    }
    include_once SYSTEM_PATH.'/view/header.tpl';
    include_once SYSTEM_PATH.'/view/update.tpl';
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }
  public function updateProcess($id) {
    // get POST variables
    //connecting to the database
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);
    $q = sprintf("SELECT * FROM camps WHERE id = '%d';",
      $id
    ) ;
    //getting the information of that character based on the sql line
    $result = $conn->query($q);
    if(!$result) {
      trigger_error('Invalid query: '.$conn->error);
    }
		$name 	 = $_POST['camp_name'];
		$state 	 = $_POST['state'];
		$prisoners		 = $_POST['prisoners'];
		$image	 = $_POST['image'];
    $row = $result->fetch_assoc();

    if(empty($name)) {
      $name = $row['name'];
    }
    if(empty($state))
      $state = $row['state'];
    if(empty($prisoners))
      $prisoners = $row['prisoners'];

    if(empty($image))
      $image = $row['image'];
    $q = sprintf("UPDATE camps SET name='$name', state='$state', prisoners='$prisoners', image='$image' WHERE id='$id';");
    $conn->query($q) or die('Error: '.$conn->error);
		header('Location: '.BASE_URL.'/camps/view/'.$id); exit();
  }

  public function deleteProcess($id) {
    if(!isset($_SESSION['username'])){
      header('Location: '.BASE_URL.'/login'); exit();
    }
    if (isset($_SESSION['username'])) {
      $user= User::loadByUn($_SESSION['username']);
    }
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);

    $q = sprintf("DELETE FROM camps WHERE id='$id'");

    $conn->query($q) or die('Error: '.$conn->error);
		header('Location: '.BASE_URL.'/camps'); exit();
  }

}
