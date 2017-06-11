$(document).ready(function(){

	if(annyang){
		var commands = {
			'focus name': function(){
				$("#firstName").focus();
			},
			
			'focus email': function(){
				$("#email").focus();
			},
			
			'focus subject' : function(){
				$("#subject").focus();
			},
			
			'focus message' : function(){
				$("#message").focus();
			},
			
			'submit' : function(){
				contactUsValidate();
			}
		}
		
		annyang.addCommands(commands);
		annyang.start(true,true);
		annyang.debug();
	};

});

function contactUsValidate(){
	
	var firstName = $("#firstName").val();
	var email = $("#email").val();
	var subject = $("#subject").val();
	
	var p = $("#contactUsErrorMessage");
	var form = $("#contactUsForm");
	var flag = 1;
	
	p.hide();
	
	if(firstName == ""){
		p.show();
		p.text("Name cannot be empty");
		flag = 0;
	}
	if(email == ""){
		p.show();
		p.text("Email cannot be empty");
		flag = 0;
	}
	if(email != ""){
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!filter.test(email)){
			p.show();
			p.text("Invalid email");
			flag = 0;
		}
	}
	if(subject == ""){
		p.show();
		p.text("Subject cannot be empty");
		flag = 0;
	}
	
	if(flag == 1){
		p.removeClass("text-danger").addClass("text-success");
		p.show();
		p.text("Details saved successfully. Redirecting... Please wait");
		
		setTimeout(function(){
			form.submit();
		}, 1500);
	}
}