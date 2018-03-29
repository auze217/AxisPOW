<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
				$this->home();
				break;

			case 'database':
				$this->database();
				break;
			case 'login':
				$this->login();
				break;
			case 'loginProcess':
				$username = $_POST['username'];
				$password = $_POST['pw'];
				$this->loginProcess($username, $password);
				break;

			case 'logout':
				$this->logoutProcess();
				break;

		}

	}

	public function loginProcess($un, $pw) {
		//$correctUsername = 'Zeus';
		//$correctPassword = 'God';
		$user = array();
		$user = User::getUsers();

		for (int i = 0; i < count($user); i++) {
			$row = $user[i];
			if ( $un == $row[username] && $pw == $row[password]) {
				$_SESSION['username'] = $un;
				//I guess we need a dashboard template and stuff.
				header('Location: '.BASE_URL.'/dashboard'); exit();
			}
		}
		header('Location: '.BASE_URL.'/login'); exit();

	}

  public function home() {
		$pageTitle = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function trees() {


		$pageTitle = 'Myth Trees';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/trees.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function logoutProcess() {
		unset($_SESSION['username']); // not necessary, but just to be safe
		session_destroy();
		header('Location: '.BASE_URL); exit(); // send us to home page
	}

	public function database() {
		$pageTitle = 'Database';
		$members = Member::getMembers();
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/characterDatabase.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

}
