
<style>

.bar {
  fill: steelblue;

}
.bar:hover {
  fill: #497;
}

.axis text {
  font: 10px sans-serif;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {
  display: none;
}

</style>
<body>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <p class="navbar-brand">PBC&copy;</p>
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
    <a href="<?= BASE_URL ?>/camps/graph">Graph</a>
    </p>

  <!--end of breadcrumbs -->

  <div>

</div>
<p><strong> ABOUT THIS GRAPH</strong><br> This graph compares all of the
   prisoners in each prison camp and compares them all to see which camp
   had the most amount of prisoners.

  <h1> <strong> Graph of Number of Prisoners in Each Camp </strong> </h1>
<svg class="chart"></svg>
<script src="//d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script>

var margin = {top: 20, right: 30, bottom: 30, left: 40},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .05  );

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var chart = d3.select(".chart")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv("<?=BASE_URL ?>/public/data.csv", type, function(error, data) {
  x.domain(data.map(function(d) {
    //var split = d.name.split(" ");
    //d.name = "";
    //for(i = 1; i < split.length; i++) {
    //    d.name += split[i] + " ";
    //}
    return d.name; }));
  y.domain([0, d3.max(data, function(d) { return d.value; })]);

  chart.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  chart.append("g")
      .attr("class", "y axis")
      .call(yAxis);

  chart.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) {
        return x(d.name); })
      .attr("y", function(d) { return y(d.value); })
      .attr("height", function(d) { return height - y(d.value); })
      .attr("width", x.rangeBand())
      .on("click", function(d){location.replace("<?=BASE_URL ?>/camps/view/" + d.id);});

});

function type(d) {
  d.value = +d.value; // coerce to number
  d.id    = +d.id;
  return d;
}

</script>
<form class="form-horizontal" action="<?= BASE_URL?>/camps/export/" method="post" name="upload_excel"
          enctype="multipart/form-data">
      <div class="form-group">
                <div class="col-md-4 col-md-offset-4">
                    <input type="submit" name="Export" class="btn btn-success" value="export to excel"/>
                </div>
       </div>
</form>

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
