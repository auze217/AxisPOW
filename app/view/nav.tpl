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
        <a class="nav-link" href="<?= BASE_URL ?>/profile/<?= user->id ?>">Profile</a>
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
