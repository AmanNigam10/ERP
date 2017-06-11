$(document).ready(function(){
	if(annyang){
		
		var commands = {
			
			'focus email' : function(){
				$("#email").focus();
				responsiveVoice.speak("email");
			},
			
			'focus password' : function(){
				$("#password").focus();
				responsiveVoice.speak("password");
			},
			
			'sign in' : function(){
				landingValidate();
			},
			
			'forgot password' : function(){
				window.location.href = "forgotPassword.jsp";
			},
			
			'register' : function(){
				window.location.href = "register.jsp";
			}
		}
	};
	
	annyang.addCommands(commands);
	annyang.start(true,true);
	annyang.debug();
});

