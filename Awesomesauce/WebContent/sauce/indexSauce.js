$(document).ready(function(){

	if(annyang){
		var commands = {
			'shop mobiles': function(){
				window.location.href = "mobile.jsp";
			},
			
			'shop mobile': function(){
				window.location.href = "mobile.jsp";
			},
			
			'shop laptops': function(){
				window.location.href = "laptop.jsp";
			}
		}
		
		annyang.addCommands(commands);
		annyang.start(true,true);
		annyang.debug();
	};

});