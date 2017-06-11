$(document).ready(function(){

	if(annyang){
		var commands = {
			'make payment': function(){
				$("#billGenerationForm").submit();
			}
		}
		
		annyang.addCommands(commands);
		annyang.start(true,true);
		annyang.debug();
	};

});