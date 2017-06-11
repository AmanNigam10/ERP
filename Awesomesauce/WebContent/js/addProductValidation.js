$(document).ready(function(){
	
	$("#addProduct").click(function(){
		addProductValid();
	});
	
	function addProductValid(){
		var pname = $("#pname").val();
		var price = $("#price").val();
		var imagePath = $("#imageProduct").val();
		var quantity = $("#quantity").val();
		var p = $("#errorMessage");
		var form = $("#addProductForm");
		var flag = 1;
		
		if(pname == ""){
			p.text("Product name cannot be empty");
			flag = 0;
		}
		/*if(price == ""){
			p.text("Price cannot be empty");
			flag = 0;
		}
		if(price != ""){
			var decimal=  /^[0-9]+\.[0-9]+$/;   
			if(!price.value.match(decimal)){
				p.text("Enter a proper value for price");
				flag = 0;
			}
			if(parseInt(price) < 0){
				p.text("Enter a proper value for price");
				flag = 0;
			}
		}
		*/if(imagePath == ""){
			p.text("Image path cannot be empty");
			flag = 0;
		}
		/*if(quantity == ""){
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
		*/
		if(flag == 1){
			p.removeClass("text-danger").addClass("text-success");
			p.text("Product added successfully. Redirecting... Please wait");
			
			setTimeout(function(){
				form.submit();
			}, 2500);
		}
	}
});