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
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Prison Camps</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Login</a>
      </li>
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
    <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h2>Add a POW Camp</h2>
    <p class="lead">If you want to add a new camp enter its information here.</p>
  </div>

    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Enter Camp Name</h4>
      <form id="add" action="<?= BASE_URL ?>/member/add/process" method="POST" class="needs-validation" novalidate>
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
        <button class="btn btn-primary btn-lg btn-block" name="submit" type="submit">Add Camp</button>
      </form>
    </div>
  </div>

</div>
