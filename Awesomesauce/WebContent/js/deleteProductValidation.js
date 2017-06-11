$(document).ready(function(){
	
	$("#deleteProduct").click(function(){
		deleteProductValid();
	});
	
	function deleteProductValid(){
		
		var pname = $("#pname").val();
		var form = $("#deleteProductForm");
		var p = $("#errorMessage");
		var flag = 1;

		if(pname == ""){
			p.text("Product name cannot be empty");
			flag = 0;
		}
		
		if(flag == 1){
			p.removeClass("text-danger").addClass("text-success");
			p.text("Product deleted successfully. Redirecting... Please wait");
			
			setTimeout(function(){
				form.submit();
			}, 2500);
		}
	}
});