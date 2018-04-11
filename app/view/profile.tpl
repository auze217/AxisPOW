<div id="left">

  <h1>Profile for <?= $user->username ?></h1>

<?php
if(isset($_SESSION['username'])):
?>

  <?php

  $followee = User::loadByUn($_GET['username']);
  $followeeID = $followee->id;
  if(!Follow::isFollower($_SESSION['user_id'], $followeeID)):
  ?>

<form method="POST" action="<?= BASE_URL ?>/user/view/<?= $_GET['username'] ?>/follow/process/">
  <button type="submit" id="btnFollow" name="btnFollow">Follow</button>
</form>

<?php else: ?>
<form method="POST" action="<?= BASE_URL ?>/user/view/<?= $_GET['username'] ?>/unfollow/process/">
  <button type="submit" id="btnUnfollow" name="btnUnfollow">Unfollow</button>
</form>
<?php endif; ?>
<?php endif; ?>

  <p>Email: <a href="<?= $user->email ?>"><?= $user->email ?></a></p>

</div>

<div id="right">

</div>
