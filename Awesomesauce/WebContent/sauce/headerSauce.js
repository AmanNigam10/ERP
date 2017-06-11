$(document).ready(function(){
	if(annyang){
		
		var commands = {
			
			'*term type' : function(term){
				var focusField = $(':focus');
				focusField.val(term);
				responsiveVoice.speak(term);
			}
		}
	};
	
	annyang.addCommands(commands);
	annyang.start(true,true);
	annyang.debug();
	
});