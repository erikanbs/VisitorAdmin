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
	  
	  //search function
	  $("#indexPage").submit(function (event) {
		  
	        //stop submit the form, we will post it manually.
	        event.preventDefault();

	        fire_ajax_submit();

	    });
	  
	  function fire_ajax_submit() {
		  
		  var search = {
				  visitorName : $("#visitorName").val(),
		    		hostName :  $("#hostName").val()
		    	}

		  $.ajax({
		        type: "POST",
		        contentType: "application/json",
		        url: "/visit/search",
		        data: JSON.stringify(search),
		        dataType: 'json',
		        cache: false,
		        timeout: 600000,
		        success: function (data) {

		        	// This is to print the json without parsing
		           // var json = "<h4>Ajax Response</h4><pre>" + JSON.stringify(data, null, 4) + "</pre>";
		           // $('#feedback').html(json);
		        	//
		        	var tbl_body = "";
		            var odd_even = false;
		            var response = data.result;
		            
		            if (response.length != 0 ) {
		            	var tbl_head = "<tr><th>Visitor</th><th>Company</th><th>Host</th><th>Time</th><th>Purpose</th></tr>";
		            	$("#tableResults thead").html(tbl_head);
		            }
		            
		            for (var i = 0; i < response.length; i++) {
		                var tbl_row = "";
		                tbl_row += "<td>"+response[i].visitorName+"</td>";
		                tbl_row += "<td>"+response[i].companyName+"</td>";
		                tbl_row += "<td>"+response[i].hostName+"</td>";
		                tbl_row += "<td>"+response[i].timeVisit+"</td>";
		                tbl_row += "<td>"+response[i].purpose+"</td>";
		                tbl_body += "<tr class=\""+( odd_even ? "odd" : "even")+"\">"+tbl_row+"</tr>";
		                odd_even = !odd_even;
		            }
		            $("#tableResults tbody").html(tbl_body);
		            console.log("SUCCESS : ", data);
		            $("#btn-search").prop("disabled", false);

		        },
		        error: function (e) {

		            var json = "<h4>Ajax Response</h4><pre>"
		                + e.responseText + "</pre>";
		            $('#feedback').html(json);

		            console.log("ERROR : ", e);
		            $("#btn-search").prop("disabled", false);

		        }
		    });
	  }
	  
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