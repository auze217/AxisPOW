
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.3.1.min.js"></script>

  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-script.js"></script>
  <!-- this is commented out because I think there is something wrong with bootstrap itself,
  if you go on the website we literally have the same sign=in and I went on chrome and microsoft edge
  and the website was broken
  <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet" id="bootstrap-css">
-->
</head>
 <body class="text-center">
   <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
     <p class="navbar-brand">PBC&copy</p>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>

     <div class="collapse navbar-collapse" id="navbarsExampleDefault">
       <ul class="navbar-nav mr-auto">
         <?php if(isset($_SESSION['username'])): ?>
         <li class="nav-item">
           <a class="nav-link" href="<?= BASE_URL ?>/dashboard">Home</a>
         </li>
       <?php else: ?>
         <li class="nav-item">
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
         <li class="nav-item active">
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






    <form method="POST" action="<?= BASE_URL?>/login/process" class="form-signin">
      <img class="mb-4" src="<?=BASE_URL?>/public/img/logo.jpg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputEmail" class="sr-only">Username</label>
      <input type="text" id="inputEmail" name="username" value="" class="form-control" placeholder="Username" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" name="password" value="" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <div class="checkbox mb-3">
        <label>
          <a href="<?=BASE_URL?>/signup" > Create an Account </a>
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
  </body>
  </html>
