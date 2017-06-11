$(document).ready(function(){
	
	$("#trackOrderBtn").click(function(){
		trackOrderValid();
	});
	
	function trackOrderValid(){
		
		var billId = $("#orderId").val();
		var p = $("#errorMessage");
		var form = $("#trackOrderForm");
		var flag = 1;
		
		if(billId == ""){
			p.text("Bill ID cannot be empty");
			flag = 0;
		}
		if(billId != ""){
			var decimal=  /^[0-9]+$/;   
			//if(billId.value.match(decimal)){
			if(decimal.test(billId)){
				if(parseInt(billId) < 0){
					p.text("Enter a proper value for bill ID");
					flag = 0;
				}
			}
			else{
				p.text("Enter a proper value for bill ID");
				flag = 0;
			}
		}
		
		if(flag == 1){
			p.removeClass("text-danger").addClass("text-success");
			
		}
	}
});