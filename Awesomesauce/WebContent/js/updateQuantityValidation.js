$(document).ready(function(){
	
	$("updateQuantity").click(function(){
		updateQuantityValid();
	});
	
	function updateQuantityValid(){
		
		var pname = $("#pname").val();
		var quantity = $("#quantity").val();
		var p = $("#errorMessage");
		var form = $("#addProductForm");
		var flag = 1;
		
		if(pname == ""){
			p.text("Product name cannot be empty");
			flag = 0;
		}
		if(quantity == ""){
			p.text("Image path cannot be empty");
			flag = 0;
		}
		if(quantity != ""){
			var decimal=  /^[0-9]+$/;   
			if(quantity.value.match(decimal)){
				if(parseInt(quantity) < 0){
					p.text("Enter a proper value for quantity");
					flag = 0;
				}
			}
			else{
				p.text("Enter a proper value for quantity");
				flag = 0;
			}
		}
		
		if(flag == 1){
			p.removeClass("text-danger").addClass("text-success");
			p.text("Product updated successfully. Redirecting... Please wait");
			
			setTimeout(function(){
				form.submit();
			}, 2500);
		}
	}
});