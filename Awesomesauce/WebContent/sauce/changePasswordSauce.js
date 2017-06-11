$(document).ready(function(){

	if(annyang){
		var commands = {
			'focus current password': function(){
				$('#currentPassword').focus();
			},
			
			'focus new password': function(){
				$('#newPassword').focus();
			},
			
			'focus confirm password': function(){
				$('#confirmPassword').focus();
			},
			
			'change' : function(){
				changePassValid();
			}
		}
		
		annyang.addCommands(commands);
		annyang.start(true,true);
		annyang.debug();
	};

});

function changePassValid(){
	var form = $("#changePasswordForm");
	var currPass = $("#currentPassword").val();
	var newPass = $("#newPassword").val();
	var confirmPass = $("#confirmPassword").val();
	var alert = $("#alert");
	var p = $("#alert p");
	var flag = 1;
	
	if(currPass == ""){
		alert.show();
		p.text("Current password cannot be empty");
		flag = 0;
	}
	if(newPass == ""){
		alert.show();
		p.text("New password cannot be empty");
		flag = 0;
	
	}
	if(confirmPass == ""){
		alert.show();
		p.text("Confirm password cannot be empty");
		flag = 0;
		
	}
	if(newPass != "" && confirmPass != ""){
		if(newPass != confirmPass){
			alert.show();
			p.text("New password and confirm password do not match");
			flag = 0;
		}
	}
	
	if(flag == 1){
		alert.removeClass("alert-danger").addClass("alert-success");
		p.text("Password changed successfully. Redirecting... Please wait");
		
		setTimeout(function(){
			form.submit();
		}, 1500);
	}
}