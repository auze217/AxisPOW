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
    }
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
    $camp = Camp::loadById($id);
    $pageTitle = $camp->name;
    include_once SYSTEM_PATH.'/view/header.tpl';
    if ($camp != null) {
      include_once SYSTEM_PATH.'/view/camp.tpl';
    } else {
      die('Invalid camp ID');
    }
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }
  public function update($id) {
    // get POST variables
		$camp = Camp::loadById($id);
		$name 	 = $_POST['camp_name'];
		$state 	 = $_POST['state'];
		$soldiers		 = $_POST['soldiers'];
		$image	 = $_POST['image'];

		//check if the user wants the variables want to be updated
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
		}

		$id = $camp->save();
		header('Location: '.BASE_URL.'/member/view/'.$id); exit();
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
