$(document).ready(function(){
	adjustMapDimensions();
});



function adjustMapDimensions() {
	var formPanelHeight = $('#formPanel').height();
	$('#mapPanel').css('height', formPanelHeight);

	var formPanelBodyHeight = $('#formPanel .panel-body').height();
	$('iframe').css('height', formPanelBodyHeight+20);
}