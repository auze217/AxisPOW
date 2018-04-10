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
