$(document).ready(function(){
	if(annyang){
		
		var commands = {
			
			'focus bill ID' : function(){
				$("#orderId").focus();
				responsiveVoice.speak("bill ID");
			},
			
			'track order' : function(){
				var status = trackOrderValid();
				if(status == true){
					
					var billID = document.getElementById("orderId").value;
					$.get("track.jsp?billid="+billID, function(data){
						$("#orderStatus").text(data);
					});
				}
			}
			
		}
	};
	
	annyang.addCommands(commands);
	annyang.start(true,true);
	annyang.debug();
});

function trackOrderValid(){
	
	var billId = $("#orderId").val();
	var p = $("#errorMessage");
	var form = $("#trackOrderForm");
	var flag = 1;
	
	if(billId == ""){
		p.text("Password cannot be empty");
		flag = 0;
		return false;
	}
	if(billId != ""){
		var decimal=  /^[0-9]+$/;   
		//if(billId.value.match(decimal)){
		if(decimal.test(billId)){
			if(parseInt(billId) < 0){
				p.text("Enter a proper value for bill ID 1");
				flag = 0;
				return false;
			}
		}
		else{
			p.text("Enter a proper value for bill ID 2");
			flag = 0;
			return false;
		}
	}
	
	if(flag == 1){
		p.removeClass("text-danger").addClass("text-success");
		return true;
	}
}