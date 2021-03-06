
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.1/examples/album/album.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <p class="navbar-brand">PBC&copy;</p>
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
          <li class="nav-item active">
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
      </div>
    </nav>

    <!--BreadCrumbs-->
      <?php if(!isset($_SESSION['username'])): ?>
      <p id="breadcrumbs" class="clear"><a href="<?= BASE_URL ?>/">Home</a> &gt;
      <?php else: ?>
      <p id="breadcrumbs" class="clear"><a href="<?= BASE_URL ?>/dashboard">Home</a> &gt;
      <?php endif; ?>
      <a href="<?= BASE_URL ?>/camps">Prison Camps</a> &gt;
      <a href="<?= BASE_URL ?>/camps/view/<?= $r['id'] ?>"><?= $r['name'] ?></a>
      </p>

    <!--end of breadcrumbs -->




    <main>
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
      <?php if(isset($_SESSION['username']) && $user->permissions == 1): ?>
        <a href="<?=BASE_URL?>/camps/delete/process/<?= $r['id']?>" class="btn btn-sm btn-outline-secondary" style="margin-right: 50px;"> Delete Camp Entry </a>
      <?php endif; ?>
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
        <div class="mb-3">
          <label for="image">Image</label>
           <textarea class="form-control" name="image" id="eventImage" placeholder="Image"></textarea>
          <!--<input type="text" class="form-control" name="email" id="email" placeholder="you@example.com" required> -->
        </div>
        <div class="mb-3">
          <label for="url">Link</label>
           <textarea class="form-control" name="link" id="eventLink" placeholder="Link to more extra information"></textarea>
          <!--<input type="text" class="form-control" name="email" id="email" placeholder="you@example.com" required> -->
        </div>
        <input id="submitEventButton" type="button" name="submit" value="Add" class="btn btn-sm btn-outline-secondary"/>
          <p id="pageId" style="display: none">
            <?= $r['id'] ?></p>
      </form>
      <?php while($levents = $life->fetch_assoc()): ?>
      <div class="album py-5 bg-light">
        <div class="container">

          <div class="row">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">

                <div class="card-body">
                  <p class="card-text"><strong> <?= $levents['title'] ?></strong> </p>
                  <img src="<?= $levents['image'] ?>" alt="Image of <?= $levents['image'] ?>" width="250">

                  <p class="card-text"><?= $levents['details'] ?></p>
                  <a href="<?= $levents['url'] ?>" class="btn btn-sm btn-outline-secondary"> More Information </a>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <?php if(isset($_SESSION['username']) && $user->permissions == 1): ?>
                      <a href="<?=BASE_URL?>/camps/view/life_event/delete/process/<?= $levents['id'] ?>" class="btn btn-sm btn-outline-secondary"> Delete </a>
                    <?php endif; ?>
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
