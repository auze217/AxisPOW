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
				$password = $_POST['password'];
				$this->loginProcess($username, $password);
				break;
			case 'signup':
				$this->signup();
				break;
			case 'signupProcess':
				$username = $_POST['username'];
				$password = $_POST['password'];
				$firstname = $_POST['first_name'];
				$lastname = $_POST['last_name'];
				$email = $_POST['email'];
				$this->signupProcess($username, $password, $firstname, $lastname, $email);
				break;
			case 'logout':
				$this->logoutProcess();
				break;

		}

	}

	public function login() {
		$title = 'Login';

		//include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/sign_in.tpl';
		//include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function loginProcess($un, $pw) {
		//$correctUsername = 'Zeus';
		//$correctPassword = 'God';
		//i hate models so I'm not gonna use them for this.
		//connecting to the database
/*		$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);
		$q = "SELECT * FROM users ORDER BY username ASC;";

		$resultU = $conn->query($q);
		//getting all the users from the database to check to see
		//if the entered username and password match anyone
		while($row = $resultU->fetch_assoc()) {
			if($un == $row['username'] && $pw == $row['password']) {
					$_SESSION['username'] = $un;
				header('Location: '.BASE_URL.'/'); exit();
			}
		}
		  header('Location: '.BASE_URL.'/login');
			exit();*/
			$pageTitle = 'Login Process';
			$users = User::getUsers();
			//    $u = User::loadById(1);
			//  echo $u->username;
			$un = $_POST['username'];
			$pw = $_POST['password'];
			echo $un;
			echo $pw;
			echo count($users);
			foreach ($users as $user) {
				if ( $un == $user->username && $pw == $user->password) {
					$_SESSION['username'] = $un;
					header('Location: '.BASE_URL.'/'); exit();
				}
			}
			header('Location: '.BASE_URL.'/login'); exit();
	}

  public function home() {
		$pageTitle = 'Home';
		if (isset($_SESSION['username'])) {
			$user= User::loadByUn($_SESSION['username']);
			echo $user->permissions;
		}
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }
	public function admin() {
		if (isset($_SESSION['username'])) {
			$user= User::loadByUn($_SESSION['username']);
			echo $user->permissions;
		}
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}


	public function logoutProcess() {
		unset($_SESSION['username']); // not necessary, but just to be safe
		session_destroy();
		header('Location: '.BASE_URL); exit(); // send us to home page
	}

	public function signup() {
		$pageTitle = 'Sign Up';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function signupProcess($un, $pw, $fn, $ln, $em) {
		//connects to the database
/*		$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die("Connection Failed: " . $conn->connect_error);
		//adding to the table in the database
		$sql = sprintf("INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`, `email`) VALUES
		('%s', '%s', '%s', '%s', '%s');",
    $fn,
		$ln,
		$un,
		$pw,
		$em
    );
		//checks to see if it was successfully added to the database
		$conn->query($sql) or die('Error:'.$conn->error);*/
		if(empty($un) || empty($pw) || empty($fn) || empty($ln) || empty($em)) {
			header('Location: '.BASE_URL.'/signup'); exit();
		}
		$user = new User();
		$user->username = $un;
		$user->password = $pw;
		$user->firstname = $fn;
		$user->lastname = $ln;
		$user->email = $em;
		//$user->permissions = 0;
		//echo $user->id;
		$userID = $user->save();
		//echo $userID;
		//header('Location: '.BASE_URL.'/login'); exit();
	}

}
