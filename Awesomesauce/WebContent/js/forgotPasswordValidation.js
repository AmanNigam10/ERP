$(document).ready(function(){
	
	$("#getQueBtn").click(function(){
		emailValid();
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
	};
	
	$("#answerSubmitBtn").click(function(){
		answerValid();
	});
	
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
});