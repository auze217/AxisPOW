<!DOCTYPE html>
<head>
  <style>
svg {
  font: 10px sans-serif;
}

.y.axis path {
  display: none;
}

.y.axis line {
  stroke: #fff;
  stroke-opacity: .2;
  shape-rendering: crispEdges;
}

.y.axis .zero line {
  stroke: #000;
  stroke-opacity: 1;
}

.title {
  font: 300 78px Helvetica Neue;
  fill: #666;
}

.prisoners,
.age {
  text-anchor: middle;
}

.prisoners {
  fill: #fff;
}

rect {
  fill-opacity: .6;
  fill: #e377c2;
}

rect:first-child {
  fill: #1f77b4;
}

</style>
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
  <div>
           <form class="form-horizontal" action="<?= BASE_URL?>/camps/export/" method="post" name="upload_excel"
                     enctype="multipart/form-data">
                 <div class="form-group">
                           <div class="col-md-4 col-md-offset-4">
                               <input type="submit" name="Export" class="btn btn-success" value="export to excel"/>
                           </div>
                  </div>
           </form>
</div>
<p><strong> ABOUT THIS GRAPH</strong><br> This graph compares all of the
   prisoners in each prison camp and compares them all to see which camp
   had the most amount of prisoners.

  <h1> <strong> Graph of Number of Prisoners in Each Camp </strong> </h1>
<meta charset="utf-8">
<style>

.chart div {
  font: 10px sans-serif;
  background-color: steelblue;
  text-align: right;
  padding: 3px;
  margin: 1px;
  color: white;
}

</style>
<div class="chart"></div>
<script src="//d3js.org/d3.v3.min.js"></script>
<script>

var data = <?php echo json_encode($data) ?>;
var names = <?php echo json_encode($names) ?>;
var inc = -1;
var x = d3.scale.linear()
    .domain([0, d3.max(data)])
    .range([0, 420]);

d3.select(".chart")
  .selectAll("div")
    .data(data)
  .enter().append("div")
    .text('balls')
    .style("width", function(d) { return x(d) + "px"; })
    .text(function(d) {
      inc++;

      return names[inc] + ', ' + d; });
</script>
<p style="margin-left: 10%;"><strong> Number of Prisoners </strong></p>
<?php if(isset($_SESSION['username'])): ?>
<button id="addEventButton" class="btn btn-sm btn-outline-secondary"> Add Camp   </button>

<?php endif; ?>
<form id="addEventForm" action="<?= BASE_URL ?>/camps/graph/add/" method="POST" class="needs-validation" style="display:none;" novalidate>
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
<?php if(isset($_SESSION['username'])): ?>
<button id="removeEventButton" class="btn btn-sm btn-outline-secondary"> Remove Camp </button>

<?php endif; ?>
<form id="removeEventForm" action="<?= BASE_URL ?>/camps/graph/remove/" method="POST" class="needs-validation" style="display:none;" novalidate>
  <div class="row">
    <div class="col-md-6 mb-3">
      <label for="campName">Camp name</label>
      <input type="text" name="removeCampName" class="form-control" id="removeCampName" placeholder="" value="" required>
      <div class="invalid-feedback">
        Valid camp name is required.
      </div>
    </div>
  </div>
  <button class="btn btn-primary btn-lg btn-block" name="submit" type="submit">Remove Camp</button>
  </form>
  <!--U for CRUD Update -->
  <?php if(isset($_SESSION['username'])): ?>
  <button id="updateEventButton" class="btn btn-sm btn-outline-secondary"> Update Camp </button>

  <?php endif; ?>
  <form id="updateEventForm" action="<?= BASE_URL ?>/camps/graph/update/" method="POST" class="needs-validation" style="display:none;" novalidate>
    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="campName">Camp name</label>
        <input type="text" name="updateCampName" class="form-control" id="updateCampName" placeholder="" value="" required>
        <div class="invalid-feedback">
          Valid camp name is required.
        </div>
      </div>
      <div class="col-md-6 mb-3">
        <label for="campNumber">Number of Prisoners</label>
        <input type="number" name="updateCampPrisoners" class="form-control" id="updateCampPrisoners" placeholder="" value="" required>
        <div class="invalid-feedback">
          Valid number of prisoners is required.
        </div>
      </div>
    </div>
    <button class="btn btn-primary btn-lg btn-block" name="submit" type="submit">Update Camp</button>
    </form>
