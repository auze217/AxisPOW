<!--<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">


-->    <!-- Bootstrap core CSS -->
<!--    <link href="../../../../dist/css/bootstrap.min.css" rel="stylesheet">
-->    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/product/product.css" rel="stylesheet">
  </head>

  <body>
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


    <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center text-white bg-light" style="background: url('<?=BASE_URL?>/public/img/background.jpg')">
      <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 font-weight-normal">Prisoner of War Camps in America</h1>
        <p class="lead font-weight-normal">Click on any of the prisoner of war camps to get more information on them.</p>
        <!-- might not need this probably get rid of it -->
        <a class="btn btn-primary" href="<?= BASE_URL ?>/camps/add">Add a Prison Camp</a>
      </div>
    </div>
    <?php while ($row = $result->fetch_assoc()): ?>
      <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
        <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
          <div class="my-3 py-3">
            <h2 class="display-5"><a href="<?=BASE_URL?>/camps/view/<?= $row['id'] ?>"><?= $row['name']?></a></h2>
            <p class="lead"><?= $row['state'] ?></p>
            <a href="<?=BASE_URL?>/camps/delete/process/<?= $row['id']?>" class="btn btn-sm btn-outline-secondary"> Delete Camp Entry </a>
          </div>
          <div class="bg-light box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
          <img style="height:100%" style="width:100%" src="<?= BASE_URL ?>/public/img/<?= $row['image'] ?>" class="img-rounded" alt="Image of <?= $row['name'] ?>"></div>
        </div>
      </div>
    <?php endwhile; ?>
