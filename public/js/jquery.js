$(document).ready(function(){
  //trying to do what I did for Single in jquery for FamProfile
  $('#addEventButton').click(function(){

    $('#addEventForm').show();
    $('#eventTitle').focus();
    $('#eventTitle').val('');
    $('#eventDescription').val('');
  });

  $('#addParent').click(function(){

    $('#addParentForm').show();
    $('#parentName').focus();
    $('#parentName').val('');
    $('#dad').prop("checked", false);
    $('#mom').prop("checked", false);
  });

//addign new events
  $('#submitEventButton').click(function(){
      var title = $('#eventTitle').val();
      var full = $('<h3>' + title + '</h3>');

      //details
      var details = $('#eventDescription').val();
      var fullDetails = $('<p class="details">' + details + '</p>');

      $('#events').append(full).append(fullDetails);

      $('#addEventForm').hide();
  });


//adding parents to the parent box
  $('#submitParentButton').click(function(){
    var name = $('#parentName').val();
    var fullName = $('<h4>' + name + '</h4>');
    //$('#Father').append(fullName);
    if ($('#dad').prop("checked") == true) {
      $('#Father').append(fullName);
    }
    else if ($('#mom').prop("checked") == true) {
      $('#Mother').append(fullName);
    }
    $('#addParentForm').hide();

  });

  $('#campName').focus(function(){
    $('#campState').remove(); // clear any existing img
  });

  // event handler for editing event title
  $('#campName').blur(function(){
    var camp = $('#campName').val().toLowerCase(); // lowercase for string comparison
    if(camp.indexOf('camp') != -1) { // we found the string "camp"
      getCampState(camp);
    }
  });
  function getCampState(camp) {

    // request the battle picture data via JSONP
    $.ajax({
      url: "https://en.wikipedia.org/w/api.php",
      data: {
          format: "json",
          action: "parse",
          page: "List_of_World_War_II_prisoner-of-war_camps_in_the_United_States",
          prop:"text",
          section:0,
      },
      dataType: 'jsonp',

      success: function (data) {

      var markup = data.parse.text["*"];
  		var i = $('<div></div>').html(markup);

      var table = i.find('td');

      var found;

      for (cnt = 0; cnt < table.length; cnt++) {
        if (table[cnt].innerText.toLowerCase() === camp) {
          found = cnt;
        }
      }

        $('#state').val(table[found+1].innerText);


      }
  });

  }
  });
