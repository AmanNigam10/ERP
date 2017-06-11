$(document).ready(function(){
	if(annyang){
		
		var commands = {
			
			'focus email' : function(){
				$("#email").focus();
				responsiveVoice.speak("email");
			},
			
			'find me' : function(){
				var status = emailValid();
				if(status == true){
					var emailid = document.getElementById("email").value;
					$.get("requestProcessor.jsp?email=" + emailid, function(data) {
					$("#question").text(data);
					$(".emailDiv").hide(300);
					$(".qaDiv").show();
					});
				}else{
					responsiveVoice.speak("Error submitting email");
				}
			},
			
			'focus answer' : function(){
				$("#answer").focus();
				responsiveVoice.speak("answer");
			},
			
			'submit' : function(){
				answerValid();
			},
			
			'cancel' : function(){
				window.location.href= "landing.jsp";
			}
		}
	};
	
	annyang.addCommands(commands);
	annyang.start(true,true);
	annyang.debug();
});

function emailValid() {
	
	var email = $("#email").val();
	var p = $("#userErrorMessage");
	var answer = $("#answer").val();
	var emailForm = $("#emailForm");
	var flag = 1;
	
	if(email == ""){
		p.text("Email cannot be empty");
		flag = 0;
		return false;
	}
	if(email != ""){
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!filter.test(email)){
			p.text("Invalid email");
			flag = 0;
			return false;
		}
	}
	
	if(flag == 1){
		return true;
	}
}

function answerValid(){
	
	var qaForm = $("#qaForm");
	var answer = $("#answer").val();
	var p = $("#answerErrorMessage");
	var flag = 1;
	
	if(answer == ""){
		p.text("Answer cannot be empty");
		flag = 0;
	}
	
	if(flag == 1){
		p.removeClass("text-danger").addClass("text-success");
		p.text("Details validated successfully. Redirecting... Please wait");
		
		setTimeout(function(){
			qaForm.submit();
		}, 1500);
	}
}
