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
                $gender = $_POST['gender'];
				$this->signupProcess($username, $password, $firstname, $lastname, $email, $gender);
				break;
			case 'logout':
				$this->logoutProcess();
				break;
			case 'dashboard':
				$this->dashboard();
				break;
			case 'admin':
				$this->admin();
				break;
			case 'deleteUser':
				$id = $_GET['id'];
				$this->deleteUser($id);
				break;
			case 'permission':
				$id = $_GET['id'];
				$this->permission($id);
				break;
      case 'checkUsername':
      	//$this->login();
      	$this->checkUsername();
        break;
			case 'profile':
				//$id = $_GET('id');
				$this->profile();
				break;
			case 'followerProfile':
				$id = $_GET['id'];
				$this->followerProfile($id);
				break;
			case 'followAdd':
				$id = $_GET['id'];
				$this->followAdd($id);
				break;
			case 'followDelete':
				$id = $_GET['id'];
				$this->followDelete($id);
				break;
			case 'userUpdate':
				$id = $_GET['id'];
				$this->userUpdate($id);
				break;
			case 'userUpdateProcess':
				$id = $_GET['id'];
				$this->userUpdateProcess($id);

		}

	}
	public function userUpdate($id) {
		$user = User::loadById($id);
		if ($_SESSION['username'] == $user->username) {
			$pageTitle = "Update $user->username";

			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/userUpdate.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		}
		else {
			header('Location: '.BASE_URL.'/dashboard'); exit;
		}
	}
	public function userUpdateProcess($id) {
		$user = User::loadById($id);
		$firstname = $_POST['first_name'];
		$lastname = $_POST['last_name'];
		$password = $_POST['password'];
		$email = $_POST['email'];
		$image = $_POST['image'];
        $gender = $_POST['gender'];
		if (!empty($firstname)) {
			$user->firstname = $firstname;
		}
		if (!empty($lastname)) {
			$user->lastname = $lastname;
		}
		if (!empty($username)) {
			$user->username = $username;
		}
		if (!empty($password)) {
			$user->password = $password;
		}
		if (!empty($email)) {
			$user->email = $email;
		}
		if (!empty($image)) {
			$user->image = $image;
		}
        if (!empty($gender)) {
            $user->gender = $gender;
        }
		$user->permissions = $user->permissions;
		$user->save();
		header('Location: '.BASE_URL.'/profile/'.$user->id); exit();
	}
	public function followAdd($id) {
		$follower_id = $_SESSION['username'];
		$follower = User::loadByUn($_SESSION['username']);
		$followee = User::loadById($id);

		$followeeID = $followee->id;

		$soldier = new Followers();
		$soldier->user_id = $follower->id;
		$soldier->follower_id = $followee->id;
		$soldier->username =$follower->username;
		$soldier->follower = $followee->username;
		$soldier->save();

		//$json = array(
		//	'success' => '
		//	'follow_id' => $fo->id
		// )

		header('Location: '.BASE_URL.'/profile/'.$follower->id); exit();
	}
	public function followDelete($id) {
		$user = User::loadByUn($_SESSION['username']);
		
		$follow = Followers::loadById($id, $user->id);
		$follow->delete();
		
		header('Location: '.BASE_URL.'/profile/'.$user->id); exit();
	}
	public function followerProfile($id) {
		$user = User::loadById($id);
		//echo $user->firstname;
		$pageTitle = $user->username;
		$uevents = UEvent::getUvents($user->id);
		$followers = Followers::getFollowers($user->id);
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/followp.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function profile() {
		$user = User::loadByUn($_SESSION['username']);
		//echo $user->firstname;
		$pageTitle = $user->username;
		$uevents = UEvent::getUvents($user->id);
		$followers = Followers::getFollowers($user->id);
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function deleteUser($id) {
		$pageTitle = 'deleteUser';
		$user = User::loadById($id);
		$user->delete();

		header('Location: '.BASE_URL.'/admin'); exit();

	}
	public function permission($id) {
		$user = User::loadById($id);
		$user->permissions = 1;
		$user->save();
		header('Location: '.BASE_URL.'/admin'); exit();
	}
	public function login() {
		$pageTitle = 'Login';

		//include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/sign_in.tpl';
		//include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function loginProcess($un, $pw) {

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
					header('Location: '.BASE_URL.'/dashboard'); exit();
				}
			}
			header('Location: '.BASE_URL.'/login'); exit();
	}
	public function dashboard() {
		$pageTitle = 'Home';
		$user= User::loadByUn($_SESSION['username']);
		$followers = Followers::getFollowers($user->id);
		//so you now have all of the people that the user follows, the name is backwards
		//now have to get the first couple events for every follower and put them into their own
		//little scrollable window. Or instead of every follower randomly get a few and put their
		//first couple events in a scrollable window.
		$uevents = UEvent::getUvents($user->id);
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/dashboard.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
  public function home() {
		$pageTitle = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }
	public function admin() {
		$pageTitle = 'Admin';
		if (isset($_SESSION['username'])) {
			$user= User::loadByUn($_SESSION['username']);
			echo $user->permissions;
		}
		$users = User::getUsers();
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/admin.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}


	public function logoutProcess() {
		unset($_SESSION['username']); // not necessary, but just to be safe
		session_destroy();
		header('Location: '.BASE_URL); exit(); // send us to home page
	}

	public function signup() {
		$pageTitle = 'Sign Up';
        if (isset($_SESSION['username'])) {
			$user= User::loadByUn($_SESSION['username']);
			//echo $user->permissions;
		}
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function signupProcess($un, $pw, $fn, $ln, $em, $ge) {
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
		if(empty($un) || empty($pw) || empty($fn) || empty($ln) || empty($em) || empty($ge)) {
			header('Location: '.BASE_URL.'/signup'); exit();
		}
		$users = User::getUsers();
		foreach($users as $u) {
			if ($u->username == $un) {
				echo '<script language="javascript">';
				echo 'alert("Username already exists.")';
				echo '</script>';
				header('Location: '.BASE_URL.'/signup'); exit();
			}
		}
		$user = new User();
		$user->username = $un;
		$user->password = $pw;
		$user->firstname = $fn;
		$user->lastname = $ln;
		$user->email = $em;
		$user->permissions = 0;
        $user->gender = $ge;
		//echo $user->id;
		$userID = $user->save();
        
        $userEvent = new UEvent();
        $userEvent->title = 'Made an account';
        $userEvent->details = 1;
        $userEvent->date_created = '2018-04-13';
        $userEvent->user_id = $user->id;
        $userEvent->insert();
        $userEvent->save();
        $userEvent->update();
		//echo $userID;
		header('Location: '.BASE_URL.'/login'); exit();
	}
    
    public function checkUsername() {

		$username = $_GET['username'];
       // echo $username;

        $json = array(
				'success' => 'success'
			);

        $users = User::getUsers();
		foreach($users as $u) {

			if ($u->username == $username) {
				$json = array(
				'success' => 'fail',
			    );
			}
		}

		header('Content-Type: application/json'); // let client know it's Ajax
		echo json_encode($json); // print the JSON

	}

}
