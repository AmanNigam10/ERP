$(document).ready(function(){

	if(annyang){
		var commands = {
			'focus new password': function(){
				$("#newPassword").focus();
			},
			
			'focus confirm password': function(){
				$("#confirmPassword").focus();
			},
			
			'cancel' : function(){
				window.location.href = "landing.jsp";
			},
			
			'change': function(){
				checkPasswordMatch();
			}
		}
		
		annyang.addCommands(commands);
		annyang.start(true,true);
		annyang.debug();
	};

});

function checkPasswordMatch() {
	$newPassword = $('#newPassword').val();
	$confirmPassword = $('#confirmPassword').val();
	$alert = $('#alert');
	$p = $('#alert p');

	if($newPassword=="" || $confirmPassword==""){
		$alert.show();
		$p.text('Password fields cannot be left empty. Please try again');
	}else if($newPassword != $confirmPassword){
		$alert.show();
		$p.text('Password fields do not match. Please try again');
	}else if($newPassword == $confirmPassword){
		/*** Add java code to set the new password  after submitting the form***/
		$alert.removeClass('alert-danger').addClass('alert-success');
		$p.text('Password reset successfully. Redirecting.. please wait');

		setTimeout(function(){
			$('#form').submit();
		}, 1500);
	}
}