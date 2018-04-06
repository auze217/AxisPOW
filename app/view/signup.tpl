<!--<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Sign Up</title>

-->  <!-- Bootstrap core CSS -->
<!--    <link href="../../../../dist/css/bootstrap.min.css" rel="stylesheet">

-->    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>

  <body class="bg-light">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">Guide</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <?php if(isset($_SESSION['username'])): ?>
          <li class="nav-item active">
            <a class="nav-link" href="<?= BASE_URL ?>/dashboard">Home</a>
          </li>
        <?php else: ?>
          <li class="nav-item active">
            <a class="nav-link" href="<?= BASE_URL ?>/">Home</a>
          </li>
        <?php endif; ?>
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
            <a class="nav-link" href="<?= BASE_URL ?>/login">Login</a>
          </li>
          <?php endif; ?>
          <?php if(isset($_SESSION['username']) && $user->permissions == 1): ?>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/admin">Admin</a>
          </li>
        <?php endif; ?>

          <!--need to have an admin page for if the logged in user is an admin -->
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






    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="<?= BASE_URL ?>/public/img/logo.jpg" alt="" width="72" height="72">
        <h2>Signup Form</h2>
        <p class="lead">If you want to sign up and edit the following pages on this site, enter your information here to get an account</p>
      </div>

        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Enter Name</h4>
          <form id="signUp" action="<?= BASE_URL ?>/signup/process" method="POST" class="needs-validation" novalidate>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First name</label>
                <input type="text" name="first_name" class="form-control" id="firstName" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last name</label>
                <input type="text" name="last_name" class="form-control" id="lastName" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="username">Username</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="text" class="form-control" name="username" id="username" placeholder="Username" required>
                <div class="invalid-feedback" style="width: 100%;">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Email</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
              <div class="invalid-feedback">
                Please enter a valid email address.
              </div>
            </div>

            <div class="mb-3">
              <label for="password">Password</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                <div class="invalid-feedback" style="width: 100%;">
                  Your password is required.
                </div>
              </div>
            </div>

            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" name="submit" type="submit">Sign Up</button>
          </form>
        </div>
      </div>

    </div>
