
<link href="<?= BASE_URL ?>/public/css/stuff.css" rel="stylesheet">
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
        <?php if(isset($_SESSION['username'])): ?>
        <li class="nav-item">
          <a class="nav-link" href="<?= BASE_URL ?>/profile/<?= $user->id ?>">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<?= BASE_URL ?>/logout">(<?=$_SESSION['username']?>)Logout</a>
        </li>
        <?php else: ?>
        <li class="nav-item">
          <a class="nav-link" href="<?= BASE_URL ?>/login">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<?= BASE_URL ?>/login">Login</a>
        </li>
        <?php endif; ?>
        <?php if(isset($_SESSION['username']) && $user->permissions == 1): ?>
        <li class="nav-item">
          <a class="nav-link" href="<?= BASE_URL ?>/admin">Admin</a>
        </li>
      <?php endif; ?>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>


<div id="left">

  <h1><?= $user->firstname ?> <?= $user->lastname ?></h1>
  <div>
    <img class="mr-3" src="<?= BASE_URL ?>/public/img/<?= $user->image ?>" alt="Portrait of <?= $user->firstname ?> <?= $user->lastname ?>" width="250" >
  </div>
<?php
if(isset($_SESSION['username'])):
?>

  <?php

  $followee = User::loadByUn($_SESSION['username']);
  $followeeID = $followee->id;
  if(!Followers::isFollower($user->id, $followeeID)): ?>

<a class="btn btn-primary" href="<?= BASE_URL ?>/follow/add/<?= $user->id ?>">Follow</a>

<?php else: ?>
<a class="btn btn-primary" href="<?= BASE_URL ?>/follow/delete/<?=$user->id ?>">Unfollow</a>
<?php endif; ?>
<?php endif; ?>
<div width="50%">
<h5 class="border-bottom border-gray pb-2 mb-0"><strong> Recent updates</strong></h5>
</div>
<?php foreach($uevents as $uevent): ?>
  <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray"
  ><a href="<?= BASE_URL ?>/camps/view/<?= $uevent->details ?>"> <?= $uevent->title ?> </a>
  </p>
<?php endforeach; ?>

</div>

<div id="right">
  <div class="album py-5 bg-light">
    <div id="userinfo" class="container">

      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 box-shadow">

            <div class="card-body">
              <p class="card-text"><strong> Username:</strong> <?= $user->username ?> </p>
              <p class="card-text"><strong> Email:</strong> <?= $user->email ?></p>
                <p class="card-text"><strong> Gender:</strong> <?= $user->gender ?></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  <?php foreach($followers as $follower): ?>
  <div class="media text-muted pt-3">
    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" style="width: 32px; height: 32px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16293582143%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16293582143%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.546875%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
    <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
      <a href="<?= BASE_URL ?>/follower/profile/<?= $follower->id ?>"<strong class="d-block text-gray-dark"><?= $follower->firstname ?> <?= $follower->lastname ?></strong></a>

    </p>
  </div>
  <?php endforeach; ?>
</div>
