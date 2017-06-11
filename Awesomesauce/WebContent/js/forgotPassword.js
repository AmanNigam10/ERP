$(document).ready(function() {

	$(".qaDiv").hide();
	
	$("#getQueBtn").click(function() {

			var emailid = document.getElementById("email").value;
			$.get("requestProcessor.jsp?email=" + emailid, function(data) {
			$("#question").text(data);
			$(".emailDiv").hide(300);
			$(".qaDiv").show();

		});
	});
	
	$("#answerSubmitBtn").click(function(){
		$("#qaForm").submit();
	});

});