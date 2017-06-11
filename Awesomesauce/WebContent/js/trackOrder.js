$(document).ready(function() {
	
	$("#trackOrderBtn").click(function(){
		var billID = document.getElementById("orderId").value;
		$.get("track.jsp?billid="+billID, function(data){
			$("#orderStatus").text(data);
		});
	});
});