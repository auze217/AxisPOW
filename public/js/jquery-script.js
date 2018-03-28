$(document).ready(function(){

    $('#help').click(function(){
      alert('clicked help');
    })

    $('#logout').click(function(){
      if (confirm('are you sure you want to logout?')) {
        window.location.href = base_url + "/logout";
      }
    })
  $('#editProfileButton').click(function(){
    $('#editBio').show();

  })


    $('#submitBioButton').click(function(){


      //$('#editBio').hide();

    })

//the tabs on the right side of the profile page
  $('#ParentsButton').click(function(){
    $(this).prop("disabled",true);
    $('#PartnersButton').prop("disabled", false);
    $('#ChildrenButton').prop("disabled", false);
    $('#SiblingsButton').prop("disabled", false);

    $('#Parents').show();
    $('#Partners').hide();
    $('#Siblings').hide();
    $('#Children').hide();

  })
  $('#PartnersButton').click(function(){
    $(this).prop("disabled",true);
    $('#ParentsButton').prop("disabled", false);
    $('#ChildrenButton').prop("disabled", false);
    $('#SiblingsButton').prop("disabled", false);

    $('#Partners').show();

    $('#Parents').hide();
    $('#Siblings').hide();
    $('#Children').hide();
  })
  $('#SiblingsButton').click(function(){
    $(this).prop("disabled",true);
    $('#PartnersButton').prop("disabled", false);
    $('#PartnersButton').prop("disabled", false);
    $('#ChildrenButton').prop("disabled", false);

    $('#Siblings').show();

    $('#Parents').hide();
    $('#Partners').hide();
    $('#Children').hide();
  })
  $('#ChildrenButton').click(function(){
    $(this).prop("disabled",true);
    $('#PartnersButton').prop("disabled", false);
    $('#ParentsButton').prop("disabled", false);
    $('#SiblingsButton').prop("disabled", false);

    $('#Children').show();

    $('#Parents').hide();
    $('#Partners').hide();
    $('#Siblings').hide();
  })

  //the add buttons on right side of the profile page
  $('#addParentButton').click(function() {
    $('#addMember').show();
    $('#addParentButton').hide();
  })

  $('#addPartnerButton').click(function() {
    $('#addMember').show();
    $('#addPartnerButton').hide();
  })

  $('#addSiblingButton').click(function() {
    $('#addMember').show();
    $('#addSiblingButton').hide();
  })

  $('#addChildrenButton').click(function() {
      $('#addMember').show();
      $('#addChildrenButton').hide();

    })

  $('#AddGeneral').click(function() {
    if($("input[name='new?']:checked").val() === 'new') {
      window.location.href = "AddMember.html";
    }

    if($("input[name='new?']:checked").val() === 'exist') {
      $('#AddExisting').show();
      $('#AddNew').hide();
    }
  })

  $('#addExistingMember').click(function() {
    var tabName = 'Children';
    if ( $('#Children').is(':visible') ) {
      tabName = 'Children'
    }
    if ( $('#Parents').is(':visible') ) {
      tabName = 'Parent'
    }
    if ( $('#Partners').is(':visible') ) {
      tabName = 'Partner'
    }
    if ( $('#Siblings').is(':visible') ) {
      tabName = 'Sibling'
    }

    if ($('#newName').val().length > 0 && $('#url').val().length > 0) {
      $("#" + tabName + "s li:last").prev().after('<li><a href="' + $('#url').val() + '">' + $('#newName').val() + '</a></li>');
      $('#addMember').hide();
      $('#add' + tabName + 'Button').show();
      $('#newName').val('');
      $('#url').val('');
    }
  })


//adding parables
  $('#AddParable').click(function() {
    $('#addParableForm').show();
    $(this).hide();

  })

  $('#submitParableButton').click(function() {

        if ($('#parableTitle').val().length > 0 && $('#parableDescription').val().length > 0) {
          $('#bottom h6:first').prev().after('<h6>' + $('#parableTitle').val() +
          '</h6>' + '<p class="details">' + $('#parableDescription').val() + '</p>')
          $('#addParableForm').hide();
          $('#AddParable').show();
          $('#parableTitle').val('');
          $('#parableDescription').val('');
        }
  })


//Select Trees scripts
  $('#NewMythology').click(function() {
    $('#myModal').show();

  })

  $('#NewMythology').mouseover(function() {
    $('#NewMythology').css('color', 'black');
  })

  $('#NewMythology').mouseout(function() {
    $('#NewMythology').css('color', 'white');
  })


  $('#close').click(function() {
    $('#myModal').hide();
  })

  $('#submitMythology').click(function() {
    $('#myModal').hide();
    $("#Mythologies li:last").prev().after('<li><a href="#">' + $('#MythologyTitle').val() + '</a></li>');
  })

  //database scripts
  $('#AddDatabaseMember').click(function() {

    window.location.href = base_url + '/member/add/';

  })

  //Home page
  $('#login').click(function() {
    window.location.href = base_url;

  })

  $('#log').click(function() {
    $('#myModal').show();
  })

  $('#signup').click(function() {
    $('#myModal').show();
  })

  $('#submitLogin').click(function() {
      window.location.href = base_url + "/login";
  })

});
