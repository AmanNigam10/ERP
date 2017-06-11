$(document).ready(function(){
	
	adjustCarouselDimensions();
	
	$("#signIn").click(function(){
		landingValidate();
	});
});

function adjustCarouselDimensions(){
	var panelHeight = $('#loginPanel').height();
	$('#tutorial').css('height', panelHeight);

}

function landingValidate(){
	var email = $("#email").val();
	var password = $("#password").val();
	var form = $("#signInForm");
	var p = $("#errorMessage");
	var flag = 1;
	
	if(email == ""){
		p.text("Email cannot be empty");
		flag = 0;
	}
	if(email != ""){
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!filter.test(email)){
			p.text("Invalid email");
			flag = 0;
		}
	}
	if(password == ""){
		p.text("Password cannot be empty");
		flag = 0;
	}
	
	if(flag == 1){
		p.removeClass("text-danger").addClass("text-success");
		p.text("Signed in successfully. Redirecting... Please wait");
		setTimeout(function(){
			form.submit();
		}, 1500);
	}
}