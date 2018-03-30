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

});
