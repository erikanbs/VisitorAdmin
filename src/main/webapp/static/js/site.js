(function () {
  "use strict";
  
  $(document).ready(function(){

	  var $table = $('#resultsTable');
	  var $msg = $('#no-data');
	  if ( $('input[name="visitorsCount"]').val() == 0) {
	      $('#resultsTable > thead > th').css('display','none');
	      $table.hide();
		  $msg.show();
	  } else {
		  $table.show();
		  $msg.hide();
	  };
  });
  
  var $pickButton = $("#pickButton");

  $("#reasonDropdown li a").on("click", function () {
    var reason = $(this).text();
    $pickButton.text(reason);
  });
  
  var $sentDialog = $("#sentDialog");

  $("#visitorForm").on("submit", function () {
    $sentDialog.modal('show');
    return false;
  });

  var $sentAlert = $("#sentAlert");

  $sentDialog.on("hidden.bs.modal", function () {
    return true;
  });

})();