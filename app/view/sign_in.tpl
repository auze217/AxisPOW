<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="<?= BASE_URL ?>/public/img/logo.jpg">

  <title>Sign In</title>

  <!-- Bootstrap core CSS -->
  <link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.3.1.min.js"></script>

  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-script.js"></script>

 <body class="text-center">
   <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
     <a class="navbar-brand" href="#">Guide</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>

     <div class="collapse navbar-collapse" id="navbarsExampleDefault">
       <ul class="navbar-nav mr-auto">
         <li class="nav-item active">
           <a class="nav-link" href="<?= BASE_URL ?>/">Home</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="<?= BASE_URL ?>/camps">Prison Camps</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="#">Profile</a>
         </li>
         <?php if(isset($_SESSION['username'])): ?>
         <li class="nav-item">
           <a class="nav-link" href="<?= BASE_URL ?>/logout">(<?=$_SESSION['username']?>)Logout</a>
         </li>
         <?php else: ?>
         <li class="nav-item">
           <a class="nav-link" href="<?= BASE_URL ?>/login">Login<span class="sr-only">(current)</span></a>
         </li>
         <?php endif; ?>
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
           <div class="dropdown-menu" aria-labelledby="dropdown01">
             <a class="dropdown-item" href="#">Action</a>
             <a class="dropdown-item" href="#">Another action</a>
             <a class="dropdown-item" href="#">Something else here</a>
           </div>
         </li>
       </ul>
       <form class="form-inline my-2 my-lg-0">
         <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
       </form>
     </div>
   </nav>



    <form method="POST" action="<?= BASE_URL?>/login/process" class="form-signin">
      <img class="mb-4" src="<?=BASE_URL?>/public/img/logo.jpg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputEmail" class="sr-only">Username</label>
      <input type="text" id="inputEmail" name="username" value="" class="form-control" placeholder="Username" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" name="password" value="" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <div class="checkbox mb-3">
        <label>
          <a href="<?=BASE_URL?>/signup" > Create an Account </a>
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
  </body>
  </html>
