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







<div class="container">
  <div class="py-5 text-center">
    <img class="d-block mx-auto mb-4" src="<?= BASE_URL?>/public/img/logo.jpg" alt="" width="72" height="72">
    <h2>Update a POW Camp</h2>
    <p class="lead">If you want to update a camp enter its information here.</p>
  </div>
  <?php $row = $result->fetch_assoc() ?>
    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Enter Camp Information</h4>
      <form id="add" action="<?= BASE_URL ?>/camps/update/process/<?= $row['id']?>" method="POST" class="needs-validation" novalidate>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="campName">Camp name</label>
            <input type="text" name="camp_name" class="form-control" id="campName" placeholder="" value="" required>
            <div class="invalid-feedback">
              Valid camp name is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="state">State</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" name="state" id="state" placeholder="State" required>
            <div class="invalid-feedback" style="width: 100%;">
              The state is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="prisoners">Prisoners</label>
          <input type="number" class="form-control" name="prisoners" id="prisoners" placeholder="0">
        </div>

        <div class="mb-3">
          <label for="image">Camp Image</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" name="image" id="image" placeholder="">
          </div>
        </div>

        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" name="submit" type="submit">Update Camp</button>
      </form>
    </div>
  </div>

</div>
