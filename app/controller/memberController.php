<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a MemberController and route it
$sc = new MemberController();
$sc->route($action);

class MemberController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'view':

				$id = $_GET['id'];
				$this->view($id);
				break;

			case 'index':
				$this->index();
				break;

			case 'update':
				$id = $_GET['id'];
				$this->update($id);
				break;

			case 'add':
				$this->add();
				break;

			case 'addBio':
				$this->addBio();
				break;

			case 'addParable':
				$id = $_GET['id'];
				$this->addParable($id);
				break;

			case 'deleteProcess':
				$id = $_GET['id'];
				$this->deleteProcess($id);
				break;

				case 'delete':
					$id = $_GET['id'];
					$this->delete($id);
					break;
		}

	}

	public function add() {
		$pageTitle = 'Add Member';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/add.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }
	public function index() {
		//$camps = Camp::getCamps();

		$pageTitle = "POW Camps";
	//	include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function delete($id) {
		$camp = Camp::loadById($id);
		$pageTitle = 'Delte'.$camp->name;
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/delete.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function deleteProcess($id) {

		$camp = Camp::loadById($id);
		$camp->delete();
		header('Location: '.BASE_URL.'/member'); exit();


	}

	public function view($id) {

		$camp = Camp::loadById($id);
		$pageTitle = $camp->name;
		include_once SYSTEM_PATH.'/view/header.tpl';
		if($camp != null) {
			$parables = Parable::getParablesById($id);
			include_once SYSTEM_PATH.'/view/camp.tpl';
		} else {
			die('Invalid member ID');
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

	public function addBio() {
		$this->addProcess();

	}

	public function addProcess() {
		// get POST variables
		$firstName 	 = $_POST['first_name'];
		$picture_file 	 = $_POST['picture_file'];
		$first_fact		 = $_POST['first_fact'];
		$second_fact	 = $_POST['second_fact'];



		// first name and first fact are required
		if( empty($firstName) || empty($first_fact)) {
			header('Location: '.BASE_URL.'/member/add/'); exit();
		}

		//create a new member
		$member = new Member();

		//define the fields the the the posted values
		$member->first_name = $firstName;
		$member->picture_file = $picture_file;
		$member->first_fact = $first_fact;
		$member->second_fact = $second_fact;

		//go to the created members save function
		$id = $member->save();

		header('Location: '.BASE_URL.'/member/view/'.$id); exit();
	}

	public function addParable($memberID) {
    // get POST variables
		$title = $_POST['parable_title'];
		$body = $_POST['parable_body'];

		$par = new Parable();
		$par->member_id = $memberID;
		$par->title = $title;
		$par->body = $body;

		$par->save();
		header('Location: '.BASE_URL.'/member/view/'.$memberID); exit();

	}

}
