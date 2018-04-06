<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="<?= BASE_URL ?>/public/img/logo.jpg">

  <!-- Bootstrap core CSS -->
  <link href="<?= BASE_URL ?>/public/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
<!--  <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet"> -->
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery.js"></script>

<link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">
  <a class="btn btn-sm btn-outline-secondary" style="float: right;" href="<?=BASE_URL?>/camps/update/<?=$r['id']?>"> Edit Camp Info</a>






<div class="container">
  <div class="py-5 text-center">
    <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h2>Add a POW Camp</h2>
    <p class="lead">If you want to add a new camp enter its information here.</p>
  </div>

    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Enter Camp Name</h4>
      <form id="add" action="<?= BASE_URL ?>/camps/add/process" method="POST" class="needs-validation" novalidate>
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

<footer class="container py-5">
<!-- we can put our own footer in here -->
</footer>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>
