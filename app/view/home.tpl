    <link href="https://getbootstrap.com/docs/4.0/examples/jumbotron/jumbotron.css" rel="stylesheet">
  </head>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <p class="navbar-brand">PBC&copy</p>
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
          <a class="nav-link" href="<?= BASE_URL ?>/login">Profile</a>
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
      </ul>
    </div>
  </nav>

<!--BreadCrumbs-->
  <?php if(!isset($_SESSION['username'])): ?>
  <p id="breadcrumbs" class="clear"><a href="<?= BASE_URL ?>/">Home</a> &gt;
  <?php else: ?>
  <p id="breadcrumbs" class="clear"><a href="<?= BASE_URL ?>/dashboard">Home</a> &gt;
  <?php endif; ?>
  </p>

<!--end of breadcrumbs -->




    <main>

      <!-- Main jumbotron for a   primary marketing message or call to action -->
      <div class="jumbotron">
        <div class="container">
          <h1 class="display-3">AXIS Prisoners of War</h1>
          <p>On this website you will learn about AXIS(Nazis and Italians) prisoners of war and what the camps they stayed in were like.</p>
          <!-- this will eventually lead to our webpage that will show all of the prison camps -->
          <p><a class="btn btn-primary btn-lg" href="<?= BASE_URL ?>/camps" role="button">Learn more &raquo;</a></p>
        </div>
      </div>
<!-- for this we dont really need but we could possibly put the most well known prison camps here with links to them -->
      <div class="container">
        <!-- Example row of columns -->
        <div class="row">
          <div class="album py-5 bg-light">
            <div id="events" class="container">

              <div class="row">
                <?php if($one): ?>
                <div class="col-md-4">
                  <div class="card mb-4 box-shadow">

                    <div class="card-body">
                      <a href="<?= BASE_URL ?>/camps/view/<?= $one->id ?>"class="card-text"><strong> <?= $one->name ?></strong> </a>
                      <img src="<?= BASE_URL ?>/public/img/<?= $one->image ?>" alt="Image of <?= $one->name ?>" width="250 px" height="150 px">

                      <p class="card-text"><?= $one->state ?></p>
                      <p  class="btn btn-sm btn-outline-secondary"> Prisoners: <?= $one->prisoners ?> </p>
                    </div>
                  </div>
                </div>
              <?php endif; ?>

                  <?php if($two): ?>
                  <div class="col-md-4">
                    <div class="card mb-4 box-shadow">

                      <div class="card-body">
                        <a href="<?= BASE_URL ?>/camps/view/<?= $two->id ?>"class="card-text"><strong> <?= $two->name ?></strong> </a>
                        <img src="<?= BASE_URL ?>/public/img/<?= $two->image ?>" alt="Image of <?= $two->name ?>" width="250 px" height="150 px">

                        <p class="card-text"><?= $two->state ?></p>
                        <p  class="btn btn-sm btn-outline-secondary"> Prisoners: <?= $two->prisoners ?> </p>
                      </div>
                    </div>
                  </div>
                <?php endif; ?>


                <?php if($three): ?>
                <div class="col-md-4">
                  <div class="card mb-4 box-shadow">

                    <div class="card-body">
                      <a href="<?= BASE_URL ?>/camps/view/<?= $three->id ?>"class="card-text"><strong> <?= $three->name ?></strong> </a>
                      <img src="<?= BASE_URL ?>/public/img/<?= $three->image ?>" alt="Image of <?= $three->name ?>" width="250 px" height="150 px">

                      <p class="card-text"><?= $three->state ?></p>
                      <p  class="btn btn-sm btn-outline-secondary"> Prisoners: <?= $three->prisoners ?> </p>
                    </div>
                  </div>
                </div>
              <?php endif; ?>




              </div>


            </div>
          </div>
        </div>

        <hr>

      </div> <!-- /container -->

    </main>
