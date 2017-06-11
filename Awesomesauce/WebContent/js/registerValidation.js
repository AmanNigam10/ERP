$(document).ready(function(){

	$("#alert").hide();
	$("#register").click(function(){
		regValidate();
	});
	
	function regValidate(){
		var firstName = $("#firstName").val();
		var lastName = $("#lastName").val();
		var email = $("#email").val();
		var contact = $("#contact").val();
		var address = $("#address").val();
		var newPassword = $("#newPassword").val();
		var confirmPassword = $("#confirmPassword").val();
		var securityQue = $("#securityQue").val();
		var securityAns = $("#securityAns").val();
		var form = $("#registerForm");
		var alert = $("#alert");
		var p = $("#alert p");
		var flag = 1;
		
		if(firstName == ""){
			alert.show();
			p.text("First name cannot be empty");
			flag = 0;
		}
		if(lastName == ""){
			alert.show();
			p.text("Last name cannot be empty");
			flag = 0;
		}
		if(email == ""){
			alert.show();
			p.text("Email cannot be empty");
			flag = 0;
		}
		if(email != ""){
			var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if (!filter.test(email)) {
				alert.show();
				p.text("Invalid Email");
				flag = 0;
			}
		}
		if(contact == ""){
			alert.show();
			p.text("Contact cannot be empty");
			flag = 0;
		}
		if(contact != ""){
			var filter = /^[0-9-+]+$/;
			if (!filter.test(contact)) {
				alert.show();
				p.text("Invalid contact number");
				flag = 0;
			}
		}
		if(address == ""){
			alert.show();
			p.text("Address cannot be empty");
			flag = 0;
		}
		if(newPassword == ""){
			alert.show();
			p.text("Password cannot be empty");
			flag = 0;
		}
		if(confirmPassword == ""){
			alert.show();
			p.text("Re-entered password cannot be empty");
			flag = 0;
		}
		if(newPassword != "" && confirmPassword != "")
		{
			if(newPassword != confirmPassword){
				alert.show();
				p.text("Passwords do not match");
				flag = 0;
			}
		}
		if(securityQue == ""){
			alert.show();
			p.text("Security question cannot be empty");
			flag = 0;
		}
		if(securityAns == ""){
			alert.show();
			p.text("Security answer cannot be empty");
			flag = 0;
		}
		
		if(flag == 1){
			alert.removeClass("alert-danger").addClass("alert-success");
			p.text("Registered successfully. Redirecting... Please wait");
			
			setTimeout(function(){
				form.submit();
			}, 1500);
		}
	}
});