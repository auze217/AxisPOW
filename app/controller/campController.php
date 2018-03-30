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
    case 'camp':
    //this is just a test case
    $this->camp();
    break;
    case 'updateProcess':
    $id = $_GET['id'];
    $this->updateProcess($id);
    break;
    }
  }
  public function camp() {
    $pageTitle = 'Camp Aliceville';
    include_once SYSTEM_PATH.'/view/header.tpl';
    include_once SYSTEM_PATH.'/view/camp.tpl';
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }
  public function index() {
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
    $pageTitle = "Add Camp";
    include_once SYSTEM_PATH.'/view/header.tpl';
  	include_once SYSTEM_PATH.'/view/add.tpl';
  	include_once SYSTEM_PATH.'/view/footer.tpl';
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

    $id = $camp->save();

    header('Location: '.BASE_URL.'/camps/view/'.$id); exit();
  }
  public function view($id) {
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
	/*	//check if the user wants the variables want to be updated
		if(!empty($name)) {
			$camp->name = $name;
		}

		if(!empty($state)) {
			$member->state = $state;
		}
		if(!empty($soldiers)) {
			$member->soldiers = $soldiers;

		}
		if(!empty($image)) {
			$member->image = $image;
		}*/
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
	//	$id = $camp->save();
		header('Location: '.BASE_URL.'/camps/view/'.$id); exit();
  }
  public function delete($id) {
    $camp = Camp::loadById($id);
    $pageTitle = 'Delete'.$camp->name;
    include_once SYSTEM_PATH.'/view/header.tpl';
    include_once SYSTEM_PATH.'/view/delete.tpl';
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }
  public function deleteProcess($id) {
    $camp = Camp::loadById($id);
		$camp->delete();
		header('Location: '.BASE_URL.'/member'); exit();
  }

}
