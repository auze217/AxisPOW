var salesData= {
  {Year:'2000', Qty:1000},
  {Year:'2001', Qty:2000},
  {Year:'2002', Qty:3000},
  {Year:'2003', Qty:4000},
  {Year:'2004', Qty:5000},
  {Year:'2005', Qty:6000},
  {Year:'2006', Qty:7000}

};
var svg-d3.select("#svg");

var padding = {top:20,right:30,bottom:30,left:50};

var chartArea={
  "width":parseInt(svg.style("width"))-padding.left-padding.right,
  "height":parseInt(svg.style("height"))-padding.top-padding.bottom
};

var yScale = d3.scaleLinear()
    .domain([0,d3.max(salesData, function(d,i) {return d.Qty})])
    .range([chartArea.height,0]).nice();

var xScale = d3.scaleBand()
    .domain(salesData.map(function(d){return d.Year}))
    .range([0,chartArea.width])
    .padding(.2);

var xAxis=svg.append("g")
  .classed("xAxis",true)
  .attr(
    'transform','translate('+padding.left+','+()
  )
