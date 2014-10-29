// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//=  #require turbolinks
//= require_tree ./summernote
//= require_tree ./timepicker
//= require_tree ./app
//= require_self

$( document ).ready(function() {

	$('#myBtn').on('click', function() { $('#myForm').submit(); });
	$('#adaptationsButton').on('click', function() { $('#adaptationsForm').submit(); });

	$('[data-toggle="tooltip"]').tooltip({
		tooltipClass:"ui-tooltip1",
		position: {
		    my: "center bottom-0",
		    at: "center top"
		}
	});

	$('form#myTreatmentsForm').trigger('submit.rails'); 
	$('form#myTreatmentsForm').submit(function() { 
		//window.scrollTo(0,0);
		$('#customFlash').show().delay(2000).fadeOut('slow', function() { 
            $("#customFlash").hide()
        }); 
	});
	$('#closeFlash').on('click', function() { $("#customFlash").hide() });

	$('.treatmentCheckbox').on('click', function() { $('#myTreatmentsForm').submit(); });
	$('#noTrainingRequired').on('click', function() { $('.trainingReqForm').hide(); });

	$('#addUserBtn').on('click', function() {
		console.log('test');
		$('#new_user').modal('toggle');
    }); 
	$('#adaptationsList').on('click', function() { $('form').submit(); });
	$('.radioButtonList').on('click', function() { $('form').submit(); });
	//For submit tasks on checkbox click
	$('.taskCheckbox').on('change', function() { $(this.form).submit() });

	$('.openTaskCheckbox').on('click', function(){ 		
			$('#new_modal').modal('show'); 
			console.log('test'); 	
	});

	$('form.edit_task').on('ajax:success',function(event, data, status, xhr){
		$('#customFlash').show().delay(2000).fadeOut('slow', function() { 
            $("#customFlash").hide()
        }); 
	});
});