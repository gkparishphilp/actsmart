
ready = $ ->
	$('.editor-full').summernote
		height: 400

	$('.editor-small').summernote
		toolbar: [ ['style', ['bold', 'italic', 'underline', 'clear']] ]

	$('.datepicker').datetimepicker
		dateFormat: 'dd MM, yy'