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

			case 'trees':
				$this->trees();
				break;

			case 'database':
				$this->database();
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
		$correctUsername = 'Zeus';
		$correctPassword = 'God';

		if($un != $correctUsername)
			header('Location: '.BASE_URL);
		elseif($pw != $correctPassword)
			header('Location: '.BASE_URL);
		else {
			$_SESSION['username'] = $un;
			header('Location: '.BASE_URL.'/trees'); exit();
		}

		//echo 'username: '.$un.'<br>';
		//echo 'password: '.$pw;

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
