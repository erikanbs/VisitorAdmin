(function () {
	$(document).ready(function(){
		
        var date_input=$('input[name="dateVisit"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'yyyy/mm/dd',
            container: container,
            todayHighlight: true,
            autoclose: true,
        });
        $('.clockpicker').clockpicker({
            autoclose: true
        });        

        $("#mobile").mask("(99) 9999-9999");

        $("#mobile").on("blur", function() {
            var last = $(this).val().substr( $(this).val().indexOf("-") + 1 );

            if( last.length == 3 ) {
                var move = $(this).val().substr( $(this).val().indexOf("-") - 1, 1 );
                var lastfour = move + last;
                var first = $(this).val().substr( 0, 9 );

                $(this).val( first + '-' + lastfour );
            }
        });
    });

})();