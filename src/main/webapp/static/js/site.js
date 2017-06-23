(function () {
  "use strict";
  
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
  
  //index
  if ($('#resultsTable > tbody > tr').length == 0){
      $('#resultsTable > thead > th').css('display','none');
  };
  

})();