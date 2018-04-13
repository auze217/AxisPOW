
    <!-- Custom styles for this template -->
    <link href="album.css" rel="stylesheet">
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
          <?php if(isset($_SESSION['username'])): ?>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/profile/<? = $user->id ?>">Profile</a>
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






    <main role="main">
  <!--    <?php $row=$result->fetch_assoc() ?> -->
      <section class="jumbotron text-center" style="background-image: url('<?= BASE_URL ?>/public/img/<?= $r['image']?>');">
        <div class="container">
          <h1 class="jumbotron-heading text-white"><?= $r['name'] ?></h1>
          <p class="text-white">State: <?=$r['state']?></p>
          <p class="text-white">
            Prisoners: <?= $r['prisoners'] ?>
          </p>
        </div>
      </section>
      <button id="addEventButton" class="btn btn-sm btn-outline-secondary"> Add Life Event </button>
        <a href="<?=BASE_URL?>/camps/delete/process/<?= $r['id']?>" class="btn btn-sm btn-outline-secondary" style="margin-right: 50px;"> Delete Camp Entry </a>
      <a class="btn btn-sm btn-outline-secondary" style="float: right;" href="<?=BASE_URL?>/camps/update/<?=$r['id']?>"> Edit Camp Info</a>
      <form id="addEventForm" style="display:none;">
        <div class="mb-3">
          <label for="title">Title</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" name="title" id="eventTitle" placeholder="Title" required>
            <div class="invalid-feedback" style="width: 100%;">
              A title is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="details">Details</label>
           <textarea class="form-control" name="details" id="eventDescription" placeholder="Details" required></textarea>
          <!--<input type="text" class="form-control" name="email" id="email" placeholder="you@example.com" required> -->
          <div class="invalid-feedback">
            Please enter a description.
          </div>
        </div>
        <input id="submitEventButton" type="button" name="submit" value="Add" class="btn btn-sm btn-outline-secondary"/>
          <p id="pageId" style="display: none" type="hidden">
            <?= $r['id'] ?></p>
      </form>
      <?php while($levents = $life->fetch_assoc()): ?>
      <div class="album py-5 bg-light">
        <div id="events" class="container">

          <div class="row">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">

                <div class="card-body">
                  <p class="card-text"><strong> <?= $levents['title'] ?></strong> </p>
                  <p class="card-text"><?= $levents['details'] ?></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button><!--could be where we found the information -->
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button><!--edit the life event -->
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    <?php endwhile; ?>

    </main>
