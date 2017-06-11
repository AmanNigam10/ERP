$(document).ready(function(){
	if(annyang){
		
		var commands = {
			
			'navigate to home' : function(){
				window.location.href = "index.jsp";
				responsiveVoice.speak("home");
			},

			'navigate to cart' : function(){
				window.location.href = "cart.jsp";
				responsiveVoice.speak("shopping cart");
			},
			
			'navigate to track order': function(){
				window.location.href = "trackOrder.jsp";
				responsiveVoice.speak("track your order");
			},
			
			'navigate to contact us' : function(){
				window.location.href = "contactUs.jsp";
				responsiveVoice.speak("contact us");
			},
			
			'navigate to change password' : function(){
				window.location.href = "changePassword.jsp";
				responsiveVoice.speak("change password");
			},
			
			'sign out' : function(){
				$("#signOutForm").submit();
			}
		}
	};
	
	annyang.addCommands(commands);
	annyang.start(true,true);
	annyang.debug();
	
});